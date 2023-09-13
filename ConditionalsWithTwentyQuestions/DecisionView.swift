//
//  DecisionView.swift
//  ConditionalsWithTwentyQuestions
//
//  Created by Jeremy Skrdlant on 9/12/23.
//

import SwiftUI

struct DecisionView: View {
    
    //This is a closure.  We will cover these in much more detail next semester.  Basically it is a variable that has the type of a function. 🤯
    var addQuestion: (Bool, String)->Void
    
    @State var questionText = ""
    
    var body: some View {
        VStack {
            //This zstack is a square rotated at 45 degrees.  The text field is centered on top of it.
            ZStack {
                //Square
                Color.white
                    .frame(width: 200, height: 200)
                    .padding(1)
                    .background(Color.gray.shadow(radius: 3))
                    .rotationEffect(Angle(degrees: 45))
                //Text field
                TextField("Add Question", text: $questionText, axis: .vertical)
                    .frame(width: 150)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 80)
            
            HStack {
                Button {
                    //We call the closure from the very top.
                    addQuestion(true, questionText)
                    //We reset the textfield text to nothing for the next question.
                    questionText = ""
                } label: {
                    Text("Yes")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding()
                        .background(Color("Yes"))
                        .cornerRadius(10)
                        .shadow(radius: 3)
            }
                Button {
                    //Same as the yes button but we pass a false instead.
                    addQuestion(false, questionText)
                    questionText = ""
                } label: {
                    Text("No")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding()
                        .background(Color("No"))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
        }
    }
}

struct DecisionView_Previews: PreviewProvider {
    static var previews: some View {
        DecisionView{
            decision, question in
            print("\(question) is \(decision)")
        }
    }
}
