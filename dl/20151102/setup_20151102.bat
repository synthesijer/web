set VERSION=20151102
set SYNTHSIJER_WORK=%HOME%\synthesijer
mkdir %SYNTHESIJER_WORK%
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/%VERSION%/synthesijer_%VERSION%.jar %SYNTHESIJER_WORK%\synthesijer_%VERSION%.jar
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/%VERSION%/synthesijer_ext-libs_%VERSION%.zip %SYNTHESIJER_WORK%\synthesijer_ext-libs_%VERSION%.zip
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/%VERSION%/synthesijer_lib_%VERSION%.zip %SYNTHESIJER_WORK%\synthesijer_lib_%VERSION%.zip
bitsadmin.exe /TRANSFER htmlget https://synthesijer.github.io/web/dl/%VERSION%/synthesijer_sample_%VERSION%.zip %SYNTHESIJER_WORK%\synthesijer_sample_%VERSION%.zip
