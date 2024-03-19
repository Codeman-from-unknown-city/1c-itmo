
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	МассивТиповДинамическогоСписка = Новый Массив;
	МассивТиповДинамическогоСписка.Добавить(Тип("ДинамическийСписок"));
	ОписаниеТиповДинамическогоСписка = Новый ОписаниеТипов(МассивТиповДинамическогоСписка);

	МассивДобавляемыхРеквизитов = Новый Массив;
	МассивДобавляемыхРеквизитов.Добавить(Новый РеквизитФормы("РеквизитСписокНоменклатура", 
																ОписаниеТиповДинамическогоСписка,																,
																"Список номенклатура",
																Ложь));
	ИзменитьРеквизиты(МассивДобавляемыхРеквизитов);

	РеквизитФормыСписокНоменклатура = ЭтаФорма["РеквизитСписокНоменклатура"];
	РеквизитФормыСписокНоменклатура.ТекстЗапроса =  "ВЫБРАТЬ
													|	Номенклатура.Наименование КАК Наименование,
													|	Номенклатура.Код КАК Код
													|ИЗ
													|	Справочник.Номенклатура КАК Номенклатура";
	РеквизитФормыСписокНоменклатура.ОсновнаяТаблица = "Справочник.Номенклатура";

	ЭлементДинамическийСписок = Элементы.Добавить("ЭлементСписокНоменклатура", Тип("ТаблицаФормы"));
	ЭлементДинамическийСписок.ПутьКДанным = "РеквизитСписокНоменклатура";

	НоваяКолонкаТаблицы = Элементы.Добавить("КолонкаНаименование", Тип("ПолеФормы"), ЭлементДинамическийСписок);
	НоваяКолонкаТаблицы.ПутьКДанным = "РеквизитСписокНоменклатура.Наименование";
	НоваяКолонкаТаблицы = Элементы.Добавить("КолонкаКод", Тип("ПолеФормы"), ЭлементДинамическийСписок);
	НоваяКолонкаТаблицы.ПутьКДанным = "РеквизитСписокНоменклатура.Код";      
	
	СуществующийДС = ЭтаФорма["РеквизитСписокНоменклатура"];
	СуществующийДС.ТекстЗапроса = "ВЫБРАТЬ
	                              |	СправочникНоменклатура.Код КАК Код,
	                              |	СправочникНоменклатура.Наименование КАК Наименование,
	                              |	ОстаткиТоваров.КоличествоТоваров КАК КоличествоТоваров
	                              |ИЗ
	                              |	РегистрНакопления.ОстаткиТоваров КАК ОстаткиТоваров
	                              |		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Номенклатура КАК СправочникНоменклатура
	                              |		ПО ОстаткиТоваров.Номенклатура = СправочникНоменклатура.Ссылка";
	СуществующийЭлементДС = Элементы["ЭлементСписокНоменклатура"];

	НоваяКолонкаТаблицы = Элементы.Добавить("КолонкаКоличествоТоваров", Тип("ПолеФормы"), СуществующийЭлементДС);
	НоваяКолонкаТаблицы.ПутьКДанным = "РеквизитСписокНоменклатура.КоличествоТоваров";
КонецПроцедуры
