#!/bin/bash

dest=`grep ".*id=" addon.xml | cut -f2 -d'"'`
version=`grep "^\s\+version" addon.xml | cut -f2 -d'"'`

if [ -d $dest ]; then
    rm -r $dest
fi

mkdir $dest
cp addon.xml $dest/
cp changelog.txt $dest/
cp icon.png $dest/
cp LICENSE.txt $dest/
cp README.md $dest/
cp -r lib $dest/

if [ -f $dest-$version.zip ]; then
    rm $dest-$version.zip
fi

zip -r $dest-$version.zip $dest
rm -r $dest
