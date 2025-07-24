########################################
### supergrid v1.0
### Function to add a customisable grid (including major and minor grid lines) to a plot for base R graphics.
### Copyright 2025, Benjamin Bell.
### Code and updates: https://github.com/benbell95/supergrid
### Blog: https://www.benjaminbell.co.uk
### Contact details via blog or github. Please send comments, suggestions, bug reports.

### This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

### This function has been tested with R v4.5.0. Use at your own risk.

### This function is designed to work with base R graphics e.g. plot(). It is unlikely to work with ggplot2 or other grid based graphics plotting packages/functions.

### !! Must create a plot before running this function.
### Position of major and minor grid lines can be obtained by creating an object. e.g. sg <- supergrid()
### To plot the grid behind other plot elements, you can add the argument: panel.first=supergrid(), to your plot code. But this may not be supported by all plot types. Or create a null plot, e.g. plot(x, y, type="n").

### See README.md file for usage. Arguments listed below. Full guide also available on my blog (coming soon).

### Create "themes" by supplying arguments as a list object, and using: do.call(supergrid, theme)
### Pre-made themes available here: 

########################################
### Arguments / details

# x, y      = Specify the major tick mark positions when not using default plot values. Use x=NULL or y=NULL to suppress either axis.
# minor     = Logical. Whether to create minor grid lines [default = TRUE].
# d         = Number of minor grid divisions [default = 10].  
# plot      = Logical. Whether to plot the grid or not [default = TRUE]. If you only wish to obtain the position of the grid lines, create an object: e.g. sg <- supergrid(plot=FALSE)
# col       = Colour for grid lines [default = "blue"]. If one colour specified, it will apply to both major and minor grid lines. If two colours are specified, the first colour will apply to major, and second to minor. If more than two colours specified, they will apply across both major and minor grid lines.
# alp       = Alpha channel value for major and minor grid lines, values between 0 and 1 [default = c(0.5, 0.1)]. First value applies to major, and second value applies to minor. If only one value specified, will apply to both major and minor.
# bg        = Background colour. If specified, a rectangle is drawn to match the size of the plot region, then the grid lines are plotted on top.
# alp.bg    = Alpha channel value for background colour, values between 0 and 1 [default = 1]. 
# lwd       = Line width for major and minor grid lines [default = c(1, 1)]. First value applies to major, and second value applies to minor. If only one value specified, will apply to both major and minor.
# lty       = Line type for major and minor grid lines [default = c(1, 1)]. First value applies to major, and second value applies to minor. If only one value specified, will apply to both major and minor.

########################################
### supergrid function

supergrid <- function(x, y, minor=TRUE, d=10, plot=TRUE, col="blue", alp=c(0.5, 0.1), bg, alp.bg=1, lwd=c(1, 1), lty=c(1, 1)) {
    # Plot region
    pu <- par("usr")
    # Tick mark locations
    if(!hasArg(x)) {x <- axTicks(1)}
    if(!hasArg(y)) {y <- axTicks(2)}
    # Minor grid
    minx <- NULL
    miny <- NULL
    if(minor==TRUE) {
        # Calculate interval and positions
        minx_i <- diff(x)[1] / d
        miny_i <- diff(y)[1] / d
        if(length(x)>1) minx <- c(seq(from=x[1], to=pu[1], by=minx_i * -1), seq(from=x[1], to=pu[2], by=minx_i))
        if(length(y)>1) miny <- c(seq(from=y[1], to=pu[3], by=miny_i * -1), seq(from=y[1], to=pu[4], by=miny_i)) 
        # Remove major from minor
        minx <- minx[-c(which(minx %in% x))]
        miny <- miny[-c(which(miny %in% y))]
    }
    # Plot
    if(plot==TRUE) {
        #Colours
        col_mj <- col
        col_mn <- col
        if(length(col)==2) {
            col_mj <- col[1]
            col_mn <- col[2]
        }
        # Background
        if(hasArg(bg)) {rect(pu[1], pu[3], pu[2], pu[4], col=adjustcolor(bg, alp.bg), border=NA)}
        # Minor
        if(minor==TRUE) {
            abline(v=minx, h=miny, col=adjustcolor(col_mn, alp[length(alp)]), lwd=lwd[length(lwd)], lty=lty[length(lty)])
        }
        # Major
        abline(v=x, h=y, col=adjustcolor(col_mj, alp[1]), lwd=lwd[1], lty=lty[1])
    } 
    invisible(list(par=pu, majx=x, majy=y, minx=minx, miny=miny))
}