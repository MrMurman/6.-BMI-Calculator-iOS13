//
//  BMI.swift
//  6. BMI-Calculator-iOS13
//
//  Created by Андрей Бородкин on 05.04.2022.
//

import Foundation
import UIKit


struct CalculatorBMI {
    var height: Float = 185
    var weight: Float = 200
    
    var index: Float {
        let index = weight / pow(height/100, 2)
        return index
    }
    
    var colorAndQuote: [UIColor: String] {
        var dict = Dictionary<UIColor, String>()
        switch index {
        case ..<18.5:
            dict = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1): "Eat more pies!"]
        case 18.5..<24.9:
            dict = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1): "Fit as a fiddle!"]
        case 25...:
            dict = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1): "Eat less pies!"]
        default: break
        }
        return dict
    }
    
}
