//
//  FileType.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

enum FileType {
    case txt, json, xml, zip
    
    var fileExtension: String {
        switch self {
            case .txt: return "txt"
            case .json: return "json"
            case .xml: return "xml"
            case .zip: return "zip"
        }
    }
    
    static func fromExtension(_ extension: String) -> FileType? {
        switch `extension` {
            case "txt":
                return FileType.txt
            case "json":
                return FileType.json
            case "xml":
                return FileType.xml
            case "zip":
                return FileType.zip
            default:
                return nil
        }
    }
}
