require(graphics)


# op <- par(mfrow = c(2,1), mgp = c(2,.8,0), mar = 0.1+c(3,3,3,1))
n <- 9
x0 <- 1:n
y0 <- rnorm(n)
plot(x0, y0, main = paste("spline through", n, "points"))
# lines(spline(x0, y0))
lines(spline(x0, y0, n = 201), col = 2)
lines(spline(x0, y0, n = 201, method = "natural"), col = 3)



y0 <- (x0-6)^2
plot(x0, y0, main = "spline -- 3 methods")
lines(spline(x0, y0, n = 201), col = 2)
#lines(spline(x0, y0, n = 201, method = "natural"), col = 3)
lines(spline(x0, y0, n = 201, method = "periodic"), col = 4)
legend(6, 25, c("fmm","natural","periodic"), col = 2:4, lty = 1)


y0 <- (x0-6)^2
plot(x0, y0, main = "periodic spline",type="l")
lines(spline(x0, y0, n = 201, method = "periodic"), col = 1)
#lines(spline(x0, y0, n = 201), col = 2)

xy_test <- spline(x0, y0, n = 201)
