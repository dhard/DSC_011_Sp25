# DSC 011 Sp25 tAPP16_Programming_Data_Science_Workflows_with_Base_R_Data-Types_PartI

# Put custom tests in this file.
      
# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# executing every command twice, which can slow things down.
      
# AUTO_DETECT_NEWVAR <- FALSE
      

hash_check <- function(correct_hash){
  e <- environment(sys.function(1))$e
  user_val <- eval(e$expr)
  hashed_val <- digest::digest(user_val)
  identical(hashed_val,correct_hash)
}

# this was cribbed partly and rewritten based on output generated on Google Gemini on April 6
#test_defined_function <- function(student_defined_f_name,anon_f, tests, score, max_score) {
  # student_defined_f_nam: student-defined function name for look-up from globalenv
  # anon_f: answer-key anonymous function definition
  # tests: list of tests. Each test is a list with elements "input" and "points"
  # score: the user's current score
  # max_score: the user's current maximum score  
  
  # test is wrapped within `try()` to trap errors in the student's implementation of 
  # student_defined_f, so it doesn't interrupt swirl.
#  try({
    # The `get` function retrieves the student's definition of f and
    # assigns it to the variable `f`.
#    sdf <- get(student_defined_f_name, globalenv())
    
    # Test `sdf` against anon_key_f() on inputvector testvec, increment score and maxscore
    #t1 <- identical(func(9), mean(9))
    #t2 <- identical(func(1:10), mean(1:10))
    #t3 <- identical(func(c(-5, -2, 4, 10)), mean(c(-5, -2, 4, 10)))
    
#    ok <- lapply(tests,function(test){score += test$points * identical(sdf(test$input), anon_f(test$input))})
    
    
    #ok <- all(t1, t2, t3)
    #}, silent = TRUE)
    
    # This value is returned at the result of the answer test.
    # exists('ok') && isTRUE(ok)
    
    # Return TRUE or FALSE
    #}