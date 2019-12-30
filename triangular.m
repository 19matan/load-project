function ret = triangular(x, a, b, c)
ret = max(min((x - a) / (b - a), (c - x) / (c - b)), 0)

end