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


# Function to wrangle and clean variable names ---------------------------------

get_wrangled <- function(wide_data){
  
  # Wide to long ---------------------------------------------------------------
  
  data_long <- wide_data %>% 
  pivot_longer(c(bfi_self_1:bfi_self_19,
                 bfi_ster_1:bfi_ster_19,
                 bfi_targ_1:bfi_targ_19),
               names_sep = "_",
               names_to = c("drop1", "bfi_target", "bfi_number")) %>% 
  pivot_wider(names_from = bfi_target, values_from = value) %>% 
  mutate(bfi_self = self,
         bfi_stereo = ster,
         bfi_targ = targ) %>% 
  select(-c(drop1, self, ster, targ)) %>% 
  pivot_longer(c(eli_self_1:eli_self_10,
                 eli_stereo_1:eli_stereo_10,
                 eli_targ_1:eli_targ_10),
               names_sep = "_",
               names_to = c("drop2", "eli_target", "eli_number")) %>% 
  pivot_wider(names_from = eli_target, values_from = value) %>% 
  mutate(eli_self = self,
         eli_stereo = stereo,
         eli_targ = targ) %>% 
  select(-c(drop2, self, stereo, targ))
  
  # Variable cleaning ------------------------------------------------------------
  
  data_long %>% 
  rename(recorded_date = RecordedDate,
         duration = `Duration (in seconds)`) %>% 
  mutate(sub_id = as.factor(sub_id),
         recorded_date = mdy_hm(recorded_date),
         duration = as.numeric(duration),
         stereo_check = as.factor(dplyr::recode(stereo_check,
                                                `1` = "Trump Supporters", #This is correct
                                                `2` = "Biden Supporters",
                                                `3` = "Myself")),
         analog_condition = as.factor(dplyr::recode(analog_condition,
                                                    `1` = "analog",
                                                    `2` = "control")),
         analog_completion = as.factor(dplyr::recode(analog_completion,
                                                     `0` = "Control/NA",
                                                     `1` = "Completed",
                                                     `2` = "Five or less words",
                                                     `3` = "Did not experience",
                                                     `4` = "Did not feel comfortable",
                                                     `5` = "Response not relevant")), #Hypothetical, not about self, not about being misunderstood
         target_condition = as.factor(target_condition),
         manip_check_politics = as.factor(dplyr::recode(manip_check_politics,
                                                        `1` = "No information",
                                                        `2` = "Voted Trump", # Correct answers depend on target condition
                                                        `3` = "Voted Biden",
                                                        `4` = "Can't remember")),
         manip_check_covid = as.factor(dplyr::recode(manip_check_covid,
                                                     `1` = "Covid is threat",
                                                     `2` = "Covid is exaggerted",
                                                     `3` = "No information", #Correct answer across all conditions since Covid condition was not used
                                                     `4` = "Can't remember")),
         manip_check_profess = as.factor(dplyr::recode(manip_check_profess,
                                         `1` = "Teacher",
                                         `3` = "Business manger",
                                         `4` = "No information",
                                         `5` = "Can't remember")),
         jen_check = as.factor(dplyr::recode(jen_check,
                                             `1` = "Jen",#correct answer
                                             `2` = "Myself",
                                             `3` = "Trump supporters",
                                             `4` = "Biden supporters")),
         vote_check = as.factor(dplyr::recode(vote_check,
                                              `1` = "Trump",
                                              `2` = "Biden", # Correct answer
                                              `3` = "Other")),
         distance_town = as.numeric(dplyr::recode(distance_town,
                                       `1` = "1",
                                       `2` = "2",
                                       `3` = "3",
                                       `4` = "4",
                                       `5` = "6",
                                       `6` = "7",
                                       `7` = "5")),
         explicit_group = as.numeric(dplyr::recode(explicit_group,
                                                   `1` = "1",
                                                   `2` = "2",
                                                   `4` = "3",
                                                   `5` = "4")),
         explicit_targ = as.numeric(dplyr::recode(explicit_targ,
                                                   `1` = "1",
                                                   `2` = "2",
                                                   `4` = "3",
                                                   `5` = "4")),
         will_to_convo = as.factor(dplyr::recode(will_to_convo,
                                                 `28` = "0 minutes",
                                                 `29` = "15 minutes",
                                                 `30` = "30 minutes",
                                                 `31` = "45 minutes",
                                                 `32` = "60 minutes")),
         #Did you take Jen's perspective and, if so, to what degree?
         intervention_check1 = as.factor(dplyr::recode(intervention_check1,
                                                       `1` = "Not at all",
                                                       `2` = "Slightly",
                                                       `3` = "Moderately",
                                                       `4` = "Completely")),
         # How often is Jen misunderstood by others?
         intervention_check2 = as.factor(dplyr::recode(intervention_check2,
                                                       `1` = "Not at all",
                                                       `2` = "Rarely",
                                                       `3` = "Sometimes",
                                                       `4` = "Always")),
         # Were you asked to write about a time you were misunderstood?
         intervention_check3 = as.factor(dplyr::recode(intervention_check3,
                                                       `1` = "Yes",
                                                       `2` = "No",
                                                       `3` = "Can't remember")),
         gender = as.factor(dplyr::recode(gender,
                                          `1` = "Man",
                                          `2` = "Woman",
                                          `3` = "Other")),                                                                                                    
         education = as.factor(dplyr::recode(education,
                                             `1` = "Less than high school",
                                             `2` = "High School",
                                             `3` = "Some college",
                                             `4` = "2 years/Associate's degree",
                                             `5` = "4 years/Bachelor's degree",
                                             `6` = "Some graduate school",
                                             `7` = "Master's degree",
                                             `8` = "Doctorate or Professional degree")),
         parent_education = as.factor(dplyr::recode(parent_education,
                                                    `20` = "Less than high school",
                                                    `21` = "High School",
                                                    `22` = "Some college",
                                                    `23` = "2 years/Associate's degree",
                                                    `24` = "4 years/Bachelor's degree",
                                                    `26` = "Some graduate school",
                                                    `1` = "Master's degree",
                                                    `2` = "Doctorate or Professional degree")),
         race = as.factor(dplyr::recode(race,
                                        `1` = "American Indian/Alaska Native",
                                        `2` = "Asian/Asian American",
                                        `3` = "Black/African American",
                                        `4` = "Latina/o or Hispanic or Chicano/a or Puerto Rican",
                                        `5` = "Middle Eastern or North African",
                                        `6` = "White or European American",
                                        `7` = "Multiracial",
                                        `8` = "Other")),
         country_birth = as.factor(dplyr::recode(country_birth,
                                                 `1` = "US is birth country",
                                                 `2` = "No, US is not birth country")),
         country_raised = as.factor(dplyr::recode(country_raised,
                                                  `1` = "Raised in US",
                                                  `2` = "Primarily raised in another country")),
         native_language = as.factor(dplyr::recode(native_language,
                                                   `1` = "English",
                                                   `2` = "Not English")),
         data_site = as.factor(data_site)) %>% 
           # Making relevant variables numeric
          mutate_at(c("distance_coffee", "realistic_q", "symbolic_q", 
                       "explicit_targ", "explicit_group", "pol_orient_1", "pol_orient_2",
                       "pol_orient_3", "age", "bfi_number", "bfi_self", "bfi_stereo",
                      "bfi_targ", "eli_number", "eli_self", "eli_stereo", "eli_targ"),
                     list(~as.numeric(.))) %>% 
  # Adding grand mean centered predictors for BFI and ELI
  mutate(bfi_self_c = bfi_self - mean(bfi_self, na.rm = TRUE),
        bfi_stereo_c = bfi_stereo - mean(bfi_stereo, na.rm = TRUE),
        eli_self_c = eli_self - mean(eli_self, na.rm = TRUE),
        eli_stereo_c = eli_stereo - mean(eli_stereo, na.rm = TRUE),
        # Adding variables to represent whether or not they need removed based on target conditions
        q_check_politics = case_when(target_condition == "LOSS" & manip_check_politics == "Voted Trump" ~ "Correct",
                                     target_condition == "LOSS" & manip_check_politics == "Can't remember" ~ "Incorrect",
                                     target_condition == "LOSS" & manip_check_politics == "No information" ~ "Incorrect",
                                     target_condition == "WARM" & manip_check_politics == "Voted Trump" ~ "Correct",
                                     target_condition == "WARM" & manip_check_politics == "Can't remember" ~ "Incorrect",
                                     target_condition == "WARM" & manip_check_politics == "No information" ~ "Incorrect",
                                     target_condition == "CONTROL" & manip_check_politics == "Voted Trump" ~ "Incorrect",
                                     target_condition == "CONTROL" & manip_check_politics == "Can't remember" ~ "Incorrect",
                                     target_condition == "CONTROL" & manip_check_politics == "No information" ~ "Correct"),
        q_check_profess = case_when(target_condition == "LOSS" & manip_check_profess == "Teacher" ~ "Incorrect",
                                    target_condition == "LOSS" & manip_check_profess == "Business manger" ~ "Incorrect",
                                    target_condition == "LOSS" & manip_check_profess == "No information" ~ "Correct",
                                    target_condition == "LOSS" & manip_check_profess == "Can't remember" ~ "Incorrect",
                                    target_condition == "WARM" & manip_check_profess == "Teacher" ~ "Correct",
                                    target_condition == "WARM" & manip_check_profess == "Business manger" ~ "Incorrect",
                                    target_condition == "WARM" & manip_check_profess == "No information" ~ "Incorrect",
                                    target_condition == "WARM" & manip_check_profess == "Can't remember" ~ "Incorrect",
                                    target_condition == "CONTROL" & manip_check_profess == "Teacher" ~ "Correct",
                                    target_condition == "CONTROL" & manip_check_profess == "Business manger" ~ "Incorrect",
                                    target_condition == "CONTROL" & manip_check_profess == "No information" ~ "Incorrect",
                                    target_condition == "CONTROL" & manip_check_profess == "Can't remember" ~ "Incorrect"),
        q_check_intervention3 = case_when(analog_condition == "analog" & intervention_check3 == "Yes" ~ "Correct",
                                          analog_condition == "analog" & intervention_check3 == "No" ~ "Incorrect",
                                          analog_condition == "analog" & intervention_check3 == "Can't remember" ~ "Incorrect",
                                          analog_condition == "control" & intervention_check3 == "Yes" ~ "Incorrect",
                                          analog_condition == "control" & intervention_check3 == "No" ~ "Correct",
                                          analog_condition == "control" & intervention_check3 == "Can't remember" ~ "Incorrect"))
  
}

