//
//  FileManagerError.swift
//  FileManager
//
//  Created by nastasya on 25.10.2024.
//

import Foundation

enum FileManagerError: Error {
    case fileAlreadyExists
    case fileNotFound
    case fileNotRead
}
