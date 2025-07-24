########################################
### supergrid themes
### Pre-designed colour schemes for use with supergrid().
### Copyright 2025, Benjamin Bell.
### Code and updates: https://github.com/benbell95/supergrid
### Blog: https://www.benjaminbell.co.uk
### Contact details via blog or github. Please send comments, suggestions, bug reports.

### This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

### See README.md file for usage. Full guide also available on my blog (coming soon).
### Must use with supergrid() function.


# "ggplot2" (similar to the style used in ggplot2 plots)
# Usage: do.call(supergrid, sg_ggplot2)
sg_ggplot2 <- list(col="white", bg="grey92", d=2, alp=c(1, 0.5), lwd=c(2, 1))

# "lattice" (similar to the style used in lattice plots)
# Usage: do.call(supergrid, sg_lattice)
sg_lattice <- list(col="grey", minor=FALSE, alp=1)

# "inverse" (inverted colours)
# Usage: do.call(supergrid, sg_inverse)
sg_inverse <- list(col="white", bg="black")

# "circuit" (like a circuit board)
# Usage: do.call(supergrid, sg_circuit)
sg_circuit <- list(col="#f5dfb9", bg="#047a59")

# "ft" (Financial Times)
# Usage: do.call(supergrid, sg_ft)
sg_ft <- list(bg="#fff0df", col="grey50", x=NULL, minor=FALSE)


### The following plots require calling supergrid multiple times.


# "tron"
# Usage: invisible(lapply(1:3, \(x) do.call(supergrid, sg_tron[[x]])))
sg_tron <- list(
    list(d=2, col="#2f8ca3", alp=1, lwd=c(4, 2), bg="black", alp.bg=0.9), 
    list(col="#5fbcd3", minor=FALSE, alp=0.75, lwd=3), 
    list(col="#afdde9", minor=FALSE, alp=0.75, lwd=2))

# "tron2" (variation on tron)
# Usage: invisible(lapply(1:3, \(x) do.call(supergrid, sg_tron2[[x]])))
sg_tron2 <- list(
    list(d=2, col="#05c7bd", alp=1, lwd=c(4, 2), bg="black", alp.bg=0.9), 
    list(col="#6bfbf4", minor=FALSE, alp=0.75, lwd=3), 
    list(col="#cdfefb", minor=FALSE, alp=0.75, lwd=2))

# "matrix"
# Usage: invisible(lapply(1:3, \(x) do.call(supergrid, sg_matrix[[x]])))
sg_matrix <- list(
    list(d=4, col=colorRampPalette(c("#097217", "#99ffa7"))(length(axTicks(1))*4), alp=1, lwd=c(5, 0.5), bg="black", alp.bg=0.9), 
    list(col=colorRampPalette(c("black", "#99ffa7"))(length(axTicks(1))), minor=FALSE, alp=0.75, lwd=4), 
    list(col=colorRampPalette(c("black", "#e5ffe9"))(length(axTicks(1))), minor=FALSE, alp=0.75, lwd=2))
