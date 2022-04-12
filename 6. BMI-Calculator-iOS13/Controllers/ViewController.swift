//
//  ViewController.swift
//  6. BMI-Calculator-iOS13
//
//  Created by Андрей Бородкин on 02.04.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    // MARK: - UI elements
    var label: UILabel = {
        var label = UILabel()
        label.text = "CALCULATE\nYOUR BMI"
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.textColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        var button = UIButton()
        
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.textColor = .white
        
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.backgroundColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        
        button.addTarget(self, action: #selector(calculateButtonTapped(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Height UI
    var heightLabel: UILabel = {
        var heightLabel = UILabel()
        heightLabel.text = "Heigh"
        heightLabel.textColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        return heightLabel
    }()
    
    var heightValueLabel: UILabel = {
        var heightValueLabel = UILabel()
        heightValueLabel.text = "0 cm"
        heightValueLabel.textAlignment = .right
        heightValueLabel.textColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        return heightValueLabel
    }()
    
    lazy var heightValueSlider: UISlider = {
        
        var heightValueSlider = UISlider()
        heightValueSlider.minimumValue = 120
        heightValueSlider.maximumValue = 250
        heightValueSlider.setValue(((250-120)/2)+120, animated: false)
        
        heightValueSlider.minimumTrackTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 1)
        heightValueSlider.maximumTrackTintColor = #colorLiteral(red: 0.6697643399, green: 0.6650184989, blue: 0.922929883, alpha: 0.524261267)
        heightValueSlider.thumbTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 1)
        
        heightValueSlider.addTarget(self, action: #selector(updateUI(_:)), for: .valueChanged)
        
        return heightValueSlider
    }()
    
    //MARK: Weight UI
    var weightLabel: UILabel = {
        var weightLabel = UILabel()
        weightLabel.text = "Weight"
        weightLabel.textColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        return weightLabel
    }()
    
    var weightValueLabel: UILabel = {
        var weightValueLabel = UILabel()
        weightValueLabel.text = "0 Kg"
        weightValueLabel.textAlignment = .right
        weightValueLabel.textColor = #colorLiteral(red: 0.386043489, green: 0.3761426806, blue: 0.6165835857, alpha: 1)
        return weightValueLabel
    }()
    
    var weightValueSlider: UISlider = {

        var weightValueSlider = UISlider()
        weightValueSlider.minimumValue = 0
        weightValueSlider.maximumValue = 250
        weightValueSlider.setValue(125, animated: false)
        
        weightValueSlider.minimumTrackTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 1)
        weightValueSlider.maximumTrackTintColor = #colorLiteral(red: 0.6697643399, green: 0.6650184989, blue: 0.922929883, alpha: 0.524261267)
        weightValueSlider.thumbTintColor = #colorLiteral(red: 0.6361649632, green: 0.6312126517, blue: 0.868719995, alpha: 1)
         
        weightValueSlider.addTarget(nil, action: #selector(updateUI(_:)), for: .valueChanged)
        
               
        /*
         In short: you can either specify nil as first param in addTarget method, or you can make a lazy var
         and specify the actual target.
         */

        return weightValueSlider
    }()
    
    
    //MARK: Variables
    
    var bmiCalculator: CalculatorBMI!
    let specialColor: UIColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    //MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        bmiCalculator = CalculatorBMI()
        //updateUI()
    }

    
    //MARK: - Functions
    
    @objc func calculateButtonTapped(sender: UIButton) {
        
        let destinationVC = DetailViewController()
        destinationVC.bmiCalculator = bmiCalculator
        navigationController?.present(destinationVC, animated: true)
       // present(destinationVC, animated: true)
        
    }
    
    
//    func updateUI(height: Float?, weight: Float?) {
//        if let height = height {
//            heightValueLabel.text = "\(height) m"
//        }
//        if let weight = weight {
//            weightValueLabel.text = "\(weight) kg"
//        }
//
//
//    }
    
//    @objc func weightSliderChanged(_ sender: UISlider) {
//        bmi.weight = sender.value
//        updateUI(height: nil, weight: sender.value)
//    }
//
//    @objc func heightSliderChanged(_ sender: UISlider) {
//
//    }
    
    
    
    @objc func updateUI(_ sender: UISlider) {
        
        if sender == heightValueSlider {
            bmiCalculator.height = sender.value
            heightValueLabel.text = String(format: "%.0f cm", sender.value.rounded())
        }
        if  sender == weightValueSlider  {
            bmiCalculator.weight = sender.value
            weightValueLabel.text = String(format: "%.1f kg", sender.value)
        }
    }
    
    //MARK: - UI Set-up
    
    func setupUI() {
        
        //        weightValueSlider.addTarget(self, action: #selector(weightSliderChanged(_:)), for: .valueChanged)
        //        heightValueSlider.addTarget(self, action: #selector(heightSliderChanged(_:)), for: .valueChanged)
        
        heightValueLabel.text = String(format: "%.0f cm", heightValueSlider.value.rounded())
        weightValueLabel.text = String(format: "%.1f kg", weightValueSlider.value)
        
        
        let backgroundImage = UIImageView(image: UIImage(named: "calculate_background"))
        backgroundImage.frame = view.frame
        view.addSubview(backgroundImage)
        
    
        let dataStack = configureDataStackView()

        
        
        let vStack = UIStackView(arrangedSubviews: [label, dataStack])
        vStack.axis = .vertical
        view.addSubview(vStack)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            vStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    

    func configureDataStackView() -> UIStackView {
        
        let dataStack = UIStackView()
    
        let heightLabelsStack = UIStackView(arrangedSubviews: [heightLabel, heightValueLabel])
        heightLabelsStack.axis = .horizontal
        heightLabelsStack.distribution = .equalSpacing
        
        let heightStack = UIStackView(arrangedSubviews: [heightLabelsStack, heightValueSlider])
        heightStack.axis = .vertical
        heightLabelsStack.distribution = .fillProportionally
        heightStack.spacing = 30
        
        let weightLabelsStack = UIStackView(arrangedSubviews: [weightLabel, weightValueLabel])
        weightLabelsStack.axis = .horizontal
        weightLabelsStack.distribution = .equalSpacing
        
        let weightStack = UIStackView(arrangedSubviews: [weightLabelsStack, weightValueSlider])
        weightStack.axis = .vertical
        weightLabelsStack.distribution = .fillProportionally
        weightStack.spacing = 30
        
        dataStack.addArrangedSubview(heightStack)
        dataStack.addArrangedSubview(weightStack)
        dataStack.addArrangedSubview(calculateButton)
        
        dataStack.axis = .vertical
        dataStack.spacing = 30
        
        return dataStack
    }

}





//MARK: - Canvas

struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let view = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<FlowProvider.ContainterView>) -> ViewController {
            return view
        }
        
        func updateUIViewController(_ uiViewController: FlowProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<FlowProvider.ContainterView>) {
            
        }
        
    }
    
}
