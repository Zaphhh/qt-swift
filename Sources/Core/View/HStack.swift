//
//  File.swift
//  Qt
//
//  Created by Zaph on 12/12/2024.
//

import Qlift

public struct HStack: QtWidget, Wrapper {

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
        let layout = QHBoxLayout()

        layout.add(item: QSpacerItem(width: 0, height: 0, horizontalPolicy: .Expanding, verticalPolicy: .Minimum))

        var storages: [ViewStorage] = []

        for element in content {
            let storage = element.storage(data: data, type: type)
            storages.append(storage)
            if let widget = storage.pointer as? QWidget {
                if let button = widget as? QPushButton,
                    let buttonView = element as? Button
                {
                    layout.add(widget: widget, alignment: buttonView.alignment)
                } else if let label = widget as? QLabel,
                    let textView = element as? Text
                {
                    layout.add(widget: widget, alignment: textView.alignment)
                } else {
                    layout.add(widget: widget)
                }
                widget.sizePolicy = QSizePolicy(horizontal: .Preferred, vertical: .Fixed)
            }
        }

        layout.add(item: QSpacerItem(width: 0, height: 0, horizontalPolicy: .Expanding, verticalPolicy: .Minimum))

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
