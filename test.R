## Test file for cachematrix.R with sample usage
source("cachematrix.R")

o <- matrix(1:4,2,2)
m <- makeCacheMatrix(o)
# now there should be no inverse in cache
m$getinverse()
# compute inverse
inv <- cacheSolve(m)
# now there should be an inverse in cache
m$getinverse()
# the computed inverse should be the same as the inverse of the original matrix
cacheSolve(m) == solve(o)


# same test on a bigger random matrix
M <- matrix(runif(81),9,9)
