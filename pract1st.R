install.packages('sofa')
library('sofa')
x<-Cushion$new()
x$ping()
db_create(x,dbname="ty")
db_list(x)
doc1<-'{"rollno":"01","name":"vijay","GRADE":"A"}'
doc_create(x,doc1,dbname="ty",docid="a_1")
doc2<-'{"rollno":"02","name":"tanmay","GRADE":"A"}'
doc_create(x,doc2,dbname="ty",docid="a_2")
doc3<-'{"rollno":"03","name":"yash","GRADE":"A"}'
doc_create(x,doc3,dbname="ty",docid="a_3")
doc4<-'{"rollno":"04","name":"ani","GRADE":"B"}'
doc_create(x,doc4,dbname="ty",docid="a_4")
db_changes(x,"ty")
db_query(x,dbname="ty",selector=list('_id'=list('$gt'=NULL)))$docs
db_query(x,dbname="ty",selector=list(GRADE="A"))$docs
db_query(x,dbname="ty",selector=list(REMARK="PASS"))$docs
db_query(x,dbname = "ty",selector = list(rollno=list('$gt'='02')),fields=c("name","GRADE"))$docs
library("jsonlite")
res<-db_query(x,dbname="ty",selector=list('_id'=list('$gt'=NULL)),fields=c("name","rollno","GRADE"),as="json")
fromJSON(res)$docs
doc_delete(x,dbname = "ty",docid = "a_1")
doc_get(x,dbname="ty",docid="a_1")
doc2<-'{"name":"Sdrink","beer":"TEST","note":"yummy","note2":"yay"}'
doc_update(x,dbname = "ty",doc=doc2,docid="a_2",rev =  "1-748640fdad548843d9d5740e34782296")