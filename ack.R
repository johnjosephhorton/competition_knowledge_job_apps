library(ggplot2)

df.raw <- na.omit(read.csv("application_count_knowledge.csv"))
df <- df.raw

with(df, prop.test(sum(knew_count), n = length(knew_count)))

# what fraction know? 
mean(df$knew_count)

method <- with(subset(df, knew_count > 0.5),
                                               c(
                                               rep("formal", sum(learned_formal)),
                                               rep("social", sum(learned_social)),
                                               rep("inferred", sum(learned_inferred))
                                               )
                 )

# What's the breakdown by method? 
table(method)/sum(table(method))
