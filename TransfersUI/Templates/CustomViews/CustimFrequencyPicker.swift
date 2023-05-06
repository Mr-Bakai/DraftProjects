//
//  CustimFrequencyPicker.swift
//  TransfersUI
//
//  Created by Bakai on 21/2/23.
//

import SwiftUI

struct CustomFrequencyPicker: View {
    @ObservedObject private var pickerViewModel: PickerState
    private var pickerData: [String]
    
    private let okayButton: (() -> ())?
    
    init(
        pickerViewModel: PickerState,
        pickerData: [String],
        okayButton: (() -> Void)?)
    {
        self.pickerViewModel = pickerViewModel
        self.pickerData = pickerData
        self.okayButton = okayButton
    }
    
    var body: some View {
        VStack {
            FrequencyPicker(dataArrays: pickerData,
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

struct FrequencyPicker: UIViewRepresentable {
    var dataArrays : [String]
    
    @ObservedObject var viewModel: PickerState
    
    func makeCoordinator() -> FrequencyPicker.Coordinator {
        return FrequencyPicker.Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<FrequencyPicker>) -> UIPickerView {
        
        let picker = UIPickerView(frame: .zero)
        picker.clipsToBounds = true
        
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<FrequencyPicker>) {
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: FrequencyPicker
        
        init(_ pickerView: FrequencyPicker) {
            self.parent = pickerView
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.dataArrays.count
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.dataArrays.count
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return UIScreen.main.bounds.width
        }
        
        //Row height:
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 30
        }
        
        func pickerView(_ pickerView: UIPickerView,
                        titleForRow row: Int,
                        forComponent component: Int) -> String? {
            return parent.dataArrays[row]
        }
        
        //View for Row
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
            
            /// To change the color of selected item
            label.text = "\(parent.dataArrays[row])"
            DispatchQueue.main.async {
                if let label = pickerView.view(forRow: row, forComponent: component) as? UILabel {
                    label.textColor = UIColor.red
                }
            }
            
            return label
        }
        
        // Picker selection
        func pickerView(_ pickerView: UIPickerView,
                        didSelectRow row: Int,
                        inComponent component: Int) {
            
            if parent.viewModel.type == .frequency {
                parent.viewModel.frequncy = parent.dataArrays[row]
            } else {
                parent.viewModel.time = parent.dataArrays[row]
            }
        }
    }
}

struct CustomFrequencyPicker_Previews: PreviewProvider {
    @StateObject private static var pickerViewModel = PickerState()
    private static var pickerData = ["00:00",
                                     "01:00",
                                     "02:00",
                                     "03:00",
                                     "04:00",
                                     "05:00",
                                     "06:00"]
    
    static var previews: some View {
        CustomFrequencyPicker(pickerViewModel: pickerViewModel,
                              pickerData: pickerData,
                              okayButton: {})
    }
}
