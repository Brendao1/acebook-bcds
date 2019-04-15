## Sign up, sign in, sign out

The devise gem is used to handle the issues related to users such as sign-up, sign-in and sign-out.

In order to use the devise gem, we make the following steps:

1. Adding the devise gem to our Gemfile.

gem 'devise'

2. running the bundle install in our terminal.

3. Running the generator inside the command line by the following command:

$ rails generate devise:install

4. Putting the following text in the file which address is "config/environments/development.rb" . 

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

5. Making the user model by running the following command in the terminal:

$ rails generate devise User

6. Creating the user table by the following command in terminal:

rails db:migrate

## Steps

```bash
$ gem 'devise', '~> 4.2'

$ bundle

$ rake db:migrate
```
Check table plus that users table is there.
```
$ rails s
```
We haven’t got views, so now we generate the views.
```
$ rails generate devise:views
```
Start the server and go to users/sign_up. There we see our form.

We committed this to the branch. 

**DON'T GENERATE THE CONTROLLERS with DEVISE.** This breaks the routing.

Everything in application.html appears on every page. So that’s why we put the nav bar here.

Manually create the view for the main page:

1. We want to create a view for the homepage, so we created views/layouts/index.html.erb. In this view we put the links to sign up or sign in. This is not a Devise view, it's just a rails view. It just contains links to Sign up and Log in. 

2. We ran this command to generate the Main controller
```
$ bin/rails generate controller Main index
```
The `index` is actually crucial because it means that the controller Main will have an action called in

3. Put this in the index view, ie in file: views/layouts/index.html.erb: 
```
<p class="navbar-text pull-right">
<% if user_signed_in? %>
  Logged in as <strong><%= current_user.email %></strong>.
  <%= link_to 'Edit profile', edit_user_registration_path, :class => 'navbar-link' %> |
  <%= link_to "Logout", destroy_user_session_path, method: :delete, :class => 'navbar-link'  %>
<% else %>
  <%= link_to "Sign up", new_user_registration_path, :class => 'navbar-link'  %> |
  <%= link_to "Login", new_user_session_path, :class => 'navbar-link'  %>
<% end %>
</p>
```
4. Then in routes.rb, at the bottom add:
```
root to: ‘main#index’
```

password length can be specified in `/config/initializers/devise.rb`:
```
  # Range for password length.
  config.password_length = 6..10
```

[ if you type $ bin/rails generate controller Main index, it will automatically generates the index view and updates the root with get 'main/index', but you still need to add root to: 'main#index ]

