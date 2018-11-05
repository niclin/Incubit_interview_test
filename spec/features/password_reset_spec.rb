RSpec.feature "User password resets" do
  scenario "Valid email password resets" do
    create(:user, email: "user@example.com", password: "password", password_confirmation: "password")

    visit "/login"

    click_link "forgot password"

    within(".password_reset") do
      fill_in "Email", with: "user@example.com"
    end

    click_button "Submit"


    expect(ActionMailer::Base.deliveries.size).to eq(1)
  end

  scenario "Wrong email password resets" do
    create(:user, email: "user@example.com", password: "password", password_confirmation: "password")

    visit "/login"

    click_link "forgot password"

    within(".password_reset") do
      fill_in "Email", with: "user@example.com"
    end

    click_button "Submit"

    expect(page).to have_content("Welcome")
  end
end
