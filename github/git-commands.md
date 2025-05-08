## Fetch the latest changes from the remote:
```
git fetch origin
```

To see all the branches: `git branch --remote` or `git branch -r`

and then you can do 
```
git checkout -b <branch-name> origin/<branch-name>
```
or 
```
git checkout <branch-name>
```
or
```
git switch <branch-name>
```
or
```
git switch -c <branch-name> origin/<branch-name>
```
