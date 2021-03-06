//
//  CoordinatorDelegate.swift
//  IMDB
//
//  Created by Ramy Sabry on 12/04/2022.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidEnd(_ childCoordinator: Coordinator)
}
