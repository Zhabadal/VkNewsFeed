//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Alexandr Badmaev on 02.10.2020.
//

import UIKit
import VK_ios_sdk

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
    }

    @IBAction func singInTapped(_ sender: UIButton) {
        authService.wakeUpSession()
    }

}

