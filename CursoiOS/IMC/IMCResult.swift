//
//  IMCResult.swift
//  CursoiOS
//
//  Created by PABLO MATEOS, Vodafone on 11/6/25.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        let result = userWeight / pow(userHeight/100, 2.0)
        VStack {
            Text("Resultado: ")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            InformationView(result: result)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct InformationView: View {
    let result: Double
    var body: some View {
        let completeResult = calculateResult(imcResult: result)
        VStack {
            Text(completeResult.resultTitle).font(.title).bold().foregroundColor(completeResult.color)
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundColor(completeResult.color)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16)
        .padding(16)
    }
}

func calculateResult(imcResult: Double) -> (resultTitle: String, color: Color) {
    let resultTitle: String
    let color: Color

    switch imcResult {
    case 0..<18.5:
        resultTitle = "Peso bajo"
        color = .yellow
    case 18.5..<25:
        resultTitle = "Peso normal"
        color = .green
    case 25..<30:
        resultTitle = "Sobrepeso"
        color = .orange
    case 30..<100:
        resultTitle = "Obesidad"
        color = .red
    default:
        resultTitle = "Error"
        color = .red
    }
    return (resultTitle: resultTitle,  color: color)
}

#Preview {
    IMCResult(userWeight: 68, userHeight: 170)
}
