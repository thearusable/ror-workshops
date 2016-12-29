if Rails.env.development?
  load(Rails.root.join( 'db', 'seeds', "development.rb"))
end

if Rails.env.test?
  puts "Seeds-TEST: Nothing to do."
end

if Rails.env.production?
  load(Rails.root.join( 'db', 'seeds', "production.rb"))
end
