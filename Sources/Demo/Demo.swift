import Qt

@main
struct helloWorld: App {

    let app = QtApp(id: "xyz.zaph.Demo")

    var scene: Scene {
        Window("Main Window", id: "main") { _ in
            VStack {
                Label("Hello, world!")
            }
        }
    }
}

