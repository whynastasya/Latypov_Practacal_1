//
//  IFileManager.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

protocol IFileManager {
    func createFile(withName fileName: String)
    func readFile(named fileName: String) -> String?
    func deleteFile(named fileName: String)
}

extension IFileManager {
    func getFileURL(fileName: String) -> URL {
        let directoryPath = "/Users/nastasya/Developer/SimpleFileManager/Files"
        let directoryURL = URL(fileURLWithPath: directoryPath)
        
        return directoryURL.appendingPathComponent(fileName)
    }
    
    func getFileSize(named fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: fileURL.path)
            if let fileSize = attributes[.size] as? UInt64 {
                print("Размер файла \(fileName): \(formatFileSize(fileSize))")
            }
        } catch {
            print("Ошибка при получении размера файла: \(error.localizedDescription)")
        }
    }
    
    func fileExists(named fileName: String) -> Bool {
        return FileManager.default.fileExists(atPath: getFileURL(fileName: fileName).path)
    }

    private func formatFileSize(_ size: UInt64) -> String {
        let byteCountFormatter = ByteCountFormatter()
        byteCountFormatter.allowedUnits = [.useBytes, .useKB, .useMB, .useGB]
        byteCountFormatter.countStyle = .file
        return byteCountFormatter.string(fromByteCount: Int64(size))
    }
}
