//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

/// Represents system and custom icons
public enum Icon {
    /// A preinstalled icon.
    case `default`(DefaultIcon)
    /// A custom icon.
    case custom(String)
    
    var qicon: QIcon {
        switch self {
        case .default(let icon): return QIcon(theme: icon.string)
        case .custom(let path): return QIcon(fileName: path)
        }
    }
    
    /// A string representation of the icon.
    public var string: String {
        switch self {
        case .default(let icon):
            return icon.string
        case .custom(let name):
            return name
        }
    }
    
    /// A preinstalled icon.
    public enum DefaultIcon: String, CaseIterable {
        // Document Actions
        case documentNew
        case documentOpen
        case documentOpenRecent
        case documentPageSetup
        case documentPrint
        case documentProperties
        case documentSave
        case documentSend
        
        // Edit Actions
        case editClear
        case editCopy
        case editCut
        case editDelete
        case editFind
        case editPaste
        case editRedo
        case editUndo
        
        // Format Actions
        case formatIndentLess
        case formatIndentMore
        case formatJustifyCenter
        case formatJustifyFill
        case formatJustifyLeft
        case formatJustifyRight
        case formatTextBold
        case formatTextItalic
        case formatTextUnderline
        case formatTextStrikethrough
        
        // Navigation
        case goDown
        case goHome
        case goNext
        case goPrevious
        case goUp
        
        // Media Controls
        case mediaEject
        case mediaPlaybackPause
        case mediaPlaybackStart
        case mediaPlaybackStop
        case mediaRecord
        case mediaSeekBackward
        case mediaSeekForward
        case mediaSkipBackward
        case mediaSkipForward
        
        // System
        case systemLockScreen
        case systemLogOut
        case systemSearch
        case systemReboot
        case systemShutdown
        
        // Window
        case windowClose
        case windowNew
        
        // View
        case viewFullscreen
        case viewRefresh
        case viewRestore
        case zoomFitBest
        case zoomIn
        case zoomOut
        
        // Status
        case audioVolumeHigh
        case audioVolumeLow
        case audioVolumeMedium
        case audioVolumeMuted
        case batteryLow
        case batteryCaution
        
        // Devices
        case audioCard
        case audioInputMicrophone
        case battery
        case cameraPhoto
        case computer
        case driveHarddisk
        case driveOptical
        case printer
        
        // Weather
        case weatherClear
        case weatherClearNight
        case weatherFewClouds
        case weatherFog
        case weatherShowers
        case weatherSnow
        case weatherStorm
        
        /// A string representation of the icon.
        public var string: String {
            var string = rawValue
            let result = string
                .map { letter in
                    if letter.isUppercase {
                        return "-\(letter)"
                    } else {
                        return "\(letter)"
                    }
                }
                .joined()
            string = result.lowercased()
            string = string.replacingOccurrences(of: "_plus_", with: "+")
            string = string.replacingOccurrences(of: "_", with: "-")
            return string
        }
    }
}

