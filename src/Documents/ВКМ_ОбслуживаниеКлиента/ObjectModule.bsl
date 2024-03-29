#Область ОбработчикиСобытий
#Если НаСервере Тогда

Процедура ОбработкаПроведения(Отказ,Режим)
	
	// Если на дату документа специалисту не установлен процент оплаты от работ, 
	//то документ не должен проводится. Необходимо учитывать, что может быть установлен 
	//нулевой процент, в этом случае документ должен проводится.
	
	Сотрудник = Специалист; // Ссылка.Специалист;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ВКМ_УсловияОплатыСотрудниковСрезПоследних.ПроцентОтРабот КАК ПроцентОтРабот,
	|	ВКМ_УсловияОплатыСотрудниковСрезПоследних.Специалист КАК Специалист
	|ИЗ
	|	РегистрСведений.ВКМ_УсловияОплатыСотрудников.СрезПоследних(&Период, Сотрудник = &Сотрудник) КАК ВКМ_УсловияОплатыСотрудниковСрезПоследних";
	
	Запрос.УстановитьПараметр("Период", Дата);
	Запрос.УстановитьПараметр("Сотрудник", Сотрудник);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Следующий() Тогда
		Если Выборка.ПроцентОтРабот = Null Тогда
			СообщениеОСотруднике = Новый СообщениеПользователю;
			ТектсОСотр = СтрШаблон("У '%1', не установлен 'Процент от работ' в РС 'Условия оплаты сотрудников'", Сотрудник);
			СообщениеОСотруднике.Текст = ТектсОСотр;
			СообщениеОСотруднике.Сообщить();
			Отказ = Истина;
		КонецЕсли;                          
		Если НЕ Выборка.Специалист ИЛИ Выборка.Специалист = Null Тогда
			СообщениеОСотруднике = Новый СообщениеПользователю;
			ТектсОСотр = СтрШаблон("Сотрудник '%1', не является 'Специалистом' в РС 'Условия оплаты сотрудников'", Сотрудник);
			СообщениеОСотруднике.Текст = ТектсОСотр;
			СообщениеОСотруднике.Сообщить();
			Отказ = Истина;
		КонецЕсли;
	Иначе
		СообщениеОСотруднике = Новый СообщениеПользователю;
		ТектсОСотр = СтрШаблон("У '%1', не найденно данных на дату документа в РС 'Условия оплаты сотрудников'", Сотрудник);
		СообщениеОСотруднике.Текст = ТектсОСотр;
		СообщениеОСотруднике.Сообщить(); 
		Отказ = Истина;
	КонецЕсли;
	
	Если НЕ Отказ Тогда
		
		ПроцентОтРабот = Выборка.ПроцентОтРабот;
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	ЕСТЬNULL(СУММА(ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.ЧасыКОплатеКлиенту), 0) КАК ЧасыКОплатеКлиенту,
		|	ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.Ссылка
		|ПОМЕСТИТЬ ВТ_КоличествоЧасовКОплате
		|ИЗ
		|	Документ.ВКМ_ОбслуживаниеКлиента.ВыполненныеРаботы КАК ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы
		|ГДЕ
		|	ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.Ссылка = &Ссылка
		|СГРУППИРОВАТЬ ПО
		|	ВКМ_ОбслуживаниеКлиентаВыполненныеРаботы.Ссылка
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВТ_КоличествоЧасовКОплате.ЧасыКОплатеКлиенту,
		|	ЕСТЬNULL(ВКМ_ОбслуживаниеКлиента.Договор.ВКМ_СоимостьЧасаРабот, 0) КАК ДоговорВКМ_СоимостьЧасаРабот
		|ИЗ
		|	ВТ_КоличествоЧасовКОплате КАК ВТ_КоличествоЧасовКОплате,
		|	Документ.ВКМ_ОбслуживаниеКлиента КАК ВКМ_ОбслуживаниеКлиента
		|ГДЕ
		|	ВКМ_ОбслуживаниеКлиента.Ссылка = &Ссылка";
		
		Запрос.УстановитьПараметр("Ссылка", Ссылка);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записать();
		Движения.ВКМ_ВыполненныеКлиентуРаботы.Записывать = Истина;
		Движения.ВКМ_ВыполненныеСотрудникомРаботы.Записать();
		Движения.ВКМ_ВыполненныеСотрудникомРаботы.Записывать = Истина;
		
		Если ВыборкаДетальныеЗаписи.Следующий() Тогда
			
			КоличествоЧасов = ВыборкаДетальныеЗаписи.ЧасыКОплатеКлиенту;
			СоимостьЧасаРабот = ВыборкаДетальныеЗаписи.ДоговорВКМ_СоимостьЧасаРабот;
			СуммаКОплате = КоличествоЧасов * СоимостьЧасаРабот;
			
			Если СуммаКОплате <> 0 Тогда
				// регистр ВКМ_ВыполненныеКлиентуРаботы
				Движение = Движения.ВКМ_ВыполненныеКлиентуРаботы.Добавить();
				Движение.Период = Дата;
				Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
				Движение.Клиент = Клиент;
				Движение.Договор = Договор;
				Движение.КоличествоЧасов = КоличествоЧасов;
				Движение.СуммаКОплате = СуммаКОплате;
				
				// регистр ВКМ_ВыполненныеКлиентуРаботы 
				//СуммаКОплате рассчитывается по формуе:
				//ЧасовКОплатеКлиенту * СтавкаЧасаКлиента * ПроцентОтРабот / 100
				Движение = Движения.ВКМ_ВыполненныеСотрудникомРаботы.Добавить();
				Движение.Период = ДатаПроведенияРабот;
				Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
				Движение.Сотрудник = Сотрудник;
				Движение.ЧасовКОплате = КоличествоЧасов;
				СуммаКОплатеСпециалисту = КоличествоЧасов * СоимостьЧасаРабот * ПроцентОтРабот / 100;
				Движение.СуммаКОплате = СуммаКОплатеСпециалисту;
			КонецЕсли;
		КонецЕсли;       
		
	КонецЕсли;
КонецПроцедуры

	#КонецЕсли	
#КонецОбласти