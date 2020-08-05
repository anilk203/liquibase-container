#!/usr/bin/env bash

echo "Perform migration begin"
 
GIT_REPO_URL="${GIT_REPO_URL}"
GIT_REPO_NAME=$GIT_REPO_NAME
GIT_TAG=$GIT_TAG
DB_TYPE=$DB_TYPE
DB_HOST="${DB_HOST}"
DB_PORT=$DB_PORT
DB_DATABASE_NAME="${DB_DATABASE_NAME}"
DB_USERNAME=$DB_USERNAME
DB_PASSWORD="${DB_PASSWORD}" 

cd /opt/ 
git clone $GIT_REPO_URL $GIT_REPO_NAME
cd $GIT_REPO_NAME 

git checkout tags/$GIT_TAG

ls -altr

 
/liquibase/liquibase --classpath='/liquibase/lib' --changeLogFile='/opt/liquibase-database-scripts/liquibase-change-log-files/liquibase-starter-dbchangelog-master.xml' --url="jdbc:sqlserver://${DB_HOST}:${DB_PORT};database=${DB_DATABASE_NAME};"  --username=${DB_USERNAME} --password=${DB_PASSWORD} --driver=com.microsoft.sqlserver.jdbc.SQLServerDriver   --logLevel=Info update

echo "Perform migration end"
