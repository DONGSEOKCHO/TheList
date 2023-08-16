//
//  ItemAddView.swift
//  TheList
//
//  Created by Sera Han on 2023-08-16.
//

import SwiftUI

struct ItemAddView: View {
    @State private var isChecked = false
    
    @State var description: String = ""
    @State var quantity: String = ""
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        HStack(spacing: 40) {
            VStack(alignment: .leading) {
                Button {
                    //action
                } label: {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                }
                
                
            }
            
            HStack(spacing: 50){
                TextField("New Item", text: $description)
                    .font(.body)
                
                Divider()
                    .frame(height:20)
                    .overlay(.blue)
                
                TextField("1", text: $quantity)
                
                Button(action: {
                    
                    ItemListViewDB().addItem(descriptionValue: self.description, quantityValue: Int(self.quantity) ?? 1)
                    
                    // go back
                    self.mode.wrappedValue.dismiss()
                
                    
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                })
            }
        }
        
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView()
    }
}
