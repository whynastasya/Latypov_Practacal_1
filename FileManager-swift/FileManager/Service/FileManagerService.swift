//
//  FileManagerService.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

final class FileManagerService {
    private var fileManagers: [FileType: IFileManager] = [:]
    
    init() {
        fileManagers[.txt] = TextFileManager()
        fileManagers[.json] = JSONFileManager()
        fileManagers[.zip] = ZipFileManager()
        fileManagers[.xml] = XMLFileManager()
    }
    
    func createFile(ofType type: FileType, fileName: String) {
        if let fileManager = fileManagers[type] {
            fileManager.createFile(withName: fileName)
        }
    }
    
    func deleteFile(ofType type: FileType, fileName: String) {
        if let fileManager = fileManagers[type] {
            fileManager.deleteFile(named: fileName)
        }
    }
    
    func readFile(ofType type: FileType, fileName: String) -> String? {
        if let fileManager = fileManagers[type] {
            return fileManager.readFile(named: fileName)
        }
        return ""
    }
    
    func getFileSize(ofType type: FileType, fileName: String) {
        if let fileManager = fileManagers[type] {
            fileManager.getFileSize(named: fileName)
        }
    }
    
    func unzipFile(fileName: String) {
        if let fileManager = fileManagers[.zip] as? ZipFileManager {
            fileManager.unzipFile(fileName: fileName)
        }
    }
    
    func showLogicalDrives() {
        let fileManager = FileManager.default

        let drives = fileManager.mountedVolumeURLs(includingResourceValuesForKeys: nil) ?? []
        
        for drive in drives {
            do {
                let values = try drive.resourceValues(forKeys: [.volumeIdentifierKey,
                                                                .volumeURLKey,
                                                                .volumeNameKey,
                                                                .volumeTotalCapacityKey,
                                                                .volumeAvailableCapacityKey,
                                                                .volumeIsRemovableKey,
                                                                .volumeIsRootFileSystemKey])
                
                print("Имя диска: \(values.volumeName ?? "Неизвестно")")
                print("Метка тома: \(values.volumeIdentifier ?? "Неизвестно" as any NSCopying & NSSecureCoding & NSObjectProtocol)")
                print("Общий размер: \(values.volumeTotalCapacity ?? 0) байт")
                print("Доступно свободного места: \(values.volumeAvailableCapacity ?? 0) байт")
                print("Тип диска: \(values.volumeIsRemovable == true ? "Съемный" : "Несъемный")")
                print("Готов ли диск: \(values.volumeIsRootFileSystem == true ? "Да" : "Нет")")
                print("---")
            } catch {
                print("Не удалось получить информацию о диске: \(drive.absoluteString)")
            }
        }
    }
    
    func fileExists(ofType type: FileType, named fileName: String) -> Bool {
        if let fileManager = fileManagers[type] {
            return fileManager.fileExists(named: fileName)
        }
        
        return false
    }
}
