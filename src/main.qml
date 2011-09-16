import Pyro 0.1
import QtQuick 1.1

Item {
    id: root
    width: 500
    height: 500

    Flickable {
        flickableDirection: Flickable.HorizontalFlick
        anchors.fill: parent
        contentWidth: parent.width * 2

        Row {
            anchors.fill: parent
            GridView {
                height: root.height
                width: root.width
                model: MenuModel {
                }

                delegate: Item {
                    width: 100
                    height: 110

                    Image {
                        id: launcherIcon
                        source: model.icon
                        anchors.centerIn: parent
                        height: 64
                        width: 64
                        sourceSize.height: 64
                        sourceSize.width: 64
                        asynchronous: true
                    }

                    Text {
                        text: model.name
                        anchors.top: launcherIcon.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: launcherIcon.horizontalCenter
                        width: 80
                        elide: Text.ElideRight
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: model.object.launch()
                    }
                }
            }

            GridView {
                height: root.height
                width: root.width
                model: SwitcherModel {
                }

                delegate: Item {
                    width: 100
                    height: 110

                    Image {
                        id: launcherIcon
                        source: "image://windows/" + model.windowId + "/" + Math.random()
                        cache: false
                        anchors.centerIn: parent
                        height: 64
                        width: 64
                        sourceSize.height: 64
                        sourceSize.width: 64
                        asynchronous: true
                    }

                    Text {
                        text: model.name
                        anchors.top: launcherIcon.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: launcherIcon.horizontalCenter
                        width: 80
                        elide: Text.ElideRight
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: model.object.launch()
                    }
                }
            }

        }
    }
}
