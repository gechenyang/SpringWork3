@echo off

set configServerPort=8080

set host=localhost:3306
set username=root
set password=123456

@echo 正在启动configservice服务.....
start cmd /c "title configserver:%configServerPort% && java -Xms256m -Xmx256m -Dspring.datasource.url=jdbc:mysql://%host%/ApolloConfigDB?serverTimezone=UTC -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dsever.port=%configServerPort% -jar apollo-configservice-1.8.0.jar"
