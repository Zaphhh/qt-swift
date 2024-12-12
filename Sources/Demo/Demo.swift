import Qt

@main
struct helloWorld: App {

    let app = QtApp(id: "xyz.zaph.Demo")

    var scene: Scene {
        Window("Main Window", id: "main") { _ in
            VStack {
                Label("Welcome to the Demo App")
                    .alignment(.AlignHCenter)
                    .wrappable()
                
                Button("New Document", icon: .default(.documentNew)) {
                    print("New Document button clicked")
                }
                .alignment(.AlignHCenter)
                
                Button("Open Document", icon: .default(.documentOpen)) {
                    print("Open Document button clicked")
                }
                .alignment(.AlignHCenter)
                
                Button("Save Document", icon: .default(.documentSave)) {
                    print("Save Document button clicked")
                }
                .alignment(.AlignHCenter)
                
                Button("Print Document", icon: .default(.documentPrint)) {
                    print("Print Document button clicked")
                }
                .alignment(.AlignHCenter)
                
                Label("Thank you for using the Demo App")
                    .alignment(.AlignHCenter)
                    .wrappable()
            }
        }
    }
}
