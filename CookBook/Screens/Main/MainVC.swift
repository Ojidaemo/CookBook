//
//  MainVC.swift
//  CookBook
//
//  Created by Alexandr Rodionov on 26.02.23.
//

import UIKit

class MainVC: UIViewController {
    
    /* Получение рандомного рецепта:
     var delegate: RestAPIProviderProtocol = RecipesManager()   // Создали делегат к менеджеру рецептов с соблюдением протокола
     var array: [Result]? // сделали массив если надо 
     */


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        
       /* delegate.getRandomRecipes { [weak self] recipe in        //обращаемся к делегату, запрашиваем метод, через комплишн хендлер в методе вызываем замыкание (безопасно, через weak)
            if let yourVarName = recipe.recipes?.last?.instructions {   // пример использования: развернули опционал, обратились к рецепту (он по сути [Recipe]), далее получаем нужный элемент. Это может быть .first, .last, .randomElement(), [3] и всё, что пожелаете.
                print(yourVarName)
            } else {                                             // это просто пример
                print("NIL")
            }
        }
        
        yourDelegteNameWhatYouImaged.getRecipesByType(forType: "bread") { [weak self] recipe in     //здесь пример получения и использования рецептов по type. Также можем передавать в массив, а можем передавать сразу нужные проперти на этот или другой контроллер
            if let varName = recipe.results {
                self?.array?.append(contentsOf: varName)
                print(varName)
            } else {
                print("NIL")
            }
        }
        */
    }
}
