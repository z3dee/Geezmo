//
//  PinPadView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 30.07.2024.
//

import SwiftUI

struct PinPadView: View {
    private let placeholderChar = "_"
    private var viewModel: MainViewModel
    
    @FocusState private var focused: Bool
    @State private var inputString = ""
    @Binding var showModal: Bool
    
    @State private var pinArray = Array(repeating: "_", count: 8)
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 15) {
                ForEach(0..<pinArray.count, id: \.self) { index in
                    Text(pinArray[index])
                        .font(.system(size: 24, weight: .regular, design: .monospaced))
                        .foregroundColor(pinArray[index] == placeholderChar ? .secondary : .primary)
                }
            }
            .padding(.bottom, -15)
            
            TextField("", text: $inputString)
                .keyboardType(.numberPad)
                .focused($focused)
                .disableAutocorrection(true)
                .opacity(0)
                .frame(width: 0, height: 0)
                .onSubmit {
                    guard inputString != "" else { return }
                }
                .onChange(of: focused) {
                    showModal = focused
                }
                .onChange(of: inputString) {
                    if inputString.count == 8 {
                        viewModel.tv?.send(.setPin(inputString))
                        showModal = false
                    }
                    handleUserInput(inputString)
                }
        }
        .onAppear {
            focused = true
            inputString = ""
            if viewModel.preferencesHapticFeedback {
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
        }
    }
    
    init(showModal: Binding<Bool>, viewModel: MainViewModel) {
        UITextField.appearance().clearButtonMode = .whileEditing
        self._showModal = showModal
        self.viewModel = viewModel
    }
    
    private func handleUserInput(_ newValue: String) {
        for i in 0..<pinArray.count {
            if i < newValue.count {
                let index = newValue.index(newValue.startIndex, offsetBy: i)
                pinArray[i] = String(newValue[index])
            } else {
                pinArray[i] = placeholderChar
            }
        }
        
        if newValue.count == 8 {
            viewModel.tv?.send(.setPin(newValue))
            showModal = false
        }
    }
}
