set SYNTHSIJER_WORK=%HOME%\synthesijer
mkdir %SYNTHESIJER_WORK%
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/synthesijer_20150608.jar %SYNTHESIJER_WORK%\synthesijer_20150608.jar
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/synthesijer_ext-libs_20150608.zip %SYNTHESIJER_WORK%\synthesijer_ext-libs_20150608.zip
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/synthesijer_lib_20150608.zip %SYNTHESIJER_WORK%\synthesijer_lib_20150608.zip
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/synthesijer_sample_20150608.zip %SYNTHESIJER_WORK%\synthesijer_sample_20150608.zip
