QT += qml quick quickcontrols2

//QML_IMPORT_PATH += $$PWD

INCLUDEPATH += $$PWD

RESOURCES += $$PWD/fam.qrc

HEADERS += \
    $$PWD/floatingactionbutton.hpp \
    $$PWD/floatingactionmenu.hpp \
    $$PWD/floatingactions.hpp  \
    $$PWD/qqmlobjectlistmodel.hpp \


SOURCES += \
    $$PWD/floatingactions.cpp \
    $$PWD/qqmlobjectlistmodel.cpp

message("In fam.pri PWD=" $$PWD)


