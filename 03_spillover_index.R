# 03_spillover_index.R - tables and figures from fitted models

library(ConnectednessApproach)
library(knitr)

dca_static <- readRDS("output/models/dca_static.rds")
dca_tvp    <- readRDS("output/models/dca_tvp.rds")
returns    <- readRDS("data/processed/returns.rds")

print(kable(SummaryStatistics(returns, correlation = "pearson")))

cat("\n=== Static ===\n");  print(kable(dca_static$TABLE))
cat("\n=== TVP-VAR ===\n"); print(kable(dca_tvp$TABLE))

dir.create("output/figures", showWarnings = FALSE, recursive = TRUE)

save_plot <- function(expr, file, w = 975, h = 587) {
  png(file, width = w, height = h, res = 120); expr; dev.off()
}

save_plot(PlotTCI(dca_tvp,  ylim = c(0, 40)),   "output/figures/fig1_tci.png")
save_plot(PlotFROM(dca_tvp, ylim = c(0, 60)),   "output/figures/fig2_from.png")
save_plot(PlotTO(dca_tvp,   ylim = c(0, 80)),   "output/figures/fig3_to.png")
save_plot(PlotNET(dca_tvp,  ylim = c(-30, 60)), "output/figures/fig4_net.png")
save_plot(PlotNPDC(dca_tvp, ylim = c(-10, 10)), "output/figures/fig5_npdc.png")
save_plot(PlotPCI(dca_tvp,  ylim = c(0, 100)),  "output/figures/fig6_pci.png")
save_plot(PlotNPT(dca_tvp),                     "output/figures/fig7_npt.png")
save_plot(PlotINF(dca_tvp,  ylim = c(0, 100)),  "output/figures/fig8_inf.png")
save_plot(PlotNetwork(dca_tvp, method = "NPDC"), "output/figures/fig9_network_npdc.png")
save_plot(PlotNetwork(dca_tvp, method = "PCI"),  "output/figures/fig10_network_pci.png")