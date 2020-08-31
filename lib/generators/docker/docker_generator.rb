class DockerGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_dockerfile
    template 'Dockerfile.erb', 'Dockerfile'
  end

  def create_entrypoint
    copy_file 'entrypoint.sh'
  end

  def create_docker_compose_yml
    copy_file 'docker-compose.yml'
  end

  private

  def ruby_version
    RUBY_VERSION
  end

  def apt_get_libraries
    %w[
      nodejs
      postgresql-client
    ].join(' ')
  end
end
