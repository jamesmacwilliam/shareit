require 'spec_helper'

describe User do

  let(:user) { create(:user) }

  it 'only displays name in as_json' do
    expect(create(:user).as_json.keys).to eq [:name]
  end

  it "should require an email address" do
    expect(build(:user, email: '')).not_to be_valid
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      expect(build(:user, email: address)).not_to be_valid
    end
  end

  it "should reject duplicate email addresses" do
    expect(build(:user, email: create(:user).email)).not_to be_valid
  end

  it "should reject email addresses identical up to case" do
    expect(build(:user, email: create(:user).email.upcase)).not_to be_valid
  end

  describe "passwords" do

    it "should have a password attribute" do
      expect(user).to respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      expect(user).to respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      expect(build(:user, password: '', password_confirmation: '')).not_to be_valid
    end

    it "should require a matching password confirmation" do
      expect(build(:user, password_confirmation: 'invalid')).not_to be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      expect(build(:user, password: short, password_confirmation: short)).not_to be_valid
    end

  end

  describe "password encryption" do

    it "should have an encrypted password attribute" do
      expect(user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      expect(user.encrypted_password).not_to be_blank
    end

  end

end
