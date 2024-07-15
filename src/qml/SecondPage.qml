/*
 * Copyright (C) 2024 LingmoOS Team.
 *
 * Author:     LingmoOS Team <team@lingmo.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import LingmoUI 1.0 as LingmoUI
import Lingmo.Setup 1.0

Item {
    id: control

    Appearance {
        id: appearance
    }

    ColumnLayout {
        id: layout
        anchors.fill: parent

        Item {
            height: LingmoUI.Units.largeSpacing
        }

        RoundedItem {
            id: ws

            Image {
                id: wallpaper_logo
                width: 350
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: ws.width/20
                sourceSize: Qt.size(width, height)
                source: "qrc:/assets/wallpaper_set.svg"
            }

            Text {
                id: title
                anchors.left: wallpaper_logo.right
                anchors.leftMargin: wallpaper_logo.width/8
                anchors.top: parent.top
                anchors.topMargin: 30
                // anchors.right: parent.right
                // anchors.rightMargin: im.width/12
                // anchors.horizontalCenter: parent.horizontalCenter
                // anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Personalize your computer")
                font.pointSize: 20
                font.bold: true
                color: LingmoUI.Theme.textColor
            }

            Text {
                id: txt
                anchors.left: wallpaper_logo.right
                anchors.top: title.bottom
                anchors.topMargin: 5
                anchors.leftMargin: wallpaper_logo.width/8
                // anchors.verticalCenter: hello.verticalCenter
                text: qsTr("You can choose your desktop wallpaper and switch between light and dark colors.")
                wrapMode: txt.WordWrap
                color: LingmoUI.Theme.textColor
                font.pointSize: 10
            }

            Text {
                id: wpa
                anchors.left: wallpaper_logo.right
                anchors.top: txt.bottom
                anchors.topMargin: 25
                anchors.leftMargin: wallpaper_logo.width/8
                // anchors.verticalCenter: hello.verticalCenter
                text: qsTr("Wallpaper")
                wrapMode: txt.WordWrap
                color: LingmoUI.Theme.textColor
                font.pointSize: 15
                font.bold: true
            }

            Image {
                id: _image
                // anchors.fill: parent
                width: 210
                // anchors.margins: LingmoUI.Units.smallSpacing
                // anchors.verticalCenter: parent.verticalCenter
                anchors.left: wallpaper_logo.right
                anchors.leftMargin: wallpaper_logo.width/8
                anchors.top: wpa.bottom
                anchors.topMargin: 10
                // source: "file://" + modelData
                source: "qrc:/assets/example.svg"
                sourceSize: Qt.size(width, height)
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                mipmap: true
                cache: true
                smooth: true
                opacity: 1.0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 100
                        easing.type: Easing.InOutCubic
                    }
                }

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: _image.width
                        height: _image.height
                        Rectangle {
                            anchors.fill: parent
                            radius: LingmoUI.Theme.bigRadius
                        }
                    }
                }
            }

            Text {
                id: themes
                anchors.left: wallpaper_logo.right
                anchors.top: wpa.bottom
                anchors.topMargin: 160
                anchors.leftMargin: wallpaper_logo.width/8
                text: qsTr("Theme")
                wrapMode: txt.WordWrap
                color: LingmoUI.Theme.textColor
                font.pointSize: 15
                font.bold: true
            }

            RowLayout {
                anchors.left: wallpaper_logo.right
                anchors.leftMargin: wallpaper_logo.width/8
                anchors.top: themes.bottom
                anchors.topMargin: 10

                IconCheckBox {
                    source: "qrc:/assets/light_mode.svg"
                    text: qsTr("Light")
                    checked: !LingmoUI.Theme.darkMode
                    onClicked: appearance.switchDarkMode(false)
                }

                IconCheckBox {
                    source: "qrc:/assets/dark_mode.svg"
                    text: qsTr("Dark")
                    checked: LingmoUI.Theme.darkMode
                    onClicked: appearance.switchDarkMode(true)
                }
            }

            Button {
                // anchors.centerIn: parent
                anchors.right: parent.right
                anchors.rightMargin: parent.width/20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 35
                flat: true
                text: qsTr("Done!")
                onClicked: {
                    // stack.push(secondPage)
                    Qt.quit()
                }
            }
            
            // Button {
            //     flat: false
            //     text: qsTr("Exit")
            //     onClicked: Qt.quit()
            // }
        }
    }
}