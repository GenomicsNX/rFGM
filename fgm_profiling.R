# Date: March 2nd 2020

# Author: Vijender Chaitankar

# Contributors: Vijender Chaitankar

# Technical Summary: An approximate but highly efficient routine for generation 
#   of Functional Genomic mRNA (FGM) profiling (Fehrmann et al.).

# Reference: Fehrmann, Rudolf SN, et al. "Gene expression analysis identifies 
#   global gene dosage sensitivity in cancer." Nature genetics 47.2 (2015): 115.

# Input: Log transformed gene expression matrix filtered for low-expression
# Output: FGM profiles which is a pair-wise correlation matrix of genes


fgm_profiling <- function(expr.data) {
  
  # Batch correct the data by identifying the surrogate variables (SV)
  # and regressiong out the SV's
  exprs_corrected_norm <- batch_correct_norm(expr.data)
  
  # Generate a co-expression network
  exp.cor <- cor(exprs_corrected_norm)

  # Apply PCA on the co-expression network
  coexp.pca <- irlba::prcomp_irlba(exp.cor, n = 250)
  
  # Identify significant PC's by identifying the inflection point on the
  # standard deviation curve of the PCs
  inflection <- identify_inflection(coexp.pca)

  # Extract the loadings of significant PC's
  pcs.sig <- coexp.pca$rotation[, 1:inflection]

  # Annotate rows of the loadings
  rownames(pcs.sig) <- rownames(expr.data)
  
  # Generate the co-regulation network (FGM profile)
  pca.coexp <- cor(t(pcs.sig))

  # Annotate rows of the co-regulation entwork
  rownames(pca.coexp) <- rownames(pcs.sig)

  # Assign the diag as zero
  diag(pca.coexp) <- 0

  return(pca.coexp)

}
