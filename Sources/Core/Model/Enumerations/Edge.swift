//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public enum Edge: Int {
    case left
    case top
    case right
    case bottom

    var marginIndex: Int {
        self.rawValue
    }
}

extension [Edge] {
    /// Left edge only
    public static var left: Self { [.left] }
    /// Right edge only
    public static var right: Self { [.right] }
    /// Top edge only
    public static var top: Self { [.top] }
    /// Bottom edge only
    public static var bottom: Self { [.bottom] }

    /// Both horizontal edges
    public static var horizontal: Self { left + right }
    /// Both vertical edges
    public static var vertical: Self { top + bottom }
    /// All edges
    public static var all: Self { vertical + horizontal }

    /// Set margins for specified edges
    /// - Parameter value: The margin value
    /// - Returns: Tuple of (left, top, right, bottom) margins
    public func setMargins(_ value: Int32) -> (Int32, Int32, Int32, Int32) {
        var margins = [Int32](repeating: 0, count: 4)
        for edge in self {
            margins[edge.marginIndex] = value
        }
        return (margins[0], margins[1], margins[2], margins[3])
    }
}
