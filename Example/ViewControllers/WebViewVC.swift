//
//  WebViewVC.swift
//  Example
//
//  Created by Cong_develop on 05/12/2022.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    private var url = "https://www.google.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configWebView()
        
        showLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadWebView()
        }
    }
    
    private func configWebView() {
        webView.navigationDelegate = self
    }
    
    private func loadWebView() {
        guard let urlRequest = URLRequest(urlString: url) else { return }
        webView.load(urlRequest)
    }
    
}

extension WebViewVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.showLoading(false)
        
        print("webview is loaded")

    }
}

extension WebViewVC {
    private func showLoading(_ isLoading: Bool) {
        isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = !isLoading
    }
}
