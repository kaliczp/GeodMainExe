## First geod
first.geod <- function(P.coord, angle, dist) {
    radian.angle <- angle * (pi / 180)
    x.out <- P.coord$x + dist * cos(radian.angle)
    y.out <- P.coord$y + dist * sin(radian.angle)
    data.frame(x = x.out, y = y.out)
}
