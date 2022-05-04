# diss_main_study

This study explored whether counter-projection was explained by threat (measured using a composite measure -- target-level threat -- and also manipulated) and could be reduced by an analogous perspective-taking intervention. Two measures of counter-projection were collected -- the big five inventory (BFI) and a series of everyday preferences (called the Everday Likes Items or ELI). The amount of counter-projection variance explained by stereotyping was also explored, with any remaining counter-projection being labeled "residual counter-projection."

## Explanation of documents

For clarity, distinct analyses were organized into different .Rmds and associated html files. The broad contents of each are described below.

### descriptives_and_demographics

This document contains the descriptives, including sample size, mean/sd/range per variable and combinations of variables, and normality of continuous measures. It also includes the number of participants in each demographic category and that corresponding percentage. Demographic categories include age, race, gender, education, parent education, country of birth, country raised in, and language. 

### downstream_effs

This document looks at the effect of residual counter-projection on the downstream measure of willingness to have a conversation with the target. This uses both the ELI and the BFI. The results in this doc correspond to the section titled "Effects of residual counter-projection on behavioral intentions" in Study 2B.

### eli_measure_exploration

Due to the ELI having zero variance in the intercept, many analyses using the ELI were explored seaprately and not included in the dissertation. Thus, the primary analyses were conducted using the BFI in separate documents. For the dissertation, this document contains all exploration into why the ELI had zero variance in the intercept. This also includes any ELI analyses using the analogous perspective taking instruction variable, but these were not included in the dissertation.

### mediational_model

Explored the direct effect of analogous perspective taking on counter-projection and if it was explained by threat. The corresponding html for this document does not include the bootstrapping results, as this was run separately. However, the code that calculated this is inlcuded and the dataset that resulted from the bootstrapping was uploaded  (titled "bootstrap_mediation_output.csv"). Tests of assumptions can be found in this document, as well as individual mlms corresponding to each path. These results correspond to the section labeled "Effect of instruction variable mediated by target-level threat" in Study 2B's results.

### pilot_replication_analyses

The pilot analysis conducted to determine the variables used in the threat composite and the target conditions can be found here: https://github.com/kdenning/diss_threat_pilot These results were replicated in this document. These results correspond to the section labeled "Threat measure replication" section within Study 2B's results.

### residual_counter_projection

This analysis explored if the effect of the threat composite (i.e., target-level threat) on counter-projection persisted after accounting for stereotyping. Models both including and not including stereotyping were conducted to look for differences in residual counter-projection. This includes both the ELI and the BFI -- the reason the ELI was included was to test for differences in residual counter-projection, so this was the one analysis the ELI was used in, even with the issue with the intercept. This document also includes analyses about whether analogous perspective taking reduced residual counter-projection. A variety of tests of assumptions, including residuals and multicolinearity, can also be found in this document. This section corresponds to the section titled "Residual counter-projection" in Study 2B's results.

### supplemental_analyses

This document includes all additional analyses, including but not limited to: exploration of variance of threat measure and exploration of intervention check answers in relation to analogous perspective taking results. As this is a working document, it has not been knitted into html. These results are not reported in the dissertation.

### threat_exploration

This document explored if the different subscales of threat had similiar effects on counter-projection using the BFI. These results are not reported in the dissertation.

### analog_mlms

This document includes multilevel models specifically about the effect of analogous perspective taking on the BFI. As there was no effect found in the mediation of analogous perspective taking, these were not included in the dissertation.

## Explanation of variable names

Within the code, the variable names are somewhat different than those used in the dissertation. The definitions below should help you follow the code for the primary variables employed in the analysis. When pmc or gmc are added to variables this indicates the type of centering. pmc = person mean centering; gmc = grand mean centering.

### sub_id 
Subject id. This is in long_format for each participant and repeats for the number of items on the bfi or eli, depending on which df is being used.

### analog_condition
This corresponds to whether people are in teh instructions condition or control. "analog" indicates the instruction condition.

### target_condition
This corresponds to which target condition the participant was in for the target variable. "Control" corresponds to the non-political control target/least threatening target, "Warm" corresponds to the warm target/moderately threatening target, and the "Loss" condition corresponds to the political loss target/most threatening.

### distance_coffee
Implicit distancing measure operationalized through distance in coffee shop

### distance_down
Implicit distancing measure operationalized through perceived distance you live away from the target

### realistic_q
Self-reported realistic threat (how much target's pose a threat to your safety or resources)

### symbolic_q
Self-reported symbolic threat (how much target's pose a threat to American culture or your way of life)

### itt_comp
Composite measure of realistic and symbolic threat. 

### explicit_threat
Explicit measure of threat at the target-level

### explicit_group
Explicit measure of threat at the group-level

### will_to_convo
Downstream behavior of willingness to have a conversation with the target

### bfi_targ, bfi_self, bfi_stereo
Responses on the bfi in long-format for either the target, self, or stereotypical member of the out-group

### eli_targ, eli_self, eli_stereo
Responses on the eli in long-format for either the target, self, or stereotypical member of the out-group


