URL to access our app from remote server: 

https://acebook-bcds.herokuapp.com/

Travis CI is deployed from Soroush’s account. Heroku is also deployed from Soroush’s account.

Soroush's Heroku account is the only one that allows us to connect to the acebook remote repo, so we're using this account for both Heroku and Travis. 

We deploy our app to the Heroku by using the instructions: https://docs.travis-ci.com/user/deployment/heroku/

On master branch, run the commands:

```bash
travis encrypt $(heroku auth:token) --add deploy.api_key --pro

travis login --pro

# Log into Soroush's Travis account.
```

The travis.yml file should have an `deploy:` similar to the following:
```
deploy:
  provider: heroku
  api_key:
    secure: ...
  app: acebook-bcds
  on:
    repo: soroushh/acebook-bcds
```
`travis setup heroku --pro` will fill in the `api_key`.

If it is ever necessary to regenerate/replace this key, use `travis encrypt $(heroku auth:token) --add deploy.api_key --pro` or else rerun the setup with `travis setup heroku --pro`.

Note that use of '--pro' is because this project is deployed on `travis-ci.com`. If it used  `travis-ci.org`, then the command should be run with `--org` instead.

We used the following web page instructions to deploy on Heroku: https://devcenter.heroku.com/articles/git

```
# Run in root of project directory to create a new Heroku app: 
heroku create

# Because we did not run `heroku create acebook-bcds`, we had to rename it:
heroku apps:rename acebook-bcds

# Make sure that that url of Heroku remote is still correct:
git remote -v

# Expect the following two lines to be present:
# heroku	https://git.heroku.com/acebook-bcds.git (fetch)
# heroku	https://git.heroku.com/acebook-bcds.git (push)

# If necessary, run the following git remote commands to remove and re-add the Heroku repo url:
git remote rm heroku
git remote add heroku https://git.heroku.com/acebook-bcds.git

# We will set up automatic deployment from GitHub repo but to start with we can push a copy from our local repo:
git push heroku master
```
In Heroku account, go to the “Deploy” section of your app select “GitHub” as your deployment method, connect to your github repo and in the “Automatic deploys” section select the production branch master and check the “Wait for CI to pass before deploy” checkbox.

Wait 5 minutes for Travis-CI to finish deploying.

Here is the URL for the remotely hosted app is now hosted here: https://acebook-bcds.herokuapp.com

## Heroku DB stuff

### If app deploys successfully to Heroku but doesn't run correctly
e.g. Clicking sign in, or sign up, doesn't work
Try running:
```bash
heroku login 
# Log in to Heroku via the browser
heroku run rake db:migrate 

```
### Looking inside the database that the Heroku app is using
Look up the credentials for the Heroku app's database so that you are able to connect to it yourself, i.e. with TablePlus:  
- Visit https://dashboard.heroku.com/apps/acebook-bcds/resources
- Under *Add-ons*, click **Heroku Postgres**
- Click **Settings** tab
- Click the **View Credentials...** button next to _Database Credentials_
- Note the Host/Port, User/Password, and Database name
- Create a new connection in TablePlus so that you can connect to, and access, the database.

## Adding collaborators to Heroku:

In command line:
``` 
heroku access:add <email>
```
