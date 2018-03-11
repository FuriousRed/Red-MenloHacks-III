//
//  KnourMeme.swift
//  Sample
//
//  Created by Alexandros Konas on 3/10/18.
//  Copyright © 2018 Alexandros Konas. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class KnourMeme : UIViewController, UITextFieldDelegate, WKNavigationDelegate{

    @IBOutlet weak var Forward: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    override func viewDidLoad() {
    super.viewDidLoad();
    // Do any additional setup after loading the view, typically from a nib.
    urlTextField.delegate = self
        webView.navigationDelegate = self
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear( animated )
    
    let urlString:String = "http://nymag.com/selectall/2018/03/take-the-vine-ap-test.html"
    let url:URL = URL(string: urlString)!
    let urlRequest: URLRequest = URLRequest(url: url)
    webView.load(urlRequest)
    
    urlTextField.text = urlString
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString:String = urlTextField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }
    @IBAction func BackTapped(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    @IBAction func ForwardTapped(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Back.isEnabled = webView.canGoBack
        Forward.isEnabled = webView.canGoForward
        
        urlTextField.text = webView.url?.absoluteString
    }
}
