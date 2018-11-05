RSpec.feature "User password resets" do
  let(:user) { create(:user, email: "user@example.com", password: "password", password_confirmation: "password") }

  scenario "Valid email password resets" do
    visit "/login"

    click_link "forgot password"

    within(".password_reset") do
      fill_in "Email", with: user.email
    end

    click_button "Submit"


    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end

  scenario "Wrong email password resets" do
    visit "/login"

    click_link "forgot password"

    within(".password_reset") do
      fill_in "Email", with: user.email
    end

    click_button "Submit"

    expect(page).to have_content("Welcome")
  end

  scenario "Right email and wrong token" do
    visit "/password_resets/wrong_token/edit?email=xxx@gmail.com"

    expect(page).to have_content("Welcome")
  end

  scenario "Right email and right token" do
    user.send_password_reset_email

    visit "/password_resets/#{user.reset_token}/edit?email=#{user.email}"

    expect(page).to have_content("Reset password")
  end
end
