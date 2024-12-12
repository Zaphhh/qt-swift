//
//  File.swift
//  Qt
//
//  Created by Zaph on 11/12/2024.
//
import Qlift

public struct EitherView: QtWidget, Meta.EitherView {

    var condition: Bool
    var view1: Body
    var view2: Body

    public init(
        _ condition: Bool,
        @ViewBuilder view1: () -> Body,
        @ViewBuilder else view2: () -> Body
    ) {
        self.condition = condition
        self.view1 = view1()
        self.view2 = view2()
    }

    public func container<Data>(
        data: WidgetData,
        type: Data.Type
    ) -> ViewStorage where Data: ViewRenderData {
        let container = QWidget()
        let storage = ViewStorage(container)
        update(storage, data: data, updateProperties: true, type: type)
        return storage
    }

    public func update<Data>(
        _ storage: ViewStorage,
        data: WidgetData,
        updateProperties: Bool,
        type: Data.Type
    ) where Data: ViewRenderData {
        guard let container = storage.pointer as? QWidget else { return }

        let body = condition ? view1 : view2
        let key = condition.description

        if let content = storage.content[key]?.first {
            body.updateStorage(content, data: data, updateProperties: updateProperties, type: type)
        } else {
            let content = body.storage(data: data, type: type)
            storage.content[key] = [content]

            if let widget = content.pointer as? QWidget {
                if container.layout == nil {
                    container.layout = QVBoxLayout()
                }
                container.layout?.add(widget: widget)
            }
        }

        if (storage.previousState as? Self)?.condition != condition {
            let oldKey = (!condition).description
            if let oldWidget = storage.content[oldKey]?.first?.pointer as? QWidget {
                oldWidget.visible = false
            }
            if let newWidget = storage.content[key]?.first?.pointer as? QWidget {
                newWidget.visible = true
            }
        }

        storage.previousState = self
    }
}
