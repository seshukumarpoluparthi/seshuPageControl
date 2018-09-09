//
//  ViewController.swift
//  seshuPageControl
//
//  Created by apple on 8/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
// pagecontrol
class ViewController: UIViewController {
    var images : [String] = ["0","1","2","0","3","4"]
    var frame = CGRect(x: 0, y: 0, width:0, height: 0)
    var pagecount : Int = 0
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        var x_postion:CGFloat=0
        for index in 0..<images.count{
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            let imgView = UIImageView(frame: CGRect(x: x_postion, y: 0, width: self.view.frame.size.width-30, height: scrollView.frame.size.height))
            //  x_postion=imgView.frame.origin.x+imgView.frame.size.width+10
            x_postion=imgView.frame.origin.x+imgView.frame.size.width+10
            imgView.image = UIImage(named: images[index])
            imgView.clipsToBounds = true
            imgView.layer.borderWidth = 2
            imgView.layer.cornerRadius = 15
            imgView.contentMode = .scaleToFill
            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: ((self.view.frame.size.width) * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.autoresizesSubviews = true
    }
}
extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        //pageControl.currentPage = Int(self.scrollView.contentOffset.x/scrollView.frame.size.width)
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

