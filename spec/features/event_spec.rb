require 'spec_helper'

describe "Events" do
  describe "When accessing the /events URL" do
  	it "should display some events" do
  		e = Event.create(
        "service_id"=>1,
        "status_id"=>1,
        "message"=>"This is a test",
        "start"=>DateTime.now,
        "informational"=>false,
        "event_type_id"=>1,
        "invisible"=>false,
        "description"=>"TEST"
      )
  		visit events_path
  		expect(page).to have_content 'This is a test'
    end
  end

  describe "When creating a new event" do
    it "should display the event" do
      visit new_event_path
      fill_in 'event_message', :with=>'This is a test message'
      click_button "Create Event"
      expect(page).to have_content 'This is a test message'
      events = Event.all
    end
  end

  

end
