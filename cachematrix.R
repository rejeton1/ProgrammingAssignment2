## The first function create an object that can sets the matrix value 
## and its inverse matrix value that is stored in the cache.
## The second function calculates the inverse matrix value 
## if it is not stored in the cache, 
## or returns the stored value if it is previously stored.

## The first function contains four functions.
## Each of them can set or obtain a matrix value
## and set or obtain the inverse matrix value.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <- inverse
  getinverse <- function() i
  
  list(set = set, get=get, 
       setinverse = setinverse,
       getinverse = getinverse)

}


## This second function returns the stored inverse matrix value 
## if it is stored in the cache, and if it is not, 
## it calculates the inverse matrix value, sets it in the object, 
## and stores it in the cach so that we can get it 
## without computation

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
  
        ## Return a matrix that is the inverse of 'x'
}
