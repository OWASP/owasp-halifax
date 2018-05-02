#!/usr/bin/env bash

cd _site/ && \
    mkdir owasp-halifax/ && \
    mv assets/ owasp-halifax/ && \
    mv pages/ owasp-halifax/ && \
    cp index.html owasp-halifax

cd owasp-halifax/pages/ && \
    find . -name "*.html" | while read i; do
        d=$(echo $i | sed 's/.\{5\}$//');
        mkdir $d;
        mv $i $d/index.html;
    done
