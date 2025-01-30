# Sinatra Summary

Sinatra is a lightweight and flexible web application framework written in Ruby. It’s perfect for building small to medium-sized web applications, APIs, and microservices. Below is a summary of the key concepts and features.

---

## **1. Basic Structure of a Sinatra App**

A Sinatra app is typically a single file (though it can be modularized). It uses a DSL (Domain-Specific Language) for defining routes and handling HTTP requests.

```ruby
require 'sinatra'

get '/' do
  "Hello, World!"
end
```

## **2. Routes**

Sinatra uses HTTP methods (get, post, put, patch, delete, etc.) to define routes. Routes are matched in the order they are defined.

```ruby
get '/hello' do
  "Hello!"
end

post '/submit' do
  # Handle form submission
end
```

## **3. Route Parameters**

You can capture dynamic parts of the URL using \:param.

```ruby
get '/hello/:name' do
  "Hello, #{params[:name]}!"
end
```

## **4. Views and Templates**

Sinatra supports templating engines like ERB, Haml, and Slim. Views are typically stored in a views folder. Use the erb method to render templates.

```ruby
get '/hello/:name' do
  @name = params[:name]
  erb :hello
end
```

Example `views/hello.erb`:

```erb
<h1>Hello, <%= @name %>!</h1>
```

## **5. Static Files**

Static files (CSS, JS, images) are served from the `public` folder by default.

## **6. Request and Response**

Access request data via the `request` object. Modify the response using the `response` object.

```ruby
get '/example' do
  request.user_agent # => Browser info
  response.status = 404 # => Set status code
  "Not Found"
end
```

## **7. Filters**

Use `before` and `after` filters to execute code before or after a request.

```ruby
before do
  @time = Time.now
end

after do
  puts "Request took #{Time.now - @time} seconds."
end
```

## **8. Sessions**

Enable sessions to store user data across requests. Sessions are stored in cookies by default.

```ruby
enable :sessions

get '/set' do
  session[:message] = "Hello, Session!"
end

get '/get' do
  session[:message] || "No session data found."
end
```

## **9. Redirects**

Use the `redirect` method to send the user to a different route or URL.

```ruby
get '/old' do
  redirect '/new'
end

get '/new' do
  "Welcome to the new page!"
end
```

You can also specify a status code for the redirect:

```ruby
redirect '/new', 301 # Permanent redirect
```

## **10. Error Handling**

Define custom error pages for specific status codes.

```ruby
not_found do
  "This page doesn't exist!"
end

error 500 do
  "Something went wrong!"
end
```

## **11. Modular Sinatra Apps**

For larger apps, use the modular style.

```ruby
require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    "Hello from Modular Sinatra!"
  end
end

MyApp.run!
```

## **12. Configuration**

Configure settings using `set` or `configure`.

```ruby
configure do
  set :environment, :production
  set :port, 4567
end
```

## **13. Helpers**

Define helper methods to reuse code across routes.

```ruby
helpers do
  def greet(name)
    "Hello, #{name}!"
  end
end

get '/greet/:name' do
  greet(params[:name])
end
```

## **14. Middleware**

Sinatra can use Rack middleware for additional functionality.

```ruby
use Rack::Auth::Basic do |username, password|
  username == "admin" && password == "secret"
end
```

## **15. Testing**

Use testing frameworks like RSpec or Test::Unit to test your Sinatra app.

```ruby
require 'test/unit'
require 'rack/test'
require_relative 'app'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_homepage
    get '/'
    assert last_response.ok?
    assert_equal "Hello, World!", last_response.body
  end
end
```

## **16. Deployment**

Deploy Sinatra apps using tools like Phusion Passenger, Unicorn, or Puma. Use Rackup (`config.ru`) for deployment.

```ruby
# config.ru
require './app'
run Sinatra::Application
```

## **17. Common Gems**

Use gems like `sinatra-contrib` for additional features (e.g., reloading, JSON support).

Use `sinatra-activerecord` for database integration.

## **18. Key Commands**

- Run a Sinatra app: `ruby app.rb`
- Use `rackup` to start the app with a `config.ru` file.

## **19. Best Practices**

- Keep your routes clean and delegate logic to helper methods or models.
- Use modular style for larger applications.
- Test your app thoroughly.


