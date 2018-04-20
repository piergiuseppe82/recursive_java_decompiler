#!/bin/bash

function javaDecompileClass {
  		for pattern in *.class; do
    		if [[ $entry == $pattern ]]; then
    			echo "Decompile $entry"
    			java -jar /home/piergiuseppe/devel/java/decompilers/cfr/cfr_0_125.jar $entry > $entry.java
    			echo "End Decompile $entry"
    		fi
		done
}


function javaDecompileOnFoleder {
	for entry in $1/*
	do
  		if [[ -d $entry ]]; then
		    javaDecompileOnFoleder $entry
		elif [[ -f $entry ]]; then
		    javaDecompileClass $entry
		else
		    echo "$entry is not valid"
		    exit 1
		fi
	done
}

javaDecompileOnFoleder $1;
