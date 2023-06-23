//
//  ItemListView.swift
//  TheList
//
//  Created by Sera Han on 2023-06-02.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var viewModel = ItemListViewModel()
   
    
    var body: some View {
       
            VStack {
                List {
                    
                    ItemDetailView()
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete()
                                
                            }
                            .tint(Color.red)
                        }
                    
                }
                
                
                .listStyle(PlainListStyle())
            }
            .navigationTitle(Text("List Name"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    
                        Button {
                        //Action
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            
        
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
