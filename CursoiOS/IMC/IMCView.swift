//
//  IMCView.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 10/6/25.
//

import SwiftUI

struct IMCView: View {
    
//    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    @State var gender: Int = 0
    @State var height: Double = 100
    @State var weight: Int = 60
    @State var age: Int = 18
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightSelector(selectedHeight: $height)
            HStack {
                AgeAndWeightSelector(componentTitle: "Edad", selectedData: $age)
                AgeAndWeightSelector(componentTitle: "Peso", selectedData: $weight)
            }
            CalcButton(weight: Double(weight), height: height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator").bold().foregroundColor(.white)
                }
            }
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        Button {
            selectedGender = gender
        } label: {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.white)
    }
}



struct HeightSelector: View {
    @Binding var selectedHeight: Double
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

struct AgeAndWeightSelector: View {
    let componentTitle: String
    @Binding var selectedData: Int
    
    var body: some View {
        VStack {
            TitleText(text: componentTitle)
            InformationText(text: "\(selectedData)")
            HStack {
                Button {
                    selectedData -= 1
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.purple)
                }
                Button {
                    selectedData += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.purple)
                }

            }.padding(.horizontal, 25)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

struct CalcButton: View {
    var weight: Double
    var height: Double
    var body: some View {
        NavigationStack {
            NavigationLink {
                IMCResult(userWeight: weight, userHeight: height)
            } label: {
                Text("Calcular")
                    .font(.title).bold().foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(.backgroundComponent)
                    .padding(.bottom, 15)
            }
        }
    }
}

#Preview {
    IMCView()
}
