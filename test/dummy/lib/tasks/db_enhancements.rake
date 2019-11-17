namespace :db do
  desc 'Add the uuid-ossp extension'
  task enhancements: :environment do
    # Enable UUID-OSSP
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION "uuid-ossp";'
    # Enable pgcrypto
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION "pgcrypto";'
  end
end

Rake::Task["app:db:create"].enhance do
  Rake::Task["app:db:enhancements"].invoke
end

Rake::Task["app:db:test:purge"].enhance do
  Rake::Task["app:db:enhancements"].invoke
end
