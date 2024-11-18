//
import SwiftUI


struct Questions{
    let title: String
    let answer: String
    let choices: [String]
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    QuestionView()
}

