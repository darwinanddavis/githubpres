# Using Github for research and life  
## Workshop on using `git` and Github (this thing you're on now) for version control, project collaboration, and data sharing.  

### Matthew Malishev<sup>1*</sup>

##### _<sup>1</sup> Department of Biology, Emory University, 1510 Clifton Road NE, Atlanta, GA, USA, 30322_    

##### *Corresponding author: matthew.malishev@gmail.com  

File extensions:     
.Rmd    
.html    
.pdf  
.tex  
.jpeg  
.png  
.gif     

******  

## Overview  

### The short version    

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

## References  

[Generating a new SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)    

[How to undo anything with Git](https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/)    

[How to access recent commits to your local repo](https://stackoverflow.com/questions/4114095/how-to-revert-a-git-repository-to-a-previous-commit)

[Origin master - rejected (fetch first), no file in GitHub repository](https://stackoverflow.com/questions/46619527/gitbash-origin-master-rejected-fetch-first-no-file-in-github-repository)    

[Intro to git: Branches, pull requests, and other useful stuff](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)   

[Automatically push an updated file whenever it is changed](https://gist.github.com/darencard/5d42319abcb6ec32bebf6a00ecf99e86)         

## Maintainer    
**Matt Malishev**     
:mag: [Website](https://www.researchgate.net/profile/Matt_Malishev)    
:bird: [@darwinanddavis](https://twitter.com/darwinanddavis)  
:email: matthew.malishev [at] gmail.com    
