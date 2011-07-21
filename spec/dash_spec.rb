require 'dash/password'

describe Dash::Password do
  it "generates consistent password" do
    Dash::Password.generate('twitter.com','password').should eql("NpPrP8E5QGJ5")
  end
end
