#/bin/sh
OUTPUTPATH=releases/arduino/TinyProto
OUTPUTZIP=releases/arduino/TinyProto.zip

rm -rf $OUTPUTPATH
rm -rf $OUTPUTZIP

mkdir -p $OUTPUTPATH/src
cp src/*.cpp $OUTPUTPATH/src
#cp src/*.c $OUTPUTPATH/src
#cp src/*.hpp $OUTPUTPATH/src
cp src/*.h $OUTPUTPATH/src
cp -R examples $OUTPUTPATH/src
cp -R src/proto $OUTPUTPATH/src
rm -rf $OUTPUTPATH/src/proto/os/linux
rm -rf $OUTPUTPATH/src/proto/os/mingw32
rm -rf $OUTPUTPATH/src/proto/os/tiny_defines.h
mv $OUTPUTPATH/src/proto/os/arduino/* $OUTPUTPATH/src/proto/os/
rm -rf $OUTPUTPATH/src/proto/os/arduino
cp library.json $OUTPUTPATH
cp library.properties $OUTPUTPATH
cp LICENSE $OUTPUTPATH
cp keywords.txt $OUTPUTPATH


(cd releases/arduino/; zip -r TinyProto.zip TinyProto)

echo "arduino package build ... [DONE]"
