# Code placed in this file fill be executed every time the
  # lesson is started. Any variables created here will show up in
  # the user's working directory and thus be accessible to them
  # throughout the lesson.
lesson_dir <- file.path(path.package("swirl"), "Courses", "DSC_011_Sp25")
			
### 1) Make path to data and let user call read.csv(data_path)
baby_clean_data_path   <- file.path(lesson_dir, "data", "baby_clean.csv")
baby_letters_data_path <- file.path(lesson_dir, "data", "baby_letters.txt")
