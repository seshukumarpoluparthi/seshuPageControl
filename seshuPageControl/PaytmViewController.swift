//
//  PaytmViewController.swift
//  seshuPageControl
//
//  Created by apple on 8/30/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PaytmViewController: UIViewController {
    // page control
    var pagecount : Int = 0
    var timer_count : Timer!
    var pageControl=UIPageControl()
    
    var images_Array = ["1","2","1","2","1","2","1","2","1","2","1","2"]
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 4*UIScreen.main.bounds.width, height: 200)
        
        // pagecontrol
        pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollView.frame.origin.y+scrollView.frame.size.height-80, width: scrollView.frame.size.width, height: 40))
        
        
        
        
        let x = (UIScreen.main.bounds.width-240)/4
        print(UIScreen.main.bounds.width)
        print(x)
        var x_spacing = x
        print(images_Array.count)
        for k in 0..<images_Array.count{
            let btn = UIButton(frame: CGRect(x: x_spacing, y: 10, width: 80, height: 80))
            btn.setImage(UIImage(named:images_Array[k]), for: .normal)
            btn.imageView?.contentMode = .scaleAspectFit
            btn.layer.borderWidth = 2
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.cornerRadius = btn.frame.size.height/2
            btn.layer.masksToBounds = true
            scrollView.addSubview(btn)
            if k % 3 == 0{
                if k != 0{
                    x_spacing = x_spacing+80+2*x
                }
            } else{
                x_spacing = x_spacing+80+x
            }
        }
        
        
        pageControl.numberOfPages = self.images_Array.count/3
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        Timer_pageviewcontroller()
        
    }
    
    func Timer_pageviewcontroller()
    {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(TimeAction11), userInfo: nil, repeats: true)
    }
    @objc func TimeAction11()
    {
        DispatchQueue.main.async {
            let x = CGFloat(self.pagecount) * self.scrollView.frame.size.width
            self.pageControl.currentPage=self.pagecount
            self.pagecount=self.pagecount+1
            if self.pagecount==self.images_Array.count/3
            {
                self.pagecount=0
            }
            self.scrollView.contentOffset.x=x
        }
    }
    
    
}
extension PaytmViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(self.scrollView.contentOffset.x/scrollView.frame.size.width)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl.currentPage=self.pagecount
        if pageControl.numberOfPages<Int(pageNumber)
        {
            pageControl.currentPage = Int(pageNumber)
        }
    }
}



