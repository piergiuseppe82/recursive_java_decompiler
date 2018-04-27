#!/bin/bash

function javaDecompileClass {
  		for pattern in *.class; do
    		if [[ $entry == $pattern ]]; then
    			echo "Decompile $entry"
    			java -jar /home/piergiuseppe/devel/java/decompilers/cfr/cfr_0_125.jar $entry > $entry.java
    			rm  $entry
    			echo "End Decompile $entry"
    		fi
		done
}


function recursiveJavaDecompile {
	for entry in $1/*
	do
  		if [[ -d $entry ]]; then
		    recursiveJavaDecompile $entry
		elif [[ -f $entry ]]; then
		    javaDecompileClass $entry
		else
		    echo "$entry is not valid"
		    exit 1
		fi
	done
}

recursiveJavaDecompile $1;


find $1 -name "*.class.java" -exec rename -v 's/\.class.java$/\.java/i' {} \;