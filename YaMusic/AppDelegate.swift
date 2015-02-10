//
//  AppDelegate.swift
//  YaMusic
//
//  Created by Dmitry Burmistrov on 09/02/15.
//  Copyright (c) 2015 Dmitry Burmistrov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    var masterVC:MasterController!

    @IBAction func goBackPressed(sender: NSButton) {
        if masterVC.respondsToSelector(Selector("goBack:")){
            masterVC.goBack(sender)
        }
    }
    @IBAction func goForthPressed(sender: NSButton) {
        if masterVC.respondsToSelector(Selector("goForth:")){
            masterVC.goForth(sender)
        }
    }
    @IBAction func reloadPressed(sender: NSButton) {
        if masterVC.respondsToSelector(Selector("reload:")){
            masterVC.reload(sender)
        }
    }
    @IBAction func goHomePressed(sender: NSButton) {
        if masterVC.respondsToSelector(Selector("goHome:")){
            masterVC.goHome(sender)
        }
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        masterVC = MasterController(nibName:"MasterController", bundle:nil)
        window.contentView.addSubview(masterVC.view)
        
        masterVC.view.translatesAutoresizingMaskIntoConstraints = false
        let masterView = masterVC.view
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[masterView]|", options: nil, metrics: nil, views:["masterView":masterView])
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[masterView]|", options: nil, metrics: nil, views:["masterView":masterView])
        window.contentView.addConstraints(verticalConstraints)
        window.contentView.addConstraints(horizontalConstraints)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let url = masterVC.currentURL()
        defaults.setObject(url, forKey: "lastURL")
        defaults.synchronize()
    }


}

