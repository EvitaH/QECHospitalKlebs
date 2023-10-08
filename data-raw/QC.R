
## code to prepare QC plots and filter clean lanes for subsequent analyses

library(QECHospitalKlebs)
library(tidyverse)
library(here)
library(ggplot2)
library(reshape2)
library(patchwork)
library(readxl)
library(devtools)

'%nin%' <- Negate('%in%')



qc_sum <- read.table(here("data-raw/QC/blood_qc.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

assembly_sum <- read.table(here("data-raw/QC/blood_assemblies.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

data_qc <- read.table(here("data-raw/QC/data_sum.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

my_samples <- read.table(here("data-raw/QC/studies_filt.txt"), sep="\t", header=TRUE, comment.char="", stringsAsFactors = FALSE)

info_all <- read.table(here("data-raw/QC/info_all.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

lanes_blood <- read.table(here("data-raw/QC/lanes_blood.txt"), sep=",", header=FALSE, comment.char="", stringsAsFactors = FALSE)

IDs_combined <- left_join(my_samples, info_all, by=c("SANGER_SAMPLE_ID"= "Sample"))

#Samples that were submitted but not sequenced
IDs_combined[is.na(IDs_combined$Lane),]$DONOR




#QC plot and filtering based on kraken composition

row.names(qc_sum) <- qc_sum$Species
qc_sum <- qc_sum[-1,]
#qc_sum <- qc_sum[,1:16]
qc_sum_l <- melt(qc_sum, id.vars = "Species", stringsAsFactors = FALSE)
qc_sum_l <- qc_sum_l %>% filter(Species != 'Total')
qc_sum_l <- qc_sum_l %>% filter(value > 10)

#Plotting once for the strains on the x-axis, to see how many are properly contaminated, and once for the species, to see what I have
#pdf("kraken.pdf")
p <- ggplot(qc_sum_l, aes(variable, value, color=Species))
p + geom_jitter(alpha = 0.4, width = .02) + theme(axis.title.x=element_blank(),axis.text.x=element_blank(), axis.ticks.x=element_blank())
#dev.off()

#Figure of only potential contaminants
qc_sum_l_cont <- qc_sum_l %>% filter(Species != 'Klebsiella pneumoniae' & Species != 'Klebsiella variicola' & Species != 'Unclassified' & Species != 'synthetic construct')

#pdf("contaminants.pdf")
p <- ggplot(qc_sum_l_cont, aes(variable, value, color=Species))
p + geom_jitter(alpha = 0.4, width = .02) + theme(axis.title.x=element_blank(),axis.text.x=element_blank(), axis.ticks.x=element_blank()) + theme_bw()
#dev.off()

cont <- as.character(qc_sum_l_cont$variable)
cont <- gsub("X", "", cont)
cont <- gsub("\\.", "#", cont)

p <- ggplot(qc_sum_l, aes(Species, value, color=Species))
p + geom_jitter(alpha = 0.4, width = .02) + theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

spec_assig <- p + geom_jitter(alpha = 0.4, width = .02, show.legend = F) + theme_bw() + ylab("percentage") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs(title = "QC species assignment", x = "Species", y = "Percentage")

#pdf("QC_species_composition.pdf")
spec_assig
#dev.off()




#QC plot and filtering based on assembly size

big_assembly <- assembly_sum[assembly_sum$No.Contigs > 500,]$Lane

ggplot(assembly_sum, aes(x=No.Contigs, y=Total.Length)) +  geom_point(data=assembly_sum[assembly_sum$Lane %nin% cont & assembly_sum$Lane %nin% big_assembly,], aes(x=No.Contigs, y=Total.Length), alpha=0.2,color="black") + geom_point(data=assembly_sum[assembly_sum$Lane %in% cont,],aes(x=No.Contigs,y=Total.Length),alpha=0.2, color="blue") +geom_point(data=assembly_sum[assembly_sum$Lane %in% big_assembly,],aes(x=No.Contigs,y=Total.Length),alpha=0.2, color="green") + theme_bw()

qc_assem <- ggplot(assembly_sum, aes(x=No.Contigs, y=Total.Length)) +  geom_point(data=assembly_sum[assembly_sum$Lane %nin% cont & assembly_sum$Lane %nin% big_assembly,], aes(x=No.Contigs, y=Total.Length), alpha=0.2,color="black") + geom_point(data=assembly_sum[assembly_sum$Lane %in% cont,],aes(x=No.Contigs,y=Total.Length),alpha=0.2, color="blue") +geom_point(data=assembly_sum[assembly_sum$Lane %in% big_assembly,],aes(x=No.Contigs,y=Total.Length),alpha=0.2, color="green") + theme_bw() + labs(title = "QC contig numbers", x = "Number of contigs", y = "Total length (bp)")

#pdf("QC_assembly.pdf")
qc_assem
#dev.off()




#QC plot and filtering out based on heterozygous SNPs

heteroz <- data_qc[data_qc$X..Het.SNPs..Total.No..of.SNPs. > 5,]$Lane.Name

ggplot(data_qc, aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage)) +  geom_point(data=data_qc[data_qc$Lane.Name %nin% heteroz,], aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage), alpha=0.2,color="black") + geom_point(data=data_qc[data_qc$Lane.Name %in% heteroz,], aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage), alpha=0.2,color="red") + theme_bw()

qc_het <- ggplot(data_qc, aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage)) +  geom_point(data=data_qc[data_qc$Lane.Name %nin% heteroz,], aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage), alpha=0.2,color="black") + geom_point(data=data_qc[data_qc$Lane.Name %in% heteroz,], aes(x=X..Het.SNPs..Total.No..of.SNPs., y=Depth.of.Coverage), alpha=0.2,color="red") + theme_bw() + labs(title = "QC heterozygous SNPs", x = "Heterozygous SNPs/total SNPs", y = "Depth of coverage")

#pdf("QC_heteroz.pdf")
qc_het
#dev.off()

#pdf("Figure_QC.pdf", width = 9, height = 5)
(qc_het + theme(axis.title.x = element_text(margin = margin(t = -190, unit = "pt")))) + (qc_assem + theme(axis.title.x = element_text(margin = margin(t = -190, unit = "pt")))) + spec_assig + plot_annotation(title = "Figure S2", tag_levels = "A", tag_suffix = ")")
#dev.off()

all_cont <- unique(c(big_assembly, cont, heteroz))




#Combining QC, cleaning up duplicated names

clean_strains <- setdiff(lanes_blood$V1, all_cont)

kleborate <- as.data.frame(read_excel("~/Nextcloud/Documents/manuscripts/Klebs_Malawi/result_files/Kleborate.xlsx"))

#A few more contaminants as in kleborate -> not identified as Klebs

#4 samples also failed assembly - not in "pf"
#"42070_1#38"  "42070_1#245" "42070_2#301" "42092_2#103"

kleborate_cont <- c("42092_1#244", "42070_1#229", "42070_1#291", "42070_1#293", "42070_1#37", "42070_1#54", "42070_1#5",  "42070_1#6",  "42070_2#95", "42092_2#197", "42092_2#229")

#Some samples have duplicated strain names. A few are duplicated within my sample set - remove these for now - a few duplicated between ours and Jen or Patrick and Jen - always keep Jen's to be pragmatic - and one duplicated in Patrick's remove one of them.

duplicated_names <- c("BGT1SC",  "BHB36Z",  "A33528",  "A57653",  "1013484", "BHA60A", "BKQA6V",  "BKQA1N",  "BKR469",  "1030259", "BKQ2QU", "D50395")

info_all[info_all$Supplier.Name %in% duplicated_names,]

duplicated_strains <- IDs_combined[IDs_combined$SUPPLIER_SAMPLE_NAME %in% duplicated_names,]$Lane

clean_strains <- setdiff(lanes_blood$V1, c(all_cont, kleborate_cont, duplicated_strains))




#Adding published data, removing duplicates; getting final set of lanes

strains_Pat <- read.table(here("data-raw/QC/info_Pat.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

strains_dupl <- c("15966_8#91", "15966_8#95", "16228_1#23")
strains_Pat <- strains_Pat[strains_Pat$Lane %nin% strains_dupl,]

strains_Reb <- read.table(here("data-raw/QC/info_Reb.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

strains_Jen <- read.table(here("data-raw/QC/info_Jen.txt"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)

info_added <- rbind(strains_Pat, strains_Reb, strains_Jen)

info_added[info_added$Supplier.Name %in% duplicated_names,]

studies_added <- as.data.frame(read_excel(here("data-raw/QC/added_others.xlsx")))

IDs_combined_others <- left_join(studies_added, info_added, by=c("SANGER_SAMPLE_ID"= "Lane"))

colnames(IDs_combined_others) <- c("Lane", "SUPPLIER_SAMPLE_NAME", "COUNTRY", "REGION", "DATE", "DESCRIPTION", "DONOR",  "PHENOTYPE", "KLEBS.SEQ", "SANGER_SAMPLE_ID", "Supplier.Name", "Public.Name", "Strain")

IDs_combined_total <- rbind(IDs_combined_others,IDs_combined)

all_clean_strains <- c(clean_strains, strains_Jen$Lane, strains_Reb$Lane, strains_Pat$Lane)
not_assembled <- c("42070_1#245","42070_1#38","42070_2#301","42092_2#103")
all_clean_strains <- all_clean_strains[all_clean_strains %nin% not_assembled]

#Finally, generated my set of clean strains for this analysis.

usethis::use_data(all_clean_strains, overwrite = TRUE)




#Reading in new kleborate run; cleaning up names and making a combined big kleborate table adding the main_ST column

kleborate_new <- as.data.frame(read_excel(here("data-raw/kleborate_kaptive/Kleborate_results_new.xlsx")))

kleborate_new$strain <- gsub(".contigs_velvet","",kleborate_new$strain)
kleborate_new$strain <- gsub(".contigs_spades","",kleborate_new$strain)

kleborate_big <- left_join(kleborate_new,IDs_combined_total,by= c("strain" = "Lane"))

main_ST <- c("ST101","ST14","ST15","ST1552","ST17","ST25","ST29","ST307","ST340","ST35","ST36","ST37","ST39","ST391","ST45","ST48","ST584","ST607","ST86")

kleborate_big$main_ST <- kleborate_big$ST
kleborate_big[kleborate_big$ST %nin% main_ST,]$main_ST <- "other"
kleborate_big[kleborate_big == "NA"] <- NA

usethis::use_data(kleborate_big, overwrite = TRUE)


#Newly predicted O-Ag loci and types after I added wbbZ and its resulting types to the kaptive files

O_new <- read.table(here("data-raw/kleborate_kaptive/kaptive_results_wbbZ.txt"), header=T, sep="\t", comment.char="")
O_new$Assembly <- gsub(".contigs_velvet","",O_new$Assembly)
O_new$Assembly <- gsub(".contigs_spades","",O_new$Assembly)

usethis::use_data(O_new, overwrite = TRUE)




#Newly predicted K-loci with most rercent kaptive as in manuscript

K_new <- read.table(here("data-raw/kleborate_kaptive/kaptive_new_k_results_table.txt"), header=T, sep="\t", comment.char="")
K_new$Assembly <- gsub(".contigs_velvet","",K_new$Assembly)
K_new$Assembly <- gsub(".contigs_spades","",K_new$Assembly)

usethis::use_data(K_new, overwrite = TRUE)


#Loading ariba plasmidfinder output data

ariba_plasmid <- read.table(here("data-raw/ariba/plasmidfinder_sum_big.csv"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)
ariba_plasmid$name <- gsub("ariba_Reb/","",ariba_plasmid$name)
ariba_plasmid$name <- gsub("ariba_Pat/","",ariba_plasmid$name)
ariba_plasmid$name <- gsub("ariba_Jen/","",ariba_plasmid$name)
ariba_plasmid$name <- gsub("ariba_","",ariba_plasmid$name)
ariba_plasmid$name <- gsub("_plasmidfinder_out/report.tsv","",ariba_plasmid$name)
colnames(ariba_plasmid) <- gsub(".match","",colnames(ariba_plasmid))
ariba_plasmid <- ariba_plasmid[ariba_plasmid$name %in% all_clean_strains,]

usethis::use_data(ariba_plasmid, overwrite = TRUE)


#Loading ariba resistance gene prediction output data using srst2-argannot database

ariba_full_AMR <- read.table(here("data-raw/ariba/srst2_argannot_sum_big.csv"), sep=",", header=TRUE, comment.char="", stringsAsFactors = FALSE)
ariba_full_AMR$name <- gsub("ariba_Reb/","",ariba_full_AMR$name)
ariba_full_AMR$name <- gsub("ariba_Pat/","",ariba_full_AMR$name)
ariba_full_AMR$name <- gsub("ariba_Jen/","",ariba_full_AMR$name)
ariba_full_AMR$name <- gsub("ariba_","",ariba_full_AMR$name)
ariba_full_AMR$name <- gsub("_srst2_argannot_out/report.tsv","",ariba_full_AMR$name)
colnames(ariba_full_AMR) <- gsub(".match","",colnames(ariba_full_AMR))
ariba_full_AMR <- ariba_full_AMR[ariba_full_AMR$name %in% all_clean_strains,]

usethis::use_data(ariba_full_AMR, overwrite = TRUE)




#Loading a combined kleborate + LIMS (laboratory management system) file.

LIMS_kleborate <- as.data.frame(read_excel(here("data-raw/QC/LIMS_kleborate_clean.xlsx")))
LIMS_kleborate[LIMS_kleborate=="NA"] <- NA

usethis::use_data(LIMS_kleborate, overwrite = TRUE)


