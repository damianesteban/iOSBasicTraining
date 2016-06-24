//
//  SuperHeroesDetectorServiceLocator.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit

class SuperHeroesDetectorServiceLocator {

    static func provideRootViewController() -> UIViewController {
        let viewController = storyBoard.instantiateInitialViewController()!
        return viewController
    }

    static func provideSuperHeroDetailViewController(superHero: SuperHero) -> UIViewController {
        let viewController = provideUIViewControllerWithName("SuperHeroDetailViewController") as! SuperHeroDetailViewController
        let superHeroesDetector = provideSuperHeroesDetector()
        viewController.presenter = SuperHeroDetailPresenter(view: viewController,
                                                            superHeroesDetector: superHeroesDetector,
                                                            superHero: superHero)
        return viewController
    }

    private static func provideUIViewControllerWithName(name: String) -> UIViewController {
        return storyBoard.instantiateViewControllerWithIdentifier(name)
    }

    private static func provideSuperHeroesDetector() -> SuperHeroesDetector {
        return SuperHeroesDetector(apiClient: FakeSuperHeroesAPIClient(),
                                   capturedSuperHeroesStorage: CapturedSuperHeroesStorage())
    }

    private static var storyBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }()

}