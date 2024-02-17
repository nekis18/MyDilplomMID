
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

Функция ДобавитьКомандуСоздатьНаОсновании(КомандыСозданияНаОсновании) Экспорт
	
	Если ПравоДоступа("Добавление", Метаданные.Документы.РеализацияТоваровУслуг) Тогда
		
        КомандаСоздатьНаОсновании = КомандыСозданияНаОсновании.Добавить();
        КомандаСоздатьНаОсновании.Менеджер = Метаданные.Документы.РеализацияТоваровУслуг.ПолноеИмя();
        КомандаСоздатьНаОсновании.Представление = ОбщегоНазначения.ПредставлениеОбъекта(Метаданные.Документы.РеализацияТоваровУслуг);
        КомандаСоздатьНаОсновании.РежимЗаписи = "Проводить";
		
		Возврат КомандаСоздатьНаОсновании;
		
	КонецЕсли;

	Возврат Неопределено;
	
КонецФункции

Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.РеализацияТоваровУслуг.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	РеализацияТоваровУслуг.Дата,
	|	РеализацияТоваровУслуг.Договор,
	|	РеализацияТоваровУслуг.Контрагент,
	|	РеализацияТоваровУслуг.Номер,
	|	РеализацияТоваровУслуг.Организация,
	|	РеализацияТоваровУслуг.Ответственный,
	|	РеализацияТоваровУслуг.СуммаДокумента,
	|	РеализацияТоваровУслуг.Услуги.(
	|		Номенклатура,
	|		Количество,
	|		Цена,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.РеализацияТоваровУслуг КАК РеализацияТоваровУслуг
	|ГДЕ
	|	РеализацияТоваровУслуг.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	//ОбластьТоварыШапка = Макет.ПолучитьОбласть("ТоварыШапка");
//	ОбластьТовары = Макет.ПолучитьОбласть("Товары");
	ОбластьУслугиШапка = Макет.ПолучитьОбласть("УслугиШапка");
	ОбластьУслуги = Макет.ПолучитьОбласть("Услуги");
	Подвал = Макет.ПолучитьОбласть("Подвал");

	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		//ТабДок.Вывести(ОбластьТоварыШапка);
		//ВыборкаТовары = Выборка.Товары.Выбрать();
		//Пока ВыборкаТовары.Следующий() Цикл
		//	ОбластьТовары.Параметры.Заполнить(ВыборкаТовары);
		//	ТабДок.Вывести(ОбластьТовары, ВыборкаТовары.Уровень());
		//КонецЦикла;

		ТабДок.Вывести(ОбластьУслугиШапка);
		ВыборкаУслуги = Выборка.Услуги.Выбрать();
		Пока ВыборкаУслуги.Следующий() Цикл
			ОбластьУслуги.Параметры.Заполнить(ВыборкаУслуги);
			ТабДок.Вывести(ОбластьУслуги, ВыборкаУслуги.Уровень());
		КонецЦикла;

		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры

#КонецОбласти

#КонецЕсли