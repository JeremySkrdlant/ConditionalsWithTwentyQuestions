//
//  HistoryView.swift
//  ConditionalsWithTwentyQuestions
//
//  Created by Jeremy Skrdlant on 9/12/23.
//

import SwiftUI

struct HistoryView: View {
    //Our app passes in all the questions so far.  You see the questions on the right because they were passed in through the preview view at the bottom.
    var allQuestions:[Question] = []
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach (allQuestions, id:\.self){
                    question in
                    
                    HStack{
                        //The question struct is in the ContentView file. It has a question and a isTrue that we can use with dot notation.
                        Text(question.question)
                            .padding(.leading)
                        Spacer()
                        
                        //We can display different information based on if the question is true or not. isTrue is a property of the question type that we made in content view.
                        if (question.isTrue){
                            Text("true 👍")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }else {
                            Text("false 👎")
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                    .padding(.vertical, 10)
                    .border(Color.gray)
                }
            }
        }.padding()
       
    }
}

//This preview has our all questions filled out with fake data to help design the view.
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(allQuestions: [Question(question: "Does it float", isTrue: false), Question(question: "Is it Landlocked", isTrue: true)])
    }
}
