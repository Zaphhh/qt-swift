//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

/// The horizontal alignment.
public enum HorizontalAlignment {
    /// Left alignment.
    case left
    /// Right alignment.
    case right
    /// Center alignment.
    case center
    /// Stretch/fill alignment.
    case stretch

    /// Convert to Qt alignment flag
    var qtAlignment: Qt.Alignment {
        switch self {
        case .left:
            return .AlignLeft
        case .right:
            return .AlignRight
        case .center:
            return .AlignHCenter
        case .stretch:
            return .AlignJustify
        }
    }
}
