#!/usr/bin/env bash

cd _site/ && \
    mkdir owasp-halifax/ && \
    mv assets/ owasp-halifax/ && \
    mv pages/ owasp-halifax/ && \
    cp index.html owasp-halifax && \
    mv 2018/ owasp-halifax/
