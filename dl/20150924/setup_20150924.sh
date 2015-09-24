#!bin/sh

#set +m

VERSION=20150924
BASE_URL=https://synthesijer.github.io/web/dl/$VERSION

download() {
  echo "Download:" $1/$2
  curl -L $1/$2 -o $2
}

mkdir -p $HOME/synthesijer
cd $HOME/synthesijer
echo "Downlaod related files"
download $BASE_URL synthesijer_$VERSION.jar
download $BASE_URL synthesijer_lib_$VERSION.zip
download $BASE_URL synthesijer_extra-libs_$VERSION.zip
download $BASE_URL synthesijer_sample_$VERSION.zip
echo "Extract libraries and samples..."
unzip -o synthesijer_lib_$VERSION.zip > /dev/null
unzip -o synthesijer_extra-libs_$VERSION.zip > /dev/null
unzip -o synthesijer_sample_$VERSION.zip > /dev/null
echo "done"

echo ""
echo ""

echo "Before using Synthesijer, please do"
echo "source $HOME/synthesijer/synthesijer_env.sh"
echo " or"
echo "source $HOME/synthesijer/synthesijer_env.csh"

touch synthesijer_env_$VERSION.sh
echo "export SYNTHESIJER=$HOME/synthesijer/synthesijer_$VERSION.jar" > synthesijer_env_$VERSION.sh
echo "export SYNTHESIJER_LIB=$HOME/synthesijer/synthesijer_lib_$VERSION" >> synthesijer_env_$VERSION.sh
echo "export SYNTHESIJER_EXTRA_LIB=$HOME/synthesijer/synthesijer_extra-libs_$VERSION" >> synthesijer_env_$VERSION.sh
ln -sf synthesijer_env_$VERSION.sh synthesijer_env.sh

touch synthesijer_env_$VERSION.csh
echo "setenv SYNTHESIJER $HOME/synthesijer/synthesijer_$VERSION.jar" > synthesijer_env_$VERSION.csh
echo "setenv SYNTHESIJER_LIB $HOME/synthesijer/synthesijer_lib_$VERSION" >> synthesijer_env_$VERSION.csh
echo "setenv SYNTHESIJER_EXTRA_LIB $HOME/synthesijer/synthesijer_extra-libs_$VERSION" >> synthesijer_env_$VERSION.csh
ln -sf synthesijer_env_$VERSION.csh synthesijer_env.csh

echo ""
echo "A quick start guid and some informations are available in"
echo "http://synthesijer.github.io/web/ ."
echo "Thank you for setting up Synthesijer!!"
