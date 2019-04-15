# UPDATE

## Update database

- In db, added user_id foreign key to posts table, from current_user.id 
- ```require user_id``` in post_params method in posts_controller.rb

## Update the front end
- Create a hidden field for :user_id with the value current_user.id in posts/new.html.erb

## Update models 
- A post belongs to a ```:user```
- And a user has_many ```:posts```

## Feature TDD: Update (Edit/Patch) and Delete
- Update other tests to create a user and include user_id: user.id in create methods
- Write feature test for 'update'. 
- Write unit test for 'update' in same format at 'create' test. It passes automatically.

### 'PATCH /'

- We use `PATCH /` because we are only updating part of a post, the message

- in `views/main/index.html.erb`, add an update method. `link_to "Update", edit_post_path(path)`. This passes the post to the `edit_post_path`
- after `posts_controller.rb` need to make an edit view
- make a new file in posts `edit.html.erb` and create a form (similar to new post)

### Delete

In order to be able to do the deleting process for the different posts, we should make the following steps:

1. We write the test in the file `spec/features/delete_post_spec.rb`

2. Then we define a method called destroy on the `posts_controller.rb` in the `destroy` method, we will find the post by means of `params[:id]` which is the id of each post. The we will use the 'destroy' method to delete it form database. 
` def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end` 

3. in the file `views/main/index.html.erb`, we add the button for deleting each post when it is shown. 


### TDD the feature in which a user can only delete and update his/her posts:

At first, we will write the test to check the user is only able to see the links delete and update for his or her posts:

we will correct the file `spec/features/delete_post_spec.rb` and write a new test. 

In this test, it will be checked that the user who has made the post will see the delete and update links only. 

Then, we will add an if statement in the `controllers/views/main/index.html.erb` file that enables us to see the delete and update buttons only when the time the id of the current user is equall to the user_if of the post.

so, now we will see the update and delete buttons for each post when the user who has created the post is logged in. 

 
