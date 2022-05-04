# diss_main_study

This study explored whether counter-projection was explained by threat (measured using a composite measure -- target-level threat -- and also manipulated) and could be reduced by an analogous perspective-taking intervention. Two measures of counter-projection were collected -- the big five inventory (BFI) and a series of everyday preferences (called the Everday Likes Items or ELI). The amount of counter-projection variance explained by stereotyping was also explored, with any remaining counter-projection being labeled "residual counter-projection."

## Explanation of documents

For clarity, distinct analyses were organized into different .Rmds and associated html files. The broad contents of each are described below.

### descriptives_and_demographics

This document contains the descriptives, including sample size, mean/sd/range per variable and combinations of variables, and normality of continuous measures. It also includes the number of participants in each demographic category and that corresponding percentage. Demographic categories include age, race, gender, education, parent education, country of birth, country raised in, and language. 

### downstream_effs

This document looks at the effect of residual counter-projection on the downstream measure of willingness to have a conversation with the target. This uses both the ELI and the BFI. This corresponds to the section titled "Effects of residual counter-projection on behavioral intentions" in Study 2B's results.

### eli_measure_exploration

Due to the ELI having zero variance in the intercept, many analyses using the ELI were explored seaprately. Thus, the primary analyses were conducted using the BFI in a separate document. For the dissertation, this document contains the analogous perspective-taking mlm using the ELI to examine residual counter-projection (corresponding to the section titled "Reducing residual counter-projection with the ELI" in Study 2B). This section also contains all exploration into why the ELI had zero variance in the intercept.

### mediational_model

Explored the direct effect of analogous perspective taking on counter-projection and if it was explained by threat. The corresponding html for this document does not include the bootstrapping results, as this was run separately. However, the code that calculated this is inlcuded and the dataset that resulted from the bootstrapping was uploaded  (titled "bootstrap_mediation_output.csv"). These results correspond to the section labeled "Effect of instruction variable mediated by target-level threat" in Study 2B's results.

### pilot_replication_analyses

The pilot analysis conducted to determine the variables used in the threat composite and the target conditions can be found here: https://github.com/kdenning/diss_threat_pilot These results were replicated in this document. These results correspond to the section labeled "Threat measure replication" section within Study 2B's results.

### residual_counter_projection

This analysis explored the effect of the threat composite (i.e., target-level threat) before and after accounting for stereotyping in order to measure residual counter-projection. This includes both the ELI and the BFI, as this was the main reason the ELI was included, so it was considered best to allow for the direct comparison of both measures in one document. This also includes a variety of tests of assumptions, including residuals and multicolinearity. This section corresponds to the section titled "Residual counter-projection" in Study 2B's results.

### supplemental_analyses

This document includes all additional analyses, including but not limited to: exploration of variance of threat measure and exploration of intervention check answers in relation to analogous perspective taking results. As this is a working document, it has not been knitted into html. These results are not reported in the dissertation.

### threat_exploration

This document explored if the different subscales of threat had similiar effects on counter-projection using the BFI. These results are not reported in the dissertation.
