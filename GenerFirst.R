StudentNum <- 10

pdf(paper = "a4", width = 19.5/2.54, height = 28.5/2.54)
par(mfrow = c(5,2), mar = c(1.1,2.1,1.1,2.1))
for(aktStudentNum in 1:StudentNum) {
    plot(c(1,50), c(1,50), type = "n", axes = FALSE)
    mtext(paste0(aktStudentNum, "."), at = 0)
    text(1,49,bquote(x[P] == .(paste(round(ttcoord[,1],2),"m"))), adj = c(0,0))
    text(1,45,bquote(y[P] == .(paste(round(ttcoord[,2],2),"m"))), adj = c(0,0))
    text(1,41,bquote(delta[PQ] == .(paste(12,15,11.2,sep="-"))), adj = c(0,0))
    text(1,37,bquote(d[PQ] == .(paste(102,"m"))), adj = c(0,0))
}
dev.off()
