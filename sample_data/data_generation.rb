require 'faker'
require 'rubyXL'
require 'rubyXL/convenience_methods'

# --- Configuration ---
# You can change the number of records to generate for each sheet here.
USERS_TO_GENERATE = 50
LEADS_TO_GENERATE = 100
CONVERSIONS_TO_GENERATE = 200

# Output file name
OUTPUT_FILENAME = "Generated_Database.xlsx"

# --- Helper Methods ---

def add_headers(sheet, headers)
  headers.each_with_index do |header, index|
    sheet.add_cell(0, index, header)
  end
end

def populate_users(sheet, count)
  puts "Populating Users sheet..."
  headers = ['id', 'name', 'email', 'password', 'admin', 'role_type']
  add_headers(sheet, headers)
  user_ids = []

  count.times do |i|
    row_index = i + 1
    id = i + 1
    user_ids << id
    sheet.add_cell(row_index, 0, id)
    sheet.add_cell(row_index, 1, Faker::Name.unique.name)
    sheet.add_cell(row_index, 2, Faker::Internet.unique.email)
    sheet.add_cell(row_index, 3, Faker::Internet.password(min_length: 8))
    sheet.add_cell(row_index, 4, ['true', 'false'].sample)
    sheet.add_cell(row_index, 5, ['sales', 'management', 'admin'].sample)
  end
  Faker::Name.unique.clear # Clear unique names for other sheets
  Faker::Internet.unique.clear # Clear unique emails for other sheets
  puts "-> Done."
  return user_ids
end

def populate_leads(sheet, count)
  puts "Populating Leads sheet..."
  headers = ['id', 'name', 'phone', 'email', 'demographic', 'vibe_check', 'budget', 'preferred_contact_method', 'notes', 'Company']
  add_headers(sheet, headers)
  lead_ids = []

  count.times do |i|
    row_index = i + 1
    id = i + 1
    lead_ids << id
    sheet.add_cell(row_index, 0, id)
    sheet.add_cell(row_index, 1, Faker::Name.unique.name)
    sheet.add_cell(row_index, 2, Faker::PhoneNumber.phone_number)
    sheet.add_cell(row_index, 3, Faker::Internet.unique.email)
    sheet.add_cell(row_index, 4, "Age: #{rand(22..65)}, Location: #{Faker::Address.city}")
    sheet.add_cell(row_index, 5, ['Y', 'N'].sample)
    sheet.add_cell(row_index, 6, rand(5000..250000))
    sheet.add_cell(row_index, 7, ['Email', 'Phone', 'In-Person'].sample)
    sheet.add_cell(row_index, 8, Faker::Lorem.sentence)
    sheet.add_cell(row_index, 9, Faker::Company.name)
  end
  Faker::Name.unique.clear # Clear unique constraints
  Faker::Internet.unique.clear
  puts "-> Done."
  return lead_ids
end

def populate_conversion_tracker(sheet, count, lead_ids, sales_rep_ids)
  puts "Populating Conversion Tracker sheet..."
  headers = ['id', 'leads_id', 'sales_rep_id', 'pipeline_stage', 'hours_spent', 'Date_of_last_attempt', 'Date_of_last_convo', 'potential_order_quote', 'total_communications', 'notes']
  add_headers(sheet, headers)

  pipeline_stages = ['Initial Contact', 'Qualification', 'Needs Analysis', 'Proposal', 'Negotiation', 'Closed Won', 'Closed Lost']

  count.times do |i|
    row_index = i + 1
    sheet.add_cell(row_index, 0, i + 1)
    sheet.add_cell(row_index, 1, lead_ids.sample)
    sheet.add_cell(row_index, 2, sales_rep_ids.sample)
    sheet.add_cell(row_index, 3, pipeline_stages.sample)
    sheet.add_cell(row_index, 4, rand(1..25))
    sheet.add_cell(row_index, 5, Faker::Date.backward(days: 30))
    sheet.add_cell(row_index, 6, Faker::Date.backward(days: 14))
    sheet.add_cell(row_index, 7, rand(10000..500000))
    sheet.add_cell(row_index, 8, rand(1..15))
    sheet.add_cell(row_index, 9, Faker::Marketing.buzzwords)
  end
  puts "-> Done."
end

# --- Main Script Execution ---

# Create a new workbook
workbook = RubyXL::Workbook.new

# Rename the default sheet
workbook.worksheets[0].sheet_name = 'Users'

# Create and populate sheets
users_sheet = workbook['Users']
user_ids = populate_users(users_sheet, USERS_TO_GENERATE)

leads_sheet = workbook.add_worksheet('Leads')
lead_ids = populate_leads(leads_sheet, LEADS_TO_GENERATE)

conversion_sheet = workbook.add_worksheet('Conversion Tracker')
populate_conversion_tracker(conversion_sheet, CONVERSIONS_TO_GENERATE, lead_ids, user_ids)

# Save the workbook to a file
workbook.write(OUTPUT_FILENAME)

puts "\nSuccess! A new file named '#{OUTPUT_FILENAME}' has been created with fake data."
