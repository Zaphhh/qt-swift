import Qt

@main
struct helloWorld: App {

    let app = QtApp(id: "xyz.zaph.Demo")

    var scene: Scene {
        Window("Main Window", id: "main") { _ in
            ScrollView {
                veryLongView()
            }
        }
    }
    
    @ViewBuilder
    func veryLongView() -> Body {
        HStack {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
            Text("Item 4")
            Text("Item 5")
            Text("Item 6")
            Text("Item 7")
            Text("Item 8")
            Text("Item 9")
            Text("Item 10")
            Text("Item 11")
            Text("Item 12")
            Text("Item 13")
            Text("Item 14")
            Text("Item 15")
            Text("Item 16")
            Text("Item 17")
            Text("Item 18")
            Text("Item 19")
            Text("Item 20")
            Text("Item 21")
            Text("Item 22")
            Text("Item 23")
            Text("Item 24")
            Text("Item 25")
            Text("Item 26")
            Text("Item 27")
            Text("Item 28")
            Text("Item 29")
            Text("Item 30")
            Text("Item 31")
            Text("Item 32")
            Text("Item 33")
            Text("Item 34")
            Text("Item 35")
            Text("Item 36")
            Text("Item 37")
            Text("Item 38")
            Text("Item 39")
            Text("Item 40")
            Text("Item 41")
            Text("Item 42")
            Text("Item 43")
            Text("Item 44")
            Text("Item 45")
            Text("Item 46")
            Text("Item 47")
            Text("Item 48")
            Text("Item 49")
            Text("Item 50")
            
            
        }
    }
}
