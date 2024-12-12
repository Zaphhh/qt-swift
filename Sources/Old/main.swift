//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

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

// Create and configure button
let button = QPushButton(text: "Click me")
button.connectClicked {
    print("I was clicked")
}

// Create and configure label
let label = QLabel(text: "Maybe this'll just work nice n all")
label.alignment = .AlignHCenter

// Add widgets to layout
layout.add(widget: button, alignment: .AlignHCenter)
layout.add(widget: label, alignment: .AlignHCenter)

// Show window and run app
window.show()
_ = app.exec()

