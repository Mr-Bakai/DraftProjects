//
//  ReceiptView.swift
//  TransfersUI
//
//  Created by Bakai on 8/2/23.
//

import SwiftUI
import UIKit

struct ReceiptView: View {
    
    @StateObject private var screenSize = CheckDeviceViewModel()
    
    private let GRAPH_WIDTH = 0.08
    private let AMPLITUDE = 0.5
    
    private let SINFOFFSET: CGFloat = 8
    private let FLIPP_DEGREE: Double = 180
    
    enum ButtonType {
        case repeatPay
        case createTemplate
        case share
    }
    
    enum OperationStatus {
        case sent
        case inProgress
    }
    
    private let action: ((ButtonType) -> ())?
    private var recordTimes: Dictionary<String, String>
    
    public init(items: Dictionary<String, String>,
                action: ((ButtonType) -> ())?) {
        self.recordTimes = items
        self.action = action
    }
    
    var body: some View {
        VStack {
            crucialView()
        }
    }
    
    private func crucialView() -> some View {
        Group {
            if screenSize.screenSize {
                mainView()
            } else {
                mainViewWithScroll()
            }
        }
        .onAppear {
            screenSize.checkScreenSize()
        }
    }
    
    private func mainView() -> some View {
        ZStack {
            Color(hex: "#F7F6F9").ignoresSafeArea()
            VStack {
                checkView
                footerView()
                bottomButton
            }
            .background(Color(hex: "#F7F6F9"))
        }
    }
    
    private func mainViewWithScroll() -> some View {
        ZStack {
            VStack {
                ScrollView {
                    checkView
                }
                .background(Color(hex: "#F7F6F9").ignoresSafeArea(.container))
                
                VStack {
                    footerView()
                        .modifier(ApplyShadow())
                        .padding(.top, 16)
                    
                    bottomButton
                        .modifier(ApplyShadow())
                }
                .background(Color.white)
            }
        }
    }
    
    private var checkView: some View {
        VStack {
            SineShape(graphWidth: GRAPH_WIDTH, amplitude: AMPLITUDE)
                .offset(y: SINFOFFSET)
                .zIndex(1)
            VStack {
                headerView
                bodyView(recordTimes)
            }
            .background(Color.white)
            SineShape(graphWidth: GRAPH_WIDTH, amplitude: AMPLITUDE)
                .rotationEffect(.degrees(-FLIPP_DEGREE))
                .offset(y: -SINFOFFSET)
                .zIndex(1)
        }
        .clipped()
        .modifier(ApplyShadow())
        .padding(.vertical, 16)
        .padding(.horizontal, 21)
    }
    
    var headerView: some View {
        VStack {
            Image("optima.logo").padding(.top, 18)
            VStack {
                Image("tick.green")
                    .padding(.top, 18)
                    .padding(.bottom, 8)
                
                Text("Операция выполнена успешно!")
                    .foregroundColor(Color(hex: "#00A873"))
                    .font(.system(size: 14, weight: .medium))
                    .padding(.bottom, 10)
                
                Text("Перевод на сумму 200,00 KGS")
                    .font(.system(size: 12, weight: .regular))
                    .padding(.bottom, 16)
                
            }
            .frame(maxWidth: .infinity)
            .background(switchStatusToGetColor(.sent))
            .padding(.top, 12)
        }
    }
    
    private func bodyView(_ model: Dictionary<String, String>) -> some View {
        VStack {
            makeRowView(model)
        }
        .padding(.horizontal, 10)
    }
    
    private func makeRowView(_ model: Dictionary<String, String>) -> some View {
        VStack {
            ForEach(model.sorted(by: >), id: \.key) { key, value in
                HStack {
                    Group {
                        Text(key)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .medium))
                        Spacer()
                        Text(value)
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundColor(Color.black)
                }
                .padding(4)
            }
            Spacer()
            HStack {
                Spacer()
                switchStatusToGetImage(.inProgress)
            }
        }
    }
    
    private func switchStatusToGetColor(_ status: OperationStatus) -> Color {
        switch status {
        case .sent:
            return Color(hex: "00A873").opacity(0.08)
        case .inProgress:
            return Color(hex: "#FE8B4A").opacity(0.08)
        }
    }
    
    private func switchStatusToGetImage(_ status: OperationStatus) -> some View {
        switch status {
        case .sent:
            return Image("optima.stamp.sent").padding(.bottom, 16)
        case .inProgress:
            return Image("optima.stamp.progress").padding(.bottom, 16)
        }
    }
    
    private func footerView() -> some View {
        HStack(spacing: 13) {
            makeButton(.repeatPay)
            makeButton(.createTemplate)
            makeButton(.share)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 14)
    }
    
    private func makeButton(_ type: ButtonType) -> some View {
        HStack {
            Button {
                self.switchButtonType(type)
            } label: {
                self.switchToFillButtonData(type)
            }
        }
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(16)
        )
    }
    
    private func switchButtonType(_ type: ButtonType) {
        guard let action = action else { return }
        
        switch type {
        case .repeatPay:
            action(.repeatPay)
            
        case .createTemplate:
            action(.createTemplate)
            
        case .share:
            let image = checkView.snapshot()
            print(image)
            action(.share)
        }
    }
    
    private func switchToFillButtonData(_ type: ButtonType) -> some View {
        return VStack {
            switch type {
            case .repeatPay:
                Image("repeat")
                    .padding(.horizontal, 33)
                Text("Повторить\nплатеж")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
            case .createTemplate:
                Image("star")
                    .padding(.horizontal, 33)
                Text("Cоздать\nшаблон")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
            case .share:
                Image("share")
                    .padding(.horizontal, 33)
                Text("Поделиться\nчеком")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 12)
    }
    
    private var bottomButton: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                VStack {
                    Text("Вернуться в платежи")
                        .foregroundColor(.red)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    
                }
            }
        }
        .frame(height: 50)
        .padding(.top, 12)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct ReceiptView_Previews: PreviewProvider {
    
    static let recordTimes: Dictionary =
    
    [
        "Квитанция": "N 14052835",
        "Дата и время": "16.04.2022 19:23",
        "С карты": "4169-58xx-xxxx-9265",
        "Поставщик услуг": "MEGA",
        "Номер счета": "(555) 537 398",
        "Сумма": "200,00 KGS",
        "Сумма включая комиссию": "200,00 KGS"
        
    ]
    
    static var previews: some View {
        ReceiptView(items: recordTimes, action: {_ in })
    }
}

private struct ApplyShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color(hex: "#404040").opacity(0.12),
                radius: 8,
                x: 0,
                y: 0
            )
    }
}
