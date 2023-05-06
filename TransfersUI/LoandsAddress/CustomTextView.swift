//
//  CustomTextView.swift
//  TransfersUI
//
//  Created by Bakai on 22/3/23.
//

import SwiftUI

struct PrimaryTextField: View {
    let title: String
    @Binding private var text: String
    let image: Image?

    init(title: String,
         text: Binding<String>,
         image: Image? = nil
    ) {
        self.title = title
        self._text = text
        self.image = image
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                EnhancedTextField(text: $text)
                image
            }
            .padding(.vertical, 14)
            .frame(width: geo.size.width * 1, height: 48)
            .font(AppFonts.textFont(weight: .medium, size: .size16))
            .foregroundColor(Color.black)
            .background(
                Rectangle()
                    .fill(Color.gray)
                    .cornerRadius(10)
            )
            .onChange(of: text) { newValue in
                text = String(newValue.prefix(50))
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CustomTextView_Previews: PreviewProvider {
    @State private static var text = ""
    static var previews: some View {
        PrimaryTextField(title: "asd", text: $text)
    }
}

class ModifiedTextField: UITextField {
  let padding = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)

  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }

  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    bounds.inset(by: padding)
  }
}

struct EnhancedTextField: UIViewRepresentable {
  @Binding var text: String
  
  
  init(text: Binding<String>) {
    self._text = text
  }

  func makeUIView(context: Context) -> ModifiedTextField {
    let textField = ModifiedTextField(frame: .zero)
    textField.delegate = context.coordinator
      
    return textField
  }
  

  func updateUIView(_ uiView: ModifiedTextField, context: Context) {
    uiView.text = text
  }


  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  
  class Coordinator: NSObject, UITextFieldDelegate {
    let parent: EnhancedTextField

    init(_ parent: EnhancedTextField) {
      self.parent = parent
    }
  

    func textFieldDidChangeSelection(_ textField: UITextField) {
      parent.text = textField.text ?? ""
    }
  }
}
