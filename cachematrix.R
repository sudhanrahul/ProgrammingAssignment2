## This script is written to make Matrix Inverse, which being a costly computation, simpler and faster by Caching the Inverse Matrix onto a variable and can be retrieved whenever needed
## makeCacheMatrix is a function to Calculate the Inverse Value of the given input Matrix
makeCacheMatrix <- function(x = matrix()) {
## Offset the variable to NULL
m <- NULL
## Below function assigns the input matrix to a local variable 
set <- function(y) {
x <<- y
m <<- NULL
}
## GetFunction Module to get the input Matrix which is equated to the local variable 
get <- function() x
## SetMatrix.Inverse module to compute the Inverse of the Matrix
setmatrix.inverse <- function(solve) m <<- solve
## GetMatrix.Inverse module to retrieve the computed Inverse Matrix
getmatrix.inverse <- function() m
list(set = set, get = get,
setmatrix.inverse = setmatrix.inverse,
getmatrix.inverse = getmatrix.inverse)
}
## cacheSolve Function is used to retrieve the cached Inverse Value of Matrix or perform the Inverse Matrix computation if returned null
cacheSolve <- function(x, ...) {
## Get the Inverse Value of the Matrix computed from makeCacheMatrix function GetMatrix.Inverse module
m <- x$getmatrix.inverse()
## If the value returned by above Step is not null, it means it has fetched non-null cached data
if(!is.null(m)) {
message("getting cached data")
return(m)
}
## Else Inverse Matrix is computed and cached in the variable
data <- x$get()
m <- solve(data, ...)
x$setmatrix.inverse(m)
m
}
