\name{chart.Correlation.color}
\alias{chart.Correlation.color}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ correlation matrix chart, in color }
\description{
Another, simpler, visualization of a Correlation Matrix, probably better for larger sets of data.
}
\usage{
chart.Correlation.color(R, nrgcols = 50, labels = TRUE, labcols = 1, title ="", use = "pairwise.complete.obs", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{R}{ a vector, matrix, data frame, timeSeries or zoo object of asset returns }
  \item{nrgcols}{ number or regularly spaced columns }
  \item{labels}{ TRUE/FALSE use labels or not }
  \item{labcols}{ labels to use }
  \item{title}{ title for the plot }
  \item{use}{ an optional character string giving a method for computing
          covariances in the presence of missing values.  This must be
          (an abbreviation of) one of the strings '"all.obs"',
          '"complete.obs"' or '"pairwise.complete.obs"'. }
  \item{\dots}{ any other passthru parameters }
}
\value{
correlation chart
}
\references{ }
\author{ Peter Carl }
\note{
based on chart by Sandrine Dudoit, sandrine@stat.berkeley.edu, from "SMA" library
}
\seealso{
    \code{\link{table.Correlation}} \cr
    \code{\link{chart.Correlation}}
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ multivariate }
\keyword{ distribution }
\keyword{ models }
\keyword{ hplot }
