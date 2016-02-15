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
     df.split <- split(df.outcome, df.outcome$"State")
     print(head(df.split, 10))
     
     ##order each state by mortility and return the hospital per state for the indicated rank 
     
          if (outcome == "heart attack") {
               
               sapply(df.split, function(num) {
                    df.result <- df.split[order(df.split$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", df.subset$"Hospital.Name"), ]
                    df.result[num, ]
                    
               })
               
               
#                sapply(s, function(x) {
#                     + colMeans(x[, c("Ozone", "Solar.R", "Wind")],
#                                + na.rm = TRUE)
               #print("Heart Attack  30 day Mortality Rate Rank")
                    if (num == "best"){
                         num <- 1
                         }
                    else if (num == "worst"){
                        num <- nrow(df.ranked)
                         }
               
               #print(nrow(df.ranked))
               #df.ranked[num,"Hospital.Name"]
               

               
          }
          
          else if (outcome == "pneumonia") {
               df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" )]
               df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia", df.subset$"State"), ]
               #print("Pneumonia  30 day Mortality Rate Rank")
                    if (num == "best"){
                         num <- 1
                    }
                    else if (num == "worst"){
                         num <- nrow(df.ranked)
                    }
               #df.ranked[num,"Hospital.Name"]
          }

          else if (outcome == "heart failure") {
               df.subset <- df.outcome[df.outcome$State == state, c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
               df.ranked <- df.subset[order(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", df.subset$"Hospital.Name"), ]
               #print("Heart Failure 30 day Mortality Rate rank")
                    if (num == "best"){
                         num <- 1
                    }
                    else if (num == "worst"){
                         num <- nrow(df.ranked)
                    }
               
               #df.ranked[num,"Hospital.Name"]
           }
     
}

rankall("heart attack", 4)


