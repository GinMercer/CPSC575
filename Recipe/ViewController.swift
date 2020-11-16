//
//  ViewController.swift
//  Recipe
//
//  Created by 印思佳 on 2020-10-21.
//  Copyright © 2020 印思佳. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITabBarControllerDelegate {
    
    @IBOutlet weak var promorecipeView: UIScrollView!
    
    @IBOutlet weak var promoPageControl: UIPageControl!
    
    var promorecipes: [String] = ["R1","R2","R3","R4","R5"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        // Do any additional setup after loading the view.
        //promo_recipeView = recipeArray[Int.random(in: 0...4)]
        
        promoPageControl.numberOfPages = promorecipes.count
        
        setupScreens()

        promorecipeView.delegate = self

    }
    
    
    func setupScreens() {
        for index in 0..<promorecipes.count {
            // 1.
            frame.origin.x = promorecipeView.frame.size.width * CGFloat(index)
            frame.size = promorecipeView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: promorecipes[index])

            self.promorecipeView.addSubview(imgView)
        }

        // 3.
        promorecipeView.contentSize = CGSize(width: (promorecipeView.frame.size.width * CGFloat(promorecipes.count)), height: promorecipeView.frame.size.height)
        promorecipeView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ promorecipeView: UIScrollView) {
        let pageNumber = promorecipeView.contentOffset.x / promorecipeView.frame.size.width
        promoPageControl.currentPage = Int(pageNumber)
    }
   
    
}

