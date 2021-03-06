#language: ru

@tree

Функционал: Проверка добавления картинок в справочник Товары

Как Менеджер я хочу
добавить картинки к номенклатуре 
чтобы можно было посмотреть, как выглядит товар 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _1101 Подготовительный
	Когда Загрузка данных в справочник Товары

Сценарий: _1102 проверка добавления картинки (существующий товар)
	* Закроем все окна от предыдущих тестов
		И я закрываю все окна клиентского приложения
	* Открываем существующий элемент справочника Товары
		И Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca0000d8843cd1b11dc8d043d710077"
		И я запоминаю значение поля с именем 'Наименование' как 'Наименование'
		И Я запоминаю значение выражения '"$Наименование$" + " (Товар) *"' в переменную "НаименованиеОкнаТовара"
		И Я запоминаю значение выражения '"$Наименование$" + " (Файл)"' в переменную "НаименованиеОкнаФайла"
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
	* Создаём новый файл с картинкой
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст '$Наименование$'
		И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		Когда открылось окно '$НаименованиеОкнаФайла$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$НаименованиеОкнаФайла$' в течение 20 секунд
	* Выбираем созданный файл картинки
		Тогда открылось окно 'Файлы'
		И в таблице "Список" я перехожу к строке
			| 'Наименование'   |
			| '$Наименование$' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
	* Записываем Товар с выбранной картинкой
		Тогда открылось окно '$НаименованиеОкнаТовара$'
		Тогда элемент формы с именем "ФайлКартинки" стал равен '$Наименование$'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

Сценарий: _1103 проверка добавления картинки (услуга)
	* Закроем все окна от предыдущих тестов
		И я закрываю все окна клиентского приложения
	* Открываем существующий элемент справочника Товары
		И Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8d3a000d8843cd1b11dd321ba7a30aaf"
		И я запоминаю значение поля с именем 'Наименование' как 'Наименование'
		И Я запоминаю значение выражения '"$Наименование$" + " (Товар) *"' в переменную "НаименованиеОкнаТовара"
		И Я запоминаю значение выражения '"$Наименование$" + " (Файл)"' в переменную "НаименованиеОкнаФайла"
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
	* Создаём новый файл с картинкой
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст '$Наименование$'
		И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		Когда открылось окно '$НаименованиеОкнаФайла$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$НаименованиеОкнаФайла$' в течение 20 секунд
	* Выбираем созданный файл картинки
		Тогда открылось окно 'Файлы'
		И в таблице "Список" я перехожу к строке
			| 'Наименование'   |
			| '$Наименование$' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
	* Записываем Товар с выбранной картинкой
		Тогда открылось окно '$НаименованиеОкнаТовара$'
		Тогда элемент формы с именем "ФайлКартинки" стал равен '$Наименование$'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

Сценарий: _1104 проверка добавления картинки (создание товара с записью)
	* Закроем все окна от предыдущих тестов и перейдём в форму списка справочника Товары
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	* Создаём новую товарную позицию и записываем
		Когда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Товар (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Товар тестовый'
		И я запоминаю значение поля с именем 'Наименование' как 'Наименование'
		И Я запоминаю значение выражения '"$Наименование$" + " (Товар) *"' в переменную "НаименованиеОкнаТовара"
		И Я запоминаю значение выражения '"$Наименование$" + " (Файл)"' в переменную "НаименованиеОкнаФайла"
		И я нажимаю на кнопку 'Записать'
	* Создаём и выбираем файл у нового записанного товара
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст '$Наименование$'
		И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		Когда открылось окно '$НаименованиеОкнаФайла$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$НаименованиеОкнаФайла$' в течение 20 секунд
	* Выбираем созданный файл картинки
		Тогда открылось окно 'Файлы'
		И в таблице "Список" я перехожу к строке
			| 'Наименование'   |
			| '$Наименование$' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
	* Записываем Товар с выбранной картинкой
		Тогда открылось окно '$НаименованиеОкнаТовара$'
		Тогда элемент формы с именем "ФайлКартинки" стал равен '$Наименование$'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

Сценарий: _1105 проверка добавления картинки (создание товара без записи)
	* Закроем все окна от предыдущих тестов и перейдём в форму списка справочника Товары
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	* Создаём новую товарную позицию
		Когда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Товар (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Товар тестовый с картинкой'
		И я запоминаю значение поля с именем 'Наименование' как 'Наименование'
		И Я запоминаю значение выражения '"$Наименование$" + " (Товар) *"' в переменную "НаименованиеОкнаТовара"
		И Я запоминаю значение выражения '"$Наименование$" + " (Файл)"' в переменную "НаименованиеОкнаФайла"
	* Пытаемся выбрать файл у незаписанного товара
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно '1С:Предприятие'
		И элемент формы с именем 'Message' стал равен 'Данные не записаны'
		И я нажимаю на кнопку 'OK'
		Тогда открылось окно 'Файлы'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст '$Наименование$'
		И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		Тогда открылось окно '1С:Предприятие'
		И элемент формы с именем 'Message' стал равен 'Не заполнен владелец хранимого файла'
		И я нажимаю на кнопку 'OK'
		И Я закрываю окно 'Файл (создание) *'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Нет'
		И я закрываю все окна клиентского приложения