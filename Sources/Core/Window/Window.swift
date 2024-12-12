//
//  File.swift
//  Qt
//
//  Created by Zaph on 11/12/2024.
//

import Foundation
import Qlift

public struct Window: QtSceneElement {

    public var id: String
    var title: String
    var content: (QtWindow) -> Body
    var open: Int

    var width: Binding<Int>?
    var height: Binding<Int>?
    var resizable: Bool?
    var deletable: Bool?

    public class QtWindow {

        var window: QMainWindow
        var central: QWidget

        init() {
            window = QMainWindow()
            central = QWidget()

            window.centralWidget = central
        }

        public func close() {
            _ = window.close()
        }

    }

    public init(
        _ title: String = "",
        id: String,
        open: Int = 1,
        @ViewBuilder content: @escaping (QtWindow) -> Body
    ) {
        self.title = title
        self.content = content
        self.id = id
        self.open = open
    }

    public func setupInitialContainers<Storage>(app: Storage) where Storage: Meta.AppStorage {
        for _ in 0..<open {
            let container = container(app: app)
            container.show()
            app.storage.sceneStorage.append(container)
        }
    }

    public func container<Storage>(app: Storage) -> Meta.SceneStorage where Storage: Meta.AppStorage {
        let window = QtWindow()
        let storage = SceneStorage(id: id, pointer: window) {
            window.window.show()
        }
    
        let contentStorage = content(window)
            .storage(data: .init(sceneStorage: storage, appStorage: app), type: QtMainView.self)
    
        if let widget = contentStorage.pointer as? QWidget {
            window.window.centralWidget = widget
        }
    
        storage.content[.mainContent] = [contentStorage]
    
        window.window.windowTitle = title
    
        return storage
    }

    public func update<Storage>(_ storage: Meta.SceneStorage, app: Storage, updateProperties: Bool) where Storage: Meta.AppStorage {
        guard let window = storage.pointer as? QtWindow,
            let contentStorage = storage.content[.mainContent]?.first
        else {
            return
        }

        content(window).updateStorage(
            contentStorage,
            data: .init(sceneStorage: storage, appStorage: app),
            updateProperties: updateProperties,
            type: QtMainView.self
        )

        guard updateProperties else {
            return
        }

        let previousState = storage.previousState as? Self

        if title != previousState?.title {
            window.window.windowTitle = title
        }

        if let width = width?.wrappedValue, let height = height?.wrappedValue {
            window.window.resize(width: Int32(width), height: Int32(height))
        }

        if resizable != previousState?.resizable {
            let size = QSize(
                width: resizable == true ? -1 : window.window.width,
                height: resizable == true ? -1 : window.window.height)
            window.window.setFixedSize(size)
        }

        storage.previousState = self
    }

    public func frame(width: Binding<Int>? = nil, height: Binding<Int>? = nil) -> Self {
        var newSelf = self
        newSelf.width = width
        newSelf.height = height
        return newSelf
    }

    public func resizable(_ resizable: Bool = true) -> Self {
        var newSelf = self
        newSelf.resizable = resizable
        return newSelf
    }
}

public typealias QtWindow = Window.QtWindow
