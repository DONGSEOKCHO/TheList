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
    
    var body: some View {
        HStack(spacing: 30) {
            VStack(alignment: .leading) {
                Button {
                    //action
                } label: {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                }
               
                
            }
            
            HStack(spacing: 100){
                Text("Hello World")
                    .font(.body)
                
                
                Text("5")
            }
            
            
        }
    }

}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView()
    }
}


