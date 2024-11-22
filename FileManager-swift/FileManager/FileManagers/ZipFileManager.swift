//
//  ZipFileManager.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation
import ZIPFoundation

final class ZipFileManager: IFileManager {
    func createFile(withName fileName: String) {
        let zipFileURL = getFileURL(fileName: "\(fileName)")
        print("Введите название файла для архивации:")
        if let content = readLine() {
            if self.fileExists(named: content) {
                let fileToZipURL = getFileURL(fileName: content)
                
                do {
                    try FileManager.default.zipItem(at: fileToZipURL, to: zipFileURL)
                    print("Файл \(content) успешно добавлен в ZIP архив \(fileName)")
                } catch {
                    print("Ошибка при создании ZIP архива: \(error.localizedDescription)")
                }
            } else {
                print("Ошибка: файла \(content) не существует")
            }
        }
    }

    func readFile(named fileName: String) -> String? {
        print("Чтение содержимого ZIP файла не поддерживается в текстовом формате.")
        return nil
    }

    func deleteFile(named fileName: String) {
        let fileURL = getFileURL(fileName: fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("ZIP файл \(fileName) успешно удален.")
        } catch {
            print("Ошибка при удалении ZIP файла: \(error.localizedDescription)")
        }
    }

    func unzipFile(fileName: String) {
        let zipFileURL = getFileURL(fileName: "\(fileName)")
        let destinationURL = getFileURL(fileName: "\(fileName)-unzipped")

        do {
            try FileManager.default.unzipItem(at: zipFileURL, to: destinationURL)
            print("Архив \(fileName) успешно разархивирован.")
            
            let contents = try FileManager.default.contentsOfDirectory(atPath: destinationURL.path)
            for file in contents {
                print("Разархивированный файл: \(file)")
            }
        } catch {
            print("Ошибка при разархивировании: \(error.localizedDescription)")
        }
    }
}
