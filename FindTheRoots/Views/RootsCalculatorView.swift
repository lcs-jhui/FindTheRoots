//
//  RootsCalculatorView.swift
//  FindTheRoots
//
//  Created by Justin Hui on 24/1/2023.
//

import SwiftUI

struct RootsCalculatorView: View {
    
    //MARK: Stored Properties
    @State var a: Double = 1.0
    @State var b: Double = -6.0
    @State var c: Double = 9.0

    //List of prior results
    @State var priorResults: [Result] = []

    //MARK: Computed Properties
    
    //The result, possibilties are:
    //1. Discriminant is negative, no real roots
    //2. Discriminant is zero, so two equal real roots
    //3. Driscriminant is positive, so two different real roots
    
    var result: String {
        
        let discriminant = b * b - 4 * a * c
        
        //Check for negative discriminant (no solution)
        if discriminant < 0 {
            return "No real roots."
        } else {
            let x1 = ( b * -1 - discriminant.squareRoot() ) / (2 * a)
            let x2 = ( b * -1 + discriminant.squareRoot() ) / (2 * a)
            
            return "x = \(x1.formatted(.number.precision(.fractionLength(2)))) and x = \(x2.formatted(.number.precision(.fractionLength(2))))"
        }
    }
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 10){
                
                Image("QuadraticFormula")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                Image("StandardForm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                
                HStack(spacing: 20){
                    
                    VStack{
                        Text("a: \(a.formatted(.number.precision(.fractionLength(2))))")
                            .font(Font.custom("Times New Roman",
                                              size: 24.0,
                                              relativeTo: .body))
                        
                       
                        Slider(value: $a,
                               in: 0.0...10.0,
                               label: {
                                    Text("Speed")
                        })
                    }
                    
                    VStack{
                        Text("b: \(b.formatted(.number.precision(.fractionLength(2))))")
                            .font(Font.custom("Times New Roman",
                                              size: 24.0,
                                              relativeTo: .body))
                        Slider(value: $b,
                               in: 0.0...10.0,
                               label: {
                                    Text("Speed")
                        })
                    }
                                        
                    VStack{
                        Text("c: \(c.formatted(.number.precision(.fractionLength(2))))")
                            .font(Font.custom("Times New Roman",
                                              size: 24.0,
                                              relativeTo: .body))
                        
                        Slider(value: $c,
                               in: 0.0...10.0,
                               label: {
                                    Text("Speed")
                        })
                    }
                }
                
                Text(result)
                    .font(Font.custom("Times New Roman",
                                         size: 24.0,
                                         relativeTo: .body))
                
                Button(action: {
                    let latestResult = Result(a: a,
                                              b: b,
                                              c: c,
                                              roots: result)
                    priorResults.append(latestResult)
                }, label: {
                    Text("Save Result")
                })
                .buttonStyle(.bordered)
                .padding()
                
                //Show prior results
                HStack{
                    Text("History")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                List(priorResults.reversed()) { currentResult in
                    HStack{
                        Spacer()
                        ResultView(somePrioresult: currentResult)
                        Spacer()
                    }
                }
                Spacer()
                
            }
            
            .padding()
            .navigationTitle("Find The Roots")
        }
    }
}

struct RootsCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        RootsCalculatorView()
            .preferredColorScheme(.dark)
    }
}
