# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RealEstateCompany.destroy_all
House.destroy_all

companies = (1..10).map {
  |i| {
    name: "company_name_#{i}",
    website: "https://company_#{i}_website",
    address: "company_#{i}_address",
    founded: 1900 + i,
    revenue: i * 10000,
    synopsis: "company_#{i}_synopsis",
  }
}

RealEstateCompany.create!(companies)
