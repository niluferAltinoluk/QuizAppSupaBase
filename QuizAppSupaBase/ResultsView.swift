import SwiftUI

struct ResultsView: View {
    @Environment(\.dismiss) var dismiss
    @State var result: QuizResult
    var body: some View {
    ZStack {
        Image("cloud")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 30)
          

        VStack {
             Spacer()

            Text("Quick Quiz")
                .font(.custom("Impact", size: 80))
                .shadow(color: .black, radius: 5, x: 2, y: 2)
                .padding()
                .accessibilityLabel(Text("App Title"))

            Text("Results")
                .font(.custom("Impact", size: 50))
                .foregroundColor(.white)
                .padding()
                .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                
            
            
                Text("\(result.correct) out of \(result.total)")
                    .font(.custom("Impact", size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                Text(result.grade)
                    .font(.custom("Impact", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
            
               
            
            Text("You were amazing")
                .font(.custom("Impact", size: 30))
                .foregroundColor(.white)
                .padding()
                .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                

            Button(action: {
                dismiss()
            }) {
                Text("Try again")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: 300)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)

            }
            .padding()

            Spacer() // Adjust spacing for visual hierarchy
        }
    }
    .background(Color.black.opacity(0.3)) // Add subtle background dim
    .foregroundColor(.white) // Set default text color
}
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(result: .init(correct: 8 , total: 10, grade: "80%"))
   }
}
