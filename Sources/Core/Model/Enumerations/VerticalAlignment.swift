//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

/// The vertical alignment.
public enum VerticalAlignment {
    /// Top alignment.
    case top
    /// Bottom alignment.
    case bottom
    /// Center alignment.
    case center
    /// Stretch/fill alignment.
    case stretch

    /// Convert to Qt alignment flag
    var qtAlignment: Qt.Alignment {
        switch self {
        case .top:
            return .AlignTop
        case .bottom:
            return .AlignBottom
        case .center:
            return .AlignVCenter
        case .stretch:
            return .AlignJustify
        }
    }
}
