require 'spec_helper'


describe "Services" do
  describe "When accessing the root URL" do
  	it "display some services" do
  		@service = Service.create :name        => 'Cloud Servers Zone 1',
 								                :description => 'Sydney City Data Center',
 								                :slug        => 'cloud-servers-zone-1',
 								                :version     => 1,
 								                :order       => 1

  		visit services_path
  		expect(page).to have_content 'Cloud Servers Zone 1'

    end
  end
  describe "When accessing the other URL" do
    it "display some services" do
      @service = Service.create :name        => 'Cloud Servers Zone 1',
                                :description => 'Sydney City Data Center',
                                :slug        => 'cloud-servers-zone-1',
                                :version     => 1,
                                :order       => 1

      visit services_path
      expect(page).to have_content 'Cloud Servers Zone 1'

    end
  end
end
