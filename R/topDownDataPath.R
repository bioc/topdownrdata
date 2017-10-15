#' TopDown Proteomic Datasets
#'
#' This function returns the path to the example files accompanying
#' the `topdownr`.
#'
#' See [topdownrdata-package] for a description of the datasets.
#'
#' @param protein `character`, name of the dataset.
#'
#' @return `character`, path to the directory containing the example
#' files.
#' @author Sebastian Gibb \email{mail@@sebastiangibb.de}
#' @seealso \url{https://sgibb.github.io/topdownr/}
#' @export
#' @examples
#' topDownDataPath("myoglobin")
topDownDataPath <- function(protein=c("myoglobin", "ca", "h3_3", "h4", "c3a")) {
    path <- c(
        myoglobin="2017_06_29_myo",
        ca="2017_07_03_CA",
        "h3_3"="2017_07_05_H3_3",
        h4="2017_07_07_H4",
        c3a="2017_07_08_C3A"
    )
    system.file(
        file.path("extdata", path[match.arg(protein)]),
        package="topdownrdata"
    )
}
