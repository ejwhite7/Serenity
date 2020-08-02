//
//  CourseViewController.swift
//  Serenity
//
//  Created by Edward White on 7/31/20.
//

import UIKit
import WebKit

class CourseViewController: UIViewController, WKUIDelegate {
    
    var course: Course!
    weak var webView: WKWebView?
    
    @IBOutlet weak var titleLable: UINavigationItem?
    @IBOutlet weak var subHeadingLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var webViewContainer: UIView?
        
    override func viewDidLoad() {
        super .viewDidLoad()
        loadCourse()
    }
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration : webConfiguration)
            webView?.uiDelegate = self
            view = webView
        }
    
    func loadCourse() {
        self.titleLable?.title = self.course.title
        self.subHeadingLabel?.text = self.course.subheading
        self.descriptionLabel?.text = self.course.description
        let request = URLRequest(url: URL(string: self.course.sclink)!)
        webView?.load(request)
    }
    
}
