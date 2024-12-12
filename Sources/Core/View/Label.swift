//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct Label: QtWidget {

    @Property(set: { $0.text = $1 }, pointer: QLabel.self)
    var label = ""

    public init(_ label: String) {
        self.label = label
    }

    public func initializeWidget() -> Any {
        let label = QLabel(text: label)
        label.alignment = .AlignHCenter
        return label
    }
}

