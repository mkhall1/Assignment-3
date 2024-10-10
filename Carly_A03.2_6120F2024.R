## 01. Assignment Description

#*A03.2. Demonstrate that you can use {osfr} to interface with OSF using R. 
#*Create a script that explores a public OSF project (it need not be yours, but it could be), and downloads a file. [2 Marks]

##########################################################################################################################################

## 02. Relevant Information

# Script Author: Carly Magnacca
# Project Name: PSYC 6120A, A03.2
# Date: October 8, 2024
# Purpose of Script: Exploring a public OSF project

#*MH:liked that you used your newly created header template here! but why not include the assignment 
#*description here in place of the script purpose?

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

# install.packages("dplyr") 
# install.packages("osfr")

##########################################################################################################################################

## 05. Load Packages

library(osfr)
library(dplyr)

#*MH: didn't want to use groundhog here?

##########################################################################################################################################

## 06. Authenticate to OSF (if needed; reminder to remove the token after running)

osf_auth("INCLUDE YOUR PAT HERE")
osf_auth("o6P6IWR7nMMQEoqnIC3NQ6cTMX9owGUxcecjtxFiaPqlIeDTA4PJXJ945ygN9kwRBXEj15")
  # osf_auth(): designed for authenticating users to access their OSF projects, files, and other resources via the OSF API/
  # PAT = Personal Access Token

#*MH: was this required for the assignment? also a reminder to remove your PAT from your script when sharing!

##########################################################################################################################################

## 07. Retrieving the Project

# Retrieve the project using its GUID (Global Unique Identifier)
public_project_example <- osf_retrieve_node("d3f7y")
  # osf_retrieve_node() = a function from the osfr package used for interacting with the OSF API. 
  # It retrieves information about a specific project node (a project, a component, or a file) on OSF.
  # "d3f7y" = the unique identifier (or node ID) for the project node I want to access. 

#*MH: good explanation of the code. would have been nice to have a bit of info about which project you picked.
#*e.g., what's it called?
#*MH: would be helpful to explore the structure of 'public_project_example' 

# Check if the project was retrieved successfully
if (is.null(public_project_example)) {
  stop("Project not found. Please check the GUID.")
}
  # if (is.null(public_project_example)): This is a conditional statement that checks if the variable public_project_example is NULL.
  # is.null(): This function returns TRUE if the argument is NULL, and FALSE otherwise. 
  # In R, NULL represents the absence of a value or an undefined variable.
  # stop("Project not found. Please check the GUID."): If the condition in the if statement evaluates to TRUE (i.e., public_project_example is indeed NULL), the code within {} is executed.
  # stop(): This function is used to terminate the execution of the current R function or script and generates an error message. 
  # When called, it raises an error and prints the message provided as its argument. 

#*MH: is there another way to verify that the project was retrieved successfully? I would guess that you
#*would likely get an error code when running 'public_project_example <- osf_retrieve_node("d3f7y")' if 
#*the project was not retrieved.

##########################################################################################################################################

## 08. Explore Files and Nodes

# List all files associated with the specified project on OSF
files_list <- osf_ls_files(public_project_example)
  # Retrieves and lists all the files associated with the specified project on OSF.

print(files_list)
  # prints the contents of the files_list variable to the R console.
  # I can see there are 3 variables: name (character variable), ID (character variable), meta (list)

#* MH: but unclear whether there are any files associated with the project? 
#* Appears as a tibble with 0 rows for me.

# List all nodes associated with the specified OSF project
nodes_list <- osf_ls_nodes(public_project_example)
  # Retrieves and lists all nodes associated with the specified OSF project.

#* MH: what is a node?

print(nodes_list)
  # prints the contents of the nodes_list variable to the R console.
  # I can see there are 3 folders: Public (ID = gwrfe), Preregistration (ID = h75vf), and Stage 1 Registered Report (ID = w2gxu)

##########################################################################################################################################

## 09. Exploring the Public Node

# Filter to get only the node(s) with the name "Public"
specific_node <- nodes_list %>%
  filter(name == "Public")
  # == is commonly used in conditional statements, such as if statements and filtering functions.

#*MH: this code is helpful to know but i wonder if it was necessary to implment here given that there were
#*only 3 nodes associated with the project? Also not 100% clear on how the code works here, same with code
#*below:

# Check if the specific node exists
if (nrow(specific_node) > 0) {
  print(specific_node)
  
# List files in the specific node
  files_in_specific_node <- osf_ls_files(specific_node)
  print(files_in_specific_node)
} else {
  print("Node 'Public' not found in the project.")
}
  # If/else part of code is part of a conditional structure 
  # If the condition for the if statement is FALSE, the code within the else block will execute.
  # If the else condition is triggered, it executes and outputs the message to the console.

