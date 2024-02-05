//
//  PasscodeIndicatorView.swift
//  PassCode
//
//  Created by Eric on 05/02/2024.
//

import SwiftUI

struct PasscodeIndicatorView: View {
    @Binding var passcode: String
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(0..<4) { index in
                Circle()
                    .fill(passcode.count > index ? .primary : Color(.white))
                    .frame(width: 20, height: 20)
                    .overlay {
                        Circle()
                            .stroke(.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    }
            }
        }
    }
}

#Preview {
    VStack {
        PasscodeIndicatorView(passcode: .constant(""))
        PasscodeIndicatorView(passcode: .constant("421"))
    }
}
