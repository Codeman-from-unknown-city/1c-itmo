&НаКлиенте 
Процедура ТоварыНоменклатураПриИзменении(Элемент)  
 Строка = Элементы.Товары.ТекущиеДанные;  
 Строка.Цена = СерверныеПроцедуры.ЦеныИзРегистраСведений(Объект.Дата, Строка.Номенклатура, Объект.Договор);
КонецПроцедуры    

&НаКлиенте 
Процедура ТоварыКоличествоПриИзменении(Элемент) 
 Строка = Элементы.Товары.ТекущиеДанные;
 Строка.Сумма = Строка.Количество * Строка.Цена;
КонецПроцедуры
