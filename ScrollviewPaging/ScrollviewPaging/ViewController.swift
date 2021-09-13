//
//  ViewController.swift
//  ScrollviewPaging
//
//  Created by HS on 12/02/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //ProcessInfo.processInfo.environment[""]
    }

    @IBAction func segmentAction(_ sender: UISegmentedControl){
        self.scrollView.scrollTo(horizontalPage: segment.selectedSegmentIndex, animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.bounds.contains(view1.frame) {
            // entire UIView is visible in scroll view
            segment.selectedSegmentIndex = 0
        }
        if scrollView.bounds.contains(view2.frame) {
            // entire UIView is visible in scroll view
            segment.selectedSegmentIndex = 1
        }
        if scrollView.bounds.contains(view3.frame) {
            // entire UIView is visible in scroll view
            segment.selectedSegmentIndex = 2
        }
    }
    
}


extension UIScrollView {

    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }

}
