//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Nick Rigano on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    var game = Game()
    var heroType: HeroType! {
        didSet {
            game.heroType = heroType
        }
    }
    var delegate = self
    
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = HeroType.offense
    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: heroType = HeroType.offense
        case 1: heroType = HeroType.defense
        case 2: heroType = HeroType.tank
        case 3: heroType = HeroType.support
        default: heroType = HeroType.offense
        }
        print(characterStackViewWidthConstraint.multiplier)
    }
    
    func updateStackViewWithHeroes() {
        //var arrayCount = HeroName.heroes(with: heroType).count
        let selectedArray = HeroName.heroes(with: heroType)
        let imageViews: [UIImage] = []
        let nameViews: [String] = []
        for i in selectedArray {
            let heroArray = HeroName.heroes(with: i)
            
        }
        
        
}
}
