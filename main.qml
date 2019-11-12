import QtQuick 2.9
import QtQuick.Window 2.2
import QtQml 2.0

Window {
    visible: true
    width: 1350
    height: 700
    title: qsTr("Tourist Weather")


    Image {
        id: base
        source: "images/main_wp.jpg"

        anchors.centerIn: parent

        // textbox edit for searching
        TextEdit {
            id: searching
            x: 2185
            y: 745
            width: 390
            height: 60
            color: "#e6ec4545"
            text: qsTr("Search...")
            z: 1
            font.weight: Font.Light
            font.wordSpacing: -0.3
            font.capitalization: Font.AllLowercase
            font.pixelSize: 35

        }

        // search box
        Rectangle {
            id: rectangle
            x: 2185
            y: 740
            width: 390
            height: 70
            color: "#5cdcf5"
            border.color: "white"
            radius: 7.5
        }

        // current place informations
        Rectangle {
            id: currentCityInfo
            x: 1270
            y: 750
            width: 150
            height: 200
            color: "#abefef"
            border.color: "white"
            radius: 7.5

            Image {
                id: cloud
                x: 8
                y: 8
                width: 50
                height: 40
                source: "images/cloud.png"
            }

            Text {
                id: element
                x: 8
                y: 55
                width: 135
                height: 20
                text: qsTr("HANOI City")
                font.pixelSize: 15
                color: "#074786"
            }

            Text {
                id: element1
                x: 8
                y: 81
                width: 134
                height: 62
                text: qsTr("28 °C ")
                font.pixelSize: 55
            }
        }
    }

    QtObject{
        property var locale: Qt.locale()
        property date currentDate: new Date()
        property string dateString

        Component.onCompleted: {
            dateString = currentDate.toLocaleDateString();
            console.log(Date.fromLocaleString(locale, dateString, "ddd yyyy-MM-dd hh:mm:ss"));
        }
    }
}
