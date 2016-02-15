rankhospital <- function(state, outcome, num = "best") {
     
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
     
     ## Return hospital name in that state with the given rank 30-day death rate

          if (outcome == "heart attack") {
               df.subset <- df.outcome[df.outcome$State == state & !(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" )]
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"), df.subset$"Hospital.Name"), ]
               #print("Heart Attack  30 day Mortality Rate Rank")
                    if (num == "best"){
                         num <- 1
                         }
                    else if (num == "worst"){
                        num <- nrow(df.ranked)
                         }
               
               df.ranked[num,"Hospital.Name"]
          }
          
          else if (outcome == "pneumonia") {
               df.subset <- df.outcome[df.outcome$State == state & !(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" )]
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"), df.subset$"State"), ]
               #print("Pneumonia  30 day Mortality Rate Rank")
                    if (num == "best"){
                         num <- 1
                    }
                    else if (num == "worst"){
                         num <- nrow(df.ranked)
                    }
               
               df.ranked[1:20,"Hospital.Name"]
          }

          else if (outcome == "heart failure") {
               df.subset <- df.outcome[df.outcome$State == state & !(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"), df.subset$"Hospital.Name"), ]
               #print("Heart Failure 30 day Mortality Rate rank")
                    if (num == "best"){
                         num <- 1
                    }
                    else if (num == "worst"){
                         num <- (nrow(df.ranked))
                    }
               
               df.ranked[num,c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
     }
     
}

rankhospital("TX", "pneumonia", 10)
