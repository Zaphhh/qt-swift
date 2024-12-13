//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct ScrollView: QtWidget {
    
    var content: Body
    
    public init(@ViewBuilder content: @escaping () -> Body) {
        self.content = content()
    }
    
    public func container<Data>(
        data: WidgetData,
        type: Data.Type
    ) -> ViewStorage where Data: ViewRenderData {
        let scrollArea = QScrollArea()
        
        scrollArea.widgetResizable = true
        scrollArea.horizontalScrollBarPolicy = .ScrollBarAsNeeded
        scrollArea.verticalScrollBarPolicy = .ScrollBarAsNeeded
        
        // Add content
        let storage = content.storage(data: data, type: type)
        if let widget = storage.pointer as? QWidget {
            scrollArea.setWidget(widget)
        }
        
        return ViewStorage(scrollArea, content: [.mainContent: [storage]])
    }
    
    public func update<Data>(
        _ storage: ViewStorage,
        data: WidgetData,
        updateProperties: Bool,
        type: Data.Type
    ) where Data: ViewRenderData {
        guard let storages = storage.content[.mainContent] else { return }
        guard let contentStorage = storages.first else { return }
        content.updateStorage(contentStorage, data: data, updateProperties: updateProperties, type: type)
    }
}


