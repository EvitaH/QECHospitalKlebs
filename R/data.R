#' Data: A list of all post-QC strains used for the analyses
#'
#' @format A character vector of 1373 lane IDs
#' \describe{
#'   \item{all_clean_strains}{Character vector of lane IDs}
#' }
"all_clean_strains"




#' Data: Core gene tree based on the output from panaroo
#'
#' Tree generated as described in manuscript,
#'
#' @format A "phylo" object ("ape" package)
#'
"test_tree"



#' Data: K. pneumoniae subsp. pneumoniae mapping tree
#'
#' Tree generated as described in manuscript, excluding all STs with only a single isolate in the dataset.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"Kp1tree"



#' Data: K. pneumoniae subsp. quasipneumoniae mapping tree
#'
#' Tree generated as described in manuscript.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"Kp2tree"



#' Data: K. variicola mapping tree
#'
#' Tree generated as described in manuscript.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"Kp3tree"



#' Data: K. pneumoniae subsp. pneumoniae ST1415 tree
#'
#' Tree generated as described in manuscript, using only ST14 and ST15 isolates.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"ST1415tree"


#' Data: K. pneumoniae subsp. pneumoniae ST39 tree
#'
#' Tree generated as described in manuscript, using only ST39 isolates.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"ST39tree"


#' Data: K. pneumoniae subsp. pneumoniae ST35 tree
#'
#' Tree generated as described in manuscript, using only ST35 isolates.
#' Mapping tree as described recalculated so branch lengths represent SNP distances to use as rPinecone input.
#'
#' @format A "phylo" object ("ape" package)
#'
"ST35tree"


#' Data: Colourscheme for the ESBL genes / alleles detected
#'
#' @format A vector of seven named characters
#' \describe{
#'   \item{ESBL_col}{Named character vector of seven entries}
#' }
"ESBL_col"


#' Data: Colourscheme for K-types
#'
#' @format A vector of 27 named characters
#' \describe{
#'   \item{K_col}{Named character vector of 27 entries}
#' }
"K_col"


#' Data: Colourscheme for the O-Ag loci
#'
#' @format A vector of 13 named characters
#' \describe{
#'   \item{O_colours}{Named character vector of 13 entries}
#' }
"O_colours"


#' Data: Colourscheme for the O-Ag types as predicted
#'
#' @format A vector of 17 named characters
#' \describe{
#'   \item{O_type_colours}{Named character vector of 17 entries}
#' }
"O_type_colours"


#' Data: Colourscheme for dates (year)
#'
#' @format A vector of 25 named characters
#' \describe{
#'   \item{date_col}{Named character vector of 25 entries}
#' }
"date_col"


#' Data: Colourscheme for the main ST types
#'
#' @format A vector of 20 named characters
#' \describe{
#'   \item{main_ST_col}{Named character vector of 20 entries}
#' }
"main_ST_col"


#' Data: Colourscheme for the sample type
#'
#' @format A vector of 2 named characters
#' \describe{
#'   \item{sample_col}{Named character vector of 2 entries}
#' }
"sample_col"


#' Data: Colourscheme for the (sub)species
#'
#' @format A vector of 8 named characters
#' \describe{
#'   \item{species_col}{Named character vector of 8 entries}
#' }
"species_col"


#' Data: Colourscheme for the main wards
#'
#' @format A vector of 16 named characters
#' \describe{
#'   \item{ward_col}{Named character vector of 16 entries}
#' }
"ward_col"


#' Data: Main sequence types in the dataset
#'
#' @format A vector of 19 characters
#' \describe{
#'   \item{main_ST}{Character vector of 19 entries}
#' }
"main_ST"


