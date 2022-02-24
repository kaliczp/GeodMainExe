StudentNum <- 10

set.seed(10)

GeodII.df <- data.frame(x = round(runif(StudentNum, 64000, 256000), 2),
                        y = round(runif(StudentNum, 432000, 816000), 2)
                        )

## If possible not in the first quarter
ttxadd <- rnorm(StudentNum, sd = 100)
ttyadd <- ifelse(ttxadd > -90, rnorm(StudentNum, -200, sd = 50), rnorm(StudentNum, sd = 100))
GeodII.df$x2 <- GeodII.df$x + round(ttxadd, 2)
GeodII.df$y2 <- GeodII.df$y + round(ttyadd, 2)

## Quick check
par(mfrow = c(5,2), mar = c(1.1,2.1,1.1,2.1))
for(aktStudentNum in 11:StudentNum) {
    plot(c(GeodII.df[aktStudentNum, "y"], GeodII.df[aktStudentNum, "y2"]),
         c(GeodII.df[aktStudentNum, "x"], GeodII.df[aktStudentNum, "x2"]), asp = TRUE)
    mtext(paste0(aktStudentNum, ".2"), at = 0)
    text(GeodII.df[aktStudentNum, "y"], GeodII.df[aktStudentNum, "x"], "P", adj = c(0,0))
    text(GeodII.df[aktStudentNum, "y2"], GeodII.df[aktStudentNum, "x2"], "Q", adj = c(0,0))
}

pdf(paper = "a4", width = 19.5/2.54, height = 28.5/2.54)
par(mfrow = c(5,2), mar = c(1.1,2.1,1.1,2.1))
for(aktStudentNum in 1:StudentNum) {
    plot(c(1,50), c(1,50), type = "n", axes = FALSE)
    mtext(paste0(aktStudentNum, ".2"), at = 0)
    text(1,49,bquote(x[P] == .(paste(GeodII.df[aktStudentNum, "x"], "m"))), adj = c(0,0))
    text(1,45,bquote(y[P] == .(paste(GeodII.df[aktStudentNum, "y"], "m"))), adj = c(0,0))
    text(1,41,bquote(x[Q] == .(paste(GeodII.df[aktStudentNum, "x2"], "m"))), adj = c(0,0))
    text(1,37,bquote(y[Q] == .(paste(GeodII.df[aktStudentNum, "y2"], "m"))), adj = c(0,0))
}
dev.off()
