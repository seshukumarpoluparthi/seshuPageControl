//
//  PopupViewController.swift
//  seshuPageControl
//
//  Created by apple on 8/31/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    var background_dummyview=UIView()
    var topconstraint2:NSLayoutConstraint!
    let extraViewsContainer12 = UIView.init()
    
    @IBOutlet var view_popUp: UIView!
    
    @IBOutlet weak var btn_CancelPopup: UIButton!
    
    @IBAction func btn_cancelPopupTapped(_ sender: UIButton) {
        Cancelpopup_view()
        
    }
    
    
    @objc func popup_view()
    {
       topconstraint2.constant=000
        background_dummyview.isHidden=false
        view_popUp.slideInFromTop1()
        
        view_popUp.isHidden=false
    }
    @objc func Cancelpopup_view()
    {
        topconstraint2.constant=1000
        view_popUp.slideInFromTop1()
        background_dummyview.isHidden=true
        view_popUp.isHidden=true
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapguster=UITapGestureRecognizer(target: self, action: #selector(Cancelpopup_view))
        view_popUp.addGestureRecognizer(tapguster)
    self.view.addGestureRecognizer(tapguster)
        view_popUp.layer.shadowColor=UIColor.gray.cgColor
        view_popUp.layer.shadowOffset=CGSize.zero
        view_popUp.layer.shadowOpacity=2
        view_popUp.layer.cornerRadius=10
         setup_popupview()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var btn_showPopup: UIButton!
    
    @IBAction func btn_showPopupTapped(_ sender: UIButton) {
        popup_view()
    }
    
   
    func setup_popupview()
    {
        let dummyview=UIView.init(frame: CGRect(x: 20, y: (self.view.frame.size.height-382)/2,width: self.view.frame.size.width-40, height: 382))
        self.view.addSubview(dummyview)
        dummyview.isHidden=true
        background_dummyview.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        background_dummyview.backgroundColor=UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        self.view.addSubview(background_dummyview)
        background_dummyview.isHidden=true
        extraViewsContainer12.translatesAutoresizingMaskIntoConstraints = false
        background_dummyview.addSubview(extraViewsContainer12)
        topconstraint2=NSLayoutConstraint(item: extraViewsContainer12, attribute: .top, relatedBy: .equal, toItem: dummyview, attribute: .top, multiplier: 1.0, constant: 1000)
        topconstraint2.isActive=true
        extraViewsContainer12.leadingAnchor.constraint(equalTo: dummyview.leadingAnchor).isActive = true
        extraViewsContainer12.trailingAnchor.constraint(equalTo: dummyview.trailingAnchor).isActive = true
        extraViewsContainer12.heightAnchor.constraint(equalTo: dummyview.heightAnchor, multiplier: 1).isActive = true
        extraViewsContainer12.widthAnchor.constraint(lessThanOrEqualTo: dummyview.widthAnchor).isActive=true
        extraViewsContainer12.backgroundColor = UIColor.clear
        extraViewsContainer12.addSubview(view_popUp)
        view_popUp.leadingAnchor.constraint(equalTo: extraViewsContainer12.leadingAnchor).isActive=true
        view_popUp.trailingAnchor.constraint(equalTo: extraViewsContainer12.trailingAnchor).isActive=true
        view_popUp.widthAnchor.constraint(equalTo: extraViewsContainer12.widthAnchor).isActive=true
        view_popUp.heightAnchor.constraint(equalTo: dummyview.heightAnchor, multiplier: 1).isActive = true
        view_popUp.topAnchor.constraint(greaterThanOrEqualTo: extraViewsContainer12.topAnchor).isActive=true
        view_popUp.translatesAutoresizingMaskIntoConstraints = false
        view_popUp.isHidden=true
    }

}
