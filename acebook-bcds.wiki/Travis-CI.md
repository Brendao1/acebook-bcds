Follow these setup instructions: https://medium.com/full-taxx/how-to-setup-travis-ci-for-a-rails-application-78a453963300

```bash
# in Gemfile:
gem 'travis'
```

```bash
$ bundle
$ travis init # creates travis.yml
```
[input username and password for Travis account]

In the travis file - we set out our setup for travis to run in [```travis.yml```](https://github.com/soroushh/acebook-bcds/blob/master/.travis.yml)



Git add and commit. 
View job log on website

Outputs: 3 passes. So it ran the test. 
Now every time we commit to Master, Travis will update automatically and run the tests. 


Add a bash: this will tell us the message: build passing in our repo. 
Copy and paste the build:unknown  text in markdown mode and put it into README.md so we can see the message. 


Go to Travis website, so now we can see the project in our account

$ travis open << opens project in browser


In local project repo:
Git pull
Git add/push


On website:
In current tab, we can see that a connection is started
View config shows the travis.yml file
In job log you can see the tests
