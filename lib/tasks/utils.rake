namespace :utils do
  desc "Popular BD"
  task seed: :environment do
    puts "init seed"
    10.times do |i|
      Contact.create(
          name: Faker::Name.name, 
          email: Faker::Internet.email, 
          kind: Kind.all.sample,
          rmk: Faker::Lorem.sentence(word_count: 3, supplemental: true) 
      )
    end
    
    10.times do |i|
        Address.create(
            street: Faker::Address.street_address, 
            city: Faker::Address.city, 
            contact: Contact.all.sample,
            state: Faker::Address.state 
        )
    end
    
    10.times do |i|
        Phone.create(
            contact: Contact.all.sample,
            phone: Faker::PhoneNumber.cell_phone_in_e164
        )
    end
    puts "end seeds"
  end

end
