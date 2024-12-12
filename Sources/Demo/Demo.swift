import Qt

@main
struct helloWorld: App {

    let app = QtApp(id: "AppName")

    var scene: Scene {
        Window("Main Window", id: "main") { _ in
            VStack {
                Label("Hello, world!")
            }
        }
    }
}

