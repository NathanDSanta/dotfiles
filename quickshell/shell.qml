import Quickshell // for PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30

    Text {
        id: clock
        // center the bar in its parent component (the window)
        anchors.centerIn: parent

        text: "hello world"
        Process {
            command: ["date"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: clock.text = this.text
            }
        }
    }
}
