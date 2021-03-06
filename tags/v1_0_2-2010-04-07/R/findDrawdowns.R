`findDrawdowns` <-
function (R, geometric = TRUE, ...)
{ # @author Peter Carl

    # modified with permission from function by Sankalp Upadhyay
    # <sankalp.upadhyay [at] gmail [dot] com>

    # DESCRIPTION:
    # Find the drawdowns in a timeseries.
    # Find the starting period, the ending period, and the amount and length
    # of the drawdown.

    # FUNCTION:

    x = checkData(R[,1,drop=FALSE], method="matrix") # matrix?

#     Return.cumulative = cumprod(1+na.omit(x)) 
#     maxCumulativeReturn = cummax(c(1,Return.cumulative))[-1]
#     drawdowns = Return.cumulative/maxCumulativeReturn - 1
    drawdowns = Drawdowns(x, geometric = geometric)
    # if you want to see the drawdown series, plot(drawdown,type="l")

    draw = c()
    begin = c()
    end = c()
    length = c(0)
    trough = c(0)
    index = 1
    if (drawdowns[1] >= 0)
        priorSign = 1
    else
        priorSign = 0
    from = 1
    sofar = drawdowns[1]
    to = 1
    dmin = 1

    for (i in 1:length(drawdowns)) { #2:length()
        thisSign <- ifelse(drawdowns[i] < 0, 0, 1)
        if (thisSign == priorSign) { ###
            if(drawdowns[i]< sofar) {
                sofar = drawdowns[i]
                dmin = i
            }
            to = i + 1 ###
        }
        else { 
            draw[index] = sofar
            begin[index] = from
            trough[index] = dmin
            end[index] = to
            #cat(sofar, from, to)
            from = i 
            sofar = drawdowns[i]
            to = i + 1 ###
            dmin = i
            index = index + 1
            priorSign = thisSign
        }
    }
    draw[index] = sofar
    begin[index] = from
    trough[index] = dmin
    end[index] = to
    list(return=draw, from=begin, trough = trough, to=end, length=(end-begin+1), peaktotrough = (trough-begin+1), recovery = (end-trough))

}

###############################################################################
# R (http://r-project.org/) Econometrics for Performance and Risk Analysis
#
# Copyright (c) 2004-2010 Peter Carl and Brian G. Peterson
#
# This library is distributed under the terms of the GNU Public License (GPL)
# for full details see the file COPYING
#
# $Id$
#
###############################################################################
# $Log: not supported by cvs2svn $
# Revision 1.8  2009-04-07 22:32:03  peter
# - changed checkData to a matrix
#
# Revision 1.7  2008-06-02 16:05:19  brian
# - update copyright to 2004-2008
#
# Revision 1.6  2007/07/26 03:34:46  peter
# - fixed error when first period is negative
#
# Revision 1.5  2007/03/21 16:34:48  peter
# - fixed period calculations
#
# Revision 1.4  2007/03/21 14:07:38  peter
# - added trough date, periods to trough, periods to recovery
# - changed to use dataCheck
#
# Revision 1.3  2007/02/07 13:24:49  brian
# - fix pervasive comment typo
#
# Revision 1.2  2007/02/06 11:58:42  brian
# - standardize attribution for Drawdown runs
#
# Revision 1.1  2007/02/02 19:06:15  brian
# - Initial Revision of packaged files to version control
# Bug 890
#
###############################################################################