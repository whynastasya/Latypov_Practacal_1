//
//  JSONFileManager.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

final class JSONFileManager: IFileManager {
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
        
        let user = User(name: name, age: age)
        
        
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            let jsonString = String(data: jsonData, encoding: .utf8)
            let fileURL = getFileURL(fileName: fileName)
            try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
            print("JSON файл \(fileName) успешно создан.")
        } catch {
            print("Ошибка при создании JSON файла: \(error.localizedDescription)")
        }
    }

    func readFile(named fileName: String) -> String? {
        let fileURL = getFileURL(fileName: fileName)
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let user = try JSONDecoder().decode(User.self, from: jsonData)
            return "\(user)"
        } catch {
            print("Ошибка при чтении JSON файла: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteFile(named fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("JSON файл \(fileName) успешно удален.")
        } catch {
            print("Ошибка при удалении JSON файла: \(error.localizedDescription)")
        }
    }
}
