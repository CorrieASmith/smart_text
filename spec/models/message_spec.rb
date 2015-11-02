require 'spec_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'yo mama', :to => '11111', :from => '4255295902')
    message.save.should be_falsey
  end
end
