% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/LogNormalVaRETLPlot2DCL.R
\name{LogNormalVaRETLPlot2DCL}
\alias{LogNormalVaRETLPlot2DCL}
\title{Plots log normal VaR and ETL against confidence level}
\usage{
LogNormalVaRETLPlot2DCL(...)
}
\arguments{
\item{...}{The input arguments contain either return data or else mean and
 standard deviation data. Accordingly, number of input arguments is either 4
 or 5. In case there are 4 input arguments, the mean and standard deviation of
 data is computed from return data. See examples for details.

 returns Vector of daily geometric return data

 mu Mean of daily geometric return data

 sigma Standard deviation of daily geometric return data

 investment Size of investment

 cl VaR confidence level and must be a vector

 hp VaR holding period and must be a scalar}
}
\description{
Plots the VaR and ETL of a portfolio against confidence level assuming that geometric
 returns are normally distributed, for specified confidence level and
 holding period.
}
\examples{
# Plots VaR and ETL against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRETLPlot2DCL(returns = data, investment = 5, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogNormalVaRETLPlot2DCL(mu = .012, sigma = .03, investment = 5, cl = seq(.85,.99,.01), hp = 40)
}
\author{
Dinesh Acharya
}
\references{
Dowd, K. Measuring Market Risk, Wiley, 2007.
}

