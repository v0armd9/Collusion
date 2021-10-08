//
//  TestViewController.swift
//  CollusionTV
//
//  Created by Marcus Armstrong on 10/8/21.
//

import MultipeerConnectivity
import UIKit

class TestViewController: UIViewController {

    var mcSessionService = MCSessionService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        showConnectionMenu()
    }

    private func showConnectionMenu() {
        let ac = UIAlertController(title: "Connection Menu", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Join a session", style: .default, handler: joinSession))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    private func hostSession() {
        mcSessionService.mcNearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: mcSessionService.peerID, discoveryInfo: nil, serviceType: "gameCreation")
//        mcSessionService.mcNearbyServiceAdvertiser.delegate = self
        mcSessionService.mcNearbyServiceAdvertiser.startAdvertisingPeer()
    }

    private func joinSession(action: UIAlertAction) {
        let mcBrowser = MCBrowserViewController(serviceType: "gameCreation", session: self.mcSessionService.mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
}

extension TestViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }


}
