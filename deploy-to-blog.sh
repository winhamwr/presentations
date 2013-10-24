#! /usr/bin/env bash

# Deploy the static/html version of a presentation
# to my github-pages-based blog.
set -e;

usage() {
    echo "Usage: $0 <presentation-name> [<path-to-blog-repo>]"
    exit 1
}

test -z "$1" && usage

# The showoff server must be running and properly configured for PDF-building
# for this script to work. If the PDF-generation isn't given a 200, remind
# myself about that.
PDF_URL="http://localhost:9090/pdf"
set +e;
curl --fail --silent --output /dev/null $PDF_URL
CURL_RETURN=$?
set -e;
if [ $CURL_RETURN -ne 0 ]; then
	echo "ERROR: Failed to grab the PDF"
	echo "ERROR: Ensure showoff is running and configured for PDF generation"
	echo "ERROR: curl for URL: $PDF_URL gave return code $CURL_RETURN"
	exit 1
fi

trap 'echo "ERROR: Command exited unexpectedly. It R broked"' EXIT

BASE_PRESO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PRESO_NAME=$1
PRESO_DIR="$BASE_PRESO_DIR/$PRESO_NAME"
PRESO_STATIC_DIR="$PRESO_DIR/static"
BASE_BLOG_DIR=${2:-~/policystat/workspace/winhamwr.github.com}
BASE_BLOG_PRESO_DIR="$BASE_BLOG_DIR/source/preso"
BLOG_PRESO_DIR="$BASE_BLOG_PRESO_DIR/$PRESO_NAME"

BLOG_REPO="git@github.com:winhamwr/winhamwr.github.com.git"

# Ensure the blog is properly checked out
if [ ! -d "$BASE_BLOG_DIR" ]; then
	echo "Cloning the blog repo from $BLOG_REPO"
	cd $BASE_BLOG_DIR && cd .. && git clone $BLOG_REPO;
fi
# Ensure we're on the source branch, there (not the deployable master branch)
echo "INFO: Checking out the blog's 'source' branch"
cd $BASE_BLOG_DIR && git checkout source > /dev/null 2>&1;

# Generate the static version
echo "INFO: Using showoff to generate the static presentation"
cd $PRESO_DIR && showoff static > /dev/null 2>&1;

# Copy the static version to the blog repository
echo "INFO: Moving the static version to the blog repo"
rm -rf $BLOG_PRESO_DIR
cp -R $PRESO_STATIC_DIR $BLOG_PRESO_DIR

# Get the PDF version and put it in the blog respository
echo "INFO: Getting the PDF version of the presentation"
set +e;
curl http://localhost:9090/pdf --silent -o $BLOG_PRESO_DIR/$PRESO_NAME.pdf;
set -e;
if [ $? -ne 0 ]; then
	echo "ERROR: Failed to retrieve and write the PDF"
	exit 1
fi

trap - EXIT

# Remind myself to commit the post to the blog repo
echo "INFO: Now go commit the presentation in the blog repo"
echo "INFO: Easy copy/paste:"
echo ""
echo ""
echo "cd $BASE_BLOG_DIR;"
echo "git add $BLOG_PRESO_DIR;"
echo "git commit -m 'Pulled in latest vesion of $PRESO_NAME slides';"
echo "git push;"
echo ""
echo ""
echo "INFO: Then, don't forget to deploy the blog to github pages"
