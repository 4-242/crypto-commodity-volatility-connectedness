# 04_robustness.R - rolling-window benchmark and lag sensitivity

library(ConnectednessApproach)

vol     <- readRDS("data/processed/volatility.rds")
dca_tvp <- readRDS("output/models/dca_tvp.rds")

dca_rolling <- ConnectednessApproach(
  vol, nlag = 4, nfore = 10,
  window.size = 104, model = "VAR", connectedness = "Time"
)
saveRDS(dca_rolling, "output/models/dca_rolling.rds")
dir.create("output/figures", showWarnings = FALSE, recursive = TRUE)

png("output/figures/fig_robust_rolling.png", width = 975, height = 587, res = 120)
PlotTCI(dca_rolling, ylim = c(0, 60)); dev.off()

cat("Rolling TCI:",  round(mean(dca_rolling$TCI, na.rm = TRUE), 2), "%\n")
cat("TVP-VAR TCI:",  round(mean(dca_tvp$TCI,     na.rm = TRUE), 2), "%\n")

cat("\nLag sensitivity:\n")
for (p in 2:5) {
  fit <- ConnectednessApproach(
    vol, nlag = p, nfore = 10,
    model = "TVP-VAR", connectedness = "Time",
    VAR_config = list(TVPVAR = list(kappa1 = 0.99, kappa2 = 0.96,
                                    prior = "BayesPrior"))
  )
  cat("  nlag =", p, "| TCI =", round(mean(fit$TCI, na.rm = TRUE), 2), "%\n")
}