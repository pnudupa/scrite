QT += gui qml quick widgets xml concurrent network quickcontrols2
DESTDIR = $$PWD/../Release/
TARGET = Scrite

DEFINES += PHTRANSLATE_STATICLIB

CONFIG(release, debug|release): {
    DEFINES += QT_NO_DEBUG_OUTPUT
    CONFIG += qtquickcompiler
}

INCLUDEPATH += . \
        ./src \
        ./src/core \
        ./src/importers \
        ./src/exporters \
        ./src/printing \
        ./src/quick \
        ./src/quick/objects \
        ./src/quick/items \
        ./src/utils \
        ./src/document \
        ./src/interfaces \
        ./src/reports

HEADERS += \
    3rdparty/phtranslator/LanguageCodes.h \
    3rdparty/phtranslator/PhTranslateLib.h \
    3rdparty/phtranslator/PhTranslator.h \
    3rdparty/phtranslator/stdafx.h \
    3rdparty/phtranslator/targetver.h \
    3rdparty/poly2tri/common/shapes.h \
    3rdparty/poly2tri/common/utils.h \
    3rdparty/poly2tri/poly2tri.h \
    3rdparty/poly2tri/sweep/advancing_front.h \
    3rdparty/poly2tri/sweep/cdt.h \
    3rdparty/poly2tri/sweep/sweep.h \
    3rdparty/poly2tri/sweep/sweep_context.h \
    src/core/qobjectproperty.h \
    src/importers/openfromlibrary.h \
    src/printing/qtextdocumentpagedprinter.h \
    src/printing/imageprinter.h \
    src/quick/objects/delayedpropertybinder.h \
    src/quick/objects/notification.h \
    src/quick/objects/fileinfo.h \
    src/quick/objects/searchengine.h \
    src/quick/objects/completer.h \
    src/quick/objects/eventfilter.h \
    src/quick/objects/polygontesselator.h \
    src/quick/objects/shortcutsmodel.h \
    src/quick/objects/trackobject.h \
    src/quick/objects/notificationmanager.h \
    src/quick/objects/materialcolors.h \
    src/quick/objects/errorreport.h \
    src/quick/objects/resetonchange.h \
    src/quick/objects/focustracker.h \
    src/quick/objects/standardpaths.h \
    src/quick/objects/aggregation.h \
    src/quick/items/textshapeitem.h \
    src/quick/items/tightboundingbox.h \
    src/quick/items/ruleritem.h \
    src/quick/items/abstractshapeitem.h \
    src/quick/items/gridbackgrounditem.h \
    src/quick/items/painterpathitem.h \
    src/utils/timeprofiler.h \
    src/utils/garbagecollector.h \
    src/utils/hourglass.h \
    src/utils/simpletimer.h \
    src/utils/genericarraymodel.h \
    src/utils/qobjectfactory.h \
    src/utils/qobjectserializer.h \
    src/utils/modifiable.h \
    src/document/formatting.h \
    src/document/transliteration.h \
    src/document/scritedocument.h \
    src/document/documentfilesystem.h \
    src/document/structure.h \
    src/document/screenplaytextdocument.h \
    src/document/undoredo.h \
    src/document/screenplayadapter.h \
    src/document/note.h \
    src/document/screenplay.h \
    src/document/scene.h \
    src/core/application.h \
    src/core/autoupdate.h \
    src/exporters/finaldraftexporter.h \
    src/exporters/structureexporter.h \
    src/exporters/textexporter.h \
    src/exporters/fountainexporter.h \
    src/exporters/htmlexporter.h \
    src/exporters/pdfexporter.h \
    src/exporters/odtexporter.h \
    src/importers/fountainimporter.h \
    src/importers/finaldraftimporter.h \
    src/importers/htmlimporter.h \
    src/interfaces/abstracttextdocumentexporter.h \
    src/interfaces/abstractreportgenerator.h \
    src/interfaces/abstractexporter.h \
    src/interfaces/abstractimporter.h \
    src/interfaces/abstractdeviceio.h \
    src/interfaces/abstractscreenplaysubsetreport.h \
    src/reports/characterscreenplayreport.h \
    src/reports/progressreport.h \
    src/reports/screenplaysubsetreport.h \
    src/reports/locationscreenplayreport.h \
    src/reports/characterreportgenerator.h \
    src/reports/scenecharactermatrixreportgenerator.h \
    src/reports/locationreportgenerator.h 

