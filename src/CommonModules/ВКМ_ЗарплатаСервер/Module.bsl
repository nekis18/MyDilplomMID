
#Область  СлужебныеПроцедурыИФункции
Функция ПолчитьВыдачиИНДФЛ (Сумма) Экспорт
	
	//полагаем что НДФЛ не меняется - ни когда!!! как и график работы =)))
	ЗПНаруки = Сумма/100*87;
	НДФЛ = Сумма/100*13;
	
	Результат = Новый Структура;
	Результат.Вставить("ЗПНаруки", ЗПНаруки);
	Результат.Вставить("НДФЛ", НДФЛ);
	Возврат Результат
	
КонецФункции
#КонецОбласти
