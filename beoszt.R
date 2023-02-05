beoszt <- function(deg) {
    hatar <- data.frame(fok = c(-10,70), lat = c(0,30))
    plot(lat ~ fok, hatar, asp = 0.7, axes = FALSE,
         type = "n", xlab = "", ylab = "")
    ### Plot microscope scale
    ## Small segments
    segments(-3:63, 10, -3:63, 20)
    ## Generate ten minutes
    ten.degs <- (0:6)*10
    ## Minutes text
    text(ten.degs, 30, 0:6)
    ## Ten minutes segments
    segments(ten.degs, 20, ten.degs, 25)
    ## Five minutes segments
    segments(ten.degs[-length(ten.degs)] + 5,
             20,
             ten.degs[-length(ten.degs)] + 5,
             23)
    ## Angle manipulation
    deg.whole <- trunc(deg)
    deg.fract <- deg - deg.whole
    axis(3, deg.fract * 60, tck=1, lab = deg.whole, cex.axis = 1.5)
    if(deg.fract < 0.3) {
        deg.plus <- ifelse(deg.whole == 1, 0, deg.whole - 1)
        axis(3, (deg.fract + 1) * 60, tck=1, lab = deg.plus, cex.axis = 1.5)
    } else if (deg.fract > 0.7) {
        deg.minus <- ifelse(deg.whole == 359, 0, deg.whole +1)
        axis(3, (deg.fract - 1) * 60, tck=1, lab = deg.minus, cex.axis = 1.5)
    }
}

akt.szog <- simple.to.deg(data.frame(deg = 33, min = 22, sec =07))

pdf("beoszt.pdf", paper = "a4")
par(mfrow=c(5,2), mar = c(0,0,4,0), oma = c(0,0,0,0))
for(tti in 1: 10) {
    akt.values <- c(sample(0:359, 1), sample(0:59, size = 2, replace = TRUE))
    akt.szog <- simple.to.deg(data.frame(deg = akt.values[1], min = akt.values[2], sec = akt.values[3]))
    beoszt(akt.szog)
}
dev.off()

for(fok in 10:20) {
    for(perc in 0:59) {
        for(msdp in seq(0, 54, by = 6)) {
            fname <- paste(ifelse(fok < 10, paste0("0", fok), fok),
                           ifelse(perc < 10, paste0("0", perc), perc),
                           ifelse(msdp < 10, paste0("0", msdp), msdp),
                           sep="-")
            png(paste0("movie/", fname,".png"), width = 1280, height = 720, pointsize = 24)
            par(mar = c(0,0,5,0))
            akt.szog <- simple.to.deg(data.frame(deg = fok, min = perc, sec = msdp))
            beoszt(akt.szog)
            mtext(fname, adj = 0.01, line = 4)
            dev.off()
        }
    }
}

# ffmpeg -framerate 30 -pattern_type glob -i '*.png' -c:v libx264 -pix_fmt yuv420p out.mp4
