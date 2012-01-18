require 'spec_helper'

describe "Navigation" do
  include Capybara
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
  
  it "should display filters" do
    visit whoops_event_groups_path
    page.should have_content("Filters")
  end


  it "should display event groups" do
    Whoops::Event.record(Whoops::Spec::ATTRIBUTES[:event_params])
    visit whoops_event_groups_path
    page.should have_content("ArgumentError")
  end

  it "should display event group" do
    Whoops::Event.record(Whoops::Spec::ATTRIBUTES[:event_params])
    e = Whoops::EventGroup.first
    visit whoops_event_group_events_path(e)
    page.should have_content("ArgumentError")
  end
end
