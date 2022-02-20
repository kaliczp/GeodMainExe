## Test first geod

delta <- c(28,35,22)

delta.fok <- simple.to.deg(delta)

ttcoord <- data.frame(x = 268823.12, y = 392123.25)

first.geod(ttcoord, delta.fok, 82.23)
