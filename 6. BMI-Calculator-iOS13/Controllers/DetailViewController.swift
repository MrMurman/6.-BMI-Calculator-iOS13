//
//  DetailViewController.swift
//  6. BMI-Calculator-iOS13
//
//  Created by Андрей Бородкин on 07.04.2022.
//

import UIKit
import SwiftUI

class DetailViewController: UIViewController {

    var label: UILabel = {
        var lbl = UILabel()
        lbl.text = "YOUR RESULT"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        return lbl
    }()
    
    var resultLabel: UILabel = {
        var rsltLbl = UILabel()
        rsltLbl.text = "0.0"
        rsltLbl.textColor = .white
        rsltLbl.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        
        return rsltLbl
    }()
    
    var commentLabel: UILabel = {
        var cmntLbl = UILabel()
        cmntLbl.text = "Some comment".uppercased()
        cmntLbl.textColor = .white
        cmntLbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return cmntLbl
    }()
    
    var recalculateButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("RECALCULATE", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1), for: .normal)
        
        btn.layer.cornerRadius = 10 
        btn.layer.masksToBounds = true
        
        btn.addTarget(nil, action: #selector(dismissView(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    var bmiCalculator: CalculatorBMI!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        guard let bmi = bmiCalculator else { return }
        let bmiIndex = bmi.index
        
        for (color, quote) in bmi.colorAndQuote {
            view.backgroundColor = color
            commentLabel.text = quote
        }
//        view.backgroundColor = bmi.colorAndQuote.keys.first
//        commentLabel.text = bmi.colorAndQuote.values.first
        
        resultLabel.text = String(format: "%.1f", bmiIndex)
    }
    
    
    @objc func dismissView(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }

    func setupUI() {
        let backgroundImage = UIImageView(image: UIImage(named: "result_background"))
        backgroundImage.frame = view.frame
        view.addSubview(backgroundImage)
        
        
        let vStack = UIStackView(arrangedSubviews: [label, resultLabel, commentLabel])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fillEqually
        vStack.spacing = -7
        
        view.addSubview(vStack)
        view.addSubview(recalculateButton)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60)
                                    ])
    }

}





//MARK: - Canvas

struct DetailFlowProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let view = DetailViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<DetailFlowProvider.ContainterView>) -> DetailViewController {
            return view
        }
        
        func updateUIViewController(_ uiViewController: DetailFlowProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<DetailFlowProvider.ContainterView>) {
            
        }
        
    }
    
}
