//
//  Cards.swift
//  Collusion
//
//  Created by Mason Kelly on 10/7/21.
//

import UIKit
import SpriteKit

// MARK: - CardType
enum CardType {
    case party
    case roll
    case policy
}

// MARK: - CardAffiliation
enum CardAffiliation {
    case fascist
    case liberal
    case hitler
}

// MARK: - Card
class Card: SKSpriteNode {
    let cardType: CardType
    let cardAffiliation: CardAffiliation
    let frontTexture: SKTexture
    let backTexture: SKTexture

    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(cardType: CardType, cardAffiliation: CardAffiliation) {
        self.cardType = cardType
        self.cardAffiliation = cardAffiliation

        switch cardType {
        case .party:
            backTexture = SKTexture(imageNamed: "")
            switch cardAffiliation {
            case .fascist:
                frontTexture = SKTexture(imageNamed: "")
            case .liberal:
                frontTexture = SKTexture(imageNamed: "")
            case .hitler:
                frontTexture = SKTexture(imageNamed: "")
            }
        case .roll:
            backTexture = SKTexture(imageNamed: "")
            switch cardAffiliation {
            case .fascist:
                frontTexture = SKTexture(imageNamed: "")
            case .liberal:
                frontTexture = SKTexture(imageNamed: "")
            case .hitler:
                frontTexture = SKTexture(imageNamed: "")
            }
        case .policy:
            backTexture = SKTexture(imageNamed: "")
            switch cardAffiliation {
            case .fascist:
                frontTexture = SKTexture(imageNamed: "")
            case .liberal:
                frontTexture = SKTexture(imageNamed: "")
            case .hitler:
                frontTexture = SKTexture(imageNamed: "")
            }
        }

        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
    }
}
