#language: ru

@tree

Функционал: пример использования экспортных сценариев

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: пример использования экспортных сценариев 
* подготовка тестовых данных
	и загружаю константы
и создание документа поступления товаров
и проверка наличия в справочнике номенклатуры Торт
И перезаполнение константы SSLIMAP значением
