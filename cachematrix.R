## Functions to provide a chaching facility for matrix inverse

## Wraps a square matrix into a list structure capable of caching its inverse
makeCacheMatrix <- function(x = matrix()) {
    ## 'x' should be a square (invertible) matrix

    inverse <- NULL

    # accessor methods for the original matrix
    # (this is very similar to certain Java coding conventions)
    set <- function(y) {
            x <<- y
            inverse <<- NULL
    }
    get <- function() x

    # accessor methods for the cached inverse
    setinverse <- function(i) inverse <<- i
    getinverse <- function() inverse

    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This would compute the inverse of matrix 'x'
## It requires 'x' to have been prepared using makeCacheMatrix
cacheSolve <- function(x, ...) {

    # internally the function checks if a cache is present for the inverse
    i <- x$getinverse()
    # if so it would return the cached value 
    if(!is.null(i)) {
            message("getting cached data")
            return(i)
    }
    # otherwise it would compute the inverse, update the cached value 
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    # and return the inverse
    i
}
