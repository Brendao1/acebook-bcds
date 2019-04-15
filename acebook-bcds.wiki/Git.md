
## Git Process

### Golden rules

1. Remember to pull first


### Committing a branch:

1. Always start working on a branch.

2. Create an issue.

3. Create the branch on Github and pull to local. 

4. After a branch is committed, the other pair rebases to master.



### Test branches
- Develop tests in a testing branch, merge back into its dev branch after they are written and passing
- e.g. in GitHub, switch to branch `user_issues_1` and create new branch there called `user_issues_1_test`. Then `user_issues_1_test` is a branch off  `user_issues_1`

## Making Pull Requests

When making a pull request, wait 3-4 minutes for Travis CI to complete checking tests. 

## Challenges encountered

1. Authentication on Brenda's account - used Keychain Access in MacOS to resolve. 

## Going back to a previous commit

This way reverts local changes to the state of the commit:
```
git log
copy hash of commit
git reset --soft <commit hash>
```

David to review this method, I am not sure: 
```
git log
copy hash of commit
git reset --HARD <commit hash>
git add .
git commit -m <message>
git push force
```

## How to review a PR
```
git checkout branch that is being reviewed
bundle
rails s
rspec
```
