//
//  ListView.swift
//  TheList
//
//  Created by Dongseok Cho on 2023-06-21.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    
    @State var itemModels: [CategoryListModel] = []
    
    //@StateObject var theList = ListViewModel()

    let thelist = ["Camping",
                   "Groceries",
                   "Fashion"]
    
    
    var body: some View {
        //created lists
        
        VStack{
            NavigationView{
                List{
                    
                    ForEach(thelist, id: \.self){ list in
                        NavigationLink(destination: ItemListView()){
                            Image(systemName: "circle.circle")
                            Text(list)
                        }
                        .navigationTitle("THE LIST")
                    
                    }
                }
                
            }

            
        }
        
    }
    
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
