## (Feature) Posts can be 'liked'
## Description
Posts and comments can be 'liked' and the number of likes is visible next to the post or comment

## Acceptance Criteria
A signed in user can:
<br>click on a 'like' emoji next to posts and comments to indicate a like
<br>can then click on emoji to remove that like.
<br>a count of likes shows next to the like emoji
<br>Users can like each post only once

## Process

Follow these instructions: https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2

```
rails g model Like post:references user:references

rails db:migrate
```

View table in postgres
```
SELECT * FROM likes; 
```
We have 2 foreign keys: post_id and user_id

```
rails g controller likes
```

## Writing the test
Write the feature test: users_can_like_posts_spec.rb
We've decided to go with a link because it's simpler. 

## Add resource
Add to config/routes.rb . We use nested routes for likes
```
resources :posts do 
  resources :likes
end 
```

Now we can see the routes in the routes:
```
rails routes
```
## Update main.index.html.erb
Add a link to the view - id 'Like' means that the link will be read as 'Like' even if we use an emoji as the view.
```
<%= link_to "👍", post_likes_path(post), :id => 'Like', method: :post %>
```

## Remove underline using CSS
in application.css
```#Like {text-decoration: none;}```

## Run the tests
We get a failing error because we need to define the 'new' method for likes. 

## Create views/likes/new.html.erb
Do similar form to post

## In likes/controller
- ```before_action :find_post```
- ```create``` method: create a like with user id and redirect to root 
- private ```find_post``` method: find the post by ```:post_id```

## In model
- Set up dependencies posts & users ```has_many``` likes, and likes ```belong_to``` posts & users 


## Counting likes
in index.html.erb
```posts.all.likes.length```

## User can't do multiple likes & can 'unlike'
We decided that if a user clicks on a like it will delete it. That deals with both ensuring a user does not have multiple likes, and that they can 'unlike'. In 
```
<%= mylike = Like.where(user_id: current_user.id, post_id: post.id %>
<% if mylike.exists? %>
<%= link_to "👍🏻", post_like_path(post, mylike.id)), :id => 'Like' %>
# snippet 
```

- in likes_controller.rb
create ```destroy``` method 
create ```find_like ``` private method, and add this method to before_action

## Defining associations
- Since posts and users have many likes and posts, in the Post model, add:
```
has_many :likes, dependent: :destroy
```
In the User model, add:
```
has_many :user, dependent: :destroy
```







