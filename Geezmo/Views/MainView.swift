//
//  MainView.swift
//  Geezmo
//
//  Created by Ярослав Седышев on 18.07.2024.
//

import SwiftUI
import PopupView

struct MainView: View {
    @Environment(\.scenePhase) var scenePhase
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack {
            ScrollView([], showsIndicators: false) {
                VStack {
                    Spacer()

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
                
//                ToolbarItem(placement: .topBarTrailing) {
//                    Image(
//                        systemName: viewModel.isConnected ?
//                        "checkmark.circle.fill" : "exclamationmark.circle.fill"
//                    )
//                    .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
//                    .foregroundStyle(.white, viewModel.isConnected ? .green : .red)
//                    .padding(.trailing, Globals.iconPadding)
//                    .padding(.top, 10)
//                    .contentTransition(.symbolEffect(.replace.byLayer))
//                    .onTapGesture {
//                        viewModel.showConnectionStatus()
//                    }
//                }

//                ToolbarItem(placement: .topBarTrailing) {
//                    Image(systemName: "keyboard.fill")
//                        .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
//                        .foregroundColor(.secondary)
//                        .padding(.trailing, Globals.iconPadding)
//                        .padding(.top, 10)
//                        .onTapGesture {
//                            viewModel.keyboardPresented = true
//                        }
//                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "rectangle.grid.2x2.fill")
                        .font(.system(size: Globals.iconSize, weight: .bold, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding(.trailing, Globals.iconPadding)
                        .padding(.top, 10)
                        .onTapGesture {
                            viewModel.toast(Bool.random() ? .powerOn : .powerOff)
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
                if viewModel.alertConfiguration?.secondaryButton != nil {
                    Alert(
                        title: Text(viewModel.alertConfiguration?.title ?? ""),
                        message: Text(viewModel.alertConfiguration?.message ?? ""),
                        primaryButton: viewModel.alertConfiguration?.primaryButton ?? .cancel(),
                        secondaryButton: viewModel.alertConfiguration?.secondaryButton ?? .cancel()
                    )
                } else {
                    Alert(
                        title: Text(viewModel.alertConfiguration?.title ?? ""),
                        message: Text(viewModel.alertConfiguration?.message ?? ""),
                        dismissButton: viewModel.alertConfiguration?.primaryButton ?? .cancel()
                    )
                }
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
                onDismiss: {
                    if let pairingCode = viewModel.pairingCode, pairingCode.count == 8 {
                        viewModel.send(.setPin(pairingCode))
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Globals.TimeIntervals.medium) {
                            viewModel.pinPadPresented = true
                        }
                    }
                },
                content: {
                    PinPadView(showModal: $viewModel.pinPadPresented, viewModel: viewModel)
                        .presentationDetents([.height(115)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(24)
                }
            )
//            .popup(isPresented: $viewModel.isToastPresented) {
//                PopupView(
//                    viewModel: viewModel,
//                    configuration: viewModel.toastConfiguration!
//                )
//            } customize: { popup in
//                popup
//                    .type(.floater())
//                    .position(.bottom)
//                    .animation(.spring(duration: 0.35))
//                    .autohideIn(viewModel.toastConfiguration?.autohideIn)
//                    .closeOnTap(viewModel.toastConfiguration?.closeOnTap ?? true)
//                    .closeOnTapOutside(viewModel.toastConfiguration?.closeOnTapOutside ?? true)
//                    .backgroundColor(Color(uiColor: .black).opacity(0.3))
//                    .dismissCallback {
//                        if viewModel.toastConfiguration == .prompted && viewModel.isConnected {
//                            viewModel.toast(.promptAccepted)
//                        }
//                    }
//            }
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
                viewModel.navigateToDeviceDiscoveryViewIfNeeded(.fromMainView)
            }
        }
    }
}
