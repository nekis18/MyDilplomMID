
&НаКлиенте
Процедура Заполнить(Команда)
	ВыполнитьОбработку();
	Сообщить("Обработка завершена!");
КонецПроцедуры

&НаСервере
Процедура ВыполнитьОбработку()
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	ОбработкаОбъект.ЗаполнитьГрафик(ВыборПериода.ДатаНачала, ВыборПериода.ДатаОкончания, ВыходныеДни, ГрафикРаботы);
КонецПроцедуры 
