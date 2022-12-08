//
//  CustomTabBar.swift
//  Example
//
//  Created by Cong_develop on 05/12/2022.
//

import UIKit
import SwifterSwift

class CustomTabBar: UIView {

    @IBOutlet weak var bgItemView1: UIView!
    @IBOutlet weak var bgItemView2: UIView!
    @IBOutlet weak var bgItemView3: UIView!
    @IBOutlet weak var imgItem1: UIButton!
    @IBOutlet weak var imgItem2: UIButton!
    @IBOutlet weak var imgItem3: UIButton!
    
    var itemTapped: ((_ tab: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    func initializeSubviews() {
        let xibFileName = "CustomTabBar" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?[0] as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        self.bgItemView1.backgroundColor = UIColor(hexString: "6153B0")
        self.bgItemView2.backgroundColor = .white
        self.bgItemView3.backgroundColor = .white
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        itemTapped?(sender.tag)
        switch sender.tag {
        case 0:
            bgItemView1.backgroundColor = UIColor(hexString: "6153B0")
            bgItemView2.backgroundColor = .white
            bgItemView3.backgroundColor = .white
        case 1:
            bgItemView1.backgroundColor = .white
            bgItemView2.backgroundColor = UIColor(hexString: "6153B0")
            bgItemView3.backgroundColor = .white
        default:
            bgItemView1.backgroundColor = .white
            bgItemView2.backgroundColor = .white
            bgItemView3.backgroundColor = UIColor(hexString: "6153B0")
        }
    }
}
