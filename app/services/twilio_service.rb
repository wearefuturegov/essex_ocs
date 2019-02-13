require 'twilio-ruby'

class TwilioService

  TWILIO_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

  def self.send_sms(body, mobile_number)
    TWILIO_CLIENT.messages.create(
      :from => ENV['TWILIO_PHONE_NUMBER'],
      :to => mobile_number,
      :body =>  body)
  end
end
