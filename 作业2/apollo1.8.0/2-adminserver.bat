@echo off


set configServerPort=8080
set adminServerPort=8090
set portalPort=8070


set host=localhost:3306
set username=root
set password=123456

@echo 正在启动adminservice服务.....
start cmd /c "title adminserver:%adminServerPort% && java -Xms256m -Xmx256m -Dspring.datasource.url=jdbc:mysql://%host%/ApolloConfigDB?serverTimezone=UTC -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dsever.port=%adminServerPort% -jar apollo-adminservice-1.8.0.jar"

spause