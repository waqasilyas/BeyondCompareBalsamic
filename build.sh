#!/bin/sh

set -e

# Configuration

GITHUB_ORG=https://github.com/waqasilyas
REPO_NAME=json-converter-bmpr
VERSION=0.2

DOWNLOAD_URL=$GITHUB_ORG/$REPO_NAME/releases/download/v$VERSION/$REPO_NAME-$VERSION.zip

OUTPUT_DIR=output
PLUGIN_DIR=Bmpr

# Initialize directories
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf $OUTPUT_DIR
fi

mkdir -p $OUTPUT_DIR/$PLUGIN_DIR

# Download converter
echo Downloading $DOWNLOAD_URL
wget -T30 -Ooutput/$REPO_NAME.zip $DOWNLOAD_URL 

# Unpack converter and prepare output
cd $OUTPUT_DIR
7z x -tzip -o$PLUGIN_DIR $REPO_NAME.zip
mv $PLUGIN_DIR/$REPO_NAME-$VERSION $PLUGIN_DIR/$REPO_NAME

cp ../BCFileFormats.xml .
cp ../JSonConverterBmpr.bat $PLUGIN_DIR

7z a -tzip BCSettings.bcpkg Bmpr/ BCFileFormats.xml