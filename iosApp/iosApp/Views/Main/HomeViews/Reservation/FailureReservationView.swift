//
//  FailureReservationView.swift
//  iosApp
//
//  Created by Sergey Ivanov on 08.08.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct FailureReservationView: View {
    @Binding var showModal: Bool
    let executeClosure: () async -> Void

    var body: some View {
        VStack(spacing: 36) {
            HStack {
                Button(action: {
                    showModal.toggle()
                }, label: {
                    Image.xmark
                        .resizable()
                        .foregroundStyle(Color(R.color.text))
                        .fontWeight(.bold)
                        .frame(width: 18, height: 18)
                })
                .padding(.top, 10)
                .padding(.horizontal, 5)
                Spacer()
            }

            Image(R.image.failureCoin)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color(R.color.text))
                .padding(.horizontal, 110)
                .padding(.top, 40)

            VStack(alignment: .center, spacing: 24) {
                Text(R.string.localizable.requestFailedTitle)
                    .font(.header1).foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                Text(R.string.localizable.requestFailedText)
                    .font(.paragraph2)
                    .foregroundStyle(Color(R.color.text))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, 12)

            Button(R.string.localizable.reconnectButton(), action: {
                Task {
                    await executeClosure()
                }
            })
            .buttonStyle(BorderedBtnStyle())

            Spacer()
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    FailureReservationView(showModal: Binding.constant(true)) {
        print("retry button tapped")
    }
}
