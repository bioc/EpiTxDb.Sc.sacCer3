#' @title Annotation package for EpiTxDb object(s)
#'
#' @author Felix G M Ernst [aut]
#'
#' @description
#' This package loads one or more EpiTxDb objects. Such EpiTxDb objects are an
#' R interface to prefabricated databases contained by this package.
#' 
#' The names of any objects exposed by this package indicate the origin and
#' resources exposed.  So for example EpiTxDb.Hsapiens.hg38.snoRNAdb would be a
#' EpiTxDb object of Homo sapiens data from snoRNAdb build based on the hg38
#' build.
#' 
#' @seealso
#' \itemize{
#' \item{\code{\link[EpiTxDb:modifications]{modifications}}}
#' \item{\code{\link[EpiTxDb:modifications]{reactions}}}
#' \item{\code{\link[EpiTxDb:modifications]{specifies}}}
#' \item{\code{\link[EpiTxDb:modifications]{modificationsByTranscript}}}
#' \item{\code{\link[EpiTxDb:modifications]{modifiedSeqsByTranscript}}}
#' }
#' 
#' @docType package
#' @name EpiTxDb.Sc.sacCer3
#' 
#' @examples 
#' library(EpiTxDb.Sc.sacCer3)
#' EpiTxDb.Sc.sacCer3.RMBase
NULL

#' @import EpiTxDb
NULL

.onLoad <- function(libname, pkgname)
{
  ns <- asNamespace(pkgname)
  path <- system.file("extdata", package = pkgname, lib.loc = libname)
  files <- dir(path)
  files <- files[grepl("*\\.sqlite",files)]
  for(i in seq_len(length(files))){
    db <- 
      AnnotationDbi::loadDb(system.file("extdata", files[[i]],
                                        package = pkgname, lib.loc = libname),
                                packageName = pkgname)
    objname <- sub(".sqlite$", "", files[[i]])
    assign(objname, db, envir = ns)
    namespaceExport(ns, objname)
  }
}


#' @rdname EpiTxDb.Sc.sacCer3
#' @keywords datasets
#' 
#' @usage EpiTxDb.Sc.sacCer3.tRNAdb
"EpiTxDb.Sc.sacCer3.tRNAdb"
#' @rdname EpiTxDb.Sc.sacCer3
#' @usage EpiTxDb.Sc.sacCer3.RMBase
"EpiTxDb.Sc.sacCer3.RMBase"