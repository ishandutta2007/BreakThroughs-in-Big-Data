require(ggplot2)
require(grid)
years <- c(2003,2004,2005,2006,2007,2007,2008,2008,2008,2009,2009,2010,2011,2011,2011,2012,2013,2013)
systems <- c("Memcached","MapReduce","CouchDB","BigTable/Hbase","MongoDB","Dynamo","Pig","HIVE","Cassandra","Voldemort","Riak","Dremel","Megastore","Tenzing","Spark/Shark","Spanner","Impala","Presto")

labels <- c("nosql",
            "batch",
            rep("nosql",4),            
            rep("sql-like",2),
            rep("nosql",3),
            "sql-like",
            "nosql",
            rep("sql-like",5)
            )
v <- c()


for(i in table(years))v<-c(v,1:i)

all <-
c(c("PCA",1986),
c("Boosting",1988),
c("SVM",1995),
c("Bagging",1996),
c("Random Forest",1998))
even <- c(2,4,6,8,10)

yearsML <- all[even]
algos <- all[-even]
years <- c(years,yearsML)
systems <- c(systems,algos)
labels <- c(labels, rep("ML",5))
v <- c(v, rep(0.5,5))

yearsML <- c(1993,2012,2007,2007)
languages <- c("R","Julia","Revolution R", "scikit-learn")
years <- c(years,yearsML)
systems <- c(systems,languages)
labels <- c(labels, rep("Languages",4))
v <- c(v, c(0.25,0.25,0.65,0.45))
data =data.frame( V1=years, V2=systems, disloc=v )
dev.new()
Palette1 <- c('red','green','blue','violet','black')

plot <- ggplot() +
  geom_segment(aes(x = V1,y = disloc,xend = V1),data=data,yend = 0) +
  geom_segment(aes(x = min(years),y = 0,xend = max(years),yend = 0),data=data,arrow = arrow(length = unit(x = 0.2,units = 'cm'),type = 'closed')) +
  geom_text(aes(x = V1,y = disloc,label = V2,colour=factor(labels)),data=data,hjust = 1.0,vjust = 1.0,parse = FALSE,angle = 40.0) +
  geom_point(aes(x = V1,y = disloc),data=data) +
  scale_colour_manual(values=Palette1 ) +
  #scale_x_continuous(breaks = years,labels = years) +
  opts(title="Breakthroughs in Machine Learning, Analytics and BigData", axis.text.x = theme_text(size = 12.0,angle = 90.0), axis.text.y = theme_blank(), axis.ticks = theme_blank(), axis.title.x = theme_blank(), axis.title.y = theme_blank())
plot
ggsave(filename="C:\\Users\\DELL\\Documents\\GitHub\\BreakThroughs in Big Data\\BreakThroughsML.jpg", plot=plot)
