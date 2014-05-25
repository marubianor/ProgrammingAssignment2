## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  require("MASS")
  m_inverse <- NULL ##Asigna el valor nulo a la funcion cuando tome valores indefinidos
  set <- function(y) {
    x <<- y
    m_inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(ginv) m_inverse <<- ginv
  getinverse <- function() m_inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        require("MASS")
  -        m_inverse <- x$setinverse
  +        m_inverse <- x$getinverse()
  if(!is.null(m_inverse)) {
    message("getting cached data")
    return(m_inverse)
  }
  data <- x$get()
  -        m_inverse <- ginv(data)
  +        m_inverse <- ginv(data,...)
  x$setinverse
  m_inverse
}
m <- matrix(1:4,2,2)
source("cachematrix.R")
matriz <- makeCacheMatrix(m)
cacheSolve(matriz)
