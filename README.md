# *supergrid*

![supergrid](https://raw.githubusercontent.com/benbell95/supergrid/refs/heads/main/supergrid.svg)

A script to add a customisable grid (including major and minor grid lines) to a plot in R using base graphics.

## Features

* Quickly and easily add a grid to almost any plot (base R).
* Fully customisable, change colour, size, position, etc.
* Pseudo theming. 

## Get the code

You can load the code directly into R from Github using the following, which will always be the latest version:

```
# Load supergrid script from Github
source("https://raw.githubusercontent.com/benbell95/supergrid/refs/heads/main/r/supergrid.r")

# Load supergrid themes (optional)
source("https://raw.githubusercontent.com/benbell95/supergrid/refs/heads/main/r/supergrid_themes.r")
```

## Usage

It's really simple to use:

```
# Plot
plot(1:10)
# Add supergrid
supergrid()
```
To ensure grid lines appear behind plot elements, use either:

```
# Panel first (works in most cases)
plot(1:10, panel.first=supergrid())
```

or:

```
# Null plot (this always works)
plot(1:10, type="n")
supergrid()
points(1:10)
```


More to come...
