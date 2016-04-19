require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password")}

  it {is_expected.to have_many(:posts)}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_length_of(:name).is_at_least(1)}

  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_uniqueness_of(:email)}
  it {is_expected.to validate_length_of(:email).is_at_least(3)}
  it {is_expected.to allow_value("user@bloccit.com").for(:email)}

  it {is_expected.to validate_presence_of(:password)}
  it {is_expected.to have_secure_password}
  it {is_expected.to validate_length_of(:password).is_at_least(6)}

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
    end
  end

  describe "invalid user" do
    let (:invalid_name){User.new(name: "", email: "user@bloccit.com")}
    let (:invalid_email){User.new(name: "Bloccit User", email: "")}

    it "should be invalid bc of blank name" do
      expect(invalid_name).to_not be_valid
    end

    it "should be invalid bc of blank email" do
      expect(invalid_email).to_not be_valid
    end
  end
end
