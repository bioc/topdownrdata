#' Histone H2A data
#'
#' This function returns the path to the Histone H2A example files accompanying
#' the \code{\link[topdown]{topdown-package}}.
#'
#' @return \code{character}, path to the directory containing the example
#' files.
#' @author Sebastian Gibb \email{mail@@sebastiangibb.de}
#' @seealso \code{\link[topdown]{topdown-package}}
#' @export
#' @examples
#' library("topdowndata")
#' h2aPath()
h2aPath <- function()system.file("h2a", package="topdowndata")
