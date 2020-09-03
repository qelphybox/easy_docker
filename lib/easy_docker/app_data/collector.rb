module EasyDocker
  module AppData
    class Collector
      attr_reader :fields_to_collect

      def initialize(fields_to_collect)
        @fields_to_collect = fields_to_collect
      end

      def collect
        fields_to_collect.each { |field| send(:"collect_#{field}") }
      end

      private

      def collect_ruby_version
        RUBY_VERSION
      end

      def collect_bundler_version
        gemfilelock_path = Rails.root.join('Gemfile.lock').to_s
        return '2.1.4' unless File.exist?(gemfilelock_path)

        File.read(gemfilelock_path).scan(/BUNDLED WITH\n\s+(.+)$/).flatten.first
      end

      def collect_database_configuration
        if ENV['DATABASE_URL']

        else
          AppData::DatabaseConfiguration.new(Rails.configuration.database_configuration[Rails.env])
        end
      end
    end
  end
end
