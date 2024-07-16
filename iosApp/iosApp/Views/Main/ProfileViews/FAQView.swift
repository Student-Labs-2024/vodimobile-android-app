//
//  FAQScreen.swift
//  iosApp
//
//  Created by Sergey Ivanov on 12.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct FAQScreenView: View {
    @State private var expandedIndices: [Bool]
    
    private var viewModel: FAQViewModel
    var attributedTitle: AttributedString {
        var attributedString = AttributedString("Вопрос-ответ от \"Водимобиль\"")
        attributedString.font = .header3
        
        if let range = attributedString.range(of: "Вопрос-ответ") {
            attributedString[range].foregroundColor = .blueColor
        }
        
        return attributedString
    }
    
    init() {
        self.viewModel = FAQViewModel()
        self.expandedIndices = Array(repeating: false, count: viewModel.listOfQuestions.count)
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    Text(attributedTitle)
                        .font(.header3)
                    Text("Найдите ответ на любой интересующий Вас вопрос.")
                        .font(.paragraph4)
                        .foregroundStyle(Color.grayTextColor)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(Color.blueBoxColor)
                .padding(.top, 10)
                
                LazyVStack(alignment: .leading) {
                    ForEach(0..<expandedIndices.count, id: \.self) { index in
                        DisclosureGroup(
                            isExpanded: $expandedIndices[index],
                            content: {
                                Text(viewModel.listOfQuestions[index].body)
                                    .font(.paragraph5)
                                    .multilineTextAlignment(.leading)
                                    .padding(24)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.grayLightColor))
                            },
                            label: {
                                Text(viewModel.listOfQuestions[index].title)
                                    .font(.header3)
                                    .foregroundStyle(Color.black)
                                    .multilineTextAlignment(.leading)
                            }
                        )
                        .tint(Color.black)
                        .padding(.top, 25)
                        .padding(.bottom, 5)
                        .onChange(of: expandedIndices[index]) { newValue in
                            withAnimation {
                                if newValue {
                                    for i in 0..<expandedIndices.count {
                                        if i != index {
                                            expandedIndices[i] = false
                                        }
                                    }
                                }
                            }
                        }
                        
                        if index < expandedIndices.count - 1 {
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            CustomToolbar(title: String.ScreenTitles.faqScreenTitle)
        }
    }
}

#Preview {
    FAQScreenView()
}
