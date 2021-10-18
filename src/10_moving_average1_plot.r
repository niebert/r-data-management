xy <- data.frame(x1, source=y1, m1, m2, m3)
# xy
p0 <- ggplot(xy, aes(x=x1, y=source ))   +  geom_point()
p0 <- p0 + geom_line(aes(y = y1, col = "source"))
p0 <- p0 + geom_line(aes(y = m1, col = "mean1"))
p0 <- p0 + geom_line(aes(y = m2, col = "mean2")) 
p0 <- p0 + geom_line(aes(y = m3, col = "mean3"))
p0
