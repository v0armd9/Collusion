//
//  BoardViewController.swift
//  CollusionTV
//
//  Created by Mason Kelly on 10/8/21.
//

import UIKit

class BoardViewController: UIViewController {


    @IBOutlet private var backgroundImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

private extension BoardViewController {

    func setupView() {
        self.view.backgroundColor = UIColor(rgb: 0xd6be97)
        backgroundImage.image = UIImage(named: "Policy_drawn01")
    }
}
