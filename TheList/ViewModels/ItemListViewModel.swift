//
//  ItemListViewModel.swift
//  TheList
//
//  Created by Sera Han on 2023-06-02.
//

import Foundation
import SQLite

class ItemListViewModel: ObservableObject {

//    init() {
//
//    }
//
//    /// Delete todo list item
//    /// - Parameter id: item id to delete
//    func delete() {
//
//    }


    private var db: Connection!
    private var items: Table!
    
    private var id: Expression<Int>!
    private var description: Expression<String>!
    private var quantity: Expression<Int>!
    
    init() {
       
        do {
            
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            db = try Connection("\(path)/my_items.sqlite3")
            
            items = Table("items")
            
            id = Expression<Int>("id")
            description = Expression<String>("description")
            quantity = Expression<Int>("quantity")
            
            if (!UserDefaults.standard.bool(forKey:  "is_db_created")) {
                try db.run(items.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(description)
                    t.column(quantity)
                })
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    public func addItem(descriptionValue: String, quantityValue: Int) {
        do {
            try db.run(items.insert(description <- descriptionValue, quantity <- quantityValue))
        
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getItems() -> [ItemListModel] {
        var itemModels: [ItemListModel] = []
        
        items = items.order(id.desc)
        do {
            for item in try db.prepare(items) {
                let itemModel: ItemListModel = ItemListModel()
                itemModel.id = item[id]
                itemModel.description = item[description]
                itemModel.quantity = item[quantity]
                
                itemModels.append(itemModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        return itemModels
    }
    
    public func delete() {
        
    }
    


}


