//
//  MasterController.swift
//  YaMusic
//
//  Created by Dmitry Burmistrov on 09/02/15.
//  Copyright (c) 2015 Dmitry Burmistrov. All rights reserved.
//

import Cocoa
import WebKit
class MasterController: NSViewController {
    @IBOutlet weak var yaWebView: WebView!
    let yandexMusicURL = "http://music.yandex.ru"
    
    @IBOutlet weak var backButton: NSButton!
    @IBOutlet weak var forthButton: NSButton!
    @IBOutlet weak var reloadButton: NSButton!
    @IBOutlet weak var homeButton: NSButton!
    
    @IBAction func goBack(sender: NSButton) {
        yaWebView.goBack()
    }

    @IBAction func goForth(sender: NSButton) {
        yaWebView.goForward()
    }
    @IBAction func reload(sender: NSButton) {
        yaWebView.reload(sender)
    }
    @IBAction func goHome(sender: AnyObject) {
        let request = NSURLRequest(URL: NSURL(string: yandexMusicURL)!)
        yaWebView.mainFrame.loadRequest(request)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let rawURL: AnyObject? = defaults.objectForKey("lastURL")
        var requestURL: NSURL
        if (rawURL == nil){
            requestURL = NSURL(string: yandexMusicURL)!
        } else{
            requestURL = NSURL(string: rawURL as String)!
        }

        let request = NSURLRequest(URL: requestURL)
        yaWebView.mainFrame.loadRequest(request)
    }
    
    func currentURL() -> String{
        return yaWebView.stringByEvaluatingJavaScriptFromString("window.location.href")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
