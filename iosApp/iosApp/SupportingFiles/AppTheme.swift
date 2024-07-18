//
//  AppTheme.swift
//  iosApp
//
//  Created by Sergey Ivanov on 09.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import UIKit
import SwiftUI
import RswiftResources


extension Font {
    public static let header1: Font = Font(R.font.akzidenzGroteskProMdEx(size: 18) ?? .systemFont(ofSize: 18))
    public static let header2: Font = Font(R.font.akzidenzGroteskProRegular(size: 20) ?? .systemFont(ofSize: 20))
    public static let header3: Font = Font(R.font.akzidenzGroteskProMdEx(size: 16) ?? .systemFont(ofSize: 16))
    public static let header4: Font = Font(R.font.akzidenzGroteskProExt(size: 15) ?? .systemFont(ofSize: 15))
    
    public static let button: Font = Font(R.font.akzidenzGroteskProMdEx(size: 16) ?? .systemFont(ofSize: 16))
    public static let buttonText: Font = Font(R.font.akzidenzGroteskProLight(size: 14) ?? .systemFont(ofSize: 14))
    public static let buttonCheckBox: Font = Font(R.font.akzidenzGroteskProLight(size: 14) ?? .systemFont(ofSize: 14))
    public static let buttonTabbar: Font = Font(R.font.akzidenzGroteskProMd(size: 12) ?? .systemFont(ofSize: 12))
    
    public static let paragraph1: Font = Font(R.font.akzidenzGroteskProMd(size: 18) ?? .systemFont(ofSize: 18))
    public static let paragraph2: Font = Font(R.font.akzidenzGroteskProRegular(size: 16) ?? .systemFont(ofSize: 16))
    public static let paragraph3: Font = Font(R.font.akzidenzGroteskProLight(size: 14) ?? .systemFont(ofSize: 14))
    public static let paragraph4: Font = Font(R.font.akzidenzGroteskProRegular(size: 14) ?? .systemFont(ofSize: 14))
    public static let paragraph5: Font = Font(R.font.akzidenzGroteskProLight(size: 14) ?? .systemFont(ofSize: 14))
    public static let paragraph6: Font = Font(R.font.akzidenzGroteskProLight(size: 12) ?? .systemFont(ofSize: 12))
}

struct FilledBtnStyle: ButtonStyle {
    
    public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        FilledButton(configuration: configuration)
    }
}

struct BorderedBtnStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? Color(uiColor: R.color.blueColor() ?? .clear): .white)
            .foregroundColor(configuration.isPressed ? .white : Color(R.color.blueColor))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(R.color.blueColor), lineWidth: configuration.isPressed ? 0 : 2)
            )
            .border(Color(R.color.blueColor), width: configuration.isPressed ? 0 : 2)
            .cornerRadius(15)
            .font(.button)
    }
}

struct BorderedTextFieldStyle: TextFieldStyle {
    var text: String
    var isFocused: Bool
    var isValid: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(alignment: .leading)
            .font(.paragraph4)
            .padding(16)
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
            .background(Color(R.color.grayLightColor))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(!isValid && !text.isEmpty ? Color(R.color.redColor) : Color(R.color.grayDarkColor), lineWidth: isFocused || (!isValid && !text.isEmpty) ? 1 : 0)
            )
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    var text: String
    var isFocused: Bool
    var isValid: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(alignment: .leading)
            .font(.paragraph4)
            .padding(16)
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
            .background(Color(R.color.grayLightColor))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(!isValid && !text.isEmpty ? Color(R.color.redColor) : Color(R.color.grayDarkColor), lineWidth: isFocused || (!isValid && !text.isEmpty) ? 1 : 0)
            )
    }
}

extension UIColor {
    
    // Definision color by hex format
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
