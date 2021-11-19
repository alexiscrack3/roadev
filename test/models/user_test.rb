require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      first_name: 'Foo',
      last_name: 'Bar',
      email: 'foo.bar@gmail.com',
      password_digest: '123456'
    )
  end

  test 'er should be valid' do
    assert @user.valid?
  end

  test 'email should not be nil' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'email should not be empty' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should not be blank' do
    @user.email = ' '
    assert_not @user.valid?
  end
end
