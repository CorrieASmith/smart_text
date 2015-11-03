class Message < ActiveRecord::Base
  before_create :send_sms

private
  def send_sms
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/ACfb8ca945cf11858962ed0d8da27edce8/Messages.json',
      :user => 'ACfb8ca945cf11858962ed0d8da27edce8',
      :password => '378f73dbe67adeabe5f14894d631c510',
      :payload => {:Body => body,
                   :From => from,
                   :To => to }).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
