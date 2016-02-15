## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. This code describes a pair of functions that cache the 
## inverse of a matrix. V1 ..


## `makeCacheMatrix`: This function creates a special "matrix" object
## that can cache its inverse. Usage: makeCacheMatrix(x) where x is matrix

     makeCacheMatrix <- function(x = matrix()) {
          inv <- NULL
          set <- function(y) {
               x <<- y
               inv <<- NULL
          }
          get <- function() x
          setinv <- function(solve) inv <<- solve
          getinv <- function() inv
          list(set = set, get = get, setinv = setinv, getinv = getinv)    
}

## `cacheSolve`: This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated , then `cacheSolve` should retrieve the
## a <- diag(5,3)inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'. `solve(X)` returns its inverse.
     
          inv <- x$getinv()
          if(!is.null(inv)) {
               message("getting cached data")
               return(inv)
          }
          data <- x$get()
          inv <- solve(data, ...)
          x$setinv(inv)
          inv
    
     }

