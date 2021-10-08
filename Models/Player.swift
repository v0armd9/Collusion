//
//  Player.swift
//  Collusion
//
//  Created by Mason Kelly on 10/7/21.
//

import UIKit

enum Affiliation {
    case liberal
    case fascist
    case hitler
}

class Player {
    let name: String
    let party: Affiliation
    var isSecretHitler: Bool
    var isPresident: Bool
    var isChancellor: Bool
    var hasVoted: Bool
    var voteValue: Bool
    var isDead: Bool

    init(name: String, party: Affiliation, isSecretHitler: Bool, isPresident: Bool, isChancellor: Bool, hasVoted: Bool, voteValue: Bool, isDead: Bool) {
        self.name = name
        self.party = party
        self.isSecretHitler = isSecretHitler
        self.isPresident = isPresident
        self.isChancellor = isChancellor
        self.hasVoted = hasVoted
        self.voteValue = voteValue
        self.isDead = isDead
    }
}

enum GamePlayOptions: Int {
    case five = 5
    case six = 6
    case seven = 7

    var affiliationOptions: [Affiliation] {
        switch self {
        case .five:
            return [.liberal, .liberal, .liberal, .fascist, .hitler]
        case .six:
            return [.liberal, .liberal, .liberal, .liberal, .fascist, .hitler]
        case .seven:
            return [.liberal, .liberal, .liberal, .liberal, .fascist, .fascist, .hitler]
        }
    }

    var liberalBoardConfiguration: [ExecutiveActions] {
        switch self {
        case .five, .six, .seven:
            return [.empty, .empty, .empty, .empty, .empty]
        }
    }

    var fascistBoardConfigurations: [ExecutiveActions] {
        switch self {
        case .five:
            return [.empty, .empty, .policyPeek, .execution, .executionWithVeto]
        case .six:
            return [.empty, .investigateLoyalty, .specialElection, .execution, .executionWithVeto]
        case .seven:
            return [.investigateLoyalty, .investigateLoyalty, .specialElection, .execution, .executionWithVeto]
        }
    }
}

enum ExecutiveActions {
    case policyPeek
    case investigateLoyalty
    case specialElection
    case execution
    case executionWithVeto
    case empty
}

