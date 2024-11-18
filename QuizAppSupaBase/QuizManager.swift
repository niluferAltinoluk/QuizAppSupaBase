import Foundation
import Supabase

class QuizManager: ObservableObject {
    
    @Published var questions  = [Questions]()
    @Published var quizResult = QuizResult(correct: 0, total: 0, grade: "100%")
    
    
  //  @Published var mockQuestions = [
    //     Questions(title:"What company was originally called Cadabra?", answer: "A", choices: ["A", "B", "C", "D"]),
    //     Questions(title:"What company was originally called Cadabra?", answer: "A", choices: ["A", "B", "C", "D"]),
    //    Questions(title:"What company was originally called Cadabra?", answer: "A", choices: ["A", "B", "C", "D"]),
    //  Questions(title:"What company was originally called Cadabra?", answer: "A", choices: ["A", "B", "C", "D"])
       
    //  ]
    let client = SupabaseClient(supabaseURL: URL(string: "https://lfdoujpmusbbbtxwmqmd.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxmZG91anBtdXNiYmJ0eHdtcW1kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1MjYxMTksImV4cCI6MjA0NzEwMjExOX0.lFTotpDp2IwmbVsQtFOzrhr2hjY7Xp1GYiCxXvVfpoQ")
    
    init() {
        Task {
            do {
                let response = try await client.database.from("quiz").select().execute()
                let data = response.data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let questions = try decoder.decode([Questions].self, from: data)
                await MainActor.run {
                    self.questions = questions
                }
               
            } catch {
                print("error")
            }
        }
    }
    
    func canSubmitQuiz() -> Bool {
        
        return questions.filter({ $0.selection == nil }).isEmpty
    }
    func gradeQuiz()  {
        var correct: CGFloat = 0
        for question in questions {
            if question.answer == question.selection {
                correct += 1
                
            }
        }
        self.quizResult = QuizResult(correct: Int(correct), total: questions.count, grade:
                            "\((correct/CGFloat(questions.count))*100)%")
    }
    
    func resetQuiz() {
        self.questions = questions.map({Questions(id: $0.id, createdAt: $0.createdAt, title: $0.title, answer: $0.answer, choices: $0.choices, selection: nil)})
    }
}

struct QuizResult {
    let correct: Int
    let total: Int
    let grade: String
}
