//
//  main.swift
//  FileManager
//
//  Created by nastasya on 28.09.2024.
//

import Foundation

func showMenu() {
    print("""
    Выберите действие:
    1. Показать логические диски - show drivers
    2. Создать - create 'filename'
    3. Прочитать - read 'filename'
    4. Удалить - delete 'filename'
    5. Размер файла - size 'filename'
    6. Разархивировать - unzip 'filename'
    0. Выход
    """)
}

func main() {
    showMenu()
    let fileManager = FileManagerService()
    
    while true {
        print("Введите команду:")
        
        if let input = readLine() {
            let components = input.split(separator: " ")
            guard components.count >= 2 else {
                print("Некорректный ввод. Попробуйте снова.")
                
                continue
            }
            
            let command = String(components[0])
            let fileName = String(components[1])
            
            switch command {
                case "show":
                    if fileName == "drivers" {
                        fileManager.showLogicalDrives()
                    }
                case "create":
                    checkConditionsForCreating(for: fileName) {
                        if let type = fileType(for: fileName) {
                            fileManager.createFile(ofType: type, fileName: fileName)
                        }
                    }
                case "read":
                    checkConditionsForReadingAndDeleting(for: fileName) {
                        if let type = fileType(for: fileName) {
                            if let content = fileManager.readFile(ofType: type, fileName: fileName) {
                                print("Содержимое файла:\n\(content)")
                            } else {
                                print("Файл пустой")
                            }
                        }
                    }
                case "delete":
                    checkConditionsForReadingAndDeleting(for: fileName) {
                        if let type = fileType(for: fileName) {
                            fileManager.deleteFile(ofType: type, fileName: fileName)
                        }
                    }
                case "size":
                    checkConditionsForReadingAndDeleting(for: fileName) {
                        if let type = fileType(for: fileName) {
                            fileManager.getFileSize(ofType: type, fileName: fileName)
                        }
                    }
                case "unzip":
                    checkConditionsForReadingAndDeleting(for: fileName) {
                        if let type = fileType(for: fileName), type == .zip {
                            fileManager.unzipFile(fileName: fileName)
                        } else {
                            print("Ошибка: файл \(fileName) не является архивом")
                        }
                    }
                case "0":
                    print("Выход из программы.")
                    return
                default:
                    print("Некорректный ввод. Пожалуйста, попробуйте снова.")
            }
        }
    }
    
    func fileType(for fileName: String) -> FileType? {
        let fileExtension = (fileName as NSString).pathExtension
        
        return FileType.fromExtension(fileExtension)
    }
    
    func checkConditionsForCreating(for fileName: String, completion: @escaping () -> Void) {
        if let type = fileType(for: fileName) {
            if !fileManager.fileExists(ofType: type, named: fileName) {
                completion()
            } else {
                print("Ошибка: файл \(fileName) уже существует")
            }
        } else {
            print("Ошибка: Неподдерживаемый формат файла.")
        }
    }
    
    func checkConditionsForReadingAndDeleting(for fileName: String, completion: @escaping () -> Void) {
        if let type = fileType(for: fileName) {
            if fileManager.fileExists(ofType: type, named: fileName) {
                completion()
            } else {
                print("Ошибка: файл \(fileName) не найден")
            }
        } else {
            print("Ошибка: Неподдерживаемый формат файла.")
        }
    }
}

main()
