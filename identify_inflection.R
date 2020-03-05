# Date: March 2nd 2020

# Author: See Source

# Source: https://scrnaseq-course.cog.sanger.ac.uk/website/processing-raw-scrna-seq-data.html

# Technical Summary: Identify saturation point in the elbow plot of the
# standard deviations of PC's

# inflection point
identify_inflection <- function(coexp.pca) {
  rawdiff <- diff(coexp.pca$sdev)/diff(1:250)
  rawdiff <- rawdiff[which(abs(rawdiff) > 0.00001)]
  inflection <- which(rawdiff == min(rawdiff[100:length(rawdiff)], na.rm=TRUE))
  return(inflection)
}
