## 01. Assignment Description

#*A03.1. Write a header for all future R scripts, that ensures a clean environment, uses {groundhog} to load the packages you routinely use, 
#*and includes any other information that will help ensure good project management (e.g., name of study, author of script). [1 Mark]

##########################################################################################################################################

## 02. Adding Relevant Information (this information would need to be updated for each project).

# Script Author: Carly Magnacca
# Project Name: PSYC 6120A, A03.1
# Date: October 8, 2024
# Purpose of Script: Header for future files
# Notes (if relevant):[include relevant information here that may help to contextualize the script/project description for someone else viewing script]

#*MH: This all looks great! I like your addition of a notes section. Also wanted to comment that I 
#*appreciated your use of an RProject. I had no issues opening it and accessing all of your scripts.

##########################################################################################################################################

## 03. Ensuring a Clean Environment

# Clear the workspace
rm(list = ls())
  # rm(): used to remove objects from the R environment.
  # list = ls(): returns a character vector of the names of all objects in the current environment.
  # By using list = ls(), you are instructing rm() to remove all objects that ls() lists.

#*MH: solid description of what this code does and how it works. Practically speaking (depending on the 
#*number of objects stored in your environment), it may be more efficient to clear all objects from the 
#*workspace using the 'broomstick' icon in the top right of the environment pane.

# Detach all non-base packages
loaded_packages <- names(sessionInfo()$otherPkgs)
for (pkg in loaded_packages) {
  detach(paste("package:", pkg, sep = ""), unload = TRUE, character.only = TRUE)
}
  # names(sessionInfo()$otherPkgs): extracts the names of all loaded packages, which are then stored in the variable loaded_packages.
  # for (pkg in loaded_packages): starts a loop that iterates through each loaded package name stored in loaded_packages.
  # paste("package:", pkg, sep = ""): constructs the name of the package to be detached.
  # detach(): removes the package from the R search path.
  # unload = TRUE: This option tells detach() to also unload the package from memory.
  # character.only = TRUE: This tells R that the name of the package is provided as a string (character vector), which allows the detach() function to interpret it correctly.

#*MH: again, good description of the code here. I was a bit unlcear on your explanation for 
#*'character.only = TRUE.' I think it is saying that the package name should treated as a string? Because 
#*this is the format that is required for the detach() function to work properly?
#*I also wondered what the rationale for removing non-base packages would be. I could see this being helpful
#*if you needed to start with a completely clean slate (e.g., have some kind of unresolvable error), but would
#*it be necessary to do this for every script you run?

# Restart the R session
rstudioapi::restartSession()
  # Fully restarts the R environment, which clears everything and ensures that you have a clean slate for your analysis.

#*MH: This code worked well for me - minor note, but it restarts the R session, and does not clear the
#*environment.

  # Rationale: Resetting R before creating or running a script is important for several reasons (as we discussed in class):
      # Clear Workspace: Removes old variables and datasets, preventing conflicts and freeing up memory.
      # Reproducibility: Ensures consistent results, making it easier to reproduce and share scripts.
      # Avoiding Side Effects: Prevents interference from global options and previously defined functions.
      # Clarity and Organization: Promotes a structured coding approach, making scripts easier to manage.

#*MH: good explanation!

##########################################################################################################################################

## 04. Install Packages (only if packages are not already installed)

# install.packages("groundhog") 
# install.packages("readxl") 
# install.packages("dplyr") 

##########################################################################################################################################

## 05. Use Groundhog to Load Packages

# Load the groundhog package
library("groundhog")

# Specify the packages of interest (I will continue to add packages as I learn which ones I more frequently use)
pkgs <- c("readxl", "dplyr")        
  # The c() function combines multiple package names into a single vector

# Load the packages using groundhog, specifying the date and tolerating a specific R version
groundhog.library(pkgs, "2024-10-01", tolerate.R.version = "4.1.2")
  # groundhog.library = Specifies which version of the packages (i.e., pkgs) to use (i.e., based on the date listed in quotations)
  # This package ensures that the analysis consistently works and is reproducible, even if package updates occur
  # tolerate.R.version = Specifies that the function should load packages that are compatible with R version 4.1.2.(my current version of r)

#*MH: good idea to use groundhog here. The groundhog.library() function actually installs the packages
#* automatically for you, so you did not need to install the "readxl" and "dplyr" packages above. 
#* Also helpful to note that the versions of the requested packages to be installed and loaded are based
#* on a date ("2024-10-01"). It is recommended to set the date to two days prior to script creation date.
#* I also wonder if using the 'tolerate.R.version' specifier could defeat part of the value of
#* using groundhog? Which is that the same version of the packages would be loaded regardless of the R version
#* or operating system being used (to ensure your script is usable/shareable across users).
#* 
#* I was not able to run your code because I have a different version of R.

##########################################################################################################################################

## 06. Set All Default Variables, Global Options, and Path Variables

# Global Options (this is what I have thought of so far, but I will continue to add to this)

options(
  digits = 4,  # Limits the number of digits displayed for numeric values
  scipen = 999 # Avoids scientific notation by increasing the penalty for using it
)

#*MH: what is the reasoning for doing so?

# Set the default working directory (uncomment if needed)
  # setwd("ADD PATH HERE")        # Set the working directory to a default folder

#*MH: nice. using an Rproject could save the trouble of each user having to reset the path.

# Set seed for reproducibility (useful for simulations and random sampling; uncomment if needed)
  # set.seed(123)

#*MH: good idea to include this as optional!

##########################################################################################################################################

## 07. Call All Data Files (import relevant data files - uncomment if relevant)

# readxl("ADD FILE NAME HERE")
  # No need to include path as working directory was set above

#*MH: nice thinking here. Not sure if it's necessary to include in the header.

##########################################################################################################################################

## 08. Potential Footer

# Helpful Resources
  # Best practices: https://www.r-bloggers.com/2018/09/r-code-best-practices/; https://bookdown.org/content/d1e53ac9-28ce-472f-bc2c-f499f18264a3/


#*MH: Nice job, Carly! Overall, I thought it was clear that you put thought into what components should be
#*included in your header. You organized it well and explained your code clearly. I had some questions about
#*parts of your code and your reasoning for including certain aspects.
#*Suggested grade: 0.75/1

