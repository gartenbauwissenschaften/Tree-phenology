# Get a list of all Rmd files in the directory
rmd_files <- list.files(pattern = "\\.Rmd$", full.names = TRUE)

# Initialize a vector to store all package names
all_package_names <- c()

# Loop over each file
for (file in rmd_files) {
  # Read the file lines
  lines <- readLines(file)
  
  # Find lines containing library(...)
  library_lines <- grep("\\b(library|require)\\s*\\(", lines, value = TRUE)
  
  # Extract package names from the library() calls
  package_names <- gsub(".*(library|require)\\s*\\(([^)]+)\\).*", "\\2", library_lines)
  
  # Remove any extra whitespace and quotes
  package_names <- trimws(package_names)
  package_names <- gsub("['\"]", "", package_names)
  
  # Split lines that load multiple libraries in one call
  package_names <- unlist(strsplit(package_names, split = ",\\s*"))
  
  # Add to the overall list
  all_package_names <- c(all_package_names, package_names)
}

# Get unique package names
unique_packages <- unique(all_package_names)

# Display unique package names
print(unique_packages)

# unique_packages[14] <- "EduardoFernandezC/dormancyR"
# renv::snapshot()
# - bookdown
# - chillR
# - colorRamps
# - cowplot
# - devtools
# - dormancyR
# - downloadthis
# - dplyr
# - fields
# - gganimate
# - ggplot2
# - ggpmisc
# - ggrepel
# - kableExtra
# - Kendall
# - knitr
# - leaflet
# - lubridate
# - metR
# - pander
# - patchwork
# - reshape2
# - rmarkdown
# - scales
# - tidyr
# - tidyverse
# - tufte