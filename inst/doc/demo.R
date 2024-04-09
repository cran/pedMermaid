## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(pedMermaid)

## -----------------------------------------------------------------------------
ped <- ped <- data.frame(
  ID = 1:7,
  SIRE = c(0, 0, 1, 0, 3, 0, 5),
  DAM = c(0, 0, 2, 2, 4, 0, 6)
)

x <- mermaid_md(ped)
cat(x, sep = "\n") # Display the output syntax on-screen.
# Do one of the following to write the output syntax into a file.
# cat(x, sep = "\n", file = "output.txt")
# write(x, file = "output.txt")

## -----------------------------------------------------------------------------
x <- mermaid_rmd(ped)
cat(x, sep = "\n")
library(DiagrammeR)

## ----echo=FALSE---------------------------------------------------------------
mermaid("
graph TB
    1 --> 3
    2 --> 3
    2 --> 4
    3 --> 5
    4 --> 5
    5 --> 7
    6 --> 7
")

## -----------------------------------------------------------------------------
x <- mermaid_md(ped, orient = "LR", type = "line")

## -----------------------------------------------------------------------------
x <- mermaid_rmd(ped, orient = "LR", type = "line")

## ----echo=FALSE---------------------------------------------------------------
mermaid("
graph LR
    1 --- 3
    2 --- 3
    2 --- 4
    3 --- 5
    4 --- 5
    5 --- 7
    6 --- 7
")

## -----------------------------------------------------------------------------
x <- mermaid_md(ped, curve = "step", dash = "Y")

## -----------------------------------------------------------------------------
ped$BgColor <- c(NA, "pink", NA, "pink", NA, "pink", NA)
ped$RoundBorder <- c(NA, "Y", NA, "Y", NA, "Y", NA)
x <- mermaid_rmd(ped)

## ----echo=FALSE---------------------------------------------------------------
mermaid("
graph TB
    2(2)
    1 --> 3
    2 --> 3
    2 --> 4(4)
    3 --> 5
    4 --> 5
    6(6)
    5 --> 7
    6 --> 7
    style 2 fill:pink
    style 4 fill:pink
    style 6 fill:pink
")

## -----------------------------------------------------------------------------
ped$lwd <- c(NA, 3, 1, 1, 3, 1, 3) # NA & 1 are equivalent.
x <- mermaid_rmd(ped)

## ----echo=FALSE---------------------------------------------------------------
mermaid("
graph TB
    2(2)
    1 --> 3
    2 --> 3
    2 --> 4(4)
    3 --> 5
    4 --> 5
    6(6)
    5 --> 7
    6 --> 7
    style 2 fill:pink,stroke-width:3
    style 4 fill:pink
    style 5 stroke-width:3
    style 6 fill:pink
    style 7 stroke-width:3
")

