#! /usr/bin/env bash
set -e;
BLOG_PRESO_DIR=~/policystat/workspace/devblog/source/slides;
PRESO_NAME=pragmatic-django-performance

# Generate the static version
showoff static;

# Copy the static version to the blog repository
cd static;
mkdir -p $BLOG_PRESO_DIR/$PRESO_NAME;
cp -r * $BLOG_PRESO_DIR/$PRESO_NAME/;
# Delete the static directory
cd ..;
rm -r static;

# Get the PDF version and put it in the blog respository
curl http://localhost:9090/pdf -o $BLOG_PRESO_DIR/$PRESO_NAME/$PRESO_NAME.pdf;

# Commit the update presentation to the blog respository
cd $BLOG_PRESO_DIR;
git add .;
git commit -m "Pulled in latest vesion of $PRESO_NAME slides";
git push;
