//
//  Constants.swift
//  iosApp
//
//  Created by Sergey Ivanov on 10.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

public let emailRegex = #"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
public let phoneRegex = #"^\+(?:[0-9] ?-?){6,14}[0-9]$"#

// UI paddings

/// UI general paddings
public let horizontalPadding: CGFloat = 16
public let checkboxLeadingPadding: CGFloat = 14
public let spacingBetweenCheckboxAndText: CGFloat = 16
public let checkboxSize: CGFloat = 21
public let аuthScreencontentTopPadding: CGFloat = 120

/// UI screen paddings
struct StartScreenConfig {
    static let spacingBetweenComponents: CGFloat = 20
    static let xmarkSize: CGFloat = 15
    static let xmarkTopPadding: CGFloat = 10
    static let logoHorizontalPadding: CGFloat = 50
}

struct AuthAndRegScreensConfig {
    static let spacingBetweenGroupAndCheckbox: CGFloat = 10
    static let spacingBetweenComponents: CGFloat = 18
}

struct ConditionScreenConfig {
    static let paddings: CGFloat = 24
}

struct PinCodeConfig {
    static let spacingBetweenGroupAndResendText: CGFloat = 10
    static let spacingBetweenMainComponents: CGFloat = 25
    static let contentTopPadding: CGFloat = 40
    static let spacingBetweenPincodeCells: CGFloat = 16
    static let pincodeCellsSize: CGFloat = 56
    static let verticalSpacingBetweenPincodeField: CGFloat = 20
}
