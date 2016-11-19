//
//  DetailViewController.swift
//  TreeNavigation
//
//  Created by tonyguan on 2016/10/31.
//  Copyright © 2016年 关东升. All rights reserved.
//
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 添加WKWebView
        self.webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.webView)
        self.webView.navigationDelegate = self
        
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: --实现WKNavigationDelegate委托协议
    //开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
    
    //当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("内容开始返回")
    }
    
    //加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
    }
    
    //加载失败时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败 error : ", error.localizedDescription)
    }
}
