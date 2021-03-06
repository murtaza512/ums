# config/initializers/sidekiq.rb
require 'sidekiq-scheduler'
require 'sidekiq/web'

Sidekiq::Web.set :session_secret, Rails.application.secret_key_base

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file("#{Rails.root}/sidekiq_scheduler.yml")
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
end
