# Using Github for research and life  
## Workshop on using `git` and Github (this thing you're on now) for version control, project collaboration, and data sharing    

### Matthew Malishev<sup>1*</sup>

##### _<sup>1</sup> Department of Biology, Emory University, 1510 Clifton Road NE, Atlanta, GA, USA, 30322_    

##### *Corresponding author: matthew.malishev [at] gmail.com  

File extensions:     
.Rmd    
.html    
.pdf  
.tex  
.jpeg  
.png  
.gif     

******   

## Installation instructions  

[Download the instructions](https://github.com/darwinanddavis/githubpres/raw/master/installing_git.pdf) for installing `git` for both Mac OSX and Windows.  

## Seminar slides  

Right click and select 'Save as', then open the HTML on your preferred browser:      
[Using Git with GUI (Part I)](http://htmlpreview.github.io/?https://github.com/darwinanddavis/githubpres/blob/master/github_presentation.html)      

[Using Git with Terminal (Part II)](http://htmlpreview.github.io/?https://github.com/darwinanddavis/githubpres/blob/master/github_presentation_part2.html)          

## The short version (with Terminal)      

Local git (version control on your computer)    
```{shell eval=F, echo=T}
git init # initialise your local git  
git add . # adds all files to git. replace '.' with filename for individ files
git commit -m 'redo intro' # '-m' = message 
```

Remote git (version control on your github)  
```{shell eval=F, echo=T}
# after the above steps ^ 
# see what remote repo you have. if a github exists, you can push
git remote -v  
# set the new remote repo (if necessary)  
git remote add origin "your github repo"  # if remote branch doesn't exist
git remote set-url origin "your github repo"  # if already exists
# push changes from local repo to remote repo 
git push
```    

<!-- _____________________________ break ________________________________ -->  
# :pig: Troubleshooting  
  
**Exiting command editor**    
Write your message at the top of the editor, then run the following:  
    
Hit ESC  
`w` + ENTER = write (save)  
`q` + ENTER = quit         
`q!` + ENTER = quit w/o saving     

## Common errors     

**fatal: remote origin already exists**  
The remote origin already exists, so you can't add it again
```{shell eval=F, echo=T}  
git remote rm origin # if origin already exists, remove it
git remote add origin "your github repo" # then re-add 
git push origin master # then push again  
```

**! [rejected] master -> master (non-fast-forward)**
Someone else has made changes since your latest ones and git refuses to lose the commit, so won't push your new changes  
```{shell eval=F, echo=T}  
git pull origin master # fetches any updates to online repo and merges them    
```   

**fatal: refusing to merge unrelated histories**
Usually associated with a README file on the Github repo  
```{shell eval=F, echo=T}  
git pull origin master --allow-unrelated-histories # unnecessary parallel history 
# merged to your project. usually associated with a README.md file
```
If VIM opens, type 'SHIFT + :', then press ENTER  

**fatal: The current branch master has no upstream branch**    
```{shell eval=F, echo=T}  
git push --set-upstream origin master
```

<!-- _____________________________ break ________________________________ -->
## Weird technical errors 

**invalid active developer path** (Mac OSX and XCode issue)    
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun    
```{shell}
xcode-select --install # install missing xcode developer tools
xcode-select --reset # if above install doesn't work, reset xcode 
```

<!-- _____________________________ break ________________________________ -->
## Staging and pushing files  

Re-do a commit    
```{shell eval=F, echo=T}
git reset --soft HEAD~1
```

Alternative push option 
```{shell eval=F, echo=T}
# option 1
git remote set-url origin "link to existing github repo" # talk to github 
git push -u origin master
# option 2
git remote add github "your github repo"  # if remote branch doesn't exist
git push -u github master
```

After pushing to your remote repo and this error appears:  
` ! [rejected] master -> master (fetch first)`
```{shell eval=F, echo=T}   
git fetch origin master # match the local repo commit status to the push destination     
git merge master # merge the recent commits    
git push -u origin master # push to remote repo  

# ------- for non-fast-forward error  ---------
# grab changes made on remote repo and align with local master branch 
git fetch origin master:tmp  
git rebase tmp
git push origin HEAD:master # push the changes from local HEAD to remote    
git branch -D tmp
git push -u origin master # finalise the changes  
```

For `fatal: refusing to merge unrelated histories` error  
```{shell eval=F, echo=T}   
git checkout master
git merge origin/master --allow-unrelated-histories
# or run this before your 'git pull origin master' command  
git pull --allow-unrelated-histories origin master 
```

Delete files from remote repo (option 1)   
```{shell eval=F, echo=T}
git rm --cached file1.txt
git commit -m "remove file1.txt"
git push
```

Delete files from a Github repo (option 2)
```{shell eval=T, echo=T}
# ensure you are in the default branch:
git checkout master
# the rm -r command will recursively remove your folder:
git rm -r folder-name
#Commit the change:
git commit -m "Remove duplicated directory"
# push the change to your remote repo
git push origin master
```

<!-- __________________________ break _______________________________ -->
## Accessibility   

If Github questions your user credentials.      
```{shell eval=F, echo=T}
git config --global user.email "<your email>" 
git config --global user.name "<your github user name>" 
```

Cache your user credentials to avoid being asked everytime  
```{shell eval=F, echo=T}
# once in git directory   
git config credential.helper store  
```

When using SSH for your github remote repo, e.g. `git@github.com:username/reponame.git` 

[Generating a new SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)  

Accessing your SSH key:  

- In Mac, in _Terminal_, type   
```{shell eval=F, echo=T}
cat ~/.ssh/id_rsa.pub  
```
- In Windows, in _cmd_, type   
```{shell eval=F, echo=T}
ls ~/.ssh/*.pub   
```

<!-- _____________________________ break ________________________________ -->
## Accessing commits {.build}    

[How to undo anything with Git](https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/)    

[How to access recent commits to your local repo](https://stackoverflow.com/questions/4114095/how-to-revert-a-git-repository-to-a-previous-commit)  

```{shell eval=F, echo=T}
git log # check recent activity and select commit e.g. 0df4g3 ...  
git checkout "enter your commit tag"  
git checkout master  # return to current branch 
```

<!-- _____________________________ break ________________________________ -->
## Creating automatic commits/push commands {.build} 

1. Install `fswatch` https://github.com/emcrisostomo/fswatch (requires [Homebrew package manager](https://brew.sh/) for Max OSX).  

2. Create a script for the commit and push (auto_commit_push.sh)  

```{shell eval=F, echo=T}  
#!/bin/bash
# <<branch>> = branch you are pushing to
git commit -m "auto commit" $1 
git push origin <<branch>> 
```

<!-- _____________________________ break ________________________________ -->
## Creating automatic commits/push commands (cont ...) {.build} 

3. In Terminal, navigate to your folder with the git  
```{shell eval=F, echo=T}  
# <<file>> = file you want to monitor
# <<path/to/auto_commit_push.sh>> = path to the script created above
fswatch -0 <<file>> | xargs -0 -n 1 bash <<path/to/auto_commit_push.sh>>
```

4. Keep the `fswatch` command still active in a separate shell, do whatever you want and when monitored file is updated, it will automatically be committed and pushed.      

<!-- _____________________________ break ________________________________ -->
## References   

[Generating a new SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)    

[How to undo anything with Git](https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/)    

[How to access recent commits to your local repo](https://stackoverflow.com/questions/4114095/how-to-revert-a-git-repository-to-a-previous-commit)

[Origin master - rejected (fetch first), no file in GitHub repository](https://stackoverflow.com/questions/46619527/gitbash-origin-master-rejected-fetch-first-no-file-in-github-repository)    

[Intro to git: Branches, pull requests, and other useful stuff](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)   

[Automatically push an updated file whenever it is changed](https://gist.github.com/darencard/5d42319abcb6ec32bebf6a00ecf99e86) 

Using git and Github with R: [Happy Git and Github for the useR](http://happygitwithr.com/)  

[Creating and Hosting a Personal Site on GitHub](http://jmcglone.com/guides/github-pages/)    

[Switching between terminal and GUI](https://pages.github.com/)  

[Using Github pages](https://stackoverflow.com/questions/15563685/can-i-create-more-than-one-repository-for-github-pages)    

[Using RMarkdown](https://rmarkdown.rstudio.com/)    

[Shiny web app](https://shiny.rstudio.com/)    

[Authoring R presentations](https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations)  

[invalid active developer path (xcrun: error: invalid active developer path)](https://apple.stackexchange.com/questions/254380/why-am-i-getting-an-invalid-active-developer-path-when-attempting-to-use-git-a)    

    

## Maintainer    
**Matt Malishev**     
:mag: [Website](https://www.researchgate.net/profile/Matt_Malishev)    
:bird: [@darwinanddavis](https://twitter.com/darwinanddavis)  
:email: matthew.malishev [at] gmail.com    
