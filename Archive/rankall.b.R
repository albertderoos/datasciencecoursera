rankall <- function(outcome, num = "best") {
     
     ## Read outcome data
     df.outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
       ## Check that state and outcome are valid
     
     allstates <- unique(df.outcome$State)
     alloutcomes <- c("heart attack", "heart failure", "pneumonia")

          if (!is.element(outcome, alloutcomes)){
               stop("invalid outcome")
          }

     
     ## For each state, find the hospital of the given rank
     ## Return a data frame with the hospital names and the
     ## (abbreviated) state name
     
     ##split the data frame by State

     ##order each state by mortility and return the hospital per state for the indicated rank 
     
          if (outcome == "heart attack") {
              
               #subset into list without the "Not Available"
               df.subset <- df.outcome[!(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" )]
               
               #rank the subsetted list first on mortality rate then on alphabet
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"), df.subset$"Hospital.Name"), ]
               
               #split by state
               df.split <- split(df.ranked, df.ranked$"State")
               
               #apply function to get the desired "num" ranking back
               result <- sapply(df.split, function (x){
                    x[num, df.split$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]
               })

              result
               
                if (num == "best"){
                         num <- 1
                         }
                    else if (num == "worst"){
                        num <- nrow(df.ranked)
                         }
            
          }
          
#           else if (outcome == "pneumonia") {
#                df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" )]
#                df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", df.subset$"State"), ]
#                #print("Pneumonia  30 day Mortality Rate Rank")
#                     if (num == "best"){
#                          num <- 1
#                     }
#                     else if (num == "worst"){
#                          num <- nrow(df.ranked)
#                     }
#                #df.ranked[num,"Hospital.Name"]
#           }
# 
#           else if (outcome == "heart failure") {
#                df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
#                df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", df.subset$"Hospital.Name"), ]
#                #print("Heart Failure 30 day Mortality Rate rank")
#                     if (num == "best"){
#                          num <- 1
#                     }
#                     else if (num == "worst"){
#                          num <- nrow(df.ranked)
#                     }
#                
#                #df.ranked[num,"Hospital.Name"]
#            }
     
}

rankall("heart attack", 4)


