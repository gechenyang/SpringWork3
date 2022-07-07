@echo off


set configServerPort=8080
set adminServerPort=8090
set portalPort=8070


set host=localhost:3306
set username=root
set password=123456


@echo 正在启动portal服务......
start cmd /c "title portal:%portalPort% && java -Xms256m -Xmx256m -Dapollo_profile=github,auth -Ddev_meta=http://localhost:%configServerPort%/ -Dspring.datasource.url=jdbc:mysql://%host%/ApolloPortalDB?serverTimezone=UTC -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dsever.port=%portalPort% -jar apollo-portal-1.8.0.jar"

spause