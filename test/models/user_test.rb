require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      first_name: 'Foo',
      last_name: 'Bar',
      email: 'email@gmail.com',
      password: 'password',
      password_digest: 'password'
    )
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'user should not be valid when email is nil' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'user should not be valid when email is empty' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'user should not be valid when email is blank' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'user should not be valid when email is greater than or equal to 255 characters' do
    @user.email = "#{'a' * 244}@example.com"
    assert_not @user.valid?
  end

  test 'user should be valid when email is in the right format' do
    valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'user should not be valid when email is not in the correct format' do
    invalid_addresses = %w[user@example user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'user should not be valid when email is not unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should be transformed to lowercase before saving' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'user should not be valid when password is nil' do
    @user.password = nil
    assert_not @user.valid?
  end

  test 'user should not be valid when password is empty' do
    user = User.new(
      first_name: 'Foo',
      last_name: 'Bar',
      email: 'email@gmail.com',
      password: ''
    )
    assert_not user.valid?
  end

  test 'user should not be valid when password is blank' do
    @user.password = ' '
    assert_not @user.valid?
  end

  test 'user should not be valid when password is not at least 6 characters' do
    user = User.new(
      first_name: 'Foo',
      last_name: 'Bar',
      email: 'email@gmail.com',
      password: "#{'a' * 5}"
    )
    assert_not user.valid?
  end
end
