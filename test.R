## Test first geod

tti <- 1
delta.simp <- paste(GeodI.df[tti,c("deg","min","sec")], collapse = "-")

delta.fok <- simple.to.deg(GeodI.df[tti,c("deg","min","sec")])

ttcoord <- data.frame(x = GeodI.df[tti,"x"], y = GeodI.df[tti,"y"])

(ttircoord <- first.geod(ttcoord, delta.fok, GeodI.df[tti,c("dist")]))

## Test second geod
(dist.bear <- second.geod(ttcoord, ttircoord))

deg.to.simple(deg.angle = dist.bear$angle)

