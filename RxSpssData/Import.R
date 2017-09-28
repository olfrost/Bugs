# options(scipen = 12)
# rxOptions(numDigits = 12)

# Neither of these configurations had an effect.

library(RevoScaleR)

#### Create the data object. ----
df <- RxSpssData(
  "RoundingTest.sav", # Change this to your local path.
  stringsAsFactors = FALSE, 
  labelsAsInfo = TRUE, 
  labelsAsLevels = TRUE,
  mapMissingCodes = "none" # Tried this with "all" and "first" also.
)

#### Import it. ----
test <- rxImport(df) # Same error is present when rxDataStep is used.

#### When you extract the attributes, you will notice the rounding error. ----
attr(test[1], ".rxValueInfoCodes") # NULL
attr(test[2], ".rxValueInfoCodes") # "0" "0" "0" "0" "1"
attr(test[3], ".rxValueInfoCodes") # NULL

# rxGetVarInfo("C:/OF/df.xdf")
# The error persists when you create an XDF and call rxGetVarInfo.
