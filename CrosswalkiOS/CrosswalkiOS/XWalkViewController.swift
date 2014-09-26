//
//  XWalkViewController.swift
//  CrosswalkiOS
//
//  Created by Jonathan Dong on 14/9/24.
//  Copyright (c) 2014年 Crosswalk. All rights reserved.
//

import UIKit
import WebKit

public class XWalkViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    var webview : WKWebView?
    let userContentController : WKUserContentController = WKUserContentController()
    var extensionManager : XWalkExtensionManager = XWalkExtensionManager()

    override public func viewDidLoad() {
        super.viewDidLoad()

        var config : WKWebViewConfiguration = WKWebViewConfiguration()
        config.userContentController = userContentController
        var webview = WKWebView(frame: view.frame, configuration: config)
        webview.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        webview.frame = view.frame
        webview.navigationDelegate = self
        view.addSubview(webview)
        self.webview = webview

        extensionManager.loadExtensions(userContentController)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        webview = nil
    }

    public func userContentController(userContentController: WKUserContentController!,
        didReceiveScriptMessage message: WKScriptMessage!) {
        //TODO:(jondong) message handling codes should be add here.
    }

    public func loadURL(url: NSURL) {
        webview?.loadRequest(NSURLRequest(URL: url));
    }
}