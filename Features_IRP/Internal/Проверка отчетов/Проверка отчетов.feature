﻿#language: ru

@tree
@Отчеты

Функционал: Тестирование отчетов

Как Тестировщик я хочу
протестировать отчеты 
чтобы проверить, что у пользователя не возникает проблем 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0701 подготовительный сценарий (тестирование отчетов)
	Когда экспорт основных данных
	Когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
	"""bsl
		Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	"""

Сценарий: _0702 D0010 Информация по товарам
	И В командном интерфейсе я выбираю 'Отчеты' 'D0010 Информация по товарам'
	Тогда открылось окно 'D0010 Информация по товарам'
	И я нажимаю на кнопку с именем 'FormGenerate'
	// сравнение отчета с эталонной таблицей
	// сравнить можно с маленькой таблицей, тогда указываем её непосредственно
	Тогда табличный документ "Result" равен:
		| 'Номенклатура'              | 'Файл'         | 'Штрихкод'                         |
		| 'Характеристика'            | ''             | ''                                 |
		| 'Серия номенклатуры'        | ''             | ''                                 |
		| 'Товар с характеристиками'  | 'ValueStorage' | '67676787889899\n90997878798989\n' |
		| 'S/Красный'                 | 'ValueStorage' | '67676787889899'                   |
		| 'XS/Черный'                 | 'ValueStorage' | '90997878798989'                   |
		| 'M/Черный'                  | 'ValueStorage' | ''                                 |
		| 'Товар без характеристик'   | ''             | '787889899'                        |
		| 'Товар без характеристик'   | ''             | '787889899'                        |
		| 'Услуга'                    | ''             | ''                                 |
		| 'Услуга'                    | ''             | ''                                 |
		| 'Товар со спецификацией'    | ''             | '\n\n'                             |
		| '/'                         | ''             | ''                                 |
		| '/'                         | ''             | ''                                 |
		| 'XS/Красный'                | ''             | ''                                 |
		| 'Набор'                     | ''             | '\n\n'                             |
		| '/'                         | ''             | ''                                 |
		| '/Товар с характеристиками' | ''             | ''                                 |
		| '/'                         | ''             | ''                                 |
	// в общем случае советуют сравнивать с макетами с использованием шаблонов
	Дано Табличный документ "Result" равен макету "ИнформацияПоТоварам1" по шаблону
	// при значительной величине и сложности отчета можно использовать сравнение значений ячеек
	И в табличном документе "Result" ячейка с адресом "R8C3" равна "78788989*" по шаблону
	// так же можно сравнивать области табличных документов через макеты или таблицы на языке Геркин

Сценарий: _0903 проверка отчета D1001 Закупки
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
	Тогда открылось окно 'D1001 Закупки'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	// проверка заполнения реально заполняемой ячейки с ожиданием
	И я жду когда в табличном документе "Result" заполнится ячейка "R16C4" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки1" по шаблону