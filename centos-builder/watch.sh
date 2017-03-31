#!/bin/bash

inotifywait -m -r -q --format '%e %f' /rpms/  | while read OUTPUT

do
ACTION=`echo $OUTPUT | awk '{print $1}'`
FILE=`echo $OUTPUT | awk '{print $2}'`
  
  if [[ $FILE == *\.src\.rpm ]]; then
	  if [[ $ACTION == "CLOSE_WRITE,CLOSE" ]]; then
		  echo "Building $FILE"
		  yum-builddep -y /rpms/$FILE
		  rpmbuild --rebuild --define "_rpmdir /rpms/out/" /rpms/$FILE
		  echo "+++++++++++++++++++++++++++++++++++++++"
		  echo "Done building $FILE"
		  echo "+++++++++++++++++++++++++++++++++++++++"
	  fi
  fi
done
