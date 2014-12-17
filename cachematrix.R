## This is my attempt at R Programming Programming Assignment #2. 

## The assignment gave advice on how to do 'makeVector' which created a special vector, which was really a list containing: 
## a function to: 
# - set the value of the vector
# - get the value of the vector
# - set the value of the mean
# - get the value of the mean

## Our first assigned task was to create makeCacheMatrix, using the same four goals (though adapted from above).
## makeCacheMatrix creates a special matrix object that can cache the inverse

## The assignment started us off with: 
## makeCacheMatrix <- function(x = matrix()) {  }


# This first function is below: 


makeCacheMatrix <- function(x = matrix()) {
  # First, we initialize the inverse value to NULL. 
  inv <- NULL
  
  # Second, we set the value. Here, the inv remains NULL, but x goes to y. In this assignment, we are using
  # <<- instead of <- because "for a very long vector, it may take too long to compute the mean, 
  ## especially if it has to be computed repeatedly (e.g. in a loop)."
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Third, we want to get the value of the function here. 
  get <- function() x
  
  # Fourth, we are setting the inverse in correspondence with the function and inverse input
  set_inverse <- function(inv_input) inv <<- inv_input
  # get the value of the inverse
  get_inverse <- function() inv
  
  # Finally, we are returning a list of what we did above 
  list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
  
}

# The second function for the assignment calculates the inverse of
# the matrix that we created in the first part of this assignment.
# It first will check to see if the inverse was already calculated.
# If it has been, it will use the cache and skip the math here, which
# is the benefit of such a function. If the math computation was not
# done before, it will calculate the inverse and set the value through
# the set_inverse function provided. 

  # First, the function will check and see if the inverse 
  # is already in the cache.
cacheSolve <- function(x, ...) {
  inv <- x$get_inverse()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  
  # If not, we then get the matrix. 
  data <- x$get()
  
  # and then we must calculate the inverse
  inv <- solve(data, ...)
  
  # The inverse of the matrix is then put into the cache
  x$set_inverse(inv)
  
  # Then, 'inv' gives us the result, which, as requested, should be
  # "a matrix that is the inverse of 'x'.
  inv
}
