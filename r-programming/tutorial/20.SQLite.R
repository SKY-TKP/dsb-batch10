# load library
library(RSQLite)

# connect to SQLite database (.db file)
# 1. open connection
conn <- dbConnect(SQLite(),"chinook.db")


# 2. get data
dbListTables(conn) # return name of each table
dbListFields(conn, "customers")

df1 <- dbGetQuery(conn, "select * from customers 
                 where country = 'USA'")
df2 <- dbGetQuery(conn, "select * from customers 
                 where country = 'United Kingdom'")

# 3. close connection
dbDisconnect(conn)
