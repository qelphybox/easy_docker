class DockerGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  # requires:
  #   ruby version
  #   libraries for db
  #   bundler_version
  def create_dockerfile

  end

  # requires:
  #   db ports for wait for it
  def create_entrypoint
  end

  # requires
  #   db with version
  #   check sidekiq
  def create_docker_compose_yml
  end

  private

  def app_data2
    @app_data2 ||= EasyDocker::AppData.collect
  end
  def app_data
    @app_data ||= {
      database_configuration: Rails.configuration.database_configuration[Rails.env],
      ruby_version: RUBY_VERSION,
      bundler_version: get_bundler_version
    }
  end

  def get_bundler_version
    gemfilelock_path = Rails.root.join('Gemfile.lock').to_s
    return '2.1.4' unless File.exist?(gemfilelock_path)

    File.read(gemfilelock_path).scan(/BUNDLED WITH\n\s+(.+)$/).flatten.first
  end
end
