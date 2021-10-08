//
//  HomeTvViewController.swift
//  CollusionTV
//
//  Created by Mason Kelly on 10/8/21.
//

import UIKit

class HomeTvViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var titleImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var howToPlayButton: UIButton!
    @IBOutlet private var startGameButton: UIButton!

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Private
private extension HomeTvViewController {

    func setupView() {
        let greyColor = UIColor(rgb: 0x454442)

        titleImageView.image = UIImage(named: "secret hitler title")

        self.view.backgroundColor = UIColor(rgb: 0xd6be97)
        descriptionLabel.textColor = greyColor
        howToPlayButton.setTitleColor(.white, for: .normal)
        startGameButton.setTitleColor(.white, for: .normal)
        howToPlayButton.backgroundColor = greyColor
        startGameButton.backgroundColor = greyColor

        descriptionLabel.text = "Secret Hitler is a social deduction game for 5-10 people about finding and stopping the Secret Hitler."
        howToPlayButton.setTitle("how to play", for: .normal)
        startGameButton.setTitle("Start game", for: .normal)
    }
}
