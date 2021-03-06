\name{chart.Histogram}
\alias{chart.Histogram}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ histogram of returns }
\description{
Create a histogram of returns, with optional curve fits for density and normal.  This is a wrapper function for \code{\link[graphics]{hist}}, see the help for that function for additional arguments you may wish to pass in.
}
\usage{
chart.Histogram(R, breaks="FD", main = NULL, xlab = "Returns", ylab = "Frequency", methods = c("none","add.density", "add.normal", "add.centered", "add.cauchy", "add.sst", "add.rug", "add.risk", "add.qqplot"), show.outliers = TRUE, colorset = c("lightgray", "#00008F", "#005AFF", "#23FFDC", "#ECFF13", "#FF4A00", "#800000"), border.col = "white", lwd = 2, xlim = NULL, ylim = NULL, element.color="darkgray", note.lines = NULL, note.labels = NULL, note.cex = 0.7, note.color = "darkgray", probability = FALSE, p = 0.95, cex.axis = 0.8, cex.legend = 0.8, cex.lab = 1, cex.main = 1, xaxis=TRUE, yaxis=TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{R}{ an xts, vector, matrix, data frame, timeSeries or zoo object of asset returns }
  \item{breaks}{one of:
    \itemize{
      \item a vector giving the breakpoints between histogram cells,
      \item a single number giving the number of cells for the histogram,
      \item a character string naming an algorithm to compute the number of cells (see \sQuote{Details}),
      \item a function to compute the number of cells.
    }
    In the last three cases the number is a suggestion only. see \code{\link[graphics]{hist}} for details, default "FD"
  }
  \item{methods}{ what to graph, one or more of:
    \itemize{
        \item{add.density}{ to display the density plot}
        \item{add.normal}{ to display a fitted normal distibution line over the mean}
        \item{add.centered}{ to display a fitted normal line over zero}
        \item{add.rug}{ to display a rug of the observations}
        \item{add.risk}{ to display common risk metrics}
        \item{add.qqplot}{ to display a small qqplot in the upper corner of the histogram plot}
    }
  }
  \item{p}{ confidence level for calculation, default p=.99 }
  \item{probability}{logical; if TRUE, the histogram graphic is a representation of frequencies, the counts component of the result; if FALSE, probability densities, component density, are plotted (so that the histogram has a total area of one). Defaults to TRUE if and only if breaks are equidistant (and probability is not specified). see \code{\link[graphics]{hist}}}
  \item{show.outliers}{logical; if TRUE (the default), the histogram will show all of the data points.  If FALSE, it will show only the first through the fourth quartile and will exclude outliers. }
  \item{main}{ set the chart title, same as in \code{\link{plot}} }
  \item{ylab}{ set the y-axis label, same as in \code{\link{plot}} }
  \item{xlab}{ set the x-axis label, same as in \code{\link{plot}} }
  \item{ylim}{ set the y-axis limits, same as in \code{\link{plot}} }
  \item{border.col}{ color to use for the border }
  \item{xlim}{ set the x-axis limit, same as in \code{\link{plot}} }
  \item{lwd}{ set the line width, same as in \code{\link{plot}} }
  \item{colorset}{ color palette to use, set by default to rational choices }
  \item{element.color}{ provides the color for drawing chart elements, such as the box lines, axis lines, etc. Default is "darkgray" }
  \item{note.lines}{ draws a vertical line through the value given. }
  \item{note.labels}{ adds a text label to vertical lines specified for note.lines. }
  \item{note.cex}{ The magnification to be used for note line labels relative to the current setting of 'cex'.  }
  \item{note.color}{ specifies the color(s) of the vertical lines drawn. }
  \item{cex.legend}{ The magnification to be used for sizing the legend relative to the current setting of 'cex'.  }
  \item{cex.axis}{ The magnification to be used for axis annotation relative to the current setting of 'cex', same as in \code{\link{plot}}.  }
  \item{cex.lab}{ The magnification to be used for x- and y-axis labels relative to the current setting of 'cex'.  }
  \item{cex.main}{ The magnification to be used for the main title relative to the current setting of 'cex'.  }
  \item{xaxis}{ if true, draws the x axis }
  \item{yaxis}{ if true, draws the y axis }
  \item{\dots}{ any other passthru parameters to \code{\link{plot}}}
} 
\details{
  The default for \code{breaks} is \code{"FD"}. Other names for which algorithms
  are supplied are \code{"Sturges"} (see
  \code{\link{nclass.Sturges}}), \code{"Scott"}, and \code{"FD"} /
  \code{"Freedman-Diaconis"} (with corresponding functions
  \code{\link{nclass.scott}} and \code{\link{nclass.FD}}).
  Case is ignored and partial matching is used.
  Alternatively, a function can be supplied which
  will compute the intended number of breaks as a function of \code{R}.
}
\note{
Code inspired by a chart on: \cr
\url{http://zoonek2.free.fr/UNIX/48_R/03.html}
}
\author{ Peter Carl }
\seealso{
  \code{\link[graphics]{hist}}
}
\examples{
    data(edhec)
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE])

    # version with more breaks and the standard close fit density distribution
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], breaks=40, methods = c("add.density", "add.rug") )

    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], methods = c( "add.density", "add.normal") )

    # version with just the histogram and normal distribution centered on 0
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], methods = c( "add.density", "add.centered") )

    # add a rug to the previous plot for more granularity on precisely where the distribution fell
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], methods = c( "add.centered", "add.density", "add.rug") )

    # now show a qqplot to give us another view on how normal the data are
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], methods = c( "add.centered", "add.density", "add.rug", "add.qqplot") )

    # add risk measure(s) to show where those are in relation to observed returns
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], methods = c("add.density", "add.centered", "add.rug", "add.risk") )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ multivariate }
\keyword{ distribution }
\keyword{ models }
\keyword{ hplot }
