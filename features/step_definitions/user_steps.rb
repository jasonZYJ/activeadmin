Given /^I am logged out$/ do
  visit "/admin/sign_out"
end

Given /^I am logged in$/ do
  Given 'an admin user "admin@example.com" exists'
  visit new_admin_user_session_path
  fill_in "Email", :with => "admin@example.com"
  fill_in "Password", :with => "password"
  click_button "Login"
end

Given /^an admin user "([^"]*)" exists$/ do |admin_email|
  unless AdminUser.find_by_email(admin_email)
    AdminUser.create! :email => admin_email,
                      :password => "password",
                      :password_confirmation => "password"
  end
end
