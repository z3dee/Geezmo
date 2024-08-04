//
//  MainView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI

struct MainView: View {
    @Environment(\.scenePhase) var scenePhase
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            ScrollView([], showsIndicators: false) {
                VStack {
                    Spacer().frame(height: 25)

                    if viewModel.preferencesAlternativeView {
                        if viewModel.colorButtonsPresented {
                            ButtonGroupColorAlternativeView()
                                .environmentObject(viewModel)
                        } else {
                            ButtonGroupDefaultAlternativeView()
                                .environmentObject(viewModel)
                        }
                    } else {
                        if viewModel.colorButtonsPresented {
                            ButtonGroupColorView()
                                .environmentObject(viewModel)
                        } else {
                            ButtonGroupDefaultView()
                                .environmentObject(viewModel)
                        }
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.keyboard)
            .background(Color(uiColor: .systemGray6))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 5) {
                        Text(Strings.General.shortAppName)
                            .font(.system(size: Globals.smallTitleSize, weight: .bold, design: .rounded))
                            .foregroundColor(.accent)
                    }
                    .padding(.leading, Globals.iconPadding)
                    .padding(.top, 10)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "keyboard.fill")
                        .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.trailing, Globals.iconPadding)
                        .padding(.top, 10)
                        .onTapGesture {
                            viewModel.keyboardPresented = true
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(
                        systemName: viewModel.isConnected ?
                        "checkmark.circle.fill" : "exclamationmark.circle.fill"
                    )
                    .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
                    .foregroundStyle(.white, viewModel.isConnected ? .green : .red)
                    .padding(.trailing, Globals.iconPadding)
                    .padding(.top, 10)
                    .contentTransition(.symbolEffect(.replace.byLayer))
                    .onTapGesture {
                        viewModel.alert("Hello, world!", message: "I have something to tell ya!")
                        //viewModel.pinPadPresented = true
                        //viewModel.showConnectionStatus()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.trailing, Globals.iconPadding)
                        .padding(.top, 10)
                        .onTapGesture {
                            viewModel.preferencesPresented = true
                            
                            if viewModel.preferencesHapticFeedback {
                                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                            }
                        }
                }
            }
            .alert(isPresented: $viewModel.isAlertPresented) {
                Alert(
                    title: Text(viewModel.alertTitle ?? ""),
                    message: Text(viewModel.alertMessage ?? ""),
                    dismissButton: .none
                )
            }
            .sheet(
                isPresented: $viewModel.preferencesPresented,
                onDismiss: {
                    viewModel.navigationPath.removeAll()
                }, content: {
                    PreferencesView(viewModel: viewModel)
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(24)
                }
            )
            .sheet(
                isPresented: $viewModel.keyboardPresented,
                onDismiss: {
                    if viewModel.isFocused { viewModel.sendKey(.back) }
                },
                content: {
                    KeyboardView(showModal: $viewModel.keyboardPresented, viewModel: viewModel)
                        .presentationDetents([.height(55)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(12)
                }
            )
            .sheet(
                isPresented: $viewModel.pinPadPresented,
                content: {
                    PinPadView(showModal: $viewModel.pinPadPresented, viewModel: viewModel)
                        .presentationDetents([.height(115)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(24)
                }
            )
            .sheet(
                isPresented: $viewModel.isToastPresented,
                onDismiss: {
                    if viewModel.toastConfiguration == .prompted && viewModel.isConnected {
                        viewModel.toast(.promptAccepted)
                    }
                },
                content: {
                    ToastSheetView(configuration: viewModel.toastConfiguration!, viewModel: viewModel)
                        .presentationDetents([.height(175)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(24)
                        .onTapGesture {
                            guard viewModel.toastConfiguration?.closeOnTap == true else {
                                return
                            }
                            viewModel.isToastPresented = false
                        }
                }
            )
            .onChange(of: scenePhase) {
                viewModel.handleScenePhase(scenePhase)
            }
            .onAppear {
                checkLocalNetworkAuthorization()
            }
        }
    }
}

private extension MainView {
    func checkLocalNetworkAuthorization() {
        let authorization = LocalNetworkAuthorization()
        authorization.requestAuthorization { granted in
            if granted {
                print("Permission Granted")
                if AppSettings.shared.host == nil {
                    viewModel.preferencesPresented = true
                }
            } else {
                viewModel.alert(
                    "Permission Denied",
                    message: "Multicast networking permissions are required to discover and connect to your TV. Please enable these permissions in Settings."
                )
            }
        }
    }
}
