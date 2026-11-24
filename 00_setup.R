# 00_setup.R - run once to install dependencies. Not sourced by analysis scripts.
install.packages(c("tidyverse","devtools", "zoo", "xts", "readxl", "vars", "knitr", "flextable"))
devtools::install_github("GabauerDavid/ConnectednessApproach")