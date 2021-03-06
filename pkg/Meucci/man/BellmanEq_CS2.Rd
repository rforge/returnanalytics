% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/DynamicPortfolioManagement.R
\name{BellmanEq_CS2}
\alias{BellmanEq_CS2}
\title{Solves the Bellman Equation for the case study 2.}
\usage{
BellmanEq_CS2(eta, gamma, lambda, tau, theta, mu, sig2, c2, b_legacy, x, t_view,
  view, i_view, omega)
}
\arguments{
\item{eta}{[scalar] overall weight of the market impact of transactions}

\item{gamma}{[scalar] risk aversion parameter}

\item{lambda}{[scalar] discounting parameter}

\item{tau}{[scalar] trading interval}

\item{theta}{[n_ x n_] transition matrix of the MVOU process}

\item{mu}{[n_ x 1]  drift vector of the MVOU process}

\item{sig2}{[n_ x n_] covariance parameters of the MVOU process}

\item{c2}{[n_ x n_] matrix of the market impact}

\item{b_legacy}{[n_ x 1]  legacy portfolio exposure at time 0}

\item{x}{[t_ x n_] path of the risk drivers (with time step = tau)}

\item{t_view}{[1 x N_MeanViews] times of the views}

\item{view}{[1 x N_MeanViews] views on the risk drivers}

\item{i_view}{[1 x N_MeanViews] vector of the labels of the risk drivers
to which views refer}

\item{omega}{[k_ x n_] matrix to select the investible risk drivers}
}
\value{
prior  [t_x n_ matrix] optimal prior exposure

post   [t_x n_ matrix] optimal posterior exposure
}
\description{
Solves the Bellman Equation for the case study 2.
}
\details{
In Case Study 2 we consider two risk drivers, the 10 year rate and
the TIP spread, and two non-synchronous views on them. The view on the rate
is that its expected value will be the actual value minus 50 basis points
at t_viewX = 1 year from the current time (as in Case Study 1).
The view on the TIP spread is that its expected value will be the actual
value plus 50 basis points at t_viewTIP = 0.75 years.

In case study 2: n_ = 2 k_ = 1 N_meanViews = 2
}
\author{
Xavier Valls \email{xavievallspla@gmail.com}
}
\references{
A. Meucci - "Dynamic Portfolio Management with Views at Multiple Horizons"
\url{http://symmys.com/node/831}. See Meucci script for "BellmanEq_CS2.m"
}

