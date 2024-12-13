//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

/// Combined alignment for both horizontal and vertical directions
public enum Alignment {
    /// Fill the available space
    case fill
    /// Start alignment (left/top)
    case start
    /// End alignment (right/bottom)
    case end
    /// Center alignment
    case center
    /// Custom alignment
    case custom(horizontal: HorizontalAlignment, vertical: VerticalAlignment)

    /// Convert to Qt alignment flags
    public var qtAlignment: Qt.Alignment {
        switch self {
        case .fill:
            return [.AlignJustify]
        case .start:
            return [.AlignLeft, .AlignTop]
        case .end:
            return [.AlignRight, .AlignBottom]
        case .center:
            return [.AlignHCenter, .AlignVCenter]
        case .custom(let h, let v):
            return [h.qtAlignment, v.qtAlignment]
        }
    }
}
