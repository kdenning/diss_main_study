# Must use data$variable in function
get_outlier_number <- function(variable) {
  lower <- quantile(variable, 0.025)
  upper <- quantile(variable, 0.975)
  
  outlier_output <- which(variable < lower | variable > upper)
  
  print(outlier_output)
  
}

# Check that it works
# get_outlier_number(clean_data$eli_self)

