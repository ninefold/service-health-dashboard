require 'spec_helper'


describe "Index" do
  describe "When accessing the root URL" do
  	it "should display some services" do
      visit root_path
      expect(page).to have_content 'Cloud Servers Zone 1'
    end
  end

  describe "When accessing the root URL" do
    it "should display the status legend" do

      visit services_path
      expect(page).to have_content 'The service is up or was up during this entire period'
    end
  end

  describe "When accessing the root URL" do
    it "should display the status images" do

      visit services_path
      page.should have_xpath("//img[@src=\"/assets/status/cross-circle.png\"]")

    end
  end


end
