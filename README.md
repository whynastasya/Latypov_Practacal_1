# Отчёт о проделанной практической работе с файлами

## Задание

Разработать программу для взаимодействия с файлами в различных форматах с возможностью их модификации, создания или удаления. Разработанный код должен иметь возможность его повторного использования и модификации.

## 1. Информация о логических дисках

Вывод в консоль информации о логических дисках, таких как имя, метка тома, размер и тип файловой системы.

### Результат:

- **Macintosh HD**: основной несъёмный диск для хранения данных системы macOS. Готов к работе.
- **VM**: виртуальная память, зарезервированная для системных нужд. Не готов к использованию.
- **Preboot**: раздел, используемый для загрузки системы (предзагрузка). Не готов к использованию.
- **Update**: раздел, предназначенный для хранения обновлений системы. Не готов к использованию.
- **xART**: раздел размером ~500 МБ для служебных или временных файлов. Не готов к использованию.
- **iSCPreboot**: дополнительный раздел предзагрузки для системных нужд. Не готов к использованию.
- **Hardware**: системный раздел, связанный с оборудованием. Не готов к использованию.
- **home**: раздел с нулевым объемом и свободным местом. Зарезервирован, но не используется.
- **iOS 18.0 Simulator Bundle**: симулятор. Не готов к использованию.
- **Recovery**: раздел восстановления системы. Не готов к использованию.
- **Macintosh HD (дублируется)**: повтор основной системы. Не готов к использованию.
- **FD6EDFAD-5B36-57BB-A689-266F47B63CE1**: неименованный системный раздел. Не готов к использованию.

## 2. Создание и чтение текстового файла

![Создание текстового файла](https://github.com/user-attachments/assets/b50f565c-4b03-4f05-bb21-432d1cf1fb71)

## 3. Создание, чтение и удаление JSON-файла

![Создание JSON-файла](https://github.com/user-attachments/assets/ac0b2de9-844d-4521-80bb-6f719d4e0bb2)

## 4. Работа с XML-файлом

![Работа с XML-файлом](https://github.com/user-attachments/assets/d43cad1e-fbc5-4827-b73e-e1a4eafef9a1)

## 5. Работа с архивом

![Работа с архивом](https://github.com/user-attachments/assets/0cb37df1-0f25-43a9-a0b5-9e8dc03d6242)

## 6. Размер файлов

![Размер файлов](https://github.com/user-attachments/assets/36de6345-86ee-4679-b921-c5c3265ba291)

Чтобы избежать уязвимостей, таких как XXE и инъекции, в Python я использовала ElementTree для безопасного парсинга XML и стандартный json для работы с JSON. В Swift экранировала символы в XML и использовала JSONEncoder/JSONDecoder для безопасной работы с JSON.
