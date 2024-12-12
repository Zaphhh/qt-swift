//
//  File.swift
//  Qt
//
//  Created by Zaph on 11/12/2024.
//

import Qlift

public struct VStack: QtWidget, Wrapper {
    
    var content: Body

    public init(@ViewBuilder content: @escaping () -> Body) {
        self.content = content()
    }

    public func container<Data>(
        data: WidgetData,
        type: Data.Type
    ) -> ViewStorage where Data: ViewRenderData {
        
        if content.count == 1, let element = content.first {
            return element.storage(data: data, type: type)
        }

        let container = QWidget()
        let layout = QVBoxLayout()
        
        var storages: [ViewStorage] = []

        for element in content {
            let storage = element.storage(data: data, type: type)
            storages.append(storage)
            if let widget = storage.pointer as? QWidget {
                layout.add(widget: widget, alignment: .AlignHCenter)
            }
        }

        container.layout = layout

        return ViewStorage(container, content: [.mainContent: storages])
    }

    public func update<Data>(
        _ storage: ViewStorage,
        data: WidgetData,
        updateProperties: Bool,
        type: Data.Type
    ) where Data: ViewRenderData {
        if content.count == 1, let element = content.first {
            element.updateStorage(storage, data: data, updateProperties: updateProperties, type: type)
        } else {
            guard let storages = storage.content[.mainContent] else { return }
            content.update(storages, data: data, updateProperties: updateProperties, type: type)
        }
    }
}
