# QtSpeech -- a small cross-platform library to use TTS
# Copyright (C) 2010-2011 LynxLine.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General
# Public License along with this library; if not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301 USA

DEPENDPATH += $$PWD
INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/QtSpeech \
    $$PWD/QtSpeech.h

macx {
    SOURCES += $$PWD/QtSpeech_mac.cpp
    LIBS *= -framework AppKit
}

win32 {
    SOURCES += $$PWD/QtSpeech_win.cpp

    INCLUDEPATH += "C:/Program Files/Microsoft Visual Studio 10.0/VC/atlmfc"
    INCLUDEPATH += "C:/Program Files/Microsoft SDKs/Windows/v7.1/Include"

    LIBS += -L"C:/Program Files/Microsoft SDKs/Windows/v7.1/Lib"
}

unix:!mac {
    INCLUDEPATH += /usr/include/speech_tools
    INCLUDEPATH += /usr/include/festival

    HEADERS += $$PWD/QtSpeech_unx.h
    SOURCES += $$PWD/QtSpeech_unx.cpp

    LIBS += -lncurses
    LIBS += -L/usr/lib/ -lFestival
    LIBS += -L/usr/lib/ -lestools -lestbase -leststring

    # Linux: use asound 
    LIBS += -lasound
    
    # Mac: use system Frameworks
    #LIBS += -framework CoreAudio -framework AudioUnit -framework AudioToolbox -framework Carbon
}
