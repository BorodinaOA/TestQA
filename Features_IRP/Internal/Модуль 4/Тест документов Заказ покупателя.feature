#language: ru

@tree

Функционал: Тест документов Заказ покупателя

Как менеджер по продажам я хочу
протестировать заполнение документа Заказ покупателя 
чтобы избежать ошибок при работе

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _ДЗ_0401 подготовительный сценарий (заказ покупателя)
	Когда экспорт основных данных

Сценарий: _ДЗ_0402 Проверка заполнения поля Партнёр в документе Заказ покупателя
	И я закрываю все окна клиентского приложения
	* Создание нового документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
	* Проверка правильности установки фильтров
		Тогда открылось окно 'Партнеры'
		И флаг с именем 'FilterCustomer' равен 'Да'
		И флаг с именем 'FilterVendor' равен 'Нет'
		И флаг с именем 'FilterEmployee' равен 'Нет'
		И флаг с именем 'FilterOpponent' равен 'Нет'
	* Проверка доступности партнёров с типом Покупатель
		Тогда таблица "List" содержит строки:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
			| 'Клиент 2 (2 соглашения)' |
			| 'Клиент и поставщик'      |
			| 'Розничный покупатель'    |
			| 'Розничный клиент 1'      |
	* Переход к нужной строке и выбор значения в документ
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
	* Проверка правильности заполнения поля Партнёр
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'

Сценарий: _ДЗ_0403 Проверка блокировки поля Контрагент в документе Заказ покупателя
	И я закрываю все окна клиентского приложения
	* Создание нового документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Проверка доступности поля Контрагент при незаполненном поле Партнёр
		И элемент формы с именем "LegalName" не доступен
	* Заполнение поля Партнёр и проверка доступности поля Контрагент
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		И элемент формы с именем "LegalName" доступен

Сценарий: _ДЗ_0404 Проверка правильности заполнения шапки документа Заказ покупателя при выборе партнёра
	И я закрываю все окна клиентского приложения
	* Создание нового документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Заполнение поля Партнёр
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
	* Проверка заполнения поля Контрагент
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 1'
	* Проверка заполнения соглашения
		Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	* Проверка изменения параметров шапки документа при перевыборе соглашения
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'
		И элемент формы с именем 'Agreement' стал равен ''
	* Завершение сценария 
	И я закрываю все окна клиентского приложения