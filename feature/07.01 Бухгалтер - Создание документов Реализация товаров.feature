﻿#language: ru

@tree

Функционал: Создание документов Реализация товаров в периоде 2023-2024

Как МенеджерОбслуживанияКлиентов я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документов Реализация товаров

И В командном интерфейсе я выбираю 'Обслуживание клиентов (ВКМ)' 'Реализации товаров и услуг'
Тогда открылось окно 'Реализации товаров и услуг'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Реализация товаров и услуг (создание)'
И из выпадающего списка с именем "Организация" я выбираю по строке 'Наша ОРГАНИЗАЦИЯ'
И из выпадающего списка с именем "Контрагент" я выбираю по строке 'Иванов ИИ ИП'
И из выпадающего списка с именем "Договор" я выбираю по строке 'Договор услуг с Ивановым ИИ 01-06.2023'
И в поле с именем 'Дата' я ввожу текст '30.06.2023  0:00:00'
И я перехожу к закладке с именем "ГруппаУслуги"
И я нажимаю на кнопку с именем 'ФормаЗаписать'
Тогда открылось окно 'Реализация товаров и услуг * от *'
И в таблице "Услуги" я нажимаю на кнопку с именем 'ВКМ_КнопкаЗаполнить'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Реализация товаров и услуг * от *' в течение 5 секунд

Когда открылось окно 'Реализации товаров и услуг'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Реализация товаров и услуг (создание)'
И из выпадающего списка с именем "Организация" я выбираю по строке 'Наша ОРГАНИЗАЦИЯ'
И из выпадающего списка с именем "Контрагент" я выбираю по строке 'Пупкин ПП ИП'
И из выпадающего списка с именем "Договор" я выбираю по строке 'Договор услуг Пупкиным ПП 06-12.2023'
И в поле с именем 'Дата' я ввожу текст '30.06.2023  0:00:00'
И я перехожу к закладке с именем "ГруппаУслуги"
И я нажимаю на кнопку с именем 'ФормаЗаписать'
Тогда открылось окно 'Реализация товаров и услуг * от *'
И в таблице "Услуги" я нажимаю на кнопку с именем 'ВКМ_КнопкаЗаполнить'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Реализация товаров и услуг * от *' в течение 5 секунд

Тогда открылось окно 'Реализации товаров и услуг'
И Я закрываю окно 'Реализации товаров и услуг'
