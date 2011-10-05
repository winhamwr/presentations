#! /usr/bin/env bash
BLOG_PRESO_DIR=/home/wes/code/weswinham_com/source/preso;
PRESO_NAME=indylsc-build-measure-learn;

# Generate the static version
showoff static;

# Copy the static version to the blog repository
cd static;
cp -r * $BLOG_PRESO_DIR/$PRESO_NAME/;

# Get the PDF version and put it in the blog respository
curl http://localhost:9090/pdf -o $BLOG_PRESO_DIR/$PRESO_NAME/$PRESO_NAME.pdf;

# Commit the update presentation to the blog respository
cd $BLOG_PRESO_DIR;
git add .;
git commit -m "Pulled in latest vesion of preso $PRESO_NAME";
git push;
