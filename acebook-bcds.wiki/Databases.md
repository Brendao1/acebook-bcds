`config/database.yml` shows name and type of databases.

Use TablePlus to view tables:
- create the connection to pgapp_development and pgapp_test and pgapp_production

When deployed on Heroku, it's also possible to view the remote database. See the [Heroku](https://github.com/soroushh/acebook-bcds/wiki/Heroku#looking-inside-the-database-that-the-heroku-app-is-using) wiki document

## Challenges
A common problem is that the database doesn't update properly. You can run ```bin/rails db:reset``` from the command line which should fix it.