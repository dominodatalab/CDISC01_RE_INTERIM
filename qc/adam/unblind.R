# Load the haven package
library(haven)

# Set the path to the directory where the data resides
path <- "/mnt/data/ADAM"

# Get the list of all .sas7bdat files in the directory
files <- list.files(path, pattern = "\\.sas7bdat$", full.names = TRUE)

# Read each file and store them in a list
data_list <- lapply(files, read_sas)

# Specify the output directory
output_dir <- "/mnt/artifacts/results"

# Check if the output directory exists; if not, create it
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Save the data_list to an R data file
save(data_list, file = file.path(output_dir, "combined_data.RData"))

cat("Data saved to", file.path(output_dir, "combined_data.RData"))
