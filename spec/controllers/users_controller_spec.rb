RSpec.describe UsersController, type: :controller do
  describe "GET new" do
    it "assign @user" do
      user = build(:user)

      get :new

      expect(assigns(:user)).to be_a_new(User)
    end

    it "render template" do
      user = build(:user)

      get :new

      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    it "assigns @user" do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(assigns[:user]).to eq(user)
    end

    it "render template" do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(response).to render_template("show")
    end
  end
end
