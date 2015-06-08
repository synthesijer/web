#!bin/sh

#set +m

VERSION=20150608
BASE_URL=https://synthesijer.github.io/web/dl/

download() {
  curl -L $1/$2 -o $2
}

mkdir -p $HOME/synthesijer
cd $HOME/synthesijer
echo "Downlaod related files"
download $BASE_URL synthesijer_$VERSION.jar
download $BASE_URL synthesijer_lib_$VERSION.zip
download $BASE_URL synthesijer_extra-libs_$VERSION.zip
download $BASE_URL synthesijer_sample_$VERSION.zip
echo "Extract libraries and samples"
unzip -o synthesijer_lib_$VERSION.zip > /dev/null
unzip -o synthesijer_extra-libs_$VERSION.zip > /dev/null
unzip -o synthesijer_sample_$VERSION.zip > /dev/null

echo "Before using Synthesijer, please do"
echo "source $HOME/synthesijer/synthesijer_env.sh"
echo " or"
echo "source $HOME/synthesijer/synthesijer_env.csh"

touch synthesijer-env_$VERSION.sh
echo "export SYNTHESIJER=$HOME/synthesijer/synthesijer_$VERSION.jar" > synthesijer-env_$VERSION.sh
echo "export SYNTHESIJER_LIB=$HOME/synthesijer/synthesijer_lib_$VERSION" >> synthesijer-env_$VERSION.sh
echo "export SYNTHESIJER_EXTRA_LIBS=$HOME/synthesijer/synthesijer_extra-libs_$VERSION" >> synthesijer-env_$VERSION.sh
ln -sf synthesijer-env_$VERSION.sh synthesijer-env.sh

touch synthesijer-env_$VERSION.csh
echo "setenv SYNTHESIJER $HOME/synthesijer/synthesijer_$JAR_VERSION.jar" > synthesijer-env_$VERSION.csh
echo "setenv SYNTHESIJER_LIB $HOME/synthesijer/synthesijer_lib_$VERSION" >> synthesijer-env_$VERSION.csh
echo "setenv SYNTHESIJER_EXTRA_LIBS $HOME/synthesijer/synthesijer_extra-libs_$VERSION" >> synthesijer-env_$VERSION.csh
ln -sf synthesijer-env_$VERSION.csh synthesijer-env.csh

echo ""
echo "A quick start guid and some informations are available in"
echo "http://synthesijer.github.io/web/ ."
echo "Thank you for setting up Synthesijer!!"
