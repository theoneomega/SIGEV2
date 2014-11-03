namespace :poblate do
  desc "poblating table people"
  task :people => :environment do
    30.times do |n|
      Person.create(ci: Faker::Number.number(5), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, last_name2: Faker::Name.last_name, alias: Faker::Internet.user_name, birth_date: Faker::Business.credit_card_expiry_date, originative: Faker::Address.city, genre: "hombre", record: false, profession: Faker::Company.bs, observations: Faker::Lorem.paragraph, status_id: Faker::Number.digit, registered_from: "C", searchable: Faker::Lorem.paragraph(2), visible: true, hide_reason: Faker::Hacker.say_something_smart)
      p ActionController::Base.helpers.pluralize(n+1, 'person')+" inserted"
    end
  end
  task :vehicles => :environment do
    brands = ["IZUKA","KURAZAI","KENWORTH","INTERNATIONAL","VENTO","BAJAJ","ACURA","ALFAROMEO","ASTONMARTIN","AUDI","BENTLEY","BMW","BUGATTI","BUICK","CADILLAC","CITROEN","CHEVROLET","CHRYSLER","DAEWOO","DAIHATSU","DODGE","FERRARI","FIAT","FORD","GMC","HOLDEN","HONDA","HUMMER","HYUNDAI","INFINITY","ISUZU","JAGUAR","JEEP","KIA","LANCIA","LANDROVER","LEXUS","LINCOLN","LOTUS","MAZDA","MERCEDES-BENZ","MERCURY","MG","MINI","MITSUBISHI","NISSAN","OLDSMOBILE","OPEL","PEUGEOT","PLYMOUTH","PONTIAC","PORSCHE","RENAULT","ROLLSROYCE","ROVER","SAAB","SATURN","SCANIA","SEAT","SHELBY","SKODA","SMART","SUBARU","SUZUKI","TOYOTA","VAUXHALL","VENTURI","VOLVO","VOLKSWAGEN","YAMAHA","DUCATI","HARLEYDAVISON","POLARIS","KAWASAKI","APRILIA","DERBI","KTM","IUMPH","ITALIKA","DINAMO","VALIANT","FREIGHTLINER"]
    linea = ["PICK-UP","SEDAN","MOTOCICLETA"]
    registro = ["O","C","E"]
    personas = (1..30).to_a
    30.times do |v|
      Vehicle.create(brand: brands.sample, line: linea.sample, model: Faker::Business.credit_card_expiry_date.year, plate: Faker::Company.ein, color: Faker::Commerce.color, stolen: false,status: "", person_id: personas.sample, registered_from: registro.sample, serial_number: Faker::Lorem.characters(10))
      p ActionController::Base.helpers.pluralize(v+1, 'vehicle')+" inserted"
    end
  end
#  p"done.....126 records inserted"
end
