simple.to.deg <- function(simple.angle) {
    deg <- simple.angle[1] + (simple.angle[2] + simple.angle[3] / 60 ) / 60
    as.numeric(deg)
}

deg.to.simple <- function(deg.angle) {
    deg <- trunc(deg.angle)
    remain <- deg.angle - deg
    remain <- remain * 60
    min <- trunc(remain)
    remain  <- remain - min
    sec <- remain * 60
    paste(deg, min, round(sec, 2), sep = "-")
}
