//
//  CalendarVC.swift
//  Example
//
//  Created by Cong_develop on 05/12/2022.
//

import UIKit

class CalendarVC: UIViewController {
    
    
    @IBOutlet weak var loanAmountTF: UITextField!
    @IBOutlet weak var numOfPtmsTF: UITextField!
    @IBOutlet weak var interestRateTF: UITextField!
    @IBOutlet weak var totalAmountLb: UILabel!
    @IBOutlet weak var monthlyPaymentLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalAmountLb.text = ""
        monthlyPaymentLb.text = ""
    }
    
    @IBAction func didClickCalculatorBtn(_ sender: UIButton) {
        var calcFlag: Bool = true

        if(Float(loanAmountTF.text!) == nil || Float(loanAmountTF.text!)! < 0) {
            showErrMsg(outletField: "Loan Amt")
            calcFlag = false
        }else if(Int(numOfPtmsTF.text!) == nil || Int(numOfPtmsTF.text!)! < 0) {
            showErrMsg(outletField: "Num Pmts")
            calcFlag = false
        }else if(Float(interestRateTF.text!) == nil || Float(interestRateTF.text!)! < 0) {
            showErrMsg(outletField: "Int. rate")
            calcFlag = false
        }

        let loanAmount = loanAmountTF.text! == "" ?  0.00 : Float(loanAmountTF.text!) ?? 0.00

        let numOfPmts = numOfPtmsTF.text! == "" ?  0 : Int(numOfPtmsTF.text!) ?? 0

        let interestRate = interestRateTF.text! == "" ?  0.00 : Float(interestRateTF.text!) ?? 0.00
        let temp = Int((loanAmount * (interestRate / 100 )) * (Float(numOfPmts ) / 12))
        let totalIntRate = Float((loanAmount + Float(temp))/Float(numOfPmts))
        if(calcFlag) {
            totalAmountLb.text = String(temp)
            monthlyPaymentLb.text = String(totalIntRate)
        }
    }
    
    func showErrMsg(outletField: String) {
        let msg = "You have invalid input in the " + outletField + " field."
        let errController = UIAlertController(title: "ERROR!", message: msg, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        errController.addAction(confirmAction)
        
        self.present(errController, animated: true, completion: nil)
    }
    
}
