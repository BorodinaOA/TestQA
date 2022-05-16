﻿#language: ru

@tree

Функционал: Тест заполнения шапки документов Заказ покупателя

Как менеджер по продажам я хочу
протестировать заполнение шапки документа Заказ покупателя 
чтобы избежать ошибок при работе

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _ДЗ_0511 подготовительный сценарий (заказ покупателя)
//	Когда экспорт основных данных

Сценарий: _ДЗ_0512 Проверка заполнения из соглашения поля Организация в документе Заказ покупателя с условием (истина)
	И я закрываю все окна клиентского приложения
	* Создание нового документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Выбор партнёра
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'       |
			| 'Розничный клиент 1' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
	* Выбор соглашения
		Если элемент формы с именем "Agreement" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Agreement"
			Тогда открылось окно 'Соглашения'
			И в таблице "List" я перехожу к строке:
				| 'Наименование'       |
				| 'Розничный клиент 1' |
			И в таблице "List" я выбираю текущую строку
			Тогда открылось окно 'Заказ покупателя (создание) *'
	* Проверка заполнения поля Организация
		Если элемент формы с именем "Company" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
			Тогда открылось окно 'Организации'
			И в таблице "List" я перехожу к строке:
				| 'Наименование'           |
				| 'Собственная компания 1' |
			И в таблице "List" я выбираю текущую строку
			Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'

Сценарий: _ДЗ_0513 Проверка заполнения из соглашения поля Организация в документе Заказ покупателя с условием (ложь)
	И я закрываю все окна клиентского приложения
	* Создание нового документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
		* Выбор партнёра 2
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
	* Выбор соглашения
		Если элемент формы с именем "Agreement" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Agreement"
			Тогда открылось окно 'Соглашения'
			И в таблице "List" я перехожу к строке:
				| 'Наименование'                                        |
				| 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
			И в таблице "List" я выбираю текущую строку
			Тогда открылось окно 'Заказ покупателя (создание) *'
	* Проверка заполнения поля Организация
		Если элемент формы с именем "Company" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
			Тогда открылось окно 'Организации'
			И в таблице "List" я перехожу к строке:
				| 'Наименование'           |
				| 'Собственная компания 1' |
			И в таблице "List" я выбираю текущую строку
			Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
	* Завершение сценария
		И я закрываю все окна клиентского приложения