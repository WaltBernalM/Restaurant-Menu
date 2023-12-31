//
//  DisplayDishes.swift
//  LittleLemonMenuM4
//
//  Created by Walter Bernal Montero on 09/10/23.
//

import SwiftUI

/// Print of individual dishes on the foods menu
struct DisplayDish: View {
    @ObservedObject private var dish:Dish
    init(_ dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        HStack {
            Text(dish.name!)
            Spacer()
            Text("$\(String(format: "%.2f", dish.price))")
                .font(.callout)
                .monospaced()
        }
        .contentShape(Rectangle()) // keep this code
    }
}

struct DisplayDish_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        DisplayDish(oneDish())
    }
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.name = "Hummus"
        dish.price = 10
        dish.size = "Extra Large"
        return dish
    }
}
