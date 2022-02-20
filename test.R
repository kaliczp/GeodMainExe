## Test first geod

delta <- c(28,35,22)

delta.fok <- simple.to.deg(delta)

ttcoord <- data.frame(x = 268823.12, y = 392123.25)

(ttircoord <- first.geod(ttcoord, delta.fok, 82.23))

## Test second geod
(dist.bear <- second.geod(ttcoord, ttircoord))

deg.to.simple(deg.angle = dist.bear$angle)

