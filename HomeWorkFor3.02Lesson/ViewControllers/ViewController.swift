//
//  ViewController.swift
//  HomeWorkFor3.02Lesson
//
//  Created by Федор Еронин on 08.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.getHeroes {
            print($0)
        }
    }
}
