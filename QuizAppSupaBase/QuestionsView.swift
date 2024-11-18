import SwiftUI

struct Questions: Identifiable, Decodable {
    let id: Int
    let createdAt: String
    let title: String
    let answer: String
    let choices: [String]
    var selection: String?
}




struct QuestionsView: View {
    @Binding var question: Questions
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            
            
            
            ForEach(question.choices, id:\.self) { choice in
              
                HStack{
                    Button {
                        question.selection = choice
                        print(choice)
                    } label: {
                        if question.selection == choice {
                            Circle()
                                
                                .shadow(radius :3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("AppColor"))
                            
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                        }
                    }
                        
                    
                    Text(choice)
                        .foregroundColor(.white)
                    
                }
                
                    
                }
                
                
                
                
                
                
            }
            
            
            
        .foregroundColor(Color(uiColor: .secondaryLabel))
            .padding(.horizontal, 20)
            
            .frame(width: 350 ,height: 550)
            .background(Color(uiColor: .backGround))
            
            .cornerRadius(20)
            .shadow(color: Color(uiColor: .label).opacity(0.2), radius: 15)
            
        }
        
    }
    
    
    
    
struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(question: .constant(
            Questions(
                id: 1,
                createdAt: "",
                title: "What company was originally called Cadabra?",
                answer: "A",
                choices: ["A", "B", "C", "D"]
            )
        ))
    }
}
    

