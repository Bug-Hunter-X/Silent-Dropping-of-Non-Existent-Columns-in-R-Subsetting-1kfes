```r
# Solution 1: Check for column existence before subsetting
data <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_select <- c("A", "D", "E")

# Check if all columns exist
if (all(cols_to_select %in% names(data))) {
  subset_data <- data[, cols_to_select]
} else {
  missing_cols <- setdiff(cols_to_select, names(data))
  warning(paste("Columns", paste(missing_cols, collapse = ", "), "not found.  Dropping them."))
  subset_data <- data[, intersect(cols_to_select, names(data))]
}

# Solution 2: Use dplyr's select function
library(dplyr)
subset_data <- data %>% select(all_of(cols_to_select))
#This throws an error if columns are missing.

# Solution 3: Use tryCatch to handle the error
cols_to_select <- c("A", "D", "E")
subset_data <- tryCatch({
  data[, cols_to_select, drop = FALSE] #Keep as a data frame even if subset is empty
}, error = function(e) {
  warning(paste("Error subsetting data:", e))
  data.frame() # Return an empty data frame if error occurs
})
```