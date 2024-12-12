import Foundation
//
//  File.swift
//  Qt
//
//  Created by Zaph on 11/12/2024.
//
@_exported import Meta
@_exported import MetaSQLite
import Qlift

public class QtApp: AppStorage {

    // MARK: - Type Definitions
    public typealias SceneElementType = QtSceneElement
    public typealias WidgetType = QtWidget
    public typealias WrapperType = VStack

    // MARK: - Properties
    public var storage: StandardAppStorage = .init()
    private var application: QApplication?

    // MARK: - Initialization
    public required init(id: String) {
        let xdgDataHome =
            ProcessInfo.processInfo.environment["XDG_DATA_HOME"]
            ?? FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent(".local")
            .appendingPathComponent("share")
            .path

        DatabaseInformation.setPath(
            URL(fileURLWithPath: xdgDataHome)
                .appendingPathComponent(id)
                .appendingPathComponent("database.sqlite")
                .path
        )
    }

    // MARK: - App Lifecycle
    public func run(setup: @escaping () -> Void) {
        application = QApplication()
        setup()

        _ = application?.exec()
    }

    public func quit() {
        application?.quit()
    }

    // MARK: - Utilities
    public static func userDataDir() -> URL {
        if let xdgDataHome = ProcessInfo.processInfo.environment["XDG_DATA_HOME"] {
            return URL(fileURLWithPath: xdgDataHome)
        }
        return FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent(".local")
            .appendingPathComponent("share")
    }
}
