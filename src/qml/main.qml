import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import LingmoUI 1.0 as LingmoUI
import Lingmo.System 1.0 as System
import Lingmo.Setup 1.0

Window {
    id: win
    visible: true
    visibility: Window.isFullScreen ? Window.Windowed : Window.FullScreen
    flags: Qt.Window & Qt.FramelessWindowHint
    title: qsTr("Welcome to Lingmo OS")

    System.Wallpaper {
        id: wallpaper
    }

    Image {
        id: wallpaperImage
        anchors.fill: parent
        source: "file://" + wallpaper.path
        sourceSize: Qt.size(width * Screen.devicePixelRatio,
                            height * Screen.devicePixelRatio)
        fillMode: Image.PreserveAspectCrop
        asynchronous: false
        clip: true
        cache: false
        smooth: true
    }

    FastBlur {
        anchors.fill: wallpaperImage
        source: wallpaperImage
        radius: 50
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePage
    }

    SysVersion {
        id: info
    }

    Component {
        id: homePage

        HomePage { }
    }

    Component {
        id: userAssets

        UserAssets {}
    }

    Component {
        id: firstPage

        FirstPage {}
    }

    Component {
        id: secondPage

        SecondPage {}
    }

    // Component {
    //     id: updatingPage

    //     UpdatingPage {}
    // }

    // Component {
    //     id: finishedPage

    //     FinishedPage {}
    // }

    // ItemPage {
    //     id: control
    //     // title: qsTr("Welcome to Lingmo OS Hydrogen")
    //     anchors.centerIn: parent
        
    //     Rectangle {
    //         anchors.centerIn: parent
    //         width: win.width/2
    //         height: win.height/2 
    //         color: LingmoUI.Theme.backgroundColor
    //         // border.width: 2
    //         radius: LingmoUI.Theme.bigRadius

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
            
    //         Button {
    //             anchors.centerIn: parent
    //             text: qsTr("Exit")
    //             onClicked: Qt.quit()
    //         }
    //     }
    // }
    
}