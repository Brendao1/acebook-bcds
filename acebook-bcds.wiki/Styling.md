Now, it is the time to make our app a bit more beautiful by doing styling.

We will use the `materializecss.com` website frameworks for that. 


## Applying style to the views

- Layouts/application.html.erb contains the navbar as this view is rendered application-wide.
```<div class= "container">
<nav>put the navigation bar links in here</nav>
```
The ```<% yield %> ```renders the next view which is index.html

## Adding fonts

- Added the name of the fonts to a font-family to apps/assets/stylesheets/application.scss thus:
```
html { 
font-family: Trebuchet, GillSans, sans-serif
}
```
Then in index.html you just add the the font-family to the style.

## RSpec

- Making changes to the Layouts/application.html.erb and Layouts/index.html.erb files, we run RSpec after each change to ensure the tests are still passing. 

## Resources

- https://materializecss.com/
- Materialize crash course video: https://www.youtube.com/watch?v=nqT8c5OFjEQ








