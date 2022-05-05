simple.to.deg <- function(x) {
    if(is.character(x)) {
        simple.angle.asc <- unlist(strsplit(x, split = "-"))
        simple.angle <- as.numeric(simple.angle.asc)
    } else {
        if(length(x) == 3) {
            simple.angle  <- x
        } else {
            stop("x length not equal to 3")
        }
    }
    deg <- simple.angle[1] + (simple.angle[2] + simple.angle[3] / 60 ) / 60
    deg
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
