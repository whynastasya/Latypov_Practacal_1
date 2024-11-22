//
//  XMLFileManager.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

final class XMLFileManager: IFileManager {
    
    // MARK: - Public Methods
    
    func createFile(withName fileName: String) {
        print("Введите имя пользователя:")
        guard let name = readLine(), !name.isEmpty else {
            print("Имя не может быть пустым.")
            return
        }
        
        print("Введите возраст пользователя:")
        guard let ageString = readLine(), let age = Int(ageString) else {
            print("Возраст должен быть числом.")
            return
        }
        
        let safeName = encodeXML(name)
        let safeAge = encodeXML(String(age))
        
        let xmlString = """
            <?xml version="1.0" encoding="UTF-8"?>
            <user>
                <name>\(safeName)</name>
                <age>\(safeAge)</age>
            </user>
            """
        
        do {
            let fileURL = getFileURL(fileName: fileName)
            try xmlString.write(to: fileURL, atomically: true, encoding: .utf8)
            print("XML файл \(fileName) успешно создан.")
        } catch {
            print("Ошибка при создании XML файла: \(error.localizedDescription)")
        }
    }
    
    func readFile(named fileName: String) -> String? {
        let fileURL = getFileURL(fileName: fileName)
        do {
            let xmlData = try String(contentsOf: fileURL, encoding: .utf8)
            let decodedData = decodeXML(xmlData)
            return decodedData
        } catch {
            print("Ошибка при чтении XML файла: \(error.localizedDescription)")
            return nil
        }
    }
    
    func deleteFile(named fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("XML файл \(fileName) успешно удален.")
        } catch {
            print("Ошибка при удалении XML файла: \(error.localizedDescription)")
        }
    }
    
    private func encodeXML(_ text: String) -> String {
        return text
            .replacingOccurrences(of: "&", with: "&amp;")
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
            .replacingOccurrences(of: "\"", with: "&quot;")
            .replacingOccurrences(of: "'", with: "&apos;")
    }
    
    private func decodeXML(_ text: String) -> String {
        return text
            .replacingOccurrences(of: "&amp;", with: "&")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&apos;", with: "'")
    }
    
    private func getFileURL(fileName: String) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(fileName)
    }
}