SOURCES += \
    main.cpp \
    3rdparty/phtranslator/PhTranslateLib.cpp \
    3rdparty/phtranslator/PhTranslator.cpp \
    3rdparty/phtranslator/stdafx.cpp \
    3rdparty/poly2tri/common/shapes.cc \
    3rdparty/poly2tri/sweep/advancing_front.cc \
    3rdparty/poly2tri/sweep/cdt.cc \
    3rdparty/poly2tri/sweep/sweep.cc \
    3rdparty/poly2tri/sweep/sweep_context.cc \
    src/core/qobjectproperty.cpp \
    src/importers/openfromlibrary.cpp \
    src/printing/qtextdocumentpagedprinter.cpp \
    src/printing/imageprinter.cpp \
    src/quick/objects/fileinfo.cpp \
    src/quick/objects/focustracker.cpp \
    src/quick/objects/delayedpropertybinder.cpp \
    src/quick/objects/notificationmanager.cpp \
    src/quick/objects/notification.cpp \
    src/quick/objects/resetonchange.cpp \
    src/quick/objects/completer.cpp \
    src/quick/objects/eventfilter.cpp \
    src/quick/objects/aggregation.cpp \
    src/quick/objects/shortcutsmodel.cpp \
    src/quick/objects/trackobject.cpp \
    src/quick/objects/materialcolors.cpp \
    src/quick/objects/errorreport.cpp \
    src/quick/objects/standardpaths.cpp \
    src/quick/objects/polygontesselator.cpp \
    src/quick/objects/searchengine.cpp \
    src/quick/items/tightboundingbox.cpp \
    src/quick/items/gridbackgrounditem.cpp \
    src/quick/items/painterpathitem.cpp \
    src/quick/items/textshapeitem.cpp \
    src/quick/items/abstractshapeitem.cpp \
    src/quick/items/ruleritem.cpp \
    src/utils/genericarraymodel.cpp \
    src/utils/timeprofiler.cpp \
    src/utils/garbagecollector.cpp \
    src/utils/simpletimer.cpp \
    src/utils/qobjectserializer.cpp \
    src/document/scritedocument.cpp \
    src/document/screenplay.cpp \
    src/document/scene.cpp \
    src/document/documentfilesystem.cpp \
    src/document/structure.cpp \
    src/document/screenplaytextdocument.cpp \
    src/document/undoredo.cpp \
    src/document/transliteration.cpp \
    src/document/screenplayadapter.cpp \
    src/document/note.cpp \
    src/document/formatting.cpp \
    src/core/autoupdate.cpp \
    src/core/application.cpp \
    src/exporters/htmlexporter.cpp \
    src/exporters/structureexporter.cpp \
    src/exporters/odtexporter.cpp \
    src/exporters/textexporter.cpp \
    src/exporters/pdfexporter.cpp \
    src/exporters/fountainexporter.cpp \
    src/exporters/finaldraftexporter.cpp \
    src/importers/finaldraftimporter.cpp \
    src/importers/fountainimporter.cpp \
    src/importers/htmlimporter.cpp \
    src/interfaces/abstracttextdocumentexporter.cpp \
    src/interfaces/abstractdeviceio.cpp \
    src/interfaces/abstractexporter.cpp \
    src/interfaces/abstractscreenplaysubsetreport.cpp \
    src/interfaces/abstractimporter.cpp \
    src/interfaces/abstractreportgenerator.cpp \
    src/reports/locationreportgenerator.cpp \
    src/reports/screenplaysubsetreport.cpp \
    src/reports/characterscreenplayreport.cpp \
    src/reports/progressreport.cpp \
    src/reports/locationscreenplayreport.cpp \
    src/reports/characterreportgenerator.cpp \
    src/reports/scenecharactermatrixreportgenerator.cpp \

RESOURCES += \
    scrite_bengali_font.qrc \
    scrite_english_font.qrc \
    scrite_gujarati_font.qrc \
    scrite_hindi_font.qrc \
    scrite_kannada_font.qrc \
    scrite_malayalam_font.qrc \
    scrite_oriya_font.qrc \
    scrite_punjabi_font.qrc \
    scrite_sanskrit_font.qrc \
    scrite_tamil_font.qrc \
    scrite_telugu_font.qrc \
    scrite_raleway_font.qrc \
    scrite_icons.qrc \
    scrite_images.qrc \
    scrite_ui.qrc

macx {
    ICON = appicon.icns
    QMAKE_INFO_PLIST = Info.plist
}

win32 {
    RC_ICONS = appicon.ico
}

include($$PWD/3rdparty/sonnet/sonnet.pri)

DISTFILES += \
    Info.plist \
    README \
    packaging/linux/install.sh \
    packaging/linux/package.sh \
    packaging/linux/scrite.desktop \
    packaging/windows/package-x86.bat \
    packaging/windows/package-x64.bat \
    packaging/windows/installer-x86.nsi \
    packaging/windows/installer-x64.nsi \
    packaging/mac/package.sh \
    packaging/mac/prepare.sh \
    packaging/mac/dmgbackdrop.qml \
    3rdparty/poly2tri/License.txt


