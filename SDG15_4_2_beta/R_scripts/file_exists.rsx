##MGCI_beta=group
##CheckifFileExists=name
##country=string
##name=string
##folder=output folder
##output_table=output table

#install and load libraries
if(!require("data.table")) install.packages("data.table")
library(data.table)

#Set working directory to data folder
setwd(folder) #replace the dummy path with the path to your working folder
#setwd ("C:/MGCI_DML/outputs_temp")
#country = "COL"
#file_path <- paste(country, "_MNTBelts_EqArea.tif",sep = "", collapse = NULL)
file_path <- paste(country, name,sep = "", collapse = NULL)
print (file_path)
(file.exists(file_path))

if (file.exists(file_path)) {
  print("The file exists")
  exists <- "file exists"
}else {
  print("The file does not exist")
  exists <- "file does not exist"
}

df <- data.frame(ID = c(1), Exists = c(exists))
is.data.table(df)
#convert df to table 
output_table <- setDT(df)

#view table 
output_table
