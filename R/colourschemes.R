main_ST_col <- c("ST101" = "#5B859E", "ST14" = "#395B7B", "ST15" = "#26405D", "ST1552" = "#566C51", "ST17" = "#637E4A", "ST25" = "#336547", "ST29" = "#576952", "ST307" = "#C2856A", "ST340" = "#CB7456", "ST35" = "#B15232", "ST36" = "#C16F5F", "ST37" = "#CF8A8B", "ST39" = "#995556", "ST391" = "#7B3B41", "ST45" = "#9A6A81", "ST48" = "#967192", "ST584" = "#69476A", "ST607" = "#856454", "ST86" = "#CBAB49", "other" = "lightgrey")
usethis::use_data(main_ST_col, overwrite = TRUE)

main_ST <- c("ST101","ST14","ST15","ST1552","ST17","ST25","ST29","ST307","ST340","ST35","ST36","ST37","ST39","ST391","ST45","ST48","ST584","ST607","ST86")
usethis::use_data(main_ST, overwrite = TRUE)

species_col <- c("Klebsiella_quasipneumoniae_subsp._quasipneumoniae" = "#9aceeb", "Klebsiella_quasipneumoniae_subsp._similipneumoniae" = "#c5d0e6", "Klebsiella_variicola_subsp._variicola" = "#ebc7df", "Klebsiella_pneumoniae" = "#ace5ee", "Klebsiella quasipneumoniae subsp. quasipneumoniae" = "#9aceeb", "Klebsiella quasipneumoniae subsp. similipneumoniae" = "#c5d0e6" , "Klebsiella variicola subsp. variicola" = "#ebc7df", "Klebsiella pneumoniae" = "#ace5ee")
usethis::use_data(species_col, overwrite = TRUE)

sample_col <- c("Blood" = "#ff496c", "CSF" = "#2b6cc4")
usethis::use_data(sample_col, overwrite = TRUE)

date_col <- c("1996"="#000000", "1997" = "#0A0A0A", "1998" =  "#151515", "1999" = "#1F1F1F", "2000" = "#2A2A2A", "2001" = "#353535","2002" =  "#3F3F3F", "2003" = "#4A4A4A", "2004" = "#555555", "2005" = "#5F5F5F", "2006" = "#6A6A6A", "2007" = "#747474", "2008" = "#7F7F7F", "2009" = "#8A8A8A", "2010" = "#949494", "2011" = "#9F9F9F", "2012" = "#AAAAAA", "2013" = "#B4B4B4", "2014" = "#BFBFBF", "2015" = "#C9C9C9", "2016" = "#D4D4D4", "2017" = "#DFDFDF", "2018" = "#E9E9E9", "2019" = "#F4F4F4",  "2020" = "#FFFFFF")
usethis::use_data(date_col, overwrite = TRUE)

K_col <- c("KL102" = "#71bc78", "KL103" = "#93dfb8", "KL106" = "#45cea2", "KL112" = "#17806d", "KL122" = "#1fcecb", "KL15" = "#18a7b5", "KL16" = "#ace5ee", "KL17" = "#0d98ba", "KL19" = "#9aceeb", "KL2" = "#1164b4", "KL20" = "#1a4876", "KL23" = "#a2add0", "KL24" = "#324ab2", "KL25" = "#7366bd", "KL27" = "#cda4de", "KL3" = "#8f509d", "KL30" = "#fc74fd", "KL43" = "#ff1dce", "KL48" = "#e6a8d7", "KL51" = "#c54b8c", "KL52" = "#ffbcd9", "KL57" = "#ffb3ba", "KL62" = "#ffdfba", "KL64" = "#ffffba", "KL9" = "#baffc9", "other" = "#cdc5c2", "unknown" = "#1b1b1b")
usethis::use_data(K_col, overwrite = TRUE)

O_colours <- c("O12" = "#ffbcd9", "O1/O2v1" = "#ea7e5d", "O1/O2v2" = "#ffa474", "O1/O2v3" = "#fdd9b5", "O3/O3a" = "#ffff66", "O3b" = "#b2ec5d", "O4" = "#aaf0d1", "O5" = "#77dde7", "OL101" = "#1dacd6", "OL102" = "#5d76cb", "OL103" = "#c364c5", "OL104" = "#dd4492", "unknown" = "#1b1b1b")
usethis::use_data(O_colours, overwrite = TRUE)

O_type_colours <- c("O12" = "#ffbcd9", "O1a" = "#ff5349", "unknown (O1/O2v1)" = "#ff5349", "unknown (O1/O2v2)" = "#ff5349", "O1b" = "#ea7e5d",  "O2a" = "#ffa474", "O2ac" = "#fdd9b5", "O2afg" = "#fcd975", "O3/O3a" = "#ffff66", "O3b" = "#b2ec5d", "O4" = "#aaf0d1", "O5" = "#77dde7", "unknown (OL101)" = "#1dacd6", "unknown (OL102)" = "#5d76cb", "unknown (OL103)" = "#c364c5", "unknown (OL104)" = "#dd4492", "unknown" = "#1b1b1b")
usethis::use_data(O_type_colours, overwrite = TRUE)

ward_col <- c("3B MALE MEDICAL WARD" = "#E7C697", "4A FEMALE MEDICAL WARD" = "#EA7E5D", "A ETC" = "#FFBD88", "BURNS UNITS" = "#EFDBC5", "CHATINKHA NURSERY" = "#BAB86C", "INTENSIVE CARE UNIT" = "#ECEABE", "PAEDIATRIC A&E" = "#BC5D58", "PAEDIATRIC MEDICAL BAY/WARD" = "#FDBCB4", "PAEDIATRIC MOYO WARD" = "#FAA76C", "PAEDIATRIC NURSERY" = "#FFCFAB", "PAEDIATRIC ONCOLOGY" = "#B0B7C6", "PAEDIATRIC SPECIAL CARE WARD" = "#DBD7D2", "PAEDIATRIC SURGICAL WARD" = "#DEAA88", "PICU/HDU" = "#FCD975", "PUBLIC" = "#D68A59", "unknown"="lightgrey")
usethis::use_data(ward_col, overwrite = TRUE)

ESBL_col <- c("AmpC2_Ecoli_Bla" = "#7DCCD3", "CARB_Bla" = "#4E7147", "CMY_Bla" = "#BE9C9D", "CTX_M_1_Bla" = "#376597", "CTX_M_55" = "#F7ECD8", "CTX_M_9_Bla" = "#9888A5", "VEB_1_Bla" = "#DBA662")
usethis::use_data(ESBL_col, overwrite = TRUE)
