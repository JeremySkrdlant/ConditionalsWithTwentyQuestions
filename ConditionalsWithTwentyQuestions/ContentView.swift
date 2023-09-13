//
//  ContentView.swift
//  ConditionalsWithTwentyQuestions
//
//  Created by Jeremy Skrdlant on 9/12/23.
//

import SwiftUI

struct ContentView: View {
    //Bools work really well with if then statements.
    @State var  locationIsSubmitted = false;
    @State var  location = ""
    @State var previousQuestions:[Question] = []
    
    var body: some View {
        //This decision shows a tab view if we have already submitted a location.
        if (locationIsSubmitted){
            
            TabView{
                DecisionView { result, questionText in
                    previousQuestions.append(Question(question: questionText, isTrue: result))
                }
                .tabItem {
                    Label("The Decider", systemImage: "person.fill.questionmark")
                }
                
                HistoryView(allQuestions: previousQuestions)
                    .tabItem {
                        Label("History", systemImage: "map")
                    }
                
                FinishView(answer: location, previousQuestions: previousQuestions) {
                    location = ""
                    previousQuestions = []
                    locationIsSubmitted = false
                }
                .tabItem {
                    Label("Final Guess", systemImage: "person.fill.checkmark")
                }
                
            }
        }else {
            //This code runs if we have not submitted a location yet.
            VStack {
                TextField("Enter a location on earth.", text: $location)
                Button {
                    print("Submitting")
                    locationIsSubmitted = true
                } label: {
                    Text("Submit")
                        .padding(.vertical, 30)
                        
                }

            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//This is the questin object. It stores two variables.  The question and the users response to the question.
struct Question:Hashable{
    var question:String
    var isTrue:Bool
}
