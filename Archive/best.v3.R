best <- function(state, outcome, num = "best") {
     
     ## Read outcome data
     df.outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     ## Check that state and outcome are valid
     
     allstates <- unique(df.outcome$State)
     alloutcomes <- c("heart attack", "heart failure", "pneumonia")

          if (!is.element(outcome, alloutcomes)){
               stop("invalid outcome")
          }
          
          if (!is.element(state, allstates)){
               stop("invalid state") 
          }
     
     ## Return best hospital name in that state with the given rank 30-day death rate

          if (outcome == "heart attack") {
               df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
               df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", df.subset$"Hospital.Name"), ]
               print("Heart Attack Best 30 day Mortality Rate")
               df.ranked[1:3, ]
          }
          
          else if (outcome == "pneumonia") {
               df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"), df.subset$"Hospital.Name"), ]
               print("Pneumonia Best 30 day Mortality Rate")
               df.ranked[1:3, ]
          }

          else if (outcome == "heart failure") {
               df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
               df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", df.subset$"Hospital.Name"), ]
               print("Heart Failure Best 30 day Mortality Rate")
               df.ranked[1:3, ]
     }
     
}

best("NY", "heart failure")
best("NY", "heart attack")
best("NY", "pneumonia")
