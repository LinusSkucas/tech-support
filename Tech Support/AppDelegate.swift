//
//  AppDelegate.swift
//  Tech Support
//
//  Created by Linus Skucas on 11/22/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func printAction(_ sender: NSMenuItem) {
        let printView = NSImageView(frame: NSRect(x: 0, y: 0, width: 549, height: 617))
        printView.image = NSImage(named: "halp")
        let printInfo = NSPrintInfo()
        printInfo.bottomMargin = 1
        printInfo.topMargin = 1
        printInfo.leftMargin = 1
        printInfo.rightMargin = 1
        let printOperation = NSPrintOperation(view: printView, printInfo: printInfo)
        printOperation.run()
    }
}

