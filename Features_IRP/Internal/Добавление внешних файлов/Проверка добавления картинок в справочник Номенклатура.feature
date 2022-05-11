#language: ru

@tree

Функционал: Проверка добавления картинок в справочник Номенклатура

Как Менеджер я хочу
добавить картинки к номенклатуре 
чтобы можно было посмотреть, как выглядит товар 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0601 Подготовительный (добавление картинок)
	Когда экспорт основных данных
	Когда экспорт настроек картинок
	И я закрываю TestClient "Этот клиент"
	И Я устанавливаю в базу расширение из файла "$КаталогПроекта$\Additional\IRP_TestExtension.cfe"
	И я подключаю профиль TestClient "Этот клиент"

Сценарий: _0602 проверка добавления картинки
	Дано Я открываю навигационную ссылку "e1cib/data/Catalog.Items?ref=b762b13668d0905011eb76684b9f687d"
	И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
	И я делаю клик по элементу клиента тестирования '+' 'Тип' UI Automation
	Когда открылось окно 'Товар с характеристиками (Номенклатура)'
	И я нажимаю на кнопку с именем 'update_slider'
	И я делаю клик по элементу клиента тестирования 'Бренд 1' 'Тип' UI Automation
	Тогда элемент формы с именем "AddAttributeViewHTML" стал равен 
		|'<!DOCTYPE html>'|
		|'<html lang=\"en\">'|
		|'<head>'|
		|'    <meta charset=\"UTF-8\">'|
		|'    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">'|
		|'    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">'|
		|'    <title>Document</title>'|
		|'    <style>'|
		|'*{'|
		|'    padding: 0;'|
		|'    margin: 0;'|
		|'    box-sizing: border-box;'|
		|'}'|
		|''|
		|'.table{'|
		|'    margin-bottom: 5px;'|
		|'    border: 1px solid #e9e9e9;'|
		|'    border-radius: 4px;'|
		|''|
		|'    max-width: 100%;'|
		|'}'|
		|''|
		|'.tHeader{'|
		|'    padding-left: 5px;'|
		|'    padding-right: 5px;'|
		|'    border-bottom: 1px solid #e9e9e9;'|
		|'    font-size: 16px;'|
		|'}'|
		|''|
		|'.tHeader p{'|
		|'    padding: 5px 0;'|
		|'    color: #009646;'|
		|'}'|
		|''|
		|'.tBody{'|
		|'    padding: 5px;'|
		|''|
		|'    display: flex;'|
		|'    flex-direction: column;'|
		|'}'|
		|''|
		|'.tBody .row{'|
		|'    padding-left: 21px;'|
		|'    position: relative;'|
		|'    display: flex;'|
		|''|
		|'    padding-bottom: 1px;'|
		|'    padding-top: 2px;'|
		|'    border-bottom: 1px solid #e9e9e9;'|
		|'}'|
		|''|
		|'.tBody .row:last-child{'|
		|'    padding-top: 2px;'|
		|'    border-bottom: none;'|
		|'}'|
		|''|
		|'.tBody .row span{'|
		|'    display: inline-block;'|
		|'}'|
		|''|
		|'.tBody .row .icon{'|
		|'    position: absolute;'|
		|'    left: 0;'|
		|'}'|
		|''|
		|'.tBody .row .name,'|
		|'.tBody .row .value{'|
		|'    width: 100%;'|
		|'}'|
		|''|
		|'.tBody .row .name{'|
		|'	font-weight: bold;'|
		|'}'|
		|''|
		|'@media screen and (max-width: 600px){'|
		|'    .tBody .row{'|
		|'        padding-left: 21px;'|
		|'        position: relative;'|
		|'        display: flex;'|
		|'        flex-direction: column;'|
		|'    }'|
		|''|
		|'    .tBody .row .value{'|
		|'    	padding-left: 10px;'|
		|'	}'|
		|'}'|
		|'    </style>'|
		|'</head>'|
		|'<body>'|
		|'    <script>'|
		|'function clearAll(){'|
		|'    document.body.innerHTML = \'\';'|
		|'}'|
		|''|
		|'function fillData(jsonData){'|
		|'    let data = JSON.parse(jsonData);'|
		|'    let keys = Object.keys(data);'|
		|'    keys.forEach(groupName => {'|
		|'        if(data[groupName].length === 0) return;'|
		|'        let div = document.createElement(\'div\');'|
		|'        div.className = \'table\''|
		|'        div.id = groupName;'|
		|'        div.innerHTML = `'|
		|'        <div class=\"tHeader\"><p>${groupName}</p></div>'|
		|'        <div class=\"tBody\"></div>'|
		|'        `'|
		|'        document.body.appendChild(div);'|
		|''|
		|'        data[groupName].forEach(element => {'|
		|'            let row = document.createElement(\'div\');'|
		|'            row.className = \'row\';'|
		|'            row.innerHTML = `'|
		|'            <span class=\"icon\"><img src=\"${element.Icon}\" onerror=\"this.style.display=\'none\'\"></span>'|
		|'            <span class=\"name\">${element.Name}</span>'|
		|'            <span class=\"value\">${element.Value}</span>'|
		|'            `'|
		|'            div.querySelector(\'.tBody\').appendChild(row);'|
		|'        })'|
		|'    })'|
		|'}'|
		|'    </script>'|
		|'</body>'|
		|'</html>'|
	И у элемента формы с именем "AddAttributeViewHTML" текст редактирования стал равен 
		|'<html dir=\"ltr\"><head>'|
		|'    <meta charset=\"UTF-8\" http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">'|
		|'    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">'|
		|'    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">'|
		|'    <title>Document</title>'|
		|'    <style>'|
		|'*{'|
		|'    padding: 0;'|
		|'    margin: 0;'|
		|'    box-sizing: border-box;'|
		|'}'|
		|''|
		|'.table{'|
		|'    margin-bottom: 5px;'|
		|'    border: 1px solid #e9e9e9;'|
		|'    border-radius: 4px;'|
		|''|
		|'    max-width: 100%;'|
		|'}'|
		|''|
		|'.tHeader{'|
		|'    padding-left: 5px;'|
		|'    padding-right: 5px;'|
		|'    border-bottom: 1px solid #e9e9e9;'|
		|'    font-size: 16px;'|
		|'}'|
		|''|
		|'.tHeader p{'|
		|'    padding: 5px 0;'|
		|'    color: #009646;'|
		|'}'|
		|''|
		|'.tBody{'|
		|'    padding: 5px;'|
		|''|
		|'    display: flex;'|
		|'    flex-direction: column;'|
		|'}'|
		|''|
		|'.tBody .row{'|
		|'    padding-left: 21px;'|
		|'    position: relative;'|
		|'    display: flex;'|
		|''|
		|'    padding-bottom: 1px;'|
		|'    padding-top: 2px;'|
		|'    border-bottom: 1px solid #e9e9e9;'|
		|'}'|
		|''|
		|'.tBody .row:last-child{'|
		|'    padding-top: 2px;'|
		|'    border-bottom: none;'|
		|'}'|
		|''|
		|'.tBody .row span{'|
		|'    display: inline-block;'|
		|'}'|
		|''|
		|'.tBody .row .icon{'|
		|'    position: absolute;'|
		|'    left: 0;'|
		|'}'|
		|''|
		|'.tBody .row .name,'|
		|'.tBody .row .value{'|
		|'    width: 100%;'|
		|'}'|
		|''|
		|'.tBody .row .name{'|
		|'	font-weight: bold;'|
		|'}'|
		|''|
		|'@media screen and (max-width: 600px){'|
		|'    .tBody .row{'|
		|'        padding-left: 21px;'|
		|'        position: relative;'|
		|'        display: flex;'|
		|'        flex-direction: column;'|
		|'    }'|
		|''|
		|'    .tBody .row .value{'|
		|'    	padding-left: 10px;'|
		|'	}'|
		|'}'|
		|'    </style>'|
		|'<base href=\"http://localhost:8314/\"></head>'|
		|'<body>'|
		|'    <script>'|
		|'function clearAll(){'|
		|'    document.body.innerHTML = \'\';'|
		|'}'|
		|''|
		|'function fillData(jsonData){'|
		|'    let data = JSON.parse(jsonData);'|
		|'    let keys = Object.keys(data);'|
		|'    keys.forEach(groupName => {'|
		|'        if(data[groupName].length === 0) return;'|
		|'        let div = document.createElement(\'div\');'|
		|'        div.className = \'table\''|
		|'        div.id = groupName;'|
		|'        div.innerHTML = `'|
		|'        <div class=\"tHeader\"><p>${groupName}</p></div>'|
		|'        <div class=\"tBody\"></div>'|
		|'        `'|
		|'        document.body.appendChild(div);'|
		|''|
		|'        data[groupName].forEach(element => {'|
		|'            let row = document.createElement(\'div\');'|
		|'            row.className = \'row\';'|
		|'            row.innerHTML = `'|
		|'            <span class=\"icon\"><img src=\"${element.Icon}\" onerror=\"this.style.display=\'none\'\"></span>'|
		|'            <span class=\"name\">${element.Name}</span>'|
		|'            <span class=\"value\">${element.Value}</span>'|
		|'            `'|
		|'            div.querySelector(\'.tBody\').appendChild(row);'|
		|'        })'|
		|'    })'|
		|'}'|
		|'    </script>'|
		|''|
		|'</body></html>'|
		