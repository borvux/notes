## Rails Basics

### MVC Architecture
Understand the Model-View-Controller (MVC) pattern. Models handle data and logic, views handle presentation, and controllers act as an intermediary between models and views.

## Routing

### Configuring Routes
Define routes in `config/routes.rb` using the `get` and `post` methods.

```ruby
get("/path", { :controller => "controller_name", :action => "action_name" })
post("/path", { :controller => "controller_name", :action => "action_name" })
```

### Resource Routing
Although not preferred at first, eventually you’ll use resource routing to define routes following RESTful conventions.

## Controllers

### Actions
Define actions within controllers to handle requests.

```ruby
class MoviesController < ApplicationController
  def index
    # Retrieve and display a list of all movies
    @movies = Movie.all
    render({ :template => "movies/index" })
  end
end
```

## Views

### ERB Templates
Create `.html.erb` files in the `app/views` directory to write HTML with embedded Ruby code.

### Displaying Data
Use instance variables from controllers to display data in views.

## Models

### ActiveRecord
Models inherit from `ActiveRecord::Base` and represent tables in your database.

### Queries
Use ActiveRecord methods to query the database.

```ruby
matching_movies = Movie.where({ :id => params.fetch("id") })
@movie = matching_movies.at(0)
```

### Validations
Define validations within models to ensure data integrity (even though we don’t discuss them at first).

## Database Migrations

### Creating Migrations
Use `rails generate migration MigrationName` to create migration files for altering the database schema.

### Running Migrations
Use `rails db:migrate` to apply migrations to the database.

## Console

### Rails Console
Use `rails console` to interact with your application’s models and data directly.

## Gems

### Gemfile
Add gems to your Gemfile and run `bundle install` to include external libraries in your application.

### Common Gems
Learn to use gems like `http` for HTTP requests and `carrierwave` for file uploads.

## Static Assets

### Public Folder
Add custom CSS or static assets to the `/public` folder in Rails projects.

## Debugging

### Rails Server Logs
Check the logs produced by `rails server` to debug issues.

### Rails Console
Use the Rails console to test out snippets of Ruby or ActiveRecord queries.

## Best Practices

### Readability
Write clean, readable code and follow Ruby and Rails conventions.
