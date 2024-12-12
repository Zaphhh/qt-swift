import Qt

@main
struct helloWorld: App {

    let app = QtApp(id: "xyz.zaph.Demo")

    var scene: Scene {
        Window("Main Window", id: "main") { _ in
            VStack {
                Button("Click me") {
                    print("I was clicked")
                }
                Label("Maybe this'll just work nice n all")
            }
        }
    }
}

