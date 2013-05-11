require 'spec_helper'


describe "Index" do
  describe "When accessing the root URL" do
  	it "should display some services" do
  		@service = Service.create :name        => 'Cloud Servers Zone 1',
 								                :description => 'Sydney City Data Center',
 								                :slug        => 'cloud-servers-zone-1',
 								                :version     => 1,
 								                :order       => 1
  		visit services_path
  		expect(page).to have_content 'Cloud Servers Zone 1'
    end
  end

  describe "When accessing the root URL" do
    it "should display the status legend" do
      @status = Status.create   :name        => 'Normal',
                                :description => 'The service is up or was up during this entire period',
                                :slug        => 'normal',
                                :image       => 'tick-circle'

      visit services_path
      expect(page).to have_content 'The service is up or was up during this entire period'
    end
  end
end