# Checking function works
# long_data <- get_wrangled(wide_data)


# Function to remove participants ----------------------------------------------

# Overall participant number before cleaning participants (for reference)

# Originally 500 participants; reference as I remove participants through function below
# 
# long_data %>% 
#   select(sub_id) %>% 
#   unique() %>% 
#   count()

remove_participants <- function(long_data){
  long_data %>% 
    # Removing repeat participants -----------------------------------------------
  filter(!sub_id %in% c(247, 262, 293, 297, 295, 304, 284, 351, 374, 
                        359, 467, 470, 479, 484, 504, 507, 525, 538, 543)) %>% #removes 11 participants (to 489)
    # Removing manipulation and intervention checks ------------------------------
  filter(q_check_politics == "Correct" & 
           q_check_profess == "Correct" &
           q_check_intervention3 == "Correct" &
           manip_check_covid == "No information") %>% # removes another 57 participants (to 432)
    # Removing those who did not vote for Biden ----------------------------------
  filter(vote_check == "Biden") %>% # Removes another 4 participants (to 428)
    # Removing those who did not correctly complete the task ---------------------
  filter(analog_completion == "Completed" | analog_completion == "Control/NA") %>% # Removes another 4 participants (to 424)
    # Removing those who responded to bfi & eli with over 70% 3's
    filter(!sub_id %in% c(31, 82, 87, 130, 131, 216, 275, 385)) # Removes another 7 since one had been removed earlier (to 417)

}

