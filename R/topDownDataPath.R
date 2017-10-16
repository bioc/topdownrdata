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
        myoglobin="20170629_myo",
        ca="20170703_ca",
        "h3_3"="20170705_h3_3",
        h4="20170707_h4",
        c3a="20170708_c3a"
    )
    system.file(
        file.path("extdata", path[match.arg(protein)]),
        package="topdownrdata"
    )
}
