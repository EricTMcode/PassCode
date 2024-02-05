//
//  PasscodeView.swift
//  PassCode
//
//  Created by Eric on 05/02/2024.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    @State private var showPasscodeError = false
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("Please enter your 4-digit pin to securely access your account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
            
            PasscodeIndicatorView(passcode: $passcode)
            
            if showPasscodeError {
                Text("Incorrect passcode. Please try again")
                    .foregroundStyle(.red)
            }
            
            Spacer()
            
            NumberPadView(passcode: $passcode)
        }
        
        // IOS17
        .onChange(of: passcode) { oldValue, newValue in
            verifyPasscode()
        }
        
        // OLDER IOS
//        .onChange(of: passcode) { value in
//            verifyPasscode()
//        }
    }
    
    private func verifyPasscode() {
        guard passcode.count == 4 else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "1111"
            showPasscodeError = !isAuthenticated
            passcode = ""
        }
        
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
