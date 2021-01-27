class NotifyUserJob
  include Sidekiq::Worker

  sidekiq_options queue: :mailers

  def perform
    # TODO Add functionality to send email and sms
    puts 'NotifyUserJob started'
    sleep 10
    puts 'NotifyUserJob ended'
  end
end
