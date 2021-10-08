//
//  JoinGameViewController.swift
//  Collusion
//
//  Created by Marcus Armstrong on 10/8/21.
//

import MultipeerConnectivity
import UIKit

class JoinGameViewController: UIViewController {

    @IBOutlet private var pageLogo: UIImageView!
    @IBOutlet private var projectLabel: UILabel!
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var textFieldUnderline: UIView!
    @IBOutlet private var joinGameButton: UIButton!

    var peerID: MCPeerID!
    var mcSession: MCSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        joinGameButton.layer.cornerRadius = 8
        nameTextField.isHidden = true
        textFieldUnderline.isHidden = true
        nameTextField.layer.opacity = 0
        textFieldUnderline.layer.opacity = 0
    }

    @IBAction func joinGameTapped(_ sender: Any) {
        if nameTextField.text == "Enter Name" {
            self.pageLogo.frame.size.width = 100
            animateTextField()
        } else {
            guard let displayName = nameTextField.text else { return }
            peerID = MCPeerID(displayName: displayName)
            joinSession()
        }
    }

    func animateTextField() {
        UIView.animate(withDuration: 0.5) {
            UIView.animate(withDuration: 4) {
                self.projectLabel.layer.opacity = 0
//                self.view.layoutIfNeeded()
            } completion: { success in
                if success {
                    UIView.animate(withDuration: 0.5) {
                        self.projectLabel.isHidden = true
                        self.nameTextField.isHidden = false
                        self.textFieldUnderline.isHidden = false
                        self.nameTextField.layer.opacity = 1
                        self.textFieldUnderline.layer.opacity = 1

                    }
                }
            }
        }
    }

    func joinSession() {
        let mcBrowser = MCBrowserViewController(serviceType: "gameCreation", session: self.mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
}

extension JoinGameViewController: MCBrowserViewControllerDelegate {

    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}
