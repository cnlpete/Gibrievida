/*
    Gibrievida - An activity tracker
    Copyright (C) 2016 Buschtrommel/Matthias Fehring http://gibrievida.buschmann23.de

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    id: settingsPage

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: settingsCol.height

        Column {
            id: settingsCol
            width: parent.width

            PageHeader {
                title: qsTr("Settings")
                page: settingsPage
            }

            ComboBox {
                width: parent.width
                currentIndex: config.distanceMeasurement
                label: qsTr("Measurement system")
                menu: ContextMenu {
                    MenuItem { text: qsTr("Metric") }
                    MenuItem { text: qsTr("Imperial US") }
                    MenuItem { text: qsTr("Imperial UK") }
                }
                onCurrentIndexChanged: config.distanceMeasurement = currentIndex
                description: qsTr("Distances are stored internally in metres. If you choose a different measurement system, the application will convert the data on the fly.")
            }

            ComboBox {
                width: parent.width
                currentIndex: config.repetitionClickSound
                label: qsTr("Repetition click sound")
                menu: ContextMenu {
                    MenuItem { text: qsTr("Disabled") }
                    Repeater {
                        model: 9
                        MenuItem { text: qsTr("Sound %1").arg(model.index + 1) }
                    }
                }
                onCurrentIndexChanged: config.repetitionClickSound = currentIndex
                description: qsTr("The sound will be played if you click on a button or area to increase the repetition count of an acitivity.")
            }
        }
    }
}

