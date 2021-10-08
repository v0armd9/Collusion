//
//  HowToPlayViewController.swift
//  CollusionTV
//
//  Created by Mason Kelly on 10/8/21.
//

import UIKit

class HowToPlayViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var doneButton: UIButton!
    @IBOutlet private var textView: UITextView!

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Private
private extension HowToPlayViewController {

    func setupView() {
        let greyColor = UIColor(rgb: 0x454442)

        self.view.backgroundColor = UIColor(rgb: 0xd6be97)
        doneButton.backgroundColor = greyColor
        doneButton.setTitle("Done", for: .normal)

        textView.backgroundColor = UIColor(rgb: 0xe5e5e5)
        textView.textColor = greyColor
        textView.allowsEditingTextAttributes = false
        textView.text = """
            The year is 1932. The place is pre-WWII Germany. In Secret Hitler, players are German politicians attempting to hold a fragile Liberal government together and stem the rising tide of Fascism. Watch out though—there are secret Fascists among you, and one player is Secret Hitler.

        OVERVIEW
        At the beginning of the game, each player
        is secretly assigned to one of three roles: Liberal, Fascist, or Hitler. The Liberals have
        a majority, but they don’t know for sure who anyone is; Fascists must resort to secrecy and sabotage to accomplish their goals. Hitler plays for the Fascist team, and the Fascists know Hitler’s identity from the outset, but Hitler doesn’t know the Fascists and must work to figure them out.
        The Liberals win by enacting five Liberal Policies or killing Hitler. The Fascists win by enacting six Fascist Policies, or if Hitler is elected Chancellor after three Fascist Policies have been enacted.
        Whenever a Fascist Policy is enacted, the government becomes more powerful, and the President is granted a single-use power which must be used before the next round can begin. It doesn’t matter what team the President is on; in fact, even Liberal players might be tempted to enact a Fascist Policy to gain new powers.

        OBJECT
        Every player has a secret identity as a member of either the Liberal team or the Fascist team.
        Players on the Liberal team win if either:
        • Five Liberal Policies are enacted. OR
        """
    }
}
