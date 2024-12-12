import Qlift

// Initialize application
let app = QApplication()

// Create main window
let window = QMainWindow()
window.windowTitle = "Main Window"

// Create central widget and set it
let centralWidget = QWidget()
window.centralWidget = centralWidget

// Create vertical layout
let layout = QVBoxLayout()
centralWidget.layout = layout

// Create and configure label
let welcomeLabel = QLabel(text: "Welcome to the Demo App")
welcomeLabel.alignment = .AlignHCenter
welcomeLabel.wordWrap = true
layout.add(widget: welcomeLabel, alignment: .AlignHCenter)

// Create buttons with icons
let newDocumentButton = QPushButton(icon: QIcon(theme: "document-new"), text: "New Document")
newDocumentButton.connectClicked {
    print("New Document button clicked")
}
layout.add(widget: newDocumentButton, alignment: .AlignHCenter)

let openDocumentButton = QPushButton(icon: QIcon(theme: "document-open"), text: "Open Document")
openDocumentButton.connectClicked {
    print("Open Document button clicked")
}
layout.add(widget: openDocumentButton, alignment: .AlignHCenter)

let saveDocumentButton = QPushButton(icon: QIcon(theme: "document-save"), text: "Save Document")
saveDocumentButton.connectClicked {
    print("Save Document button clicked")
}
layout.add(widget: saveDocumentButton, alignment: .AlignHCenter)

let printDocumentButton = QPushButton(icon: QIcon(theme: "document-print"), text: "Print Document")
printDocumentButton.connectClicked {
    print("Print Document button clicked")
}
layout.add(widget: printDocumentButton, alignment: .AlignHCenter)

// Create and configure label
let thankYouLabel = QLabel(text: "Thank you for using the Demo App")
thankYouLabel.alignment = .AlignHCenter
thankYouLabel.wordWrap = true
layout.add(widget: thankYouLabel, alignment: .AlignHCenter)

// Show window and run app
window.show()
_ = app.exec()