#*MH: I do not see the if statement here? 

  #I can see there are 6 documents within the folder, including CSV, R, xlsx f
#*MH: nice! a bit more info on the files included could have been good to see (e.g., appears there are
#*some codebooks, some data files, etc)

##########################################################################################################################################

## 10. Retrieve Specific File

# Find the URL
View(files_in_specific_node)
  # I can see the GUID in the third column (meta) - d3tbf
  # I can add the GUID to the end of the standard OSF link - https://osf.io/

#*MH: Where are the links for these files?

# Retrieve a specific file using its URL
osf_retrieve_file("https://osf.io/d3tbf") %>%
  osf_download()
  # This command retrieves a file from OSF using its URL.
  # The osf_download() function downloads the file to the local directory.

# Checked my folder and I see it there!

#MH: me too! saved within the RProject which is super handy.
#MH*: but I'm not clear on where you got the url. is this from OSF? What was the file that you pulled out
# and downloaded? more infor about what it contained would have been useful. 

#MH*: well done Carly! nice explanations of your code and well organized script. I found some code could 
#* have benefitted from further explanation and context (it was not always clear why you were using the
#* code you were). More reasoning about your code output would have also been nice to see. As well as some
#* context for the OSF project you selected was about, what the files were, what the file you pulled was, etc.,
#* would have been helpful for understanding the types of info we can get by interfacing with OSF this way.
#* 
#* Suggested grade: 1.7/2

##########################################################################################################################################

## 11. Assignment Description

# A03.2B. Demonstrate that you can use {osfr} to interface with a private OSF project, using R. 
# Create a script that explores this private project, downloads a file, and uploads a file. 
# Be sure the project has your peer-grader, and Dr. Mar, as contributors. [1 Bonus Mark]

# Note: I did not included descriptions for steps of code explained above

##########################################################################################################################################

# 12. Retrieving the Project 

# Retrieve the project using its GUID (Global Unique Identifier)
private_project_example <- osf_retrieve_node("7psmh")

#MH: I was unable to run this code due to an error (Error: Authentication credentials were not provided.
# HTTP status code 401.) I believe I needed to authenticate using a PAT. Would have been helpful to note that
# and how to do it. I did this independently and was able to register by PAT.

# Check if the project was retrieved successfully
if (is.null(private_project_example)) {
  stop("Project not found. Please check the GUID.")
}

##########################################################################################################################################

## 13. Explore Files and Nodes

# List all files associated with the specified project on OSF
private_files_list <- osf_ls_files(private_project_example)

print(private_files_list)
# I can see there are 2 folders: Project and Assignments

# List all nodes associated with the specified OSF project
private_nodes_list <- osf_ls_nodes(private_project_example)

print(private_nodes_list)
# I can see there are 3 variables: Name, ID, and Meta. 

#*MH: but no nodes, correct? tibble has zero rows/observations again.

##########################################################################################################################################

## 14. Exploring the Private Node

# Filter to get only the list(s) with the name "Assignments"
specific_private_list <- private_files_list %>%
  filter(name == "Assignments")

# Check if the specific list exists
if (nrow(specific_private_list) > 0) {  # Corrected this line
  print(specific_private_list)
  
  # List folders in the general assignments folder
  folders_in_specific_private_list <- osf_ls_files(specific_private_list)
  print(folders_in_specific_private_list)
} else {
  print("List 'Assignments' not found in the project.")  # Corrected the message
}

#I can see there are 3 folders (A1, A2, A3)

#*MH: was able to get all this code to run! but still unsure about necessity of some of it.

##########################################################################################################################################

## 15. Retrieve Specific File

# Find the URL
Assignment_2 <- osf_ls_files(folders_in_specific_private_list)
  # Looking within the A2 folder to explore the specific files within
  # Received warning message: This is not a vectorized function. Only the first row of 3 will be used. 
    # This is okay as we are only interested in the first three rows

#MH: good that you looking into the warning message.

View(Assignment_2)
  # I can see the GUID in the third column (meta) - 2hzc5

# Retrieve a specific file using its URL
osf_retrieve_file("https://osf.io/2hzc5") %>%
  osf_download()

# I can see the document in my folder now!

#MH: me too!

#*MH: nicely done. I made some minor comments throughout. it appears that you were able to succesfully download 
#*a private file but not upload one? This was the second part of the assignment.
#*
#*Suggested grade: 0.6/1


