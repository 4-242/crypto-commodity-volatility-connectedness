# crypto-commodity-volatility-connectedness
Diebold–Yilmaz volatility spillovers across Bitcoin, gold, oil, coffee and corn (2010–2025) using TVP-VAR

## Overview

This project measures dynamic volatility connectedness between Bitcoin and four
commodities — gold, crude oil, coffee and corn — using the Diebold–Yilmaz spillover
framework with a time-varying parameter VAR (TVP-VAR) estimated via the Kalman filter.

The headline result: static connectedness measures understate systemic risk
substantially. Total connectedness was 4.38% in the static model against a 13.36%
time-varying average, and exceeded 35% during the COVID-19 shock.

## Data

- Weekly returns/volatility, January 2010 – October 2025
- Assets: Bitcoin, gold, crude oil, coffee, corn
- Data Source: Investing.com

## Method

1. **Diebold–Yilmaz framework** — variance-decomposition-based spillover index
2. **TVP-VAR** — time-varying parameters estimated with the **Kalman filter**, allowing
   connectedness to evolve rather than assuming a fixed structure
3. **Robustness** — compared against a rolling-window VAR; tested sensitivity to lag
   length, forecast horizon and decay factors

## Key findings

- **Static models understate systemic risk.** Total connectedness: **4.38% (static)**
  vs **13.36% (time-varying average)**.
- **COVID-19 shock:** connectedness exceeded **35%** and remained elevated afterwards.
- **Gold** acts as the principal **net volatility transmitter**.
- **Bitcoin** shifted from an isolated receiver toward increasing integration with
  commodity markets over the sample.

## Results at a glance

| Measure | Value |
|---|---|
| Static total connectedness | 4.38% |
| Time-varying average | 13.36% |
| Peak during COVID-19 | >35% |
| Main net transmitter | Gold |


<img width="975" height="587" alt="image" src="https://github.com/user-attachments/assets/7af58a2c-4ff5-4361-8d86-90034601c650" />



## Why it matters

For portfolio and risk work, a static connectedness estimate would have materially
understated cross-asset contagion risk heading into 2020. The time-varying approach
captures the regime shift that a fixed-coefficient model smooths away.

## Repository structure

