import QtQuick 2.9
import QtQuick.Window 2.2
import QtQml 2.0

Window {
    id: window
    visible: true
    width: 1350
    height: 700
    color: "#0dd4d4"
    title: qsTr("Tourist Weather")


    // textbox edit for searching
    TextEdit {
        id: searching
        x: 2180
        y: 851
        width: 375
        height: 44
        color: "#e6ec4545"
        text: "Search location..."
        z: 1
        font.weight: Font.Light
        font.wordSpacing: -0.3
        font.capitalization: Font.AllLowercase
        font.pixelSize: 25

        anchors.onLeftMarginChanged: parent

    }

    // place holder
    Image{
        id: placeHoler
        source: "images/placeholder.png"
        anchors.centerIn: paimport QtQuick.Window 2.2
        import QtQml 2.0rent
        width: 45
        height: 45
        anchors.verticalCenterOffset: -307
        anchors.horizontalCenterOffset: 301
    }

    // humidity
    Image{
        id: humidity
        source: "images/humidity.png"
        anchors.centerIn: parent
        width: 45
        height: 45
        anchors.verticalCenterOffset: -205
        anchors.horizontalCenterOffset: 301

    }
    // text
    Text {
        x: 1012
        y: 122
        width: 83
        height: 22
        color: "#000000"
        text: qsTr("Humidity")
        font.pixelSize: 20
    }
    Text {
        id: humidityValue
        x: 1012
        y: 150
        width: 68
        height: 37
        text: qsTr("50%")
        font.bold: true
        font.pixelSize: 30
    }

    // air pressure
    Image{
        id: airpressure
        source: "images/pressure.png"
        anchors.centerIn: parent
        width: 45
        height: 45
        anchors.verticalCenterOffset: -129
        anchors.horizontalCenterOffset: 301

    }
    // text
    Text {
        x: 1012
        y: 198
        text: qsTr("Air pressure")
        font.pixelSize: 20
    }

    Text {
        id: airpressureValue
        x: 1012
        y: 228
        text: qsTr("1009.5 PS")
        font.bold: true
        font.pixelSize: 30
    }

    // chance of Rain
    Image{
        id: rain
        source: "images/rain.png"
        anchors.centerIn: parent
        width: 45
        height: 45
        anchors.verticalCenterOffset: -43
        anchors.horizontalCenterOffset: 301

    }

    //text

    Text {
        x: 1012
        y: 280
        text: qsTr("Chance of Rain")
        font.pixelSize: 20
    }

    Text {
        id: rainValue
        x: 1012
        y: 314
        text: qsTr("10%")
        font.bold: true
        font.pixelSize: 30
    }

    // windy speed
    Image{
        id: windSpeed
        source: "images/wind.png"
        anchors.centerIn: parent
        width: 45
        height: 45
        anchors.verticalCenterOffset: 49
        anchors.horizontalCenterOffset: 301

    }

    // text
    Text {
        x: 1012
        y: 376
        text: qsTr("Wind Speed")
        font.pixelSize: 20
    }

    Text {
        id: windspeedValue
        x: 1012
        y: 406
        text: qsTr("1.3 km/h")
        font.bold: true
        font.pixelSize: 30
    }



    // current place informations
    Rectangle {
        id: currentCityInfo
        x: 27
        y: 20
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
            id: temp
            x: 8
            y: 81
            width: 134
            height: 62
            color: "#0dd4d4"
            text: qsTr("28 °C ")
            font.pixelSize: 55
        }
    }

    Rectangle {
        id: tempHrs
        x: 27
        y: 477
        width: 150
        height: 200
        color: "#75ecec"
        radius: 7.5
        border.color: "white"

        Text {
            id: tempuratureNow
            x: 8
            y: 75
            width: 134
            height: 62
            color: "#0dd4d4"
            text: qsTr("28 °C ")
            font.pixelSize: 55
        }

        Text {
            id: timeNow
            x: 8
            y: 19
            width: 44
            height: 21
            color: "#0dd4d4"
            text: qsTr("3PM")
            font.pixelSize: 19
        }

        Text {
            id: feelNow
            x: 8
            y: 157
            width: 134
            height: 24
            color: "#0dd4d4"
            text: qsTr("Feel like 30 °C ")
            font.pixelSize: 20
        }
    }

    Text {
        id: tempHr2
        x: 257
        y: 555
        width: 134
        height: 43
        color: "#034141"
        text: qsTr("28 °C ")
        font.pixelSize: 35
    }

    Text {
        id: timeHr2
        x: 257
        y: 496
        width: 44
        height: 21
        color: "#034141"
        text: qsTr("4PM")
        font.pixelSize: 19
    }

    Text {
        id: tempHr3
        x: 483
        y: 555
        width: 134
        height: 43
        color: "#034141"
        text: qsTr("26 °C ")
        font.pixelSize: 35
    }

    Text {
        id: timeHr3
        x: 483
        y: 496
        width: 44
        height: 21
        color: "#034141"
        text: qsTr("5PM")
        font.pixelSize: 19
    }

    Text {
        id: tempHr4
        x: 729
        y: 555
        width: 134
        height: 43
        color: "#034141"
        text: qsTr("24 °C ")
        font.pixelSize: 35
    }

    Text {
        id: timeHr4
        x: 729
        y: 496
        width: 44
        height: 21
        color: "#034141"
        text: qsTr("6PM")
        font.pixelSize: 19
    }

    Text {
        id: tempHr5
        x: 953
        y: 555
        width: 134
        height: 43
        color: "#034141"
        text: qsTr("23 °C ")
        font.pixelSize: 35
    }

    Text {
        id: timeHr5
        x: 953
        y: 496
        width: 44
        height: 21
        color: "#034141"
        text: qsTr("7PM")
        font.pixelSize: 19
    }

    Text {
        id: tempHr6
        x: 1174
        y: 555
        width: 134
        height: 43
        color: "#034141"
        text: qsTr("19 °C ")
        font.pixelSize: 35
    }

    Text {
        id: timeHr6
        x: 1174
        y: 496
        width: 44
        height: 21
        color: "#034141"
        text: qsTr("8PM")
        font.pixelSize: 19
    }

    Rectangle {
        id: btnSearch
        x: 1286
        y: 20
        width: 55
        height: 45
        color: "#ffffff"

        MouseArea{
            anchors.fill: parent

            onClicked: {
                // query data and mapping in textbox
                logger()

                readJsonFile()
            }
        }
    }

    Rectangle {
        id: rectangle
        x: 1004
        y: 20
        width: 276
        height: 45
        color: "#ffffff"
    }

    TextEdit {
        id: textEdit
        x: 1004
        y: 20
        width: 276
        height: 45
        text: qsTr("Search location")
        font.pixelSize: 20
    }

    function logger()
    {
        console.log("button clicked");
    }

    function readJsonFile()
    {
        // dummy a json format
        var JsonString = '{"Tempurature" : "30",
                           "Humidity": "85%",
                           "WindSpeeds": "1.5 km/h"
                            }';
        var JsonObject = JSON.parse(JsonString);

        var temp = JsonObject.Tempurature;
        var humi = JsonObject.Humidity;
        var wind = JsonObject.WindSpeeds;

        console.log("Tempurature -> " + temp);
        console.log("Humidity -> " + humi);
        console.log("Wind speed -> " + wind);

        var json;

        jsonBuilder(json);
        console.log(json);
    }

    function jsonBuilder(json)
    {
        // dummy json file store all information
        var JsonString = '{
            "3PM" : "28",
            "4PM" : "28",
            "5PM" : "24"

        }';

        json = JsonString;
    }
}


