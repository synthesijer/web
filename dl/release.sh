#!/bin/bash

# clean up
rm -rf synthesijer_sample_* synthesijer_lib_* synthesijer_extra-libs_* synthesijer.scala*
rm -rf synthesijer
rm -f synthesijer*.jar
rm -f *.sha

SYNTHESIJER=../synthesijer/bin/

# synthesijer
git clone git@github.com:synthesijer/synthesijer
(cd synthesijer; ant clean jar)
# synthesijer.scala
git clone git@github.com:synthesijer/synthesijer.scala
(cd synthesijer.scala; sbt compile)
# synthesijer_yyyymmdd.jar
(cd synthesijer/bin;
 cp -r ../../synthesijer.scala/target/scala-2.11/classes/synthesijer/scala synthesijer;
 jar cfm ../../synthesijer_$1.jar ../etc/manifest.mf *)

# extra-libs
git clone git@github.com:synthesijer/extra-libs
mv extra-libs synthesijer_extra-libs_$1
(cd synthesijer_extra-libs_$1; ant -f build.xml; make -f Makefile.cygwin)
zip -r synthesijer_extra-libs_20151102.zip synthesijer_extra-libs_20151102/*

# samples
cp -r synthesijer/sample synthesijer_sample_$1
zip -r synthesijer_sample_$1.zip synthesijer_sample_$1

# libs
cp -r synthesijer/lib synthesijer_lib_$1
zip -r synthesijer_lib_$1.zip synthesijer_lib_$1

# sha
for i in synthesijer_$1.jar *.zip
do
	sha512sum $i > $i.sha
done
