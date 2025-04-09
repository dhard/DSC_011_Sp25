# DSC 011 Sp25 tAPP16_Programming_Data_Science_Workflows_with_Base_R_Data-Types_PartI

# Code placed in this file fill be executed every time the
  # lesson is started. Any variables created here will show up in
  # the user's working directory and thus be accessible to them
  # throughout the lesson.
lesson_dir <- file.path(path.package("swirl"), "Courses", "DSC_011_Sp25")
			
### 1) Make path to data and let user call read.csv(data_path)
baby_clean_data_path   <- file.path(lesson_dir, "data", "baby_clean.csv")
baby_letters_data_path <- file.path(lesson_dir, "data", "baby_letters.txt")

baby_clean <- read.csv(baby_clean_data_path,header=F)
names(baby_clean) <- c("decade","rank",paste(rep(c("boy","girl"),each=2),c("name","freq"),sep="_"))

baby_clean_f <- read.csv(baby_clean_data_path,header=F,stringsAsFactors=T)
names(baby_clean_f) <- c("decade","rank",paste(rep(c("boy","girl"),each=2),c("name","freq"),sep="_"))

baby_letters <- read.table(baby_letters_data_path,header=T)

date()
Sys.info()

dsc011_score <- 0
dsc011_max_score <- 0
