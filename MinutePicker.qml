import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0

Rectangle {
	id: minutePicker


	property int indicatorHeight: 2
	property string indicatorColor: "#e91e63"
	property int minute
	property int divisions: 5
	property string textEntered

	signal submit()
	signal abort()

	activeFocusOnTab: true

	onActiveFocusChanged: {
		textEntered = ""
		if (minutePicker.activeFocus) {
			Qt.inputMethod.show()
		}
	}

	Tumbler {
		id: minutePickerTumbler
        height: parent.height - parent.indicatorHeight
        width: parent.width
		activeFocusOnTab: false
		z: 0
		model: 60 / minutePicker.divisions
		delegate: Text {
			text: ("00" + (modelData * minutePicker.divisions)).slice(-2)
            color: "#c5002256"
            horizontalAlignment: Text.AlignHCenter
			opacity: 0.4 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 0.6
			font.pixelSize: 15 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 3
		}
		onCurrentIndexChanged: {
			var m = minutePickerTumbler.currentIndex * minutePicker.divisions
			if (minutePicker.minute != m) {
				minutePicker.minute = m
			}
		}
	}

	Rectangle	{
		id: minutePickerIndicator
		width: parent.width
		height: minutePicker.indicatorHeight
		color: parent.activeFocus ? parent.indicatorColor : parent.color
		anchors.bottom: parent.bottom
		activeFocusOnTab: false
	}

	onMinuteChanged: {
		var m = minutePicker.minute / minutePicker.divisions
		if (minutePickerTumbler.currentIndex != m) {
			minutePickerTumbler.currentIndex = m
		}
	}

	Keys.onPressed: {
		if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
			event.accepted = true
			minutePicker.submit()
		}
		else if (event.key == Qt.Key_Escape) {
			event.accepted = true
			minutePicker.abort()
		}
		else if (event.text.replace(/[^A-Z0-9]/gi, "").length > 0) {
			var foundIndex = searchIndex(event.text)
			if (foundIndex > -1)	{
				minutePickerTumbler.currentIndex = foundIndex
			}
		}
	}

	// Search for Index. If nothing is found, starts over with the last entered key
	function searchIndex(t) {
	 minutePicker.textEntered += t
			var foundIndex = findIndex(minutePicker.textEntered)
			if (foundIndex > -1) {
				return foundIndex
			}
			// If more than one key has been entered, take just the last one and try again
			else if (minutePicker.textEntered.length > t.length) {
				minutePicker.textEntered = ""
				return searchIndex(t)
		}
	}

	// return Index of the first item that contains the given string.
	function findIndex(t) {
		if (parseInt(t) < 60) {
			return Math.round(parseInt(t) / minutePicker.divisions)
		}
		return -1
	}
}
