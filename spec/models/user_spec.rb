RSpec.describe User, type: :model do
  describe "create user" do
    specify do
      user = build(:user, email: "valid_email.123-yes@gmail.com", name: nil)

      expect(user.save).to be true
    end
  end
end
