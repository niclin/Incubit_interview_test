RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "create user" do
    specify do
      user = build(:user, email: "valid_email.123-yes@gmail.com", name: nil)

      expect(user.save).to be true
    end
  end

  it "email address should be unique" do
    duplicate_user = user.dup

    user.save

    expect(duplicate_user.valid?).to be false
  end

  it "password must be least eight characters" do
    user.password = "123"

    expect(user.save).to be false
  end

  it "password should be present (nonblank)" do
    user.password = user.password_confirmation = " " * 8

    expect(user.valid?).to be false
  end
end
