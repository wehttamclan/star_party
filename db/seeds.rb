# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Party.destroy_all
Party.create(title: "Comet Party",
          date: "01-01-2019",
          description: "View Halley's Comet",
          street_address: "100 Host Place",
          city: "Starville",
          state: "CO",
          zip_code: 80203)

Party.create(title: "Nebula Party",
          date: "11-11-2018",
          description: "View Turing Nebula",
          street_address: "888 Galaxy Road",
          city: "Starville",
          state: "CO",
          zip_code: 80203)

Party.create(title: "Meteor Party",
          date: "07-07-2017",
          description: "View Lovelace Meteor Shower",
          street_address: "42 Universe Way",
          city: "Douglastown",
          state: "CO",
          zip_code: 80203)
