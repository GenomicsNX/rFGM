# setwd('/Volumes/NHLBI_BCB/vijender/07-bigdata/FGM-Profiling/rFGM/')

# Load functions

rm(list=ls())

source('./chk_packages.R')

source('./chk_input.R')

source('./batch_correct_norm.R')

source('./identify_inflection.R')

source('./q_normalize.R')

source('./chk_packages.R')

source('./fgm_profiling.R')

load('./expr.data.RData')

chk.input.mat <- chk_input(expr.data)

if (chk.input.mat) {
  fgm.profile <- fgm_profiling(expr.data)
} else {
  print('Check input for to ensure low expressed genes are filtered out
        and the gene expression is log transformed and normalized')
}

