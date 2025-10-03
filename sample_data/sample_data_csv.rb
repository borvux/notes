require 'faker'
require 'csv'

USERS_TO_GENERATE = 50
LEADS_TO_GENERATE = 100
CONVERSIONS_TO_GENERATE = 200

def generate_users_csv(filename, count)
  puts "Populating #{filename}..."
  headers = ['id', 'name', 'email', 'password', 'admin', 'role_type']
  user_ids = []

  CSV.open(filename, "w", write_headers: true, headers: headers) do |csv|
    count.times do |i|
      id = i + 1
      user_ids << id
      csv << [
        id,
        Faker::Name.unique.name,
        Faker::Internet.unique.email,
        Faker::Internet.password(min_length: 8),
        ['true', 'false'].sample,
        ['sales', 'management', 'admin'].sample
      ]
    end
  end

  Faker::Name.unique.clear
  Faker::Internet.unique.clear
  puts "-> Done."
  return user_ids
end

def generate_leads_csv(filename, count)
  puts "Populating #{filename}..."
  headers = ['id', 'name', 'phone', 'email', 'demographic', 'vibe_check', 'budget', 'preferred_contact_method', 'notes', 'Company']
  lead_ids = []

  CSV.open(filename, "w", write_headers: true, headers: headers) do |csv|
    count.times do |i|
      id = i + 1
      lead_ids << id
      csv << [
        id,
        Faker::Name.unique.name,
        Faker::PhoneNumber.phone_number,
        Faker::Internet.unique.email,
        "Age: #{rand(22..65)}, Location: #{Faker::Address.city}",
        ['Y', 'N'].sample,
        rand(5000..250000),
        ['Email', 'Phone', 'In-Person'].sample,
        Faker::Lorem.sentence,
        Faker::Company.name
      ]
    end
  end

  Faker::Name.unique.clear
  Faker::Internet.unique.clear
  puts "-> Done."
  return lead_ids
end

def generate_conversions_csv(filename, count, lead_ids, sales_rep_ids)
  puts "Populating #{filename}..."
  headers = ['id', 'leads_id', 'sales_rep_id', 'pipeline_stage', 'hours_spent', 'Date_of_last_attempt', 'Date_of_last_convo', 'potential_order_quote', 'total_communications', 'notes']
  pipeline_stages = ['Initial Contact', 'Qualification', 'Needs Analysis', 'Proposal', 'Negotiation', 'Closed Won', 'Closed Lost']

  CSV.open(filename, "w", write_headers: true, headers: headers) do |csv|
    count.times do |i|
      csv << [
        i + 1,
        lead_ids.sample,
        sales_rep_ids.sample,
        pipeline_stages.sample,
        rand(1..25),
        Faker::Date.backward(days: 30).strftime('%Y-%m-%d'),
        Faker::Date.backward(days: 14).strftime('%Y-%m-%d'),
        rand(10000..500000),
        rand(1..15),
        Faker::Marketing.buzzwords
      ]
    end
  end
  puts "-> Done."
end

puts "Starting data generation..."

user_ids = generate_users_csv("Users.csv", USERS_TO_GENERATE)
lead_ids = generate_leads_csv("Leads.csv", LEADS_TO_GENERATE)
generate_conversions_csv("Conversion_Tracker.csv", CONVERSIONS_TO_GENERATE, lead_ids, user_ids)

puts "\nSuccess! Three new CSV files have been created with fake data."
