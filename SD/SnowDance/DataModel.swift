//
//  Data.swift
//  SD
//
//  Created by lan on 2023/10/18.
//

import SwiftUI

class SDData: Equatable {
    var sdCenter: String = "Central Topic"
    var sdMain1: String = "Main Topic 1"
    var sdMain2: String = "Main Topic 2"
    var sdMain3: String = "Main Topic 3"
    var sdSub1_1: String = "Subtopic 1"
    var sdSub1_2: String = "Subtopic 2"
    var sdSub1_3: String = "Subtopic 3"
    
    static func == (lhs: SDData, rhs: SDData) -> Bool {
        return lhs.sdCenter == rhs.sdCenter &&
        lhs.sdMain1 == rhs.sdMain1 &&
        lhs.sdMain2 == rhs.sdMain2 &&
        lhs.sdMain3 == rhs.sdMain3 &&
        lhs.sdSub1_1 == rhs.sdSub1_1 &&
        lhs.sdSub1_2 == rhs.sdSub1_2 &&
        lhs.sdSub1_3 == rhs.sdSub1_3
    }
}
