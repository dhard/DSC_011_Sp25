# Load the swirlify package
library(swirlify)

# Example usage within a swirl lesson definition

# Create a list of questions for a swirl lesson
questions <- list(
  text = "What is 2 + 2?",
  answer = "4",
  hint = "Try typing the mathematical expression directly.",
  correct = "That's right! 2 + 2 equals 4.",
  incorrect = "Not quite. Remember basic arithmetic.",
  type = "expression",
  expr = quote(2 + 2), # The expected expression
  val = 4,             # The expected value
  AnswerTests = "check_expression_and_value" # Use our custom AnswerTest
)

questions <- c(questions, list(
  text = "Assign the value 10 to a variable named 'x'.",
  answer = "x <- 10",
  hint = "Remember the assignment operator.",
  correct = "Great! You've assigned the value correctly.",
  incorrect = "Double-check your assignment syntax.",
  type = "expression",
  expr = quote(x <- 10), # The expected expression
  val = 10,            # The expected value
  AnswerTests = "check_expression_and_value" # Use our custom AnswerTest
))

questions <- c(questions, list(
  text = "Calculate the square root of 9 directly (without assigning to a variable).",
  answer = "sqrt(9)",
  hint = "Use the appropriate R function.",
  correct = "Exactly! The square root of 9 is 3.",
  incorrect = "Think about the function for square roots in R.",
  type = "expression",
  expr = quote(sqrt(9)), # The expected expression
  val = 3,             # The expected value
  AnswerTests = "check_expression_and_value" # Use our custom AnswerTest
))

# Create a lesson YAML file (e.g., my_lesson.yaml) with the questions defined above.
# You would typically write this to a file, but for demonstration:
cat(yaml::as.yaml(list(
  name = "Expression and Value Check",
  author = "Your Name",
  type = "Custom Tests",
  questions = questions
)), file = "my_lesson.yaml")

# Now you can use swirlify to turn this YAML into a swirl course:
# swirlify::process_questions("my_lesson.yaml")

# How it works when a user interacts with this lesson in swirl:

# 1. The user is presented with the question (e.g., "What is 2 + 2?").
# 2. The user types an R expression (e.g., "2 + 2", "4", "1 + 3", etc.) and presses Enter.
# 3. swirl calls the AnswerTest function specified in the question ("check_expression_and_value").
# 4. Inside `check_expression_and_value`:
#    - `swirl::get_expr()` retrieves the exact expression the user typed.
#    - `identical(user_expr, expr)` compares the user's expression with the `expr` defined in the question (e.g., `quote(2 + 2)`). This checks if the *syntax* is the same.
#    - `eval(user_expr, e)` evaluates the user's expression in the appropriate environment (`e`).
#    - `identical(eval(user_expr, e), val)` compares the *result* of the user's expression with the `val` defined in the question (e.g., `4`).
# 5. The `check_expression_and_value` function returns `TRUE` only if *both* the expression and its evaluated value match the expected `expr` and `val`.
# 6. Based on the return value, swirl provides the `correct` or `incorrect` feedback.

# Benefits of this custom AnswerTest:

# - Enforces specific ways of arriving at an answer: You can require users to use a particular function or syntax.
# - Prevents correct but unintended solutions: For example, in the "2 + 2" question, a user typing "4" would be marked incorrect because the expression doesn't match `2 + 2`.
# - Useful for teaching specific R concepts: You can guide users to use particular functions or operators.

# Important Considerations:

# - Flexibility: This test is very strict. Consider if you always want to enforce the exact expression. Sometimes, you might only care about the value.
# - User Experience: Provide clear hints to guide users towards the expected expression. Overly strict tests without good hints can be frustrating.
# - Edge Cases: Think about potential variations in user input and whether your test handles them appropriately.

# To use this in a real swirl course:

# 1. Save the `check_expression_and_value` function in an R script (e.g., `custom_tests.R`) within your swirl course directory.
# 2. In your lesson YAML file, refer to the function by its name as a string in the `AnswerTests` field. swirl will automatically look for it in the current environment or in the R scripts within the course directory.
# 3. Use `swirlify::process_questions("your_lesson.yaml")` to build the swirl course.