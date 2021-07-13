//
//  Post.swift
//  SecondTask
//
//  Created by Kalana Rathnayaka on 2021-07-08.
//

import Foundation
import SwiftUI

struct Post: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let body: String
    
}
