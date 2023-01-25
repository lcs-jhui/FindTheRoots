//
//  ResultView.swift
//  FindTheRoots
//
//  Created by Justin Hui on 24/1/2023.
//

import SwiftUI

struct ResultView: View {
    
    //MARK: Stored Properties
    let somePrioresult: Result
    
    
    
    //MARK: Computed Properties
    var body: some View {
        
        VStack (spacing: 10){
            HStack(spacing: 30){
                
                VStack{
                    Text("a: \(resultForPreviews.a.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                }
                
                VStack{
                    Text("b: \(resultForPreviews.b.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                }
                
                VStack{
                    Text("c: \(resultForPreviews.c.formatted(.number.precision(.fractionLength(2))))")
                        .font(Font.custom("Times New Roman",
                                          size: 24.0,
                                          relativeTo: .body))
                    
                }
            }
            
            Text(somePrioresult.roots)
                .font(Font.custom("Times New Roman",
                                  size: 24.0,
                                  relativeTo: .body))
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePrioresult: resultForPreviews)
    }
}
