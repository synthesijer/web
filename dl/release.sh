#!/bin/bash

# clean up
rm -rf synthesijer_sample_* synthesijer_lib_* synthesijer_extra-libs_* synthesijer.scala*
rm -rf synthesijer
rm -f synthesijer*.jar
rm -f *.sha


# synthesijer
git clone git@github.com:synthesijer/synthesijer
(cd synthesijer; ant clean jar)

# extra-libs
git clone git@github.com:synthesijer/extra-libs
mv extra-libs synthesijer_extra-libs_$1
(cd synthesijer_extra-libs_$1; SYNTHESIJER=../synthesijer/bin ant -f build.xml; SYNTHESIJER=../synthesijer/bin make -f Makefile)
zip -r synthesijer_extra-libs_$1.zip synthesijer_extra-libs_$1/*

# synthesijer.scala
git clone git@github.com:synthesijer/synthesijer.scala
(cd synthesijer.scala; SYNTHESIJER=../synthesijer/bin SYNTHESIJER_EXTRA_LIB=../synthesijer_extra-libs_$1/bin sbt compile)

# synthesijer_yyyymmdd.jar
(cd synthesijer/bin;
 cp -r ../../synthesijer.scala/target/scala-2.11/classes/synthesijer/scala synthesijer;
 jar cfm ../../synthesijer_$1.jar ../etc/manifest.mf *)

# samples
cp -r synthesijer/sample synthesijer_sample_$1
zip -r synthesijer_sample_$1.zip synthesijer_sample_$1

# libs
cp -r synthesijer/lib synthesijer_lib_$1
zip -r synthesijer_lib_$1.zip synthesijer_lib_$1

# sha
if [ -x /usr/bin/sha512sum ]
then
 SHA=sha512sum
else
 SHA="shasum -a 512"
fi

for i in synthesijer_$1.jar *.zip
do
	$SHA $i > $i.sha
done

rm -rf synthesijer_sample_$1 synthesijer_lib_$1 synthesijer_extra-libs_$1 synthesijer.scala
rm -rf synthesijer
