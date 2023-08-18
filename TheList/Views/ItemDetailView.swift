//
//  ItemDetailView.swift
//  TheList
//
//  Created by Sera Han on 2023-06-22.
//

import SwiftUI

struct ItemDetailView: View {
    @StateObject var viewModel = ItemDetailViewModel()
    
    @State private var isChecked = false
    
    let description: String
    let quantity: Int
    
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
                Text(description)
                    .font(.body)
                
                Divider()
                    .frame(height:20)
                    .overlay(.blue)
                
                Text("\(quantity)")
            }
            
            
        }
        
    }

}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(description: "Item", quantity: 1)
    }
}


