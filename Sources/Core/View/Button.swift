//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct Button: QtWidget {
    
    @Property(set: { $0.text = $1 }, pointer: QPushButton.self)
    var label: String = ""
    
    var action: () -> Void
    
    public init(_ label: String, action: @escaping () -> Void = {}) {
        self.label = label
        self.action = action
    }
    
    public func initializeWidget() -> Any {
        let button = QPushButton(text: label)
        button.connectClicked(receiver: nil) { [action] in
            action()
        }
        
        return button
    }
}
