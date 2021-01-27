require 'sidekiq-scheduler'

class HelloWorldJob
  include Sidekiq::Worker

  def perform
    puts 'Hello world'
  end
end
