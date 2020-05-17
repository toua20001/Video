#!/bin/sh
WORK_DIR=/mnt/e/work/Rails/VideoManegementServer
CSV_DIR=$WORK_DIR/work/csv
DB_NAME=VideoManegementServer_development

ls $CSV_DIR

sh $WORK_DIR/work/sh/reset_table.sh

psql $DB_NAME -a -c "\copy vs001s(favorite,created_at,updated_at) from '$CSV_DIR/vs001s.csv' with csv;"
psql $DB_NAME -a -c "\copy vs002s(vs001_id,title,description,path,created_at,updated_at) from '$CSV_DIR/vs002s.csv' with csv;"
psql $DB_NAME -a -c "\copy vs003s(vs001_id,tag,created_at,updated_at) from '$CSV_DIR/vs003s.csv' with csv;"


psql $DB_NAME -a -c "select * from vs001s;"
psql $DB_NAME -a -c "select * from vs002s;"
psql $DB_NAME -a -c "select * from vs003s;"
