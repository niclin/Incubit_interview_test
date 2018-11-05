RSpec.feature "User authentication" do
  scenario "existing user signs in" do
    create(:user, email: "admin@example.com", password: "password", password_confirmation: "password")

    visit "/login"

    within(".new_user") do
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
    end

    click_button "Log in"

    expect(page).to have_text "admin@example.com"
  end
end
