//
//  SecondViewController.swift
//  seshuPageControl
//
//  Created by apple on 8/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

// scrollview page control


class SecondViewController: UIViewController,UIScrollViewDelegate {
    let images = ["0","3","4"]
    var pagecount : Int = 0
    var timer_count : Timer!
    var frame : CGRect = CGRect(x: 0, y: 0, width: 0, height: 0 )
    var pageControl=UIPageControl()
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.delegate = self
        pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollview.frame.origin.y+scrollview.frame.size.height-30, width: scrollview.frame.size.width, height: 40))
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
        var x_postion:CGFloat=0
        for index in 0..<images.count {
            frame.origin.x = scrollview.frame.size.width * CGFloat(index)
            frame.size = scrollview.frame.size
            let subView = UIView(frame: frame)
            let btn=UIButton(frame: CGRect(x: x_postion, y: 0, width: self.view.frame.size.width-0, height: frame.size.height-0))
            btn.setImage(UIImage(named: "\(images[index])"), for: .normal)
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 2
            btn.contentMode = .scaleAspectFit
            btn.clipsToBounds = true
            btn.tag=index
            btn.backgroundColor=UIColor.green
            scrollview.addSubview(btn)
            //  btn.addTarget(self, action: #selector(pagecontrolselectedpage), for: .touchUpInside)
            x_postion=x_postion+self.view.frame.size.width
        }
        scrollview.contentSize = CGSize(width:self.view.frame.size.width * CGFloat(images.count),height: scrollview.frame.size.height)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        Timer_pageviewcontroller()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(self.scrollview.contentOffset.x/scrollView.frame.size.width)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl.currentPage=self.pagecount
        if pageControl.numberOfPages<Int(pageNumber)
        {
            pageControl.currentPage = Int(pageNumber)
        }
    }
    func Timer_pageviewcontroller()
    {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(TimeAction11), userInfo: nil, repeats: true)
    }
    @objc func TimeAction11()
    {
        DispatchQueue.main.async {
            let x = CGFloat(self.pagecount) * self.scrollview.frame.size.width
            self.pageControl.currentPage=self.pagecount
            self.pagecount=self.pagecount+1
            if self.pagecount==self.images.count
            {
                self.pagecount=0
            }
            self.scrollview.contentOffset.x=x
        }
    }
}
