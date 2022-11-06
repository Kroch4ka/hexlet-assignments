# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
status_names = ['New', 'In Progress', 'Done']

status_names.each { |status| Status.create(name: status) }

user_names = %w[Michael Alex Nikita]

user_names.each { |name| User.create(name:) }
