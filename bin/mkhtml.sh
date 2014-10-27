#!/bin/bash

WIKITMP=/tmp/wiki_dump
WIKIROOT=/home/chenyang/Public/www/wiki

echo "WIKITMP=${WIKITMP}"
echo "WIKIROOT=${WIKIROOT}"

# clean
rm -rf $WIKITMP
mkdir -p $WIKITMP

echo "rebuild '$WIKITMP'"

# get from dev.masols.com
scp -P 2000 chenyang@dev.masols.com:/home/chenyang/wikidump/out/* $WIKITMP

for oldname in `ls $WIKITMP`
do
	echo "old name : " $oldname
	dirname=`echo $oldname | sed 's/%2F/\//g'`
	mkdir -p "${WIKIROOT}/${dirname}"
	cp "${WIKITMP}/${oldname}" "${WIKIROOT}/${dirname}/index.html"
done
