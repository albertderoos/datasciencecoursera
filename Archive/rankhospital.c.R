rankhospital <- function(state, outcome, num = "best") {
     
     ## Read outcome data
     df.outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     ## Check that state and outcome are valid
     
     allstates <- unique(df.outcome$State)
     alloutcomes <- c("heart attack", "heart failure", "pneumonia")
     str(allstates)
          
          if (!is.element(outcome, alloutcomes)){
               stop("invalid outcome")
          }
          
          if (!is.element(state, allstates)){
               stop("invalid state") 
          }
     
     ## Return hospital name in that state with the given rank 30-day death rate
     #ranking <- outcome[outcome$Hospital.Name]
     #head(df.outcome, 5)
     
     df.subset <- df.outcome[df.outcome$State = state, c("Hospital Name", "State")]
     
     cat("here")

}
rankhospital("AL", "heart attack")
