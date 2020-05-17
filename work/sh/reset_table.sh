#!/bin/sh
psql VideoManegementServer_development -c "truncate table vs001s restart identity cascade;"
