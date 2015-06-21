## These functions create a special object in which 
## to store the Inverse of a square Matrix
## and another function to calculate the inverse if needed
## or return the stored value if the original matrix is unchanged.
## (KDE, 2015-06-20)

## Function makeCacheMatrix builds four functions 
## to store and retrieve the Inverse of a square Matrix:
## set, get, setinv, getinv

makeCacheMatrix <- function(x = matrix()) {
      ## xinv will hold the cached inverse matrix
      xinv <- NULL
      
      ## function to set the matrix
      set <- function(y) {
            x <<- y
            xinv <<- NULL
      }
      
      ## function to get the matrix
      get <- function() x
      
      ## function to set the inverse matrix
      setinv <- function(z) xinv <<- z
      
      ## function to get the inverse matrix
      getinv <- function() xinv
      
      ## 'list' stores the 4 functions as named subsets we can use later
      list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}


## cacheSolve(x) returns inverse matrix to that created by makeCacheMatrix(x). 
## First, it checks for a cached inverse matrix and returns it if available.
## If not available, it calculates and stores the inverse Matrix
##
## Argument: x = stored (cached) result of makeCacheMatrix() function 
## e.g.,   
##    > cache.mtx <- makeCacheMatrix("matrix")
##    > cacheSolve(cache.mtx)

cacheSolve <- function(x, ...) {

      makeCacheMatrix(x)
      xinv <- x$getinv()     ## retrieves cached inverse if it exists, or NULL
      
      if(!is.null(xinv)) {
            message("retrieving cached inverse matrix")
            return(xinv)     ## returns cached inverse when it exists
      }

      ## if no cached invoice, then this routine calculates the inverse matrix
      
      mtx <- x$get()
      xinv <- solve(mtx, ...)
      x$setinv(xinv)
      xinv                   ## returns calculated and saved inverse matrix
}
