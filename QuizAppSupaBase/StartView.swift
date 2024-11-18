import SwiftUI

struct StartView: View {
    @Environment(\.dismiss) var dismiss
    
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

                   Text("Are you ready to start?")
                       .font(.custom("Impact", size: 30))
                       .foregroundColor(.white)
                       .padding()
                       .shadow(color: .black.opacity(0.5), radius: 5, x: 2, y: 2)
                       .accessibilityLabel(Text("Start Quiz Question"))

                   Button(action: {
                       dismiss()
                   }) {
                       Text("Start")
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

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
