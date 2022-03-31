# Cleaning Document ------------------------------------------------------------
# The functions below are used to clean the data in the analysis document.

# Packages ---------------------------------------------------------------------
library(dplyr)
library(tidyr)
library(magrittr)
library(rio)
library(lubridate)

# Import data & set-up ---------------------------------------------------------

## This data has already undergone a minor manual clean, including removing
## completely empty rows, target conditions from the human subjects pool that 
## were not relevant (competent and COVID target), and coding (but not removing)
## the analogous perspective-taking narratives. The UO and Prolific data has
## also been combined.

wide_data <- import("data/diss_main_combined_data_basic_clean.csv") 
# wide_data_ip <- import("data/diss_main_combined_data_raw.csv")

# Check for repeat IP addresses ------------------------------------------------

# repeat_ip_check  <- wide_data_ip %>%
# select(sub_id, IPAddress)

## Identified the repeat IP addresses
# repeat_ips <- repeat_ip_check$IPAddress[duplicated(repeat_ip_check$IPAddress)]
# repeat_ips

## IP addresses not listed and data with IP addresses not uploaded to GitHub for 
## participant confidentiality; Details about each and decision to keep or 
## remove listed below

## There were participants from Prolific that initially were screened out but 
## participated again, changing their answers. These will all be removed: 
## 247/262 (same participant), 293/297, 295/304, 359/374

## Participants from Prolific that participated twice, most likely bots: 351/284

## Participants from UO that participated more than once because they did not 
## successfully follow instructions for the redirct. The first participation will
## be kept: 465/479/484, 483/504/507, 521/525, 508/538, 528/543

## Participant from UO that started it twice, but never finished. This was already 
## removed in the basic clean data that had ip addresses removed: 467/470

## Removing repeat participants
wide_removed_repeats <- wide_data[-c(247, 262, 293, 297, 295, 304, 284, 351, 374, 
                                  359, 467, 470, 479, 484, 504, 507, 525, 538, 543), ]

# Variable cleaning 1 ----------------------------------------------------------

## Clean 