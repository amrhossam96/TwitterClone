//
//  Tweet.swift
//  TwitterClone
//
//  Created by Amr Hossam on 04/12/2022.
//

import Foundation

struct Tweet: Codable, Identifiable {
    var id = UUID().uuidString
    let author: TwitterUser
    let tweetContent: String
    var likesCount: Int
    var likers: [String]
    let isReply: Bool
    let parentReference: String?
}
