Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	Если ТребуемыеПараметры = Неопределено Тогда
		ИдПользователя = ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор;
		ПараметрыСеанса.ТекущийПользователь = Справочники.Пользователи.НайтиПоРеквизиту("УникальныйИдентификатор", строка(ИдПользователя));
	КонецЕсли
КонецПроцедуры
