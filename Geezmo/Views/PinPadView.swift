//
//  PinPadView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 30.07.2024.
//

import SwiftUI

struct PinPadView: View {
    private let placeholderChar = "·"
    private var viewModel: MainViewModel
    
    @FocusState private var focused: Bool
    @State private var inputString = ""
    @Binding var showModal: Bool
    
    @State private var pinArray: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(0..<pinArray.count, id: \.self) { index in
                        Text(pinArray[index])
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                            .foregroundColor(pinArray[index] == placeholderChar ? .gray.opacity(0.5) : .primary)
                    }
                }
                //.padding(.bottom, -25)
                
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
                        handleUserInput(inputString)
                    }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text(Strings.Titles.pairingTitle)
                        .font(.system(size: Globals.smallTitleSize, weight: .bold, design: .rounded))
                        .foregroundColor(.accent)
                        .padding(.trailing, Globals.iconPadding)
                        .padding(.top, 10)
                }
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
        self._pinArray = State(initialValue: Array(repeating: String(placeholderChar), count: 8))
    }
    
    private func handleUserInput(_ newValue: String) {
        for i in 0 ..< pinArray.count {
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
