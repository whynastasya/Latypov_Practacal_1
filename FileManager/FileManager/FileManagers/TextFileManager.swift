//
//  TextFileManager.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

final class TextFileManager: IFileManager {
    func createFile(withName fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        print("Введите содержимое файла:")
        
        if let content = readLine() {
            do {
                try content.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Текстовый файл \(fileName) успешно создан.")
            } catch {
                print("Ошибка при создании текстового файла: \(error.localizedDescription)")
            }
        }
    }

    func readFile(named fileName: String) -> String? {
        let fileURL = getFileURL(fileName: fileName)
        do {
            return try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            print("Ошибка при чтении текстового файла: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteFile(named fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("Текстовый файл \(fileName) успешно удален.")
        } catch {
            print("Ошибка при удалении текстового файла: \(error.localizedDescription)")
        }
    }
}
