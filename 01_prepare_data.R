# 01_prepare_data.R - load raw prices, compute returns and volatility

library(readxl)
library(zoo)

raw <- read_excel("data/commodities.xlsx")
raw <- data.frame(raw)
raw$Date <- as.Date(raw$Date)

prices <- zoo(raw[, 2:6], raw$Date)
names(prices) <- colnames(raw)[2:6]

k <- ncol(prices)
returns <- prices[-1, ]
for (i in 1:k) {
  x <- embed(as.numeric(prices[, i]), 2)
  returns[, i] <- 100 * (x[, 1] - x[, 2]) / x[, 2]   # simple % returns
}

volatility <- abs(returns)

dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)
saveRDS(returns,    "data/processed/returns.rds")
saveRDS(volatility, "data/processed/volatility.rds")

cat("Dimensions:", dim(returns), "\n")
cat("Range:", format(start(returns)), "to", format(end(returns)), "\n")