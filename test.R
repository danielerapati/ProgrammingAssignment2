## Test file for cachematrix.R with sample usage
source("cachematrix.R")

# tests if makeCacheMatrix and cacheSolve do what they are supposed to
test <- function(o) {
    message("original matrix")
    print(o)

    m <- makeCacheMatrix(o)

    message("now there should be no inverse in cache")
    print(m$getinverse())

    message("compute inverse")
    inv <- cacheSolve(m)

    message("now there should be an inverse in cache")
    print(m$getinverse())

    message("the computed inverse should be the same as the inverse of the original matrix")
    print(cacheSolve(m) == solve(o))
}

test(matrix(1:4,2,2))

# same test on a bigger random matrix
test(matrix(runif(81),9,9))
