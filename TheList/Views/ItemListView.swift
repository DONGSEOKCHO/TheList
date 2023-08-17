//
//  ItemListView.swift
//  TheList
//
//  Created by Sera Han on 2023-06-02.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var viewModel = ItemListViewModel()
    
    @State var itemModels: [ItemListModel] = []
    
    @State private var isClicked = false
    @State var description: String = ""
    @State var quantity: Int = 0
    
    var body: some View {
       
            VStack {
                
                List(self.itemModels) { (model) in
                    
                    ItemDetailView(description: model.description, quantity: model.quantity)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete()
                                
                            }
                            .tint(Color.red)
                        }
                    
                    
                    
                }
                .listStyle(PlainListStyle())
                if isClicked == true {
                    ItemAddView()
                    
                }
            }
            .onAppear(perform: {
                self.itemModels = viewModel.getItems()
            })
            .navigationTitle(Text("List Name"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    
                    Button {
                        //Action
                        isClicked = true
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
