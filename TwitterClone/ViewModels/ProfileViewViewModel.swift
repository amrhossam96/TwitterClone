//
//  ProfileViewViewModel.swift
//  TwitterClone
//
//  Created by Amr Hossam on 26/11/2022.
//

import Foundation
import Combine
import FirebaseAuth

final class ProfileViewViewModel: ObservableObject {
    
    @Published var user: TwitterUser?
    @Published var error: String?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    
    func retreiveUser() {
        guard let id = Auth.auth().currentUser?.uid else { return }
        DatabaseManager.shared.collectionUsers(retreive: id)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error.localizedDescription
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscriptions)

    }
    
    
    func getFormattedDate(with date:  Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        return dateFormatter.string(from: date)
    }
}
