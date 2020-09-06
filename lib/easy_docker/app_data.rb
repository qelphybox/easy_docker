module EasyDocker
  APP_DATA_FIELDS = %i[
    ruby_version
    bundler_version
    database_configuration
  ]

  # Struct contains application data required for docker configuration
  # === Example
  # app_data = AppData.collect
  # app_data.ruby_version # => '2.7.1'
  # app_data.bundler_version # => '2.1.4'
  # app_data.database_configuration # => Struct{type: 'postgres', version: '12', uri: 'posgresql://...' }
  class AppData < Struct.new(*APP_DATA_FIELDS)
    DATABASE_CONFIGURATION_FIELDS = %i[
      type
      database
      username
      password
      host
      port
      pool
      timeout
    ]
    # Struct for database configuration fields
    DatabaseConfiguration = Struct.new(*DATABASE_CONFIGURATION_FIELDS)

    def self.collect
      app_data = AppData::Collector.new(APP_DATA_FIELDS).collect
      new(app_data.values_at(*APP_DATA_FIELDS))
    end
  end
end
