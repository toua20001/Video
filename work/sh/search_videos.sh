#!/bin/sh
WORK_DIR=$HOME/Workspace/Ruby-on-Rails/VideoManegementServer
DB_NAME=VideoManegementServer_development

#psql $DB_NAME -a -c "select vs001s.id, favorite, title, description, path, tag from vs001s join vs002s on vs001s.id=vs002s.vs001_id join vs003s on vs001s.id=vs003s.vs001_id;"
psql $DB_NAME -a -c "select * from vs001s ;"
psql $DB_NAME -a -c "select * from vs002s ;"
psql $DB_NAME -a -c "select * from vs003s ;"
