//
//  UIPickerInSwiftUI.swift
//  TransfersUI
//
//  Created by Bakai on 17/2/23.
//

import SwiftUI
import UIKit

struct CustomDatePicker: View {
    @ObservedObject private var pickerViewModel: PickerState
    
    @State private var selectedArray = [
        
        ["2019", "2020", "2021",  "2022", "2023", "2024", "2025"],
        ["Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь"],
        ["22", "23", "24", "25", "26"]
        
    ]
    
    private let okayButton: (() -> ())?
    
    init(pickerViewModel: PickerState, okayButton: (() -> Void)?) {
        self.pickerViewModel = pickerViewModel
        self.okayButton = okayButton
    }
    
    var body: some View {
        VStack{
            CustomPicker(dataArrays: $selectedArray,
                         viewModel: pickerViewModel)
            readyButtonView
        }
    }
    
    private var readyButtonView: some View {
        VStack {
            Button {
                guard let okayButton = okayButton else { return }
                okayButton()
            } label: {
                textView
            }
        }
    }
    
    var textView: some View {
        Text("Готово")
            .frame(maxWidth: .infinity, minHeight: 49)
            .foregroundColor(.white)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 20)
            .padding(.bottom, 32)
    }
}

struct CustomPicker: UIViewRepresentable {
    @Binding var dataArrays : [[String]]
    @ObservedObject var viewModel: PickerState

    func makeCoordinator() -> CustomPicker.Coordinator {
        return CustomPicker.Coordinator(self)
    }
    
//    func makeUIView(context: Context) -> UIView {
//        let wrapperView = UIView(frame: .zero)
//
//        let pickerView = UIPickerView()
//        pickerView.delegate = context.coordinator
//        pickerView.dataSource = context.coordinator
//
//        // Remove top margin of UIPickerView
//        pickerView.translatesAutoresizingMaskIntoConstraints = false
//        wrapperView.addSubview(pickerView)
//
//        NSLayoutConstraint.activate([
//            pickerView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
//            pickerView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
//            pickerView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
//            pickerView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor)
//        ])
//
//        return wrapperView
//    }
    
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        picker.clipsToBounds = true
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ view: UIPickerView,
                      context: UIViewRepresentableContext<CustomPicker>) {
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CustomPicker
        
        init(_ pickerView: CustomPicker) {
            self.parent = pickerView
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.dataArrays.count
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.dataArrays[component].count
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return UIScreen.main.bounds.width/3
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 30
        }
        
        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            
            return parent.dataArrays[component][row]
        }
        
        func pickerView(_ pickerView: UIPickerView,
                        viewForRow row: Int,
                        forComponent component: Int,
                        reusing view: UIView?) -> UIView {
            
            let label = UILabel()
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            
            /// To hide section selection indicator
            for subview in pickerView.subviews {
                if subview.frame.origin.y != 0 {
                    subview.isHidden = true
                }
            }
            
            /// To change the color selected item
            label.text = "\(parent.dataArrays[component][row])"
            DispatchQueue.main.async {
                if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
                    label.textColor = UIColor.red
                }
            }
            
            return label
        }
        
        // Picker selection, TO BE Refactored
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            if component == 0 {
                parent.viewModel.year = parent.dataArrays[component][row]
                
            } else if component == 1 {
                parent.viewModel.month = parent.dataArrays[component][row]
                
            } else if component == 2 {
                parent.viewModel.day = parent.dataArrays[component][row]
            }
            
        }
    }
}

struct UIPickerInSwiftUI_Previews: PreviewProvider {
    @StateObject private static var pickerViewModel = PickerState()
    
    static var previews: some View {
        CustomDatePicker(pickerViewModel: pickerViewModel, okayButton: {})
    }
}
