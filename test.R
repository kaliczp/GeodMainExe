## Test first geod

tti <- 1
delta.simp <- paste(GeodI.df[tti,c("deg","min","sec")], collapse = "-")

delta.fok <- simple.to.deg(GeodI.df[tti,c("deg","min","sec")])

ttcoord <- data.frame(x = GeodI.df[tti,"x"], y = GeodI.df[tti,"y"])

(ttircoord <- first.geod(ttcoord, delta.fok, GeodI.df[tti,c("dist")]))

## Test second geod

tti <- 20
(dist.bear <- second.geod(GeodII.df[tti,c("x","y")], GeodII.df[tti,c("x2","y2")]))
deg.to.simple(deg.angle = dist.bear$angle)

## Simple examples
### First
options(digits=8)
first.geod(data.frame(x=262612.05, y=456525.45), simple.to.deg("201-05-02"), 80.20)

### Second
options(digits=5)
second.geod(data.frame(x=262612.05, y=456525.45), data.frame(x=262245.11, y=456547.12))
