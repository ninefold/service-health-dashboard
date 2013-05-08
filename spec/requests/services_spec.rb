require 'spec_helper'

describe "Services" do
  describe "GET /" do
  	it "display some services" do
  		visit services_path
  		page.should have_content 'Cloud Servers Zone 1'
    end
  end
end
