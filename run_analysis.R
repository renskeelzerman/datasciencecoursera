X_test <- read.table("X_test.txt")

features <- read.table("features.txt")
as.list(features[2])
unlist(features)
colnames(X_test) <- features

activities <- read.table("y_test.txt")
activities <- sapply(activities, sub, pattern="1", replacement="walking")
activities <- sapply(activities, sub, pattern="2", replacement="walking_upstairs")
activities <- sapply(activities, sub, pattern="3", replacement="walking_downstairs")
activities <- sapply(activities, sub, pattern="4", replacement="sitting")
activities <- sapply(activities, sub, pattern="5", replacement="standing")
activities <- sapply(activities, sub, pattern="6", replacement="laying")

X_test <- cbind(activities, X_test)

X_test <- select(X_test, "activities", matches("mean\\(\\)"), matches("std()"))

X_test <- mutate(X_test, category="test")

subject <- read.table("subject_test.txt")
X_test <- cbind(subject, X_test)
colnames(X_test)[1] <- "subject"


X_train <- read.table("X_train.txt")

colnames(X_train) <- features

activities <- read.table("y_train.txt")
activities <- sapply(activities, sub, pattern="1", replacement="walking")
activities <- sapply(activities, sub, pattern="2", replacement="walking_upstairs")
activities <- sapply(activities, sub, pattern="3", replacement="walking_downstairs")
activities <- sapply(activities, sub, pattern="4", replacement="sitting")
activities <- sapply(activities, sub, pattern="5", replacement="standing")
activities <- sapply(activities, sub, pattern="6", replacement="laying")

X_train <- cbind(activities, X_train)

X_train <- select(X_train, "activities", matches("mean\\(\\)"), matches("std()"))

X_train <- mutate(X_train, category="train")

subject <- read.table("subject_train.txt")
X_train <- cbind(subject, X_train)
colnames(X_train)[1] <- "subject"

complete_tidy_data <- rbind(X_test, X_train)

complete_tidy_data$activities <- as.factor(complete_tidy_data$activities)
tidy_data_averaged <- aggregate(complete_tidy_data[ ,3:68], list(complete_tidy_data$subject, complete_tidy_data$activities), mean)

colnames(tidy_data_averaged)[1] <- "subject"
colnames(tidy_data_averaged)[2] <- "activity"
#write.csv(tidy_data_averaged, "tidy.csv")
write.table(tidy_data_averaged, "tidy.txt", row.name=FALSE)


