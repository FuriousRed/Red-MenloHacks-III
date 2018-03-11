//
//  MehMeme.swift
//  Sample
//
//  Created by Alexandros Konas on 3/11/18.
//  Copyright © 2018 Alexandros Konas. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class MehMemes: UIViewController, UITextFieldDelegate, WKNavigationDelegate{
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear( animated )
        
        let urlString:String = "hhttps://www.springfieldspringfield.co.uk/movie_script.php?movie=the-emoji-movie"
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}



