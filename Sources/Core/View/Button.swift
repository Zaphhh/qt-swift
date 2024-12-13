//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct Button: QtWidget {

    var label: String?
    var icon: Icon?
    var action: () -> Void
    var alignment: Qt.Alignment = .AlignHCenter

    public init(_ label: String? = nil, icon: Icon? = nil, action: @escaping () -> Void = {}) {
        self.label = label
        self.icon = icon
        self.action = action
    }

    public func container<Data>(
        data: WidgetData,
        type: Data.Type
    ) -> ViewStorage where Data: ViewRenderData {
        let button: QPushButton
        if let icon = icon, let label = label {
            button = QPushButton(icon: icon.qicon, text: label)
        } else if let icon = icon {
            button = QPushButton(icon: icon.qicon)
        } else if let label = label {
            button = QPushButton(text: label)
        } else {
            button = QPushButton()
        }

        button.connectClicked {
            action()
        }

        button.sizePolicy = QSizePolicy(horizontal: .Preferred, vertical: .Fixed)
        return ViewStorage(button)
    }

    public func update<Data>(
        _ storage: ViewStorage,
        data: WidgetData,
        updateProperties: Bool,
        type: Data.Type
    ) where Data: ViewRenderData {
        guard let button = storage.pointer as? QPushButton else { return }

        if updateProperties {
            button.text = label ?? ""
            if let icon = icon {
                button.addIcon(icon.qicon)
            } else {
                button.addIcon(QIcon())
            }
        }
    }

    // Alignment will be handled by parent layout when adding the button
    public func alignment(_ alignment: Qt.Alignment) -> Self {
        modify { $0.alignment = alignment }
    }

    private func modify(_ modification: (inout Self) -> Void) -> Self {
        var copy = self
        modification(&copy)
        return copy
    }
}
