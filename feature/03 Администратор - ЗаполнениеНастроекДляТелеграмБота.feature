﻿#language: ru

@tree

Функционал: Комплексный процесс настройки работы с телеграм-ботом

Как Администратор я хочу

Заполнить настройки для работы с телеграм-ботом 

чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Настройка работы с Телеграм-ботом
//Переменные
//МОИ//Идентификатор группы для оповещения (Константы): 367324359 
//МОИ//Токен управления телеграм-ботом (Константы): 6942077637:AAGNgrN0NOl1mZa-3VDCQX0s92SExyZyF7U
//И я запоминаю строку "ТРЕБУЕТСЯУКАЗАТЬТЕКУЩЕЕЗНАЧЕНИЕ" в переменную "П_ИдентификаторГруппыДляОповещения"
//И я запоминаю строку "ТРЕБУЕТСЯУКАЗАТЬТЕКУЩЕЕЗНАЧЕНИЕ" в переменную "П_ТокенУправленияТелеграмБотом"
И я запоминаю строку "367324359" в переменную "П_ИдентификаторГруппыДляОповещения"
И я запоминаю строку "6942077637:AAGNgrN0NOl1mZa-3VDCQX0s92SExyZyF7U" в переменную "П_ТокенУправленияТелеграмБотом"

// 01 Настройка расписания РЗ: Отправка сообщений в телеграм бота (ВКМ)
И В командном интерфейсе я выбираю 'Администрирование' 'Обслуживание'
Тогда открылось окно 'Обслуживание'
И я разворачиваю группу с именем "ГруппаРегламентныеОперации"
И я нажимаю на кнопку с именем 'ОбработкаРегламентныеИФоновыеЗадания'
Тогда открылось окно 'Регламентные и фоновые задания'
И в таблице "ТаблицаРегламентныеЗадания" я нажимаю на кнопку с именем 'ТаблицаРегламентныеЗаданияНайти1'
Тогда открылось окно 'Найти'
И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Наименование'
И в поле с именем 'Pattern' я ввожу текст 'Отправка сообщений в телеграм бота (ВКМ)'
И я нажимаю на кнопку с именем 'Find'
Когда открылось окно 'Регламентные и фоновые задания'
И я жду, что в окне "Регламентные и фоновые задания" в таблице "ТаблицаРегламентныеЗадания" количество строк будет "больше" 0 в течение 5 секунд
Когда открылось окно 'Регламентные и фоновые задания'
И в таблице "ТаблицаРегламентныеЗадания" я активизирую поле с именем "Наименование"
И в таблице "ТаблицаРегламентныеЗадания" я нажимаю на кнопку с именем 'ТаблицаРегламентныеЗаданияНастроитьРасписание'

Тогда открылось окно 'Расписание'

И я перехожу к закладке с именем "Day"
И в поле с именем 'DRepeatAfter' я ввожу текст '60'
И в поле с именем 'DTimeStart' я ввожу текст ' 8:00:00'
И я перехожу к следующему реквизиту
И в поле с именем 'DTimeEnd' я ввожу текст '22:00:00'
И в поле с именем 'DTimeStop' я ввожу текст '22:00:00'
И я перехожу к следующему реквизиту
И я нажимаю на кнопку с именем 'CommandCloseOK'
Тогда открылось окно 'Регламентные и фоновые задания'
И Я закрываю окно 'Регламентные и фоновые задания'
Тогда открылось окно 'Обслуживание'
И Я закрываю окно 'Обслуживание'

//02 Заполнение констант
//$П_ИдентификаторГруппыДляОповещения$
//$П_ТокенУправленияТелеграмБотом$
И В командном интерфейсе я выбираю 'Обслуживание клиентов (ВКМ)' 'Идентификатор группы для оповещения (ВКМ)'
Тогда открылось окно 'Идентификатор группы для оповещения (ВКМ)'
И в поле с именем 'ВКМ_ИдентификаторГруппыДляОповещения' я ввожу текст '$П_ИдентификаторГруппыДляОповещения$'
И я нажимаю на кнопку с именем 'ФормаЗаписать'
Тогда открылось окно 'Идентификатор группы для оповещения (ВКМ)'
И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
И я жду закрытия окна 'Идентификатор группы для оповещения (ВКМ) *' в течение 5 секунд

И В командном интерфейсе я выбираю 'Обслуживание клиентов (ВКМ)' 'Токен управления телеграм-ботом (ВКМ)'
Тогда открылось окно 'Токен управления телеграм-ботом (ВКМ)'
И в поле с именем 'ВКМ_ТокенУправленияТелеграмБотом' я ввожу текст '$П_ТокенУправленияТелеграмБотом$'
И я нажимаю на кнопку с именем 'ФормаЗаписать'
Тогда открылось окно 'Токен управления телеграм-ботом (ВКМ)'
И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
И я жду закрытия окна 'Токен управления телеграм-ботом (ВКМ) *' в течение 5 секунд