module Dockerfile
  class << self
    def serialize(&block)
      if block_given?
        context = DockerfileContext.new
        context.instance_eval(&block)
        context.ast.join("\n")
      end
    end
  end

  class DockerfileContext
    attr_reader :ast

    def initialize
      @ast = []
    end

    def method_missing(symbol, value)
      ast.push Instruction.new(symbol, value)
    end

    def comment(value)
      ast.push Comment.new(value)
    end
  end

  class Comment
    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def serialize
      "# #{text}"
    end

    alias to_s serialize
  end

  class Instruction
    attr_accessor :name, :arguments

    def initialize(name, arguments)
      @name = name
      @arguments = arguments
    end

    def serialize_name
      name.to_s.upcase
    end

    def serialize_arguments
      case arguments
      when String, Integer then arguments
      when Array
        args = arguments.map { |arg| %("#{arg}") }.join(', ')
        "[#{args}]"
      else
        raise "Can not serialize #{arguments} (#{arguments.class})"
      end
    end

    def serialize
      "#{serialize_name} #{serialize_arguments}"
    end

    alias to_s serialize
  end
end

