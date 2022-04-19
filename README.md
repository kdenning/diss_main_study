# diss_main_study

This study explored whether counter-projection was explained by threat (measured using a composite measure and also manipulated) and could be reduced by an analogous perspective-taking intervention. Two measures of counter-projection were collected -- the big five inventory (BFI) and a series of everyday preferences (called the Everday Likes Items or ELI). The amount of counter-projection variance explained by stereotyping was also explored, with any remaining counter-projection being labeled "residual counter-projection."

## Explanation of documents

For clarity, distinct analyses were organized into different .Rmds and associated html files. The broad contents of each are described below.

### descriptives_and_demographics

This document contains the descriptives, including sample size, mean/sd/range per variable and combinations of variables, and normality of continuous measures. It also includes the number of participants in each demographic category and that corresponding percentage. Demographic categories include age, race, gender, education, parent education, country of birth, country raised in, and language. 

### downstream_effs

This document looks at the effect of residual counter-projection on the downstream measure of willingness to have a conversation using the BFI.

### eli_measure_exploration

Due to the ELI having zero variance in the intercept regardless of the multilevel model being conducted and the descriptives being normal, all analyses including the ELI were explored separately. Thus, the primary analyses were conducted using the BFI. This document contains all ELI analyses.

### mediational_model

Explored the direct effect of analogous perspective taking on counter-projection and if it was explained by threat. This document does not have a corresponding html because the bootstrapping takes a while to run. However, the dataset that resulted from the bootstrapping has also been uploaded and is titled "bootstrap_mediation_output.csv"

### pilot_replication_analyses

The pilot analysis conducted to determine the variables used in the threat composite and the target conditions can be found here: https://github.com/kdenning/diss_threat_pilot These results were replicated in this document.

### stereo_analyses

This analysis explored the effect of the threat composite and the target threat condition on the BFI before and after accounting for stereotyping in order to measure residual counter-projection. This also includes a variety of tests of assumptions, including residuals and multicolinearity.

### supplemental_analyses

This document includes all additional analyses, including but not limited to: exploration of variance of threat measure, exploration of intervention check answers in relation to analogous perspective taking results, additional models to the mediational model testing the effect of analog perspective taking on the BFI, etc. As this is a working document, it has not been knitted into html.

### threat_exploration

This document explored if the different subscales of threat had similiar effects on counter-projection using the BFI.
