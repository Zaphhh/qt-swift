import Qlift

let app = QApplication()
let window = QMainWindow()
window.windowTitle = "Main Window"
window.resize(width: 800, height: 400)

let scrollArea = QScrollArea()
window.centralWidget = scrollArea

let contentWidget = QWidget()
let layout = QHBoxLayout()
contentWidget.layout = layout

// Have to keep a reference to the labels
var lblArray: [QLabel] = []

for i in 1...50 {
    let label = QLabel(text: "Item \(i)")
    label.styleSheet = "padding: 10px;"
    lblArray.append(label)
    layout.add(widget: label)
}

scrollArea.setWidget(contentWidget)
scrollArea.widgetResizable = true
scrollArea.horizontalScrollBarPolicy = .ScrollBarAsNeeded
scrollArea.verticalScrollBarPolicy = .ScrollBarAlwaysOff

window.show()
_ = app.exec()