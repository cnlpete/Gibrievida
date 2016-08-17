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
import harbour.gibrievida 1.0
import "../common"

Page {
    id: singleRecordPage

    property Record record: null

    SilicaFlickable {
        PullDownMenu {
            MenuItem {
                text: qsTr("Edit")
                onClicked: pageStack.push(Qt.resolvedUrl("../dialogs/RecordDialog.qml"), {record: record})
            }
        }

        id: singleRecordFlick
        anchors.fill: parent
        contentHeight: singleRecordCol.height

        VerticalScrollDecorator {
            flickable: singleRecordFlick
            page: singleRecordPage
        }

        Column {
            id: singleRecordCol
            anchors { left: parent.left; right: parent.right; leftMargin: Theme.horizontalPageMargin; rightMargin: Theme.horizontalPageMargin }
            spacing: Theme.paddingSmall

            PageHeader {
                id: pHeader
                page: singleRecordPage
                rightMargin: 0
                title: record ? record.activity.name : ""
            }

            IconSectionHeader {
                icon: "image://theme/icon-s-time"
                text: qsTr("Start time")
            }

            Text {
                id: startTimeText
                width: parent.width
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: record ? helpers.relativeTimeString(record.start) : ""
            }

            IconSectionHeader {
                icon: "image://theme/icon-s-duration"
                text: qsTr("Duration")
            }

            Text {
                id: durationText
                width: parent.width
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: record ? helpers.createDurationString(record.duration) : ""
            }

            IconSectionHeader {
                icon: "image://theme/icon-s-retweet"
                text: qsTr("Repetitions")
                visible: record ? record.repetitions > 0 : false
            }

            Text {
                width: parent.width
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: record ? record.repetitions : ""
                visible: record ? record.repetitions > 0 : false
            }

            IconSectionHeader {
                icon: "image://theme/icon-s-edit"
                text: qsTr("Note")
                visible: record ? record.note : false
            }

            Text {
                width: parent.width
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: record ? record.note : ""
                visible: record ? record.note : false
            }
        }
    }
}

