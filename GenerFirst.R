StudentNum <- 10

pdf(paper = "a4", width = 19.5/2.54, height = 28.5/2.54)
par(mfrow = c(5,2), mar = c(1.1,2.1,1.1,2.1))
for(aktStudentNum in 1:StudentNum) {
    plot(c(1,50), c(1,50), type = "n", axes = FALSE)
    mtext(paste0(aktStudentNum, "."), at = 0)
}
dev.off()
