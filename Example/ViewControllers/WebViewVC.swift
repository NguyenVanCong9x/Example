//
//  WebViewVC.swift
//  Example
//
//  Created by Cong_develop on 05/12/2022.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL (string: "https://ps.uci.edu/~franklin/doc/file_upload.html")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
    }
}
