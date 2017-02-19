TEMPLATE = app

QT += qml quick

CONFIG += c++14

QML_IMPORT_PATH += $$PWD

include(./fam/fam.pri)


SOURCES += main.cpp \
    floatingactionsbottomright.cpp \
    floatingactionsbottomleft.cpp 

HEADERS += \
    floatingactionsbottomright.hpp \
    floatingactionsbottomleft.hpp 

RESOURCES += qml.qrc

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

QML_DESIGNER_IMPORT_PATH =

DEFINES += QT_DEPRECATED_WARNINGS

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

message("In fam.pro PWD=" $$PWD)



