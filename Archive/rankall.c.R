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
               
               if (num == "best"){
                    num <- 1
               }
               else if (num == "worst"){
                    num <- nrow(df.split)
               }
               
               #apply function to get the desired "num" ranking back
               result <- lapply(df.split, function (x){
                    x[num,c("Hospital.Name", "State")]
                    })

               print(result)
          }
          
     else if (outcome == "pneumonia") {
               
               #subset into list without the "Not Available"
               df.subset <- df.outcome[!(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" )]
               
               #rank the subsetted list first on mortality rate then on alphabet
               df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"), df.subset$"Hospital.Name"), ]
               
               #split by state
               df.split <- split(df.ranked, df.ranked$"State")
               
               if (num == "best"){
                    num <- 1
               }
               else if (num == "worst"){
                    num <- nrow(df.split[df.split$"State" == state, ])
               }
               
               #apply function to get the desired "num" ranking back
               result <- lapply(df.split, function (x){
                    x[num,c("Hospital.Name", "State")]
               })
               
               str(result)
     }
           else if (outcome == "heart failure") {
                
                #subset into list without the "Not Available"
                df.subset <- df.outcome[!(df.outcome$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" == "Not Available") , c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" )]
                
                #rank the subsetted list first on mortality rate then on alphabet
                df.ranked <- df.subset[order(as.numeric(df.subset$"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"), df.subset$"Hospital.Name"), ]
                
                #split by state
                df.split <- split(df.ranked, df.ranked$"State")
                
                if (num == "best"){
                     num <- 1
                }
                else if (num == "worst"){
                     num <- nrow(df.split)
                }
                
                #apply function to get the desired "num" ranking back
                result <- lapply(df.split, function (x){
                     x[num,c("Hospital.Name", "State")]
                })
                
                str(result)
           }
}

r <- rankall("pneumonia", "worst")

