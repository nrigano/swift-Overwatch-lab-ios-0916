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
            updateStackViewWithHeroes()
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
    }
    
    func updateStackViewWithHeroes() {
        //var arrayCount = HeroName.heroes(with: heroType).count
        var selectedArray: [Hero] = []
        var unwrappedHero: HeroType = heroType
        switch unwrappedHero {
        case HeroType.offense:
            selectedArray = game.offenseCharacters
        case HeroType.defense:
            selectedArray = game.defenseCharacters
        case HeroType.support:
            selectedArray = game.supportCharacters
        case HeroType.tank:
            selectedArray = game.tankCharacters
        }
        heroScrollView.contentSize.width = view.frame.width * CGFloat(selectedArray.count)
        var imageViews: [UIImage] = []
        var nameViews: [String] = []
        for hero in selectedArray {
            imageViews.append(hero.profileImage)
            nameViews.append(hero.name.description)
            let image: UIImage = hero.produceButtonImage()
            self.heroScrollView.addSubview(containerView)
        }
        
    }
}
