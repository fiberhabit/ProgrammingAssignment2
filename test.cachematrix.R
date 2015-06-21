## From: http://masterr.org/r/how-to-cache-a-matrix-inversion-in-r/ (KDE, 2015-06-20).

## To test out these functions. I wrote a function called test(), 
## which takes in any invertible matrix, calculates its inverse twice 
## using these functions, and prints out the times it takes for both runs. 
## The first run should take longer than the second run because it actually 
## calculates the inverse while the second run only does a look-up 
## from the cache.

test <-  function(mat){
      ## @mat: an invertible matrix
      
      temp = makeCacheMatrix(mat)
      
      start.time = Sys.time()
      cacheSolve(temp)
      dur = Sys.time() - start.time
      print(dur)
      
      start.time = Sys.time()
      cacheSolve(temp)
      dur = Sys.time() - start.time
      print(dur)
}
