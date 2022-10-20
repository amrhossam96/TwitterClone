//
//  ProfileDataFormViewViewModel.swift
//  TwitterClone
//
//  Created by Amr Hossam on 17/10/2022.
//

import Foundation
import Combine



final class ProfileDataFormViewViewModel: ObservableObject {
    
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
    
}
