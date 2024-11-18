//
//  ContentView.swift
//  QuizAppSupaBase
//
//  Created by Nilüfer Altınoluk on 11.11.2024.
//

import SwiftUI



struct ContentView: View {
    @StateObject var manager = QuizManager()
    @State var selection = 0
    @State var showStart = false
    @State var showResults = false
    
    var body: some View {
        TabView(selection: $selection){
            ForEach(manager.questions.indices, id: \.self) { index in
                VStack{
                    Spacer()
                    QuestionsView(question: $manager.questions[index])
                    Spacer()
                    if let lastQuestion = manager.questions.last,
                       lastQuestion.id == manager.questions[index].id {
                        Button {
                            manager.gradeQuiz()
                            showResults = true
                            manager.resetQuiz()
                            selection = 0
                        } label: {
                            Text("submit")
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius:  20, style: .continuous)
                                        .fill(Color("Button"))
                                        .frame(width: 340)
                                )
                        }
                        .buttonStyle(.plain)
                        .disabled(!manager.canSubmitQuiz())
                    }
                }
                .tag(index)
                
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .fullScreenCover(isPresented: $showStart){
            StartView()
        }
        .fullScreenCover(isPresented: $showResults) {
            ResultsView( result: manager.quizResult)
         }
    }
         
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


