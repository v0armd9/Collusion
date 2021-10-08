//
//  LobbyViewController.swift
//  CollusionTV
//
//  Created by Mason Kelly on 10/8/21.
//

import UIKit

class LobbyViewController: UIViewController {

    // MARK: - Properties
    let playerNames = ["player1", "player2", "player3", "player4", "player5"]
    var players:[Player] = []

    // MARK: - IBOutlets
    @IBOutlet private var titleImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var playerStackView: UIStackView!
    @IBOutlet private var debugButton: UIButton!
    @IBOutlet private var readyButton: UIButton!

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func debugAddPlayerButton(_ sender: Any) {
        let playerNum: GamePlayOptions = GamePlayOptions(rawValue: playerNames.count)!
        var affiliaationOptions = playerNum.affiliationOptions
        playerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        playerNames.forEach { name in
            let player = Player(name: name, party: affiliaationOptions.first!, isSecretHitler: false, isPresident: false, isChancellor: false, hasVoted: false, voteValue: false, isDead: false)
            affiliaationOptions.removeFirst()
            if player.party == .hitler {
                player.isSecretHitler = true
            }
            players.append(player)

            let playerLabel = UILabel()
            playerLabel.text = name
            playerLabel.font = UIFont(name: "Courier New", size: 36.0)
            playerStackView.addArrangedSubview(playerLabel)

            debugPrint(player.party)
        }
    }
}

// MARK: - Private
private extension LobbyViewController {

    func setupView() {
        let greyColor = UIColor(rgb: 0x454442)

        self.view.backgroundColor = UIColor(rgb: 0xd6be97)
        readyButton.backgroundColor = greyColor
        readyButton.setTitle("Ready", for: .normal)

        titleImageView.image = UIImage(named: "secret hitler title")
        descriptionLabel.text = "Need a minimum of 5 players"
    }
}
