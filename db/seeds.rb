# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ "name"=> 'Chicago' }, { "name"=> 'Copenhagen' }])
#   Mayor.create("name"=> 'Emanuel', city: cities.first)
eventtypes = EventType.create(
  [
    {"name"=>"Critical"},
    {"name"=>"Hazard"},
    {"name"=>"Highlight"},
    {"name"=>"Special"}
  ]
)

severities = Severity.create(
  [
    {"name"=> 'Normal', "val"=> 10},
    {"name"=> 'Maintenance', "val"=> 20},
    {"name"=> 'Warning', "val"=> 30},
    {"name"=> 'Critical', "val"=> 50}
  ]
)

statuses = Status.create(
  [
    {
      "name"=> 'Normal', 
      "slug"=> 'normal', 
      "description"=> 'The service is up or was up during this entire period', 
      "severity_id"=> "1",
      "image"=> 'tick-circle'
    },
    {
      "name"=> 'Maintenance', 
      "slug"=> 'maintenace', 
      "description"=> 'The service is undergoing scheduled maintenance or did undergo scheduled maintenance at some point during this period ', 
      "severity_id"=> "2",
      "image"=> 'wrench'
    },
    {
      "name"=> 'Service Disruption', 
      "slug"=> 'service-disruption', 
      "description"=> 'The service is experiencing an issue or experienced an issue at some point during this period', 
      "severity_id"=> "3",
      "image"=> 'exclamation'
    },
    {
      "name"=> 'Down', 
      "slug"=> 'down', 
      "description"=> 'The service is up or was up during this entire period', 
      "severity_id"=> "4",
      "image"=> 'cross-circle'
    }
  ]
)
#:description, :name, :order, :slug, :version,

Services = Service.create(
	[
    {
      "name"=>"Cloud Servers Zone 1",
      "slug"=>"cloud-servers-zone-1",
      "description"=>"Cloud Servers located in Zone 1 (Sydney)",
      "version"=>1,
      "order"=>1,
      "invisible"=>false
    },
    {
      "name"=>"Cloud Servers Zone 2",
      "slug"=>"cloud-servers-zone-2",
      "description"=>"Cloud Servers located in Zone 2 (Sydney)",
      "version"=>1,
      "order"=>2,
      "invisible"=>false
 
    },
    {
      "name"=>"Cloud Storage",
      "slug"=>"cloud-storage",
      "description"=>"Cloud Storage Servers (incl. Oxygen Cloud)",
      "version"=>1,
      "order"=>3,
      "invisible"=>false
    },
      {
      "name"=>"Ninefold Portal",
      "slug"=>"ninefold-portal",
      "description"=>"The Management portal - http://ninefold.com/portal",
      "version"=>1,
      "order"=>4,
      "invisible"=>false
    },
    {
      "name"=>"AU-Sydney-1",
      "slug"=>"AU-Sydney-1",
      "description"=>"Western Suburb based data center",
      "version"=>2,
      "order"=>1,
      "invisible"=>false

    },
    {
      "name"=>"AU-Sydney-2",
      "slug"=>"AU-Sydney-2",
      "description"=>"Inner-city data center",
      "version"=>2,
      "order"=>2,
      "invisible"=>false

    },
    {
      "name"=>"US-N. California-1",
      "slug"=>"us-north-carolina-1",
      "description"=>"USA West Coast Data Center",
      "version"=>2,
      "order"=>3,
      "invisible"=>false

    },
    {
      "name"=>"App Deploy",
      "slug"=>"app-deploy",
      "description"=>"Ninefold Application Deployment",
      "version"=>2,
      "order"=>4,
      "invisible"=>true

    },
    {
      "name"=>"Ninefold 2 Portal",
      "slug"=>"ninefold-portal-2",
      "description"=>"The Management portal - http://portal.ninefold.com",
      "version"=>2,
      "order"=>5,
      "invisible"=>false
      
    }
  ] 
)