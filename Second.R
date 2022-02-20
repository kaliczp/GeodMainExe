## Second geod
second.geod <- function(P.coord, Q.coord) {
    delta.x <- Q.coord$x - P.coord$x
    delta.y <- Q.coord$y - P.coord$y
    dist <- sqrt(delta.x^2 + delta.y^2)
    radian.angle <- atan2(delta.y, delta.x)
    angle <- (180 / pi) * radian.angle
    data.frame(dist = dist, angle = angle)
}
