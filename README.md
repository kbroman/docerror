## test Roxygen2 documentation of data sets

In documenting datasets with Roxygen2, you don't need to use the
`@name` directive but can use the name of the dataset as a string
after the Roxygen2 comments, like this:

    #' test dataset
    #'
    #' a dataset for testing use of Roxygen2 to document datasets
    #'
    #' @docType data
    #'
    #' @usage data(testdata)
    #'
    #' @format Just the number \code{0}.
    #'
    #' @keywords datasets
    #'
    #' @examples
    #' data(testdata)
    "testdata"

_But_, this seems to require `LazyData: true` in the `DESCRIPTION`
file.

### Branch [master](https://github.com/kbroman/docerror/tree/master)

- The dataset is documented as above
- I _don't_ include `LazyData: true` in the `DESCRIPTION` file.

When I run

    R -e 'library(devtools);document()'
    
I get the following error:

    > library(devtools);document()
    Updating docerror documentation
    Loading docerror
    Error: Failure in roxygen block beginning testdata-data.R:1
    object 'testdata' not found
    Execution halted
    make: *** [doc] Error 1

### Branch [no_error](https://github.com/kbroman/docerror/tree/no_error)

- The dataset is documented as above
- _And_ I include `LazyData: true` in the `DESCRIPTION` file.

When I run

    R -e 'library(devtools);document()'
    
everything is fine.

But when I run

    R -e 'library(roxygen2);roxygenise()'

I get the following error:

    > library(roxygen2);roxygenise()
    Error: Failure in roxygen block beginning testdata-data.R:1
    object 'testdata' not found
    Execution halted
    make: *** [roxygenise] Error 1

### Branch [use_name](https://github.com/kbroman/docerror/tree/use_name)

- The documentation of the dataset is modified to include

       #' @name testdata
      
  And I replace the final line (`"testdata"`) with `NULL`.
  
- I _don't_ include `LazyData: true` in the `DESCRIPTION` file.

Either of the following works without error.

    R -e 'library(devtools);document()'
    R -e 'library(roxygen2);roxygenise()'
