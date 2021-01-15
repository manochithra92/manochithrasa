## we input a matrix, get the inverse of the matrix and store in cache for future calculation
## In future when inverse is called, it searches in cache for its availablilty and skips upon finding in cache, else calculates the inverse and stores in cache at that instant 

## THe below function stores the matrix and cache's its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set <- function(y){
                x<<-y
                m<<-NULL
        }
        get <- function()x
        setinverse<-function(inverse)m<<-inverse
        getinverse<function()m
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## The following function calculates the inverse of the matrix created with the above function.
## However, it first checks to see if the inverse has already been calculated.
## If so, it gets the inverse matrix value from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<-x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m

        }
