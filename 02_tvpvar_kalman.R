# 02_tvpvar_kalman.R - static VAR and TVP-VAR estimation

library(ConnectednessApproach)
library(vars)

vol <- readRDS("data/processed/volatility.rds")

lag_select <- VARselect(vol, lag.max = 10, type = "const")
print(lag_select$selection)   # record this in the README / thesis

dca_static <- ConnectednessApproach(
  vol, nlag = 4, nfore = 10,
  model = "VAR", connectedness = "Time",
  window.size = nrow(vol)
)

dca_tvp <- ConnectednessApproach(
  vol, nlag = 4, nfore = 10,
  window.size = NULL,
  model = "TVP-VAR", connectedness = "Time",
  VAR_config = list(TVPVAR = list(kappa1 = 0.99, kappa2 = 0.96,
                                  prior = "BayesPrior"))
)

dir.create("output/models", showWarnings = FALSE, recursive = TRUE)
saveRDS(dca_static, "output/models/dca_static.rds")
saveRDS(dca_tvp,    "output/models/dca_tvp.rds")

cat("Static TCI:", round(mean(dca_static$TCI, na.rm = TRUE), 2), "%\n")
cat("TVP-VAR TCI:", round(mean(dca_tvp$TCI, na.rm = TRUE), 2), "%\n")