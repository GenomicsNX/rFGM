# Date: March 2nd 2020

# Author: Vijender Chaitankar

# Contributors: Vijender Chaitankar

# Technical Summary: Check for required packages and install if required


chk_packages <- function() {
  if (!"irlba" %in% rownames(installed.packages())) {
    install.packages("irlba", dependencies = TRUE)
  }
  
  if (!"dplyr" %in% rownames(installed.packages())) {
    install.packages("dplyr", dependencies = TRUE)
  }
  
  if (!"sva" %in% rownames(installed.packages())) {
    if (!requireNamespace("BiocManager", quietly = TRUE))
      install.packages("BiocManager")
    BiocManager::install("sva")
  }
  
  if (!"sva" %in% rownames(installed.packages())) {
    if (!requireNamespace("BiocManager", quietly = TRUE))
      install.packages("BiocManager")
    BiocManager::install("WGCNA")
  }
}

options(stringsAsFactors = FALSE)

# Load required packages
library(irlba)
library(dplyr)
library(sva)
library(WGCNA)
