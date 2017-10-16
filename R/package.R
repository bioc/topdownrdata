#' Example Data for the topdownr package.
#'
#' This package contains example files accompanying
#' the `topdownr`.
#'
#' It has just one function [topDownDataPath()] that returns the file path to
#' the 5 example protein datasets.
#'
#' Each dataset has four different categories of files:
#'
#' * One `.fasta` file containing the protein sequence.
#' * Multiple `.experiments.csv`, `.txt`, and `.mzML` files (the same number
#' of files for each of the three types):
#'      * The `.experiments.csv` files contain the information about the used
#'      method and the settings of the mass spectrometer
#'      (fragmentation conditions).
#'      * The `.txt` scan header files contain (additional) information about
#'      the spectra (monoisotopic *m/z*, ion injection time, ...).
#'      * The `.mzML` files contain the deconvoluted spectra.
#'
#' In total this package has 323 files: a `.fasta` file for each protein (5) and
#' 20 files of each of the three method/spectra information files for every
#' protein except for the *C3a recombinant protein* that has 26 of each.
#'
#' The `topdownr` package needs all the four file types. The sequence
#' information of the `.fasta` file is used to calculate the fragmentation
#' *in-silico*. The theoretical fragments are matched against the experimental
#' seen fragments that are stored in the `.mzML` files. In the next step the
#' fragmentation data have to be combined with the general information about
#' spectra and the fragmentation condition from the `.txt` scan header and the
#' `.experiments.csv` method files, respectively.
#'
#' In combination these information could be used to investigate fragmentation
#' conditions and to find the one (or more) that maximise the overall
#' fragment coverage. Please see a small example on the end of this manual page
#' and a full featured example analysis in the `topdownr` analysis vignette:
#' `vignette("analysis", package="topdownr")`.
#'
#' The .meth files were created with the following
#' command:
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
#'                 pattern="method_CA3_\\%s.xml")
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
#' All 5 proteins were infused into a Thermo Orbitrap Fusion Lumos at 600
#' nl/minute in 50 \% acetonitrile 0.1 % FA and sprayed at through
#' FS360-20-10-5-6.35CT emitter.
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
#' @seealso [topDownDataPath()], [topdownr-package],\cr
#' Vignettes for
#' the generation `vignette("data-generation", package="topdownr")`
#' and analysis of these data `vignette("analysis", package="topdownr")`.\cr
#' Website: \url{https://sgibb.github.io/topdownr/}
#' @keywords package
#' @import topdownr
#' @examples
#' # List file categories
#' list.files(topdownrdata::topDownDataPath("myoglobin"))
#'
#' # List all needed files
#' list.files(topdownrdata::topDownDataPath("myoglobin"), recursive=TRUE)
#'
#' # Read files, predict fragments and combine spectra information
#' tds <- readTopDownFiles(
#'     path=topDownDataPath("myoglobin"),
#'     ## Use an artifical pattern to load just the fasta
#'     ## file and files from m/z == 1211, ETD reagent
#'     ## target 1e6 and first replicate to keep runtime
#'     ## of the example short
#'     pattern=".*fasta.gz$|1211_.*1e6_1"
#' )
#'
#' # Show TopDownSet object
#' tds
#'
#' # Filter all intensities that don't have at least 10 % of the highest
#' # intensity per fragment.
#' tds <- filterIntensity(tds, threshold=0.1)
#'
#' # Filter all conditions with a CV above 30 % (across technical replicates)
#' tds <- filterCv(tds, threshold=30)
#'
#' # Filter all conditions with a large deviation in injection time
#' tds <- filterInjectionTime(tds, maxDeviation=log2(3), keepTopN=2)
#'
#' # Filter all conditions where fragments don't replicate
#' tds <- filterNonReplicatedFragments(tds)
#'
#' # Normalise by TIC
#' tds <- normalize(tds)
#'
#' # Aggregate technical replicates
#' tds <- aggregate(tds)
#'
#' # Coerce to NCBSet (N-/C-terminal/Bidirectional) and plot fragment coverage
#' fragmentationMap(as(tds, "NCBSet"))
"_PACKAGE"
