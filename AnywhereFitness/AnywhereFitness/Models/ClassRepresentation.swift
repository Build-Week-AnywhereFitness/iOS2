//
//  ClassRepresentation.swift
//  AnywhereFitness
//
//  Created by Niranjan Kumar on 11/19/19.
//  Copyright © 2019 NarJesse. All rights reserved.
//

import Foundation

struct ClassRepresentation: Codable {
    let name: String
    let type: Int // Custom Enum
    let duration: Int // Custom Enum
    let intensityLevel: Int // Custom Enum
    let location: String
    let numOfAttendees: Int
    let maxClassSize: Int
    let classDetail: String
    let date: Date
    let id: UUID
}
