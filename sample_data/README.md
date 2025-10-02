# How to Use the Data Generator

## Part 1: The `Gemfile`

```ruby
source "https://rubygems.org"

gem "faker"
gem "rubyXL"
```
  * `gem "rubyXL"`: This tool gives our script the ability to create, read, and write Microsoft Excel files (`.xlsx`).

### Installing the Tools

Before you can run the main script, you need to install the tools listed in the `Gemfile`. To do this, open your terminal and run this one command:

```shell
bundle install
```

This command reads your `Gemfile` and automatically downloads and installs the `faker` and `rubyXL` gems for you. You only need to do this once.

-----

## Part 2: `data_generation.rb`

This is the main file containing all the instructions to build our Excel file.

### Section 1: Getting the Tools Ready

```ruby
# Grabbing the Tools from the gemfile
require 'faker'
require 'rubyXL'
require 'rubyXL/convenience_methods'
```

  * `require 'faker'` and `require 'rubyXL'`: These lines tell our script: "Okay, go open the `faker` and `rubyXL` toolboxes that we just installed. We're going to need them."

### Section 2: The Main Settings (The Control Panel ⚙️)

You can change the numbers here to control exactly how much data the script creates, without having to touch any other code.

```ruby
# How many imaginary users (employees) should we create?
USERS_TO_GENERATE = 50
# How many imaginary leads (potential customers) should we create?
LEADS_TO_GENERATE = 100
# How many records of interactions (conversations, attempts) should we log?
CONVERSIONS_TO_GENERATE = 200

# What should we name the final Excel file?
OUTPUT_FILENAME = "Generated_Database.xlsx"
```

  * `USERS_TO_GENERATE = 50`: Sets the number of fake employees (users) to create.
  * `LEADS_TO_GENERATE = 100`: Sets the number of fake potential customers (leads).
  * `CONVERSIONS_TO_GENERATE = 200`: Sets the number of interaction records to create in our tracker sheet.
  * `OUTPUT_FILENAME = "Generated_Database.xlsx"`: Sets the name for the final Excel file that will be saved.

### Section 3: A Reusable Helper

This method's job is to write the column titles at the top of a spreadsheet.

```ruby
# A simple method to write the titles for the columns at the top of a sheet.
def add_headers(sheet, headers)
  headers.each_with_index do |header, index|
    sheet.add_cell(0, index, header)
  end
end
```

  * `def add_headers(sheet, headers)`: It needs two pieces of information to work: **which sheet** to write on (`sheet`) and **what titles** to write (`headers`).
  * `headers.each_with_index do |header, index|`: This tells the computer to look at each title in the `headers` list, one by one. As it does this, it keeps track of the title itself (`header`) and its position in the list (`index` - 0 for the first, 1 for the second, etc.).
  * `sheet.add_cell(0, index, header)`: This is the instruction to write in a cell. It says: "On the given `sheet`, `add_cell` with this info: at **row 0** (the very top row), at column position `index`, write the column title `header`."

### Section 4: The Assembly Line (Creating the Data Sheets)

#### Creating the 'Users' Sheet

```ruby
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
    sheet.add_cell(row_index, 4, [true, false].sample)
    sheet.add_cell(row_index, 5, ['sales', 'management', 'admin'].sample)
  end

  Faker::Name.unique.clear
  Faker::Internet.unique.clear

  puts "-> Done."
  return user_ids
end
```

  * `def populate_users(sheet, count)`: It needs to know **which sheet** to work on and **how many** users to create.
  * `headers = [...]`: This creates the list of column titles we want for this sheet.
  * `add_headers(sheet, headers)`: Here, we use our `add_headers` method to write those titles onto the sheet.
  * `user_ids = []`: We create an empty list to store the ID of each user we create. 
  * `count.times do |i|`: "Repeat the following steps `count` number of times." (In our case, 50 times, based on our settings).
  * `row_index = i + 1`: Since the first row (row 0) is for headers, our actual data starts on row 1.
  * `id = i + 1`: We create a simple ID number for each user (1, 2, 3, and so on).
  * `user_ids << id`: We add the new user's ID to our `user_ids` list for later use.
  * `sheet.add_cell(...)`: These lines fill in the data for one user, column by column.
      * `Faker::Name.unique.name`: Asks the **Faker** tool for a unique fake name.
      * `Faker::Internet.unique.email`: Asks **Faker** for a unique fake email.
      * `[true, false].sample`: Randomly picks either `true` or `false` from the list.
      * `['sales', ...].sample`: Randomly picks one role from the list.
  * `Faker::Name.unique.clear`: This is a bit of cleanup. It tells **Faker** to forget the unique names it has already used, so we can generate fresh unique names for the next sheet without any issues.
  * `return user_ids`: Once all the users are created, this instruction hands the completed list of `user_ids` back to the main script.

#### Creating the 'Leads' Sheet

```ruby
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

  Faker::Name.unique.clear
  Faker::Internet.unique.clear
  puts "-> Done."
  return lead_ids
end
```

  * This function follows the exact same logic as `populate_users`, but with different headers and different **Faker** tools to generate lead-specific information like phone numbers, company names, and budgets.
  * `return lead_ids`: Just like before, it hands back the completed list of `lead_ids`.

#### Creating the 'Conversion Tracker' Sheet

```ruby
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
```

  * `def populate_conversion_tracker(...)`: This method needs to know which `sheet` to write on, `how many` records to create, and most importantly, it needs the `lead_ids` and `sales_rep_ids` (which are our user IDs) lists.
  * `pipeline_stages = [...]`: Creates a list of possible stages in a sales process.
  * `lead_ids.sample`: It randomly picks one ID from the `lead_ids` list we created earlier.
  * `sales_rep_ids.sample`: It randomly picks one ID from the employee (`user_ids`) list. 
  * The rest of the `sheet.add_cell` lines use **Faker** and random numbers to fill in the remaining details about the interaction.

### Section 5: Putting It All Together

```ruby
# Get a brand new, blank Excel workbook.
workbook = RubyXL::Workbook.new

# The new workbook starts with one sheet named 'Sheet1'. We'll rename it.
workbook.worksheets[0].sheet_name = 'Users'

# Find the sheet we just named 'Users'.
users_sheet = workbook['Users']
# Run the 'populate_users' recipe and save the list of IDs it gives back.
user_ids = populate_users(users_sheet, USERS_TO_GENERATE)

# Add a brand new, blank sheet and name it 'Leads'.
leads_sheet = workbook.add_worksheet('Leads')
# Run the 'populate_leads' recipe and save the list of lead IDs.
lead_ids = populate_leads(leads_sheet, LEADS_TO_GENERATE)

# Add another new sheet and name it 'Conversion Tracker'.
conversion_sheet = workbook.add_worksheet('Conversion Tracker')
# Run the tracker recipe, giving it the user and lead IDs it needs.
populate_conversion_tracker(conversion_sheet, CONVERSIONS_TO_GENERATE, lead_ids, user_ids)

# After all sheets are filled, save the workbook to a file.
workbook.write(OUTPUT_FILENAME)

puts "\nSuccess! A new file named '#{OUTPUT_FILENAME}' has been created with fake data."
```

  * `workbook = RubyXL::Workbook.new`: **Step 1:** Create a brand new, empty Excel workbook in memory.
  * `workbook.worksheets[0].sheet_name = 'Users'`: **Step 2:** The new workbook has a default first sheet. We find it and rename it to 'Users'.
  * `users_sheet = workbook['Users']`: **Step 3:** We grab that specific sheet so we can write on it.
  * `user_ids = populate_users(...)`: **Step 4:** We call our 'Users' recipe, telling it to fill out the `users_sheet`. We carefully catch and store the list of IDs it returns.
  * `leads_sheet = workbook.add_worksheet('Leads')`: **Step 5:** We add a completely new, blank sheet to our workbook and name it 'Leads'.
  * `lead_ids = populate_leads(...)`: **Step 6:** We call our 'Leads' recipe to fill out the new sheet, again catching the list of IDs it returns.
  * `conversion_sheet = workbook.add_worksheet(...)`: **Step 7:** We add a third sheet for the conversion tracker.
  * `populate_conversion_tracker(...)`: **Step 8:** We call the final recipe. This time, we pass it the `user_ids` and `lead_ids` we've been saving so it can make the connections.
  * `workbook.write(OUTPUT_FILENAME)`: **The Final Step\!** This command takes the entire workbook we've built in the computer's memory and saves it as a real `.xlsx` file on your computer, using the name we chose in our settings.
