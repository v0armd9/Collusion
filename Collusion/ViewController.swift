//
//  ViewController.swift
//  Collusion
//
//  Created by Marcus Armstrong on 10/7/21.
//

import MultipeerConnectivity
import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var cardMessageLabel: UILabel!
    @IBOutlet private var fascistButton: UIButton!
    @IBOutlet private var liberalButton: UIButton!
    @IBOutlet private var sendButton: UIButton!

    // MARK: - Properties
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcNearbyServiceAdvertiser: MCNearbyServiceAdvertiser!
    private var policyToSend: String = ""
    let users = ["player1", "player2", "player3", "player4", "player5"]
    let players: [Player] = []

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showConnectionMenu))
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        mcSession.delegate = self
    }

    // MARK: - IBActions
    @IBAction func fascistButtonTapped(_ sender: Any) {
        policyToSend = "Fascist"
        sendButton.setTitle("Send Fascist Policy", for: .normal)
    }

    @IBAction func liberalButtonTapped(_ sender: Any) {
        policyToSend = "Liberal"
        sendButton.setTitle("Send Liberal Policy", for: .normal)
    }

    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let policyData = policyToSend.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return }

        do {
            try self.mcSession.send(policyData, toPeers: self.mcSession.connectedPeers, with: .unreliable)
        } catch {
            print(error, error.localizedDescription)
        }
    }
}

// MARK: - Private
private extension ViewController {

    @objc func showConnectionMenu() {
        let ac = UIAlertController(title: "Connection Menu", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Host a session", style: .default, handler: hostSession))
        ac.addAction(UIAlertAction(title: "Join a session", style: .default, handler: joinSession))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    func hostSession(action: UIAlertAction) {
        mcNearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "gameCreation")
        mcNearbyServiceAdvertiser.delegate = self
        mcNearbyServiceAdvertiser.startAdvertisingPeer()
    }

    func joinSession(action: UIAlertAction) {
        let mcBrowser = MCBrowserViewController(serviceType: "gameCreation", session: self.mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }

    func printPartyCards() {
        users.forEach { _ in
            print(Card(cardType: .party, cardAffiliation: .fascist))
            print(Card(cardType: .roll, cardAffiliation: .fascist))
            print(Card(cardType: .party, cardAffiliation: .liberal))
            print(Card(cardType: .roll, cardAffiliation: .liberal))
        }
    }

    func printPolicyCards() {
        users.forEach { _ in
            print(Card(cardType: .policy, cardAffiliation: .liberal))
        }
    }
}

// MARK: - MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCBrowserViewControllerDelegate
extension ViewController: MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCBrowserViewControllerDelegate {

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, mcSession)
    }

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {

        switch state {
        case .connected:
            print("Connected: \(peerID.displayName)")
        case .connecting:
            print("Connecting: \(peerID.displayName)")
        case .notConnected:
            print("Not Connected: \(peerID.displayName)")
        @unknown default:
            print("Unknown Error")
        }
    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async { [unowned self] in
            let policyData = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
            if policyData == "Fascist" {
                self.view.backgroundColor = .red
                self.cardMessageLabel.text = "You recieved a Facist Policy Card"
            } else {
                self.view.backgroundColor = .blue
                self.cardMessageLabel.text = "You recieved a Liberal Policy Card"
            }
        }
    }

    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("This was hit 1")
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("this was hit 2")
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("This was hit 3")
    }

    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}
