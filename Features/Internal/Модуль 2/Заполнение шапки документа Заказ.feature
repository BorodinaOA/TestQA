#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Заполнение шапки документа Заказ

Как Менеджер по продажам я хочу
создать документ Заказ  
чтобы проверить правильность запонления шапки документа 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: подготовка данных для заполнения шапки заказа
* Загрузка справочника Организации
	Когда Создание объектов для справочника Организации
	
* Загрузка справочника Контрагенты
	и Загрузка покупателей
* Загрузка справочника Валюты
	и Создание объектов для справочника Валюты
* Загрузка справочника Склады
	и Создание объектов для справочника Склады		

Сценарий: Создание заказа с проверкой недоступности поля Валюта
	И я закрыл все окна клиентского приложения
* Создание документа Заказ	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Выбор организации без использования валюты
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И элемент формы с именем "Валюта" отсутствует на форме

Сценарий: Создание заказа с проверкой доступности поля Валюта
	И я закрыл все окна клиентского приложения
* Создание документа Заказ	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Выбор организации	с использованием валюты
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И элемент формы с именем "Валюта" присутствует на форме

Сценарий: Создание заказа с заполнением шапки
	И я закрыл все окна клиентского приложения
* Создание документа Заказ	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Выбор организации
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
* Заполнение валюты (при необходимости)	
	Если элемент 'Валюта' присутствует на форме Тогда
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение контрагента
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'    |
		| '000000015' | 'Магазин "Обувь"' |
	И в таблице "Список" я выбираю текущую строку
* Проверка правильности выбора цены Розничная	
	Тогда элемент формы с именем "ВидЦен" стал равен 'Розничная'		
* Заполнение поля Склад
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'

Сценарий: Проверка заполнения цены при выборе контрагента в заказе
	И я закрыл все окна клиентского приложения
* Создание документа Заказ	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Выбор организации
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
* Заполнение валюты (при необходимости)	
	Если элемент 'Валюта' присутствует на форме Тогда
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Выбор контрагента с мелкооптовой ценой
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'           |
		| '000000016' | 'Магазин "Мясная лавка"' |
	И в таблице "Список" я выбираю текущую строку
* Проверка правильности выбора цены Мелкооптовая	
	Тогда элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'		
* Выбор контрагента с розничной ценой
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'    |
		| '000000015' | 'Магазин "Обувь"' |
	И в таблице "Список" я выбираю текущую строку
* Проверка правильности выбора цены Розничная	
	Тогда элемент формы с именем "ВидЦен" стал равен 'Розничная'		
* Выбор контрагента с оптовой ценой
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000013' | 'Магазин "Продукты"' |
	И в таблице "Список" я выбираю текущую строку
* Проверка правильности выбора цены Оптовая	
	Тогда элемент формы с именем "ВидЦен" стал равен 'Оптовая'		