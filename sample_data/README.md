# How to use

## Gemfile
```ruby
source "https://rubygems.org"

gem "faker"
gem "rubyXL"
```
Installing `faker` and `rubyXL` gems, `rubyXL` is a `Excel Spreadsheet Maker` tool, this lets it create and write on Excel files.  
Make sure to run:
```
bundle
```
```
bundle install
```
To install these gems.
<br><br><br>

## data_generation.rb

```ruby
# Grabbing the Tools from the gemfile
require 'faker'
require 'rubyXL'
require 'rubyXL/convenience_methods'
```

<br>

```ruby
# This is the main instruction card for our script. You can change these
# numbers to control how much data gets created.

# How many imaginary users (employees) should we create?
USERS_TO_GENERATE = 50
# How many imaginary leads (potential customers) should we create?
LEADS_TO_GENERATE = 100
# How many records of interactions (conversations, attempts) should we log?
CONVERSIONS_TO_GENERATE = 200
# How many rows should we create for the extra 'Sheet6'?
SHEET6_ROWS_TO_GENERATE = 25

# What should we name the final Excel file?
OUTPUT_FILENAME = "Generated_Database.xlsx"
```

<br>

```ruby
# A simple method to write the titles for the columns at the top of a sheet.
# It needs to know WHICH sheet to write on and WHAT titles to write.
def add_headers(sheet, headers)
  # It goes through the list of headers one by one. 'each_with_index' gives us
  # both the title ('header') and its position ('index').
  headers.each_with_index do |header, index|
    # 'add_cell' writes information to the spreadsheet.
    # We tell it to write in the very first row (row 0), at the correct column
    # position ('index'), and to write the title ('header').
    sheet.add_cell(0, index, header)
  end
end
```

<br>

```ruby
def populate_users(sheet, count)
  puts "Populating Users sheet..."

  # This is the list of column titles for the 'Users' sheet.
  headers = ['id', 'name', 'email', 'password', 'admin', 'role_type']
  # Here, we use our 'add_headers' recipe to write the titles on the sheet.
  add_headers(sheet, headers)

  # We create an empty list, to store the ID of each user
  user_ids = []

  # 'count.times' is a loop. It tells the script: "Repeat the following steps
  # 'count' number of times." (In our case, 50 times since USERS_TO_GENERATE = 50).
  count.times do |i|
    # The first row (row 0) has headers, so our data starts on row 1.
    row_index = i + 1
    # We create a simple ID number for the user (1, 2, 3, etc.).
    id = i + 1
    # We add the new ID to our list of user IDs.
    user_ids << id

    # Now we start adding data to the cells for this user's row.
    sheet.add_cell(row_index, 0, id) # Column 0: The user's ID.
    sheet.add_cell(row_index, 1, Faker::Name.unique.name) # Column 1: A unique fake name.
    sheet.add_cell(row_index, 2, Faker::Internet.unique.email) # Column 2: A unique fake email.
    sheet.add_cell(row_index, 3, Faker::Internet.password(min_length: 8)) # Column 3: A fake password.
    sheet.add_cell(row_index, 4, [true, false].sample) # Column 4: Randomly pick 'true' or 'false' for admin status.
    sheet.add_cell(row_index, 5, ['sales', 'management', 'admin'].sample) # Column 5: Randomly pick a role.
  end

  # After we're done, we reset Faker's "unique" generator. This is good practice
  # so we can guarantee unique values on other sheets if we need to.
  Faker::Name.unique.clear
  Faker::Internet.unique.clear

  puts "-> Done."
  # Finally, we hand back the completed list of user IDs so the main script can use it.
  return user_ids
end
```

<br>

```ruby
def populate_leads(sheet, count)
  puts "Populating Leads sheet..."
  headers = ['id', 'name', 'phone', 'email', 'demographic', 'vibe_check', 'budget', 'preferred_contact_method', 'notes', 'Company']
  add_headers(sheet, headers)
  lead_ids = [] # Create an empty box for lead IDs.

  # Loop 'count' number of times (100 in our case).
  count.times do |i|
    row_index = i + 1
    id = i + 1
    lead_ids << id # Add the new lead ID to our list.

    # Fill in the data for the new lead.
    sheet.add_cell(row_index, 0, id)
    sheet.add_cell(row_index, 1, Faker::Name.unique.name)
    sheet.add_cell(row_index, 2, Faker::PhoneNumber.phone_number) # A fake phone number.
    sheet.add_cell(row_index, 3, Faker::Internet.unique.email)
    sheet.add_cell(row_index, 4, "Age: #{rand(22..65)}, Location: #{Faker::Address.city}") # Fake demographic info.
    sheet.add_cell(row_index, 5, ['Y', 'N'].sample) # Randomly pick Y or N.
    sheet.add_cell(row_index, 6, rand(5000..250000)) # A random number for the budget.
    sheet.add_cell(row_index, 7, ['Email', 'Phone', 'In-Person'].sample)
    sheet.add_cell(row_index, 8, Faker::Lorem.sentence) # A short, fake sentence for notes.
    sheet.add_cell(row_index, 9, Faker::Company.name) # A fake company name.
  end

  Faker::Name.unique.clear
  Faker::Internet.unique.clear
  puts "-> Done."
  # Hand back the list of lead IDs.
  return lead_ids
end
```

<br>

```ruby
def populate_conversion_tracker(sheet, count, lead_ids, sales_rep_ids)
  puts "Populating Conversion Tracker sheet..."
  headers = ['id', 'leads_id', 'sales_rep_id', 'pipeline_stage', 'hours_spent', 'Date_of_last_attempt', 'Date_of_last_convo', 'potential_order_quote', 'total_communications', 'notes']
  add_headers(sheet, headers)

  # A list of possible stages for a deal.
  pipeline_stages = ['Initial Contact', 'Qualification', 'Needs Analysis', 'Proposal', 'Negotiation', 'Closed Won', 'Closed Lost']

  # Loop 'count' number of times (200 in our case).
  count.times do |i|
    row_index = i + 1
    sheet.add_cell(row_index, 0, i + 1)
    sheet.add_cell(row_index, 1, lead_ids.sample) # We randomly pick an ID from the 'lead_ids' list.
    sheet.add_cell(row_index, 2, sales_rep_ids.sample) # Randomly picking a sales rep from the 'sales_rep_ids' list.
    sheet.add_cell(row_index, 3, pipeline_stages.sample) # Randomly pick a stage.
    sheet.add_cell(row_index, 4, rand(1..25)) # Random number for hours spent.
    sheet.add_cell(row_index, 5, Faker::Date.backward(days: 30)) # A fake date in the last 30 days.
    sheet.add_cell(row_index, 6, Faker::Date.backward(days: 14)) # A fake date in the last 14 days.
    sheet.add_cell(row_index, 7, rand(10000..500000)) # Random quote amount.
    sheet.add_cell(row_index, 8, rand(1..15)) # Random number of communications.
    sheet.add_cell(row_index, 9, Faker::Marketing.buzzwords) # Some fake marketing buzzwords for notes.
  end
  puts "-> Done."
end
```

<br>

```ruby
# Get a brand new, blank Excel workbook.
workbook = RubyXL::Workbook.new

# The new workbook starts with one sheet named 'Sheet1'. We'll rename it.
workbook.worksheets[0].sheet_name = 'Users'

# Find the sheet we just named 'Users'.
users_sheet = workbook['Users']
# Now, run the 'populate_users' recipe on this sheet. Tell it to create the
# number of users we set in our configuration.
# Crucially, we save the list of IDs it gives back into the 'user_ids' variable.
user_ids = populate_users(users_sheet, USERS_TO_GENERATE)

# Add a brand new, blank sheet to our workbook and name it 'Leads'.
leads_sheet = workbook.add_worksheet('Leads')
# Run the 'populate_leads' recipe and save the returned list of lead IDs.
lead_ids = populate_leads(leads_sheet, LEADS_TO_GENERATE)

# Add another new sheet and name it 'Conversion Tracker'.
conversion_sheet = workbook.add_worksheet('Conversion Tracker')
# Run the 'populate_conversion_tracker' recipe. This time, we give it the
# 'lead_ids' and 'user_ids' lists it needs to make the connections.
populate_conversion_tracker(conversion_sheet, CONVERSIONS_TO_GENERATE, lead_ids, user_ids)

# After all the sheets are filled, save the entire workbook to a file.
# The filename is the one we set in our configuration at the top.
workbook.write(OUTPUT_FILENAME)

puts "\nSuccess! A new file named '#{OUTPUT_FILENAME}' has been created with fake data."
```
