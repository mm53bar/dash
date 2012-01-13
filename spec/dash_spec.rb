require 'dash/password'

describe Dash::Password do
  before :all do
    @password = Dash::Password.generate('twitter.com','password')
  end

  it "generates consistent password" do
    @password.should eql "NpPrP8E5QGJ5"
  end

  it "should generate a 12 character password by default" do
    @password.length.should eql 12
  end

  it "should generate a different password if a different key is used" do
    @new_password = Dash::Password.generate('twitter.com','new_password')
    @new_password.should_not eql @password
  end
   
  it "should reliably regenerate a password given the same key and domain" do
    @new_password = Dash::Password.generate('twitter.com','password')
    @new_password.should eql @password
  end
end
