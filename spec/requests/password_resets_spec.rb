require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = Factory(:user)
    visit new_user_session_path
    click_link "password"
    fill_in "Email", :with => user.email
  end
end


describe PagesHelper do
  it "visits sign in page" do
    visit root_path
    click_link "sign in"
    current_path.should eq(new_user_session_path)  
  end
end
