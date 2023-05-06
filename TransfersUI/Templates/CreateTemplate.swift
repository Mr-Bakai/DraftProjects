//
//  CreateTemplate.swift
//  TransfersUI
//
//  Created by Bakai on 15/2/23.
//

import SwiftUI

// MARK: Types
public enum PickerType {
    case date
    case frequency
    case time
    
    func getDescription() -> String {
        switch self {
        case .date: return "Дата повторного платежа"
        case .frequency: return "Время повторного платежа"
        case .time: return "Повторять платеж"
        }
    }
    
    func getImagePrefix() -> String {
        switch self {
        case .date: return "ic_seven"
        case .frequency: return "ic_clock"
        case .time: return "ic_blank"
        }
    }
    
    func getAppropriateText(@ObservedObject state: PickerState) -> Binding<String> {
        switch self {
        case .date: return $state.collectedDate
        case .frequency: return $state.frequncy
        case .time: return $state.time
        }
    }
}

struct CreateTemplate: View {
    
    @State private var title = ""
    @State private var isVStackDropped = false
    @StateObject private var state = PickerState()
    
    @State var selectedYear = ""
    
    private let action: ((PickerType) -> ())?
    
    public init(action: ((PickerType) -> ())?) {
        self.action = action
    }
    
    var body: some View {
        ZStack {
            Color(hex: "#F7F6F9").ignoresSafeArea()
            VStack {
                textFieldView()
                toggle()
                
                if isVStackDropped {
                    pickers()
                }
                Spacer()
            }
            .bottomSheet(isPresented: $state.isPresented, isScrollHide: true) {
                switchTypeToGetBottomSheet()
            }
        }
    }
    
    private func textFieldView() -> some View {
        VStack() {
            FloatingTextField(title: "Наименование шаблона", text: $title)
                .padding(.horizontal, 16)
                .padding(.top, 6)
            Divider()
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
        }
        .padding(.top, 8)
        .background(Color.white)
    }
    
    private func toggle() -> some View {
        VStack {
            Toggle(isOn: $isVStackDropped){
                Text("Show some text")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 22)
        .background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
        )
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
    
    private func pickers() -> some View {
        VStack {
            makeButton(.date)
            makeButton(.frequency)
            makeButton(.time)
        }
        .transition(
            .opacity
                .animation(
                    .easeInOut(duration: 0.200).delay(0)))
        .padding(.bottom, 24)
        .background(Color.white)
        .padding(.top, 12)
    }
    
    private func makeButton(_ type: PickerType) -> some View {
        Button {
            self.switchButtonType(type)
        } label: {
            self.fillButtonData(type)
        }
    }
    
    private func switchButtonType(_ type: PickerType) {
        guard let action else { return }
        state.tuple = (type, true)
        
        switch type {
        case .date:
            action(.date)

        case .frequency:
            action(.frequency)

        case .time:
            action(.time)
        }
    }
    
    private func fillButtonData(_ type: PickerType) -> some View {
        return VStack(alignment: .leading) {
            Group {
                HStack() {
                    Image(type.getImagePrefix())
                    FloatingTextField2(title: type.getDescription(),
                                       text: type.getAppropriateText(state: state))
                }
                .padding(.top, 24)
                .padding(.bottom, 10)
                .padding(.leading, 16)
                .padding(.trailing, 22)
                
                Divider().padding(.horizontal, 16)
            }
        }
    }
    
    //TODO: This switch will be on KMM side and will be removed
    func switchTypeToGetBottomSheet() -> some View {
        switch state.type {
        case .date:
            return AnyView(CustomDatePicker(
                pickerViewModel: state,
                okayButton: {
                    state.isPresented = false
                }))
            
        case .frequency:
            return AnyView(CustomFrequencyPicker(
                pickerViewModel: state,
                pickerData: PickerState.frequencyData,
                okayButton: {
                    state.isPresented = false
                }))
            
        case .time:
            return AnyView(CustomFrequencyPicker(
                pickerViewModel: state,
                pickerData: PickerState.timeData,
                okayButton: {
                    state.isPresented = false
                }))
        }
    }
}

struct CreateTemplate_Previews: PreviewProvider {
    static var previews: some View {
        CreateTemplate(action: { _ in })
    }
}

extension UIPickerView {
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric,
                      height: super.intrinsicContentSize.height)}
}
