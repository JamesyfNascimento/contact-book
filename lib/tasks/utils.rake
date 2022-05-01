require 'faker'

namespace :utils do
  desc "Popular BD"
  task seed: :environment do
    puts "init seed"
    10.times do |i|
      puts "seed contact #{i}"
      Contact.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.paragraph
      )
    end
    
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address, 
        city: Faker::Address.city, 
        contact: contact,
        state: Faker::Address.state 
      )
    end
    
    
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create(
          contact: contact,
          phone: Faker::PhoneNumber.cell_phone_in_e164
        )
      end
    end
    puts "end seeds"
  end

end
