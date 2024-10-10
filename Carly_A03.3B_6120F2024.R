
## 01. Assignment Description

# A03.3B. Sign up for GitHub and demonstrate that you can successfully interface with it using R. [1 Bonus Mark]

##########################################################################################################################################

## 02. Relevant Information

# Script Author: Carly Magnacca
# Project Name: PSYC 6120A, A03.3B
# Date: October 8, 2024
# Purpose of Script: Exploring GitHub

########################################################################################################################################### 

## 03. Ensuring a Clean Environment

# Clear the workspace
rm(list = ls())

# Detach all non-base packages
loaded_packages <- names(sessionInfo()$otherPkgs)
for (pkg in loaded_packages) {
  detach(paste("package:", pkg, sep = ""), unload = TRUE, character.only = TRUE)
}

# Restart the R session
rstudioapi::restartSession()

##########################################################################################################################################

## 04. Install Packages (only if packages are not already installed)

# install.packages("usethis")
# install.packages("gitcreds")

##########################################################################################################################################

## 05. Load Packages

library(usethis)
library(gitcreds)

##########################################################################################################################################

## 06. Configure GitHub 

use_git_config(user.name = "cmagnacca", user.email = "cmagnacc@yorku.ca")
use_git()
  #use_git(): initializes a new Git repository in your current project directory if one does not already exist.


# create a PAT token on GIT
# create_github_token() 
  #brings you to the webpage to create token (if you don't already have one for project)

#Set your credential using username and PAT
gitcreds_set("add yours here")
  # GIT should now be connected to R Studio!

##########################################################################################################################################

## 07. Interfacing with GitHub

# Uploading a local project to GitHub as an example

use_github(private = FALSE) 
  # private = FALSE: This indicates that the repository should be public. 
  # If set to TRUE, the repository would be created as private.

use_git_remote("origin", url = NULL, overwrite = TRUE)
  # "origin": This is the standard name used for the main remote repository.
  # url = NULL: automatically usinf the URL of the GitHub repository created in the previous step.
  # overwrite = TRUE:  indicates that if there is already a remote repository named "origin," it will be overwritten with the new URL.

#My updated GitHub: https://github.com/cmagnacca/Carly_A03.1_6120F2024

# To make changes, I would start by committing the modification and including a note. 
# This can be done by clicking the GIT button located in the top toolbar.

# After making changes to my file, I would click the "push branch" button found under the GIT section in the same toolbar. 
# This action uploads the file to GitHub.

# If I am collaborating with others, I would regularly pull the latest version of the project from GitHub (the button 
# is located in the same area) to ensure that I have the most recent updates from my collaborators.