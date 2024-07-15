/*
 * Copyright (C) 2021 LingmoOS Team.
 *
 * Author:     revenmartin <revenmartin@gmail.com>
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
import QtQuick.Layouts 1.12
import LingmoUI 1.0 as LingmoUI

Rectangle {
    anchors.centerIn: parent
    width: win.width/1.8
    height: win.height/1.8
    color: LingmoUI.Theme.secondBackgroundColor
    //         // border.width: 2
    radius: LingmoUI.Theme.bigRadius
    

    //         Image {
    //             id: logo
    //             width: 300
    //             // anchors.centerIn: parent
    //             anchors.centerIn: parent
    //             // anchors.fill: parent
    //             anchors.top: parent.top
    //             // anchors.topMargin: 10
    //             anchors.horizontalCenter: parent.horizontalCenter
    //             sourceSize: Qt.size(width, height)
    //             source: "qrc:/assets/logo.svg"
    //         }
}