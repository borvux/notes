## Generate Model

```bash
rails generate model Item link_url:string link_description:string thumbnail_url:string
```

The generator creates two files:

- A migration file in `db/migrate/` that defines the table structure.
- A model file in `app/models/item.rb`.

Below is an example migration for creating the `items` table:

```ruby
class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table(:items) do |t|
      t.string(:link_url)
      t.string(:link_description)
      t.string(:thumbnail_url)

      t.timestamps
    end
    return
  end
end
```

## Running Migrations

To update your database schema based on your migration files, run:

```bash
rake db:migrate
```

This command instantiates each migration class (for example, `CreateItems`), calls its `change` method, and applies the schema changes to your database.

## Defining Models

Models are Ruby classes that inherit from `ApplicationRecord` (which in turn inherits from `ActiveRecord::Base`). A model represents a table in your database, and each instance is a row in that table.

For example, the `Item` model:

```ruby
class Item < ApplicationRecord
  # Additional model logic (validations, custom methods) can go here.
  return
end
```

## CRUD Operations

ActiveRecord makes it easy to create, read, update, and delete records. One key point for this course is to assign to each attribute individually and then call `save`.

### Create

```ruby
item = Item.new
item.link_url = "https://en.wikipedia.org/wiki/Ruby_on_Rails"
item.link_description = "Rails Homepage"
item.thumbnail_url = "https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg"
item.save
return
```

### Read

#### Fetching All Records

```ruby
all_items = Item.all
all_items.each do |an_item|
  puts an_item.link_url
end
return
```

#### Fetching Records by Conditions

Prefer using the `.where` method to retrieve records. For example:

```ruby
matching_items = Item.where({ :link_description => "Rails Homepage" })
first_item = matching_items.at(0)
puts first_item.link_url
return
```

### Update

Retrieve a record, update individual attributes, and then save:

```ruby
matching_items = Item.where({ :link_description => "Rails Homepage" })
item = matching_items.at(0)
item.link_description = "Rails Official Homepage"
item.save
return
```

### Delete

To remove records, you can use the `destroy` method on an instance or `destroy_all` to remove all matching records:

```ruby
item = Item.where({ :link_description => "Rails Homepage" }).at(0)
item.destroy
return
```

Or to delete all records:

```ruby
Item.destroy_all
return
```

## Querying with ActiveRecord

ActiveRecord provides a rich interface for querying the database.

### Using `.order` to Sort Records

```ruby
ordered_items = Item.all.order({ :created_at => :desc })
ordered_items.each do |an_item|
  puts an_item.link_url
end
return
```

### Counting Records

If you want to count occurrences of a value in an array, use the `count` method with an argument. For example:

```ruby
link_count = Item.all.count("https://en.wikipedia.org/wiki/Ruby_on_Rails")
puts link_count
return
```

Remember:

When querying for a single record from a `.where` call, assign a variable to the query result and then use `.at(0)`:

```ruby
matching_items = Item.where({ :id => 42 })
the_item = matching_items.at(0)
return
```

## Working with Data

### Rails Console

For quick experiments and debugging, use the Rails console:

```bash
rails c
```

Inside the console, try creating records, running queries, or even updating fields to see the immediate results.

### Rake Tasks for Sample Data

You can also automate the creation of sample data with a Rake task. For example, the following task (placed in `lib/tasks/dev.rake`) clears the table and adds new records:

```ruby
desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  puts "Creating sample data..."
  
  if Rails.env.development?
    puts "Deleting previous data..."
    Item.destroy_all
  end
  
  puts "Creating first item..."
  item_1 = Item.new
  item_1.link_url = "https://paulgraham.com/startupideas.html"
  item_1.link_description = "How to Get Startup Ideas"
  item_1.thumbnail_url = "https://fastly.picsum.photos/id/554/200/200.jpg?hmac=wvBDWVN6iXLUYv4DYpQ9fWSg_2y3dCYyzy4N_6H26pY"
  item_1.save
  
  puts "Creating second item..."
  item_2 = Item.new
  item_2.link_url = "https://rubyonrails.org/"
  item_2.link_description = "Rails Homepage"
  item_2.thumbnail_url = "https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg"
  item_2.save
  
  puts "Done!"
  return
end
```

After saving this file, run the task with:

```bash
rake sample_data
```

This automatically populates your database with sample records.

## Best Practices

### Assign Attributes Individually

When creating or updating records, assign each attribute and then call `save`. Avoid mass assignment using methods like `create` or `update`.

### Use `.where` for Queries

Always prefer the `.where` method when querying for records instead of using methods such as `find` or `find_by`.

### Retrieve Single Records with `.at(0)`

When you expect only one result, first query with `.where` and then retrieve the first element using `.at(0)`.

### Ordering, Counting, and Looping

Use the `.order` method to sort, and if counting occurrences in an array, pass the value directly to the `count` method. For example:

```ruby
nums.count(3)
```

over using a block.

### Use Explicit `return` Statements

When writing custom methods (outside controllers), include an explicit `return` at the end.
