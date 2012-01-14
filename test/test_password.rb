require 'helper'

class TestPassword < Test::Unit::TestCase

  def setup
    @twitter_password = Dash::Password.generate('twitter.com', 'password')
  end

  def test_consistent_password_
    assert_equal @twitter_password, "NpPrP8E5QGJ5"
  end

  def test_12_characters_by_default
    assert_equal @twitter_password.length, 12
  end

  def test_different_passwords_for_different_key
    @new_twitter_password = Dash::Password.generate('twitter.com','new_password')
    assert_not_equal @twitter_password, @new_twitter_password
  end

  def test_different_passwords_for_different_domain
    @google_password = Dash::Password.generate('google.com','password')
    assert_not_equal @twitter_password, @google_password
  end

  def test_regenerates_same_password_with_same_key_and_domain
    @same_twitter_password = Dash::Password.generate('twitter.com','password')
    assert_equal @twitter_password, @same_twitter_password
  end

  def test_change_length_with_option
    @short_twitter_password = Dash::Password.generate('twitter.com','password', :length => 8)
    assert_equal @short_twitter_password.length, 8
  end
end
