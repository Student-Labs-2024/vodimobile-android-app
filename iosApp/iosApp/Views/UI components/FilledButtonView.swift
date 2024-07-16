//
//  FilledButtonView.swift
//  iosApp
//
//  Created by Sergey Ivanov on 13.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct FilledButton: View {

    let configuration: ButtonStyle.Configuration

    @Environment(\.isEnabled) private var isEnabled: Bool

    var body: some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(isEnabled ? (configuration.isPressed ? Color.blueDarkColor : Color.blueColor) : Color.blueLightColor)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.button)
            .disabled(!isEnabled)
    }
}