# checking function works
# clean_data <- remove_participants(long_data)

# Check for repeat IP addresses to inform function above -----------------------

# wide_data_ip <- import("data/diss_main_combined_data_raw.csv")

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

# Check if screeners worked ----------------------------------------------------
# One level is everyone from Prolific; no need to filter
# consent <- clean_data %>% 
#   mutate(consent_prolific = as.factor(consent_prolific))
# levels(consent$consent_prolific)

# One level is everyone from Prolific; no need to filter
# UO should be US participants
# location <- clean_data %>% 
#   mutate(us_location_prolific = as.factor(us_location_prolific))

# levels(location$us_location_prolific)

# One level is everyone from Prolific; no need to filter
# international <- clean_data %>% 
#   mutate(international_travel_prolific = as.factor(international_travel_prolific))
# 
# levels(international$international_travel_prolific)

# Everyone has lived in the US long enough to understand US politics and most likely be US citizens
# clean_data %>% 
#   filter(country_raised != "Raised in US") %>% 
#   select(sub_id, raised_follow) %>% 
#   unique()

# Check participant bias (string of 3's) removals ------------------------------

# wide_data_sub <- wide_data %>% 
#   select(sub_id, 
#          bfi_self_1:eli_self_10,
#          bfi_ster_1:eli_stereo_10,
#          bfi_targ_1:eli_targ_10)
# 
# bias_counts <- apply(wide_data_sub, 1, function(x) length(which(x=="3")))
# bias_counts <- as.data.frame(bias_counts)
# 
# total_answers <- length(wide_data_sub)
# 
# # Used the sub_ids obtained from below in function above
# bias_counts %>% 
#   mutate(bias_percents = (bias_counts/total_answers)*100) %>% 
#   filter(bias_percents > 70)
#         
  