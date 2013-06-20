# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ Service.create! name:  'Chicago' }, { Service.create! name:  'Copenhagen' }])
#   Mayor.create(Service.create! name:  'Emanuel', city: cities.first)

EventType.create! name: 'Critical'
EventType.create! name: 'Hazard'
EventType.create! name: 'Highlight'
EventType.create! name: 'Special'


Severity.create! name: 'Normal',
                 val:  10

Severity.create! name: 'Maintenance',
                 val:  20

Severity.create! name: 'Warning',
                 val:  30

Severity.create! name: 'Critical',
                 val:  50


Status.create! name:         'Normal', 
               slug:         'normal', 
               description:  'The service is up or was up during this entire period', 
               severity_id:  1,
               image:        'tick-circle'


Status.create! name:         'Maintenance', 
               slug:         'maintenance', 
               description:  'The service is undergoing scheduled maintenance or did undergo scheduled maintenance at some point during this period', 
               severity_id:  2,
               image:        'wrench'

Status.create! name:         'Service Disruption', 
               slug:         'service-disruption', 
               description:  'The service is experiencing an issue or experienced an issue at some point during this period', 
               severity_id:  3,
               image:        'exclamation'


Status.create! name:         'Down', 
               slug:         'down', 
               description:  'The service is up or was up during this entire period', 
               severity_id:  4,
               image:        'cross-circle'



Service.create! name:        "Cloud Servers Zone 1",
                slug:        "cloud-servers-zone-1",
                description: "",
                version:     1,
                order: 1,
                invisible: false

Service.create! name: "Cloud Servers Zone 2",
                slug: "cloud-servers-zone-2",
                description: "",
                version: 1,
                order: 2,
                invisible: false


Service.create! name: "Cloud Storage",
                slug: "cloud-storage",
                description: "",
                version: 1,
                order: 3,
                invisible: false

Service.create! name: "Ninefold Portal",
                slug: "ninefold-portal",
                description: "http://ninefold.com/portal",
                version: 1,
                order: 4,
                invisible: false

Service.create! name: "AU-Sydney-1",
                slug: "AU-Sydney-1",
                description: "North-west Sydney datacentre",
                version: 2,
                order: 1,
                invisible: false


Service.create! name: "AU-Sydney-2",
                slug: "AU-Sydney-2",
                description: "Sydney CBD datacentre",
                version: 2,
                order: 2,
                invisible: false

Service.create! name: "US-N. California-1",
                slug: "us-north-carolina-1",
                description: "US West Coast datacentre",
                version: 2,
                order: 3,
                invisible: false


Service.create! name: "App Deploy",
                slug: "app-deploy",
                description: "Ninefold Application Deployment",
                version: 2,
                order: 4,
                invisible: true


Service.create! name: "Ninefold 2 Portal",
                slug: "ninefold-portal-2",
                description: "http://portal.ninefold.com",
                version: 2,
                order: 5,
                invisible: false
u = User.new(
  email: "jason@ninefold.com",
  password: 'E@sy123!'
)
u.save!(:validate => false)


u = User.new(
  email: "jeff@ninefold.com",
  password: 'E@sy123!'
)
u.save!(:validate => false)

u = User.new(
  email: "steven@ninefold.com",
  password: 'E@sy123!'
)
u.save!(:validate => false)

u = User.new(
  email: "angelo@ninefold.com",
  password: 'E@sy123!'
)
u.save!(:validate => false)