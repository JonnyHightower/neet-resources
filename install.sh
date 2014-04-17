#!/bin/bash

export NEET=/opt/neet
export CONFIDR="${NEET}/etc"
export VERSION=`cat VERSION`
export INST="${PWD}"

if [ ! -d "$NEET" ]; then
	echo "Couldn't find neet installation. Exiting."
	exit 1
fi

. ${NEET}/core/installsupport

if [ ! -z $INVOKEDBYNEETUPDATE ] && [ $INVOKEDBYNEETUPDATE -eq 1 ]; then
	FILESTOREMOVE=""
	for file in $FILESTOREMOVE; do
		rm -f "$file"
	done
	echo -n "   + Installing neet resource updates..."
	#######################################################


	[ ! -d "${NEET}/resources" ] && mkdir -p "${NEET}/resources"
	cp content/* "${NEET}/resources/"
	chown -R root.root "${NEET}/resources/"
	chmod -R go-w "${NEET}/resources/"


	#######################################################
	newVersion neet-resources $VERSION
	echo "done"
else
	echo "This package is for the neet-update script and should not be installed manually."
	exit 1
fi

exit 0



