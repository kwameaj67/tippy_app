//
//  ViewController.swift
//  TipCalculatorApp
//
//  Created by Kwame Agyenim - Boateng on 16/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLbl: UITextField!
    @IBOutlet weak var percentageLbl: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalBillLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = calculateButton.layer.frame.height / 2 
        title = "Tippy App"
        handler(message: "Hi, Kwame") { (result) in
            print("RESULT:\(result)")
        }
        
    }
    
    func calculateBill(){
        let billAmount = Double(amountLbl.text ?? "0")!
        
        let percent = Double(percentageLbl.text ?? "") ?? 0.0
        
        let percentageAmount = (percent/100)
        print("\(percentageAmount)")
        let tipAmount = percentageAmount * billAmount
        print("\(tipAmount)")
        
        tipLbl.text = "Ghc\(tipAmount)"
        
        let totalBillAmount = billAmount + tipAmount
        
        totalBillLbl.text = "Ghc\(totalBillAmount)"
    }

    @IBAction func calculateTipTap(_ sender: Any) {
        if amountLbl.text == ""{
            showAlert(title: "Error!", message: "Please enter your amount you spent")
        }else if percentageLbl.text == ""{
            showAlert(title: "Error!", message: "Please enter tip percentage you spent")
        }else{
            calculateBill()
        }
            
    }
    
    
    func showAlert(title:String,message:String){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancelled")
            
        }
        alertView.addAction(cancel)
        present(alertView, animated: true, completion: nil)
        }
    
  

    func handler(message:String,completion: (_ result:String) -> Void){
            print("MESSAGE:\(message)")
            print("This is the code for completion handler")
            
    }
    
}

