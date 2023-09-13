//
//  FinishView.swift
//  ConditionalsWithTwentyQuestions
//
//  Created by Jeremy Skrdlant on 9/12/23.
//

import SwiftUI

struct FinishView: View {
    @State var answer:String = "Lucas Kansas"
    @State var previousQuestions:[Question] = []
    var reset:()->Void
    @State var showAnswer = false
    
    var body: some View {
        VStack{
            VStack{
                Text(answer)
                    .font(.system(.title))
                Text("You asked \(previousQuestions.count) questions.")
                Button {
                    previousQuestions = []
                    answer = ""
                    showAnswer = false;
                    reset()
                } label: {
                    Text("Reset the Game")
                }
            }.frame(height: showAnswer ? 200 : 0)
                .clipped()
            //the height above is a form of if then known as a ternery operator.  it has the following form.
            // condition ? trueValue : falseValue
            
            Button {
                showAnswer = true
            } label: {
                Text("Show The Answer")
            }
            .frame(height: showAnswer ? 0 : 100)
            .clipped()
        }

        }
    
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView{
            print("yup")
        }
    }
}
