#!/usr/bin/env Rscript
# =============================================================================
# Example R Script: Student Grade Analysis
# =============================================================================
#
# This script demonstrates basic data analysis in a plain .R file.
# Compare this with example_rmarkdown.Rmd to see the difference!
#
# How to run:
#   - Line by line: Cmd+Enter (Mac) / Ctrl+Enter (Windows)
#   - Entire file: Cmd+Shift+S (Mac) / Ctrl+Shift+S (Windows), or click "Source"
# =============================================================================

# -----------------------------------------------------------------------------
# 1. SETUP - Load packages and data
# -----------------------------------------------------------------------------

# In a .R file, we just write code directly
# Comments like this explain what we're doing

# Create sample data (normally you'd load from a file)
students <- data.frame(
  name = c("Alice", "Bob", "Carol", "David", "Eve"),
  math = c(92, 78, 85, 91, 88),
  english = c(88, 82, 90, 76, 94),
  science = c(95, 75, 82, 88, 91)
)

# Print the data
print("=== Student Data ===")
print(students)

# -----------------------------------------------------------------------------
# 2. CALCULATE AVERAGES
# -----------------------------------------------------------------------------

# Calculate each student's average across subjects
students$average <- rowMeans(students[, c("math", "english", "science")])

# Round to 1 decimal place
students$average <- round(students$average, 1)

print("=== With Averages ===")
print(students)

# -----------------------------------------------------------------------------
# 3. ASSIGN LETTER GRADES
# -----------------------------------------------------------------------------

# Function to convert score to letter grade
assign_grade <- function(score) {
  if (score >= 90) return("A")
  if (score >= 80) return("B")
  if (score >= 70) return("C")
  if (score >= 60) return("D")
  return("F")
}

# Apply to each student
students$grade <- sapply(students$average, assign_grade)

print("=== With Grades ===")
print(students)

# -----------------------------------------------------------------------------
# 4. SUMMARY STATISTICS
# -----------------------------------------------------------------------------

print("=== Summary Statistics ===")

# Class average
class_avg <- mean(students$average)
print(paste("Class average:", round(class_avg, 1)))

# Highest and lowest
top_student <- students$name[which.max(students$average)]
print(paste("Top student:", top_student))

bottom_student <- students$name[which.min(students$average)]
print(paste("Needs improvement:", bottom_student))

# Grade distribution
print("Grade distribution:")
print(table(students$grade))

# -----------------------------------------------------------------------------
# 5. SIMPLE VISUALIZATION
# -----------------------------------------------------------------------------

# Bar plot of averages
barplot(
  students$average,
  names.arg = students$name,
  main = "Student Averages",
  ylab = "Average Score",
  col = "steelblue",
  ylim = c(0, 100)
)

# Add a line for class average
abline(h = class_avg, col = "red", lty = 2, lwd = 2)

# -----------------------------------------------------------------------------
# NOTES ON .R FILES
# -----------------------------------------------------------------------------
#
# Pros:
#   - Simple, just code
#   - Easy to source/run programmatically
#   - Good for reusable functions and scripts
#   - Familiar if coming from other programming languages
#
# Cons:
#   - Comments are plain text only (no formatting)
#   - Output goes to console (not saved automatically)
#   - Can't create formatted reports directly
#   - Hard to share analysis with non-R users
#
# When to use .R:
#   - Utility functions you'll reuse
#   - Automated scripts (scheduled jobs)
#   - Quick exploratory work
#   - When you don't need a formatted report
# -----------------------------------------------------------------------------
