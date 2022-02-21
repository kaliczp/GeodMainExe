StudentNum <- 10

set.seed(10)

GeodI.df <- data.frame(x = round(runif(StudentNum, 64000, 256000), 2),
                       y = round(runif(StudentNum, 432000, 816000), 2),
                       deg = round(runif(StudentNum, 0, 359)),
                       min = round(runif(StudentNum, 0, 59)),
                       sec = round(runif(StudentNum, 0, 59)),
                       dist = round(runif(StudentNum, 100, 300), 2)
                       )


pdf(paper = "a4", width = 19.5/2.54, height = 28.5/2.54)
par(mfrow = c(5,2), mar = c(1.1,2.1,1.1,2.1))
for(aktStudentNum in 1:StudentNum) {
    plot(c(1,50), c(1,50), type = "n", axes = FALSE)
    mtext(paste0(aktStudentNum, "."), at = 0)
    text(1,49,bquote(x[P] == .(paste(GeodI.df[aktStudentNum, "x"], "m"))), adj = c(0,0))
    text(1,45,bquote(y[P] == .(paste(GeodI.df[aktStudentNum, "y"], "m"))), adj = c(0,0))
    text(1,41,bquote(delta[PQ] == .(paste(GeodI.df[aktStudentNum, "deg"],
                                          GeodI.df[aktStudentNum, "min"],
                                          GeodI.df[aktStudentNum, "sec"],
                                          sep="-")
                                    )
                     ),
         adj = c(0,0))
    text(1,37,bquote(d[PQ] == .(paste(GeodI.df[aktStudentNum, "dist"], "m"))), adj = c(0,0))
}
dev.off()
