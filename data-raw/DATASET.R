## code to prepare mapping trees dataset and tree based on panaroo core gene alignment goes here

#Reading in the mapping trees reformatted to SNP distance branches using pyjar.

library(ape)
library(phytools)
library(usethis)


Kp2tree <- ape::read.tree(here("data-raw/mapping_trees/Kp2pyj2.joint.tre"))

usethis::use_data(Kp2tree, overwrite = TRUE)


Kp3tree <- ape::read.tree(here("data-raw/mapping_trees/Kp3pyj2.joint.tre"))

usethis::use_data(Kp3tree, overwrite = TRUE)


Kp1tree <- ape::read.tree(here("data-raw/mapping_trees/pyj.joint.tre"))

usethis::use_data(Kp1tree, overwrite = TRUE)


ST35tree <- ape::read.tree(here("data-raw/mapping_trees/ST35_pyj2.joint.tre"))

usethis::use_data(ST35tree, overwrite = TRUE)


ST39tree <- ape::read.tree(here("data-raw/mapping_trees/ST39_pyj2.joint.tre"))

usethis::use_data(ST39tree, overwrite = TRUE)


ST1415tree <- ape::read.tree(here("data-raw/mapping_trees/ST1415_pyj2.joint.tre"))

usethis::use_data(ST1415tree, overwrite = TRUE)


test_tree <- read.newick(here("data-raw/ariba/panaroo.core_gene_alignment_filtered.snps.contree"))
#Reformatting the tip labels so I can easily map to strain names in my tables
test_tree$tip.label <- gsub(".spades","",test_tree$tip.label)
test_tree$tip.label <- gsub(".velvet","",test_tree$tip.label)
test_tree$tip.label <- gsub("WTCHG_","WTCHG-",test_tree$tip.label)
test_tree$tip.label <- gsub('(.*_.*?)_(.*?)','\\1#\\2',test_tree$tip.label)
test_tree$tip.label <- gsub("WTCHG-","WTCHG_",test_tree$tip.label)

usethis::use_data(test_tree, overwrite = TRUE)

