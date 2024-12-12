//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct Label: QtWidget {

    var label: String
    var alignment: Qt.Alignment = .AlignHCenter
    var wordWrap: Bool = false

    public init(_ label: String) {
        self.label = label
    }

    public func container<Data>(
        data: WidgetData,
        type: Data.Type
    ) -> ViewStorage where Data: ViewRenderData {
        let label = QLabel(text: self.label)
        label.alignment = alignment
        label.wordWrap = wordWrap
        return ViewStorage(label)
    }

    public func update<Data>(
        _ storage: ViewStorage,
        data: WidgetData,
        updateProperties: Bool,
        type: Data.Type
    ) where Data: ViewRenderData {
        guard let label = storage.pointer as? QLabel else { return }

        if updateProperties {
            label.text = self.label
            label.alignment = alignment
            label.wordWrap = wordWrap
        }
    }

    // MARK: - Modifiers

    public func wrappable(_ enabled: Bool = true) -> Self {
        modify { $0.wordWrap = enabled }
    }

    public func alignment(_ alignment: Qt.Alignment) -> Self {
        modify { $0.alignment = alignment }
    }

    private func modify(_ modification: (inout Self) -> Void) -> Self {
        var copy = self
        modification(&copy)
        return copy
    }
}
