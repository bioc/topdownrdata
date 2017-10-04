#' Example Data for the topdownr package.
#'
#' This package contains example files accompanying
#' the `topdownr`.
#'
#' It has just one function [topDownDataPath] that returns the file path to
#' the 5 example protein datasets.
#'
#' All 5 proteins were infused into a Thermo Orbitrap Fusion Lumos at 600
#' nl/minute in 50 \% acetonitrile 0.1 % FA and sprayed at through
#' FS360-20-10-5-6.35CT emitter.
#'
#' The .meth files were created with the following command:
#'
#' ```
#' library("topdownr")
#'
#' writeMethodXmls(defaultMs1Settings(LastMass=1600),
#'                 defaultMs2Settings(),
#'                 ## mass/z adapted to protein of interest (see table)
#'                 ## z is currently not supported by the Thermo software,
#'                 ## setting to 1.
#'                 mz=cbind(mass=c(745.2, 908.0, 1162.0), z=c(1, 1, 1)),
#'                 groupBy=c("replication", "ETDReactionTime"),
#'                 replications=2,
#'                 pattern="method_CA3_%s.xml")
#' ```
#'
#' \subsection{General Information}{
#'
#' \tabular{llllrr}{
#' protein name \tab uniprot accession \tab product number \tab
#' modifications \tab monoisotopic mass observed \tab
#' monoisotopic mass predicted \cr
#' horse myoglobin \tab P68082 \tab sigma M1882 \tab
#' Met-loss \tab 16940.99 \tab 16940.96 \cr
#' bovine carbonic anhydrase \tab P00921 \tab sigma C2522 \tab
#' Met-loss + Acetyl \tab 29006.76 \tab 29006.83 \cr
#' histone H3.3 \tab P84243 \tab NEB M2507S \tab
#' Met-loss \tab 15187.49 \tab 15187.46 \cr
#' histone H4 \tab P62805 \tab NEB M2504S \tab
#' Met-loss \tab 11229.33 \tab 11229.34 \cr
#' C3a recombinant protein \tab P01024 part (672-748) \tab
#' recombinantly expressed \tab carbamidomethyl \tab 9814.9.0 \tab 9814.88 \cr
#' }
#'
#' }
#'
#' \subsection{M/Z used}{
#'
#' \tabular{lrrr}{
#' protein name \tab m/z 1 \tab m/z 2 \tab m/z 3 \cr
#' horse myoglobin \tab 707.3/24 \tab 893.1/19 \tab 1211.7/14 \cr
#' bovine carbonic anhydrase \tab 745.2/39 \tab 908.0/32 \tab 1162.0/25 \cr
#' histone H3.3 \tab 563.8/27 \tab 691.8/22 \tab 894.9/17 \cr
#' histone H4 \tab 562.7/20 \tab 703.2/16 \tab 937.3/12 \cr
#' C3a recombinant protein \tab 745.2/17 \tab 908.0/14 \tab 1162.0/11 \cr
#' }
#'
#' }
#'
#' @docType package
#' @name topdownrdata-package
#' @author Pavel Shliaha \email{pavels@bmb.sdu.dk},
#' Sebastian Gibb \email{mail@@sebastiangibb.de}
#' @references \url{https://github.com/sgibb/topdownrdata/}
#' @seealso [topDownDataPath()], \url{https://sgibb.github.io/topdownr/}
#' @keywords package
#'
"_PACKAGE"
