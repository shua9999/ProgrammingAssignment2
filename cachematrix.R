## Put comments here that give an overall description of what your
## functions do
## makeCacheMatrix creates a special "Matrix", which is really a list containing a function to
##    set the matrix
##    get the matrix
##    set the inversed matrix
##    get the inversed matrix


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## x ; square matrix which is invertible  
  m <- NULL
  set <- function(y) {
    
    
    x <<- y
    m <<- NULL
##  <<- operator which can be used to assign a value 
##    to an object in an environment that is different from the current environment.
    
      }
  get <- function() x
  setinver <- function(inverse) m <<- inverse
  getinver <- function() m
  list(set = set, get = get,
       setinver = setinver,
       getinver = getinver)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
          ## x ; from makeCacheMatrix
          ## Return a matrix that is the inverse of 'x'
  m <- x$getinver()
  if(!is.null(m)) {
    ## If the inverse has already been calculated (and the matrix has not changed), 
    ## then the cachesolve should retrieve the inverse from the cache.
    message("getting cached data")
    return(m)
  }
  ## calculate the inverse 
  matrixdata <- x$get()
  m <- inverse(matrixdata, ...)
  x$setinver(m)
  m
}
