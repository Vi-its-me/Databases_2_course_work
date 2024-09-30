﻿USE [C:\USERS\USERM\DOCUMENTS\2 КУРС 2 СЕМЕСТР\БД\DATABASE_CONNECTION\DATABASE_CONNECTION\COURSEWORK.MDF]

INSERT INTO [Предприятие] ([Код], [Название], [Краткое название]) VALUES 
(1, N'ОренКанц', 'ОК'),
(2, N'Оренбург-Экспресс', 'ОЭ'),
(3, N'Send2BNice', 'S2BN'),
(4, N'DeliverNRecieve', 'DnR'),
(5, N'ОтправКо', 'ОКо')
INSERT INTO [Подразделение] ([Код], [Название], [Краткое название]) VALUES
(1, N'Цех_производства', 'ЦП'),
(1, N'Совет_директоров', 'СД'),
(1, N'Список_акционеров', N'СА'),
(1, N'Служба_доставки', N'Д'),
(2, N'Служба_проверки', N'CП'),
(2, N'Список_акционеров', N'СА'),
(2, N'Совет_директоров', N'СД'),
(2, N'Бухгалтерия', N'Б'),
(3, N'Служба_обработки_заказов', N'СОЗ'),
(3, N'Совет_директоров', N'СД'),
(3, N'Доставка', N'Д'),
(3, N'Отдел_разработки', N'ОР'),
(4, N'Рекламный_отдел', N'РО'),
(4, N'Служба_обработки', N'СО'),
(4, N'Служба_доставки', N'СД'),
(4, N'Список_акционеров', N'СА'),
(4, N'Бухгалтерия', N'Б'),
(5, N'Цех_производства', N'ЦП'),
(5, N'Совет_директоров', N'СД'),
(5, N'Список_акционеров', N'СА'),
(5, N'Служба_доставки', N'Д')
INSERT INTO [Товар] ([Код], [Код предприятия], [Название], [Краткое название]) VALUES 
(1, 1, N'Ручка_шариковая', N'РШ'),
(2, 1, N'Бумага_формат_А4', N'БА4'),
(3, 1, N'Файл_канцелярский', N'ФК'),
(4, 1, N'Карандаш_графитный', N'КГ'),
(5, 1, N'Дырокол_канцелярский', N'ДК'),
(6, 2, N'Холодильник_однокамерный', N'Хо'),
(7, 2, N'Холодильник_двухкамерный', N'Хд'),
(8, 2, N'Микроволновая_печь', N'Мп'),
(9, 2, N'Блендер_стационарный', N'БС'),
(10, 2, N'Блендер_погружной', N'БП'),
(11, 3, N'Компьютер_персональный', N'ПК'),
(12, 3, N'Принтер_струйный', N'ПС'),
(13, 3, N'Принтер_лазерный', N'ПЛ'),
(14, 3, N'Веб-камера', N'ВК'),
(15, 4, N'Стол_компьютерный', N'СК'),
(16, 4, N'Диван_раскладной', N'ДР'),
(17, 4, N'Столик_журнальный', N'СЖ'),
(18, 5, N'Зеркала_автомобильные_комплект', N'ЗА'),
(19, 5, N'Диски_штампованные_комплект', N'ДШ'),
(20, 5, N'Дворники_комплект', N'ДК'),
(21, 5, N'Чехлы на сиденья', N'Ч')
INSERT INTO [Единица измерения] ([Код], [Название], [Краткое название]) VALUES
(1, N'Килограмм', N'кг'),
(2, N'Метр', N'м'),
(3, N'метр_кубический', N'м3'),
(4, N'штук', N'шт')
INSERT INTO [Клиент] ([Код], [ФИО], [Адрес], [Телефон]) VALUES
(1, N'Андреев Андрей Андреевич', N'ул. Октябрьская, д. 55', N'8 (901)-802-77-77'),
(2, N'Алексеев Алексей Алексеевич', N'ул. Пушкинская, д. 11', N'8 (900)-800-00-00'),
(3, N'Штыков Василий Андреевич', N'ул. Александрова, д. 1, кв. 20', N'8 (905)-755-20-10')
INSERT INTO [Паспорт] ([Код], [Серия], [Номер], [Дата выдачи], [Кем выдан]) VALUES
(1, 5500, 616215, N'2015.01.01', N'МП УФ России'),
(2, 5511, 600600, N'2010.12.05', N'МП УФ России'),
(3, 5150, 700500, N'2008.10.10', N'МП УФ России')
INSERT INTO [Заказ] ([Код], [Код клиента], [Код товара], [Код единицы измерения], [Количество товара], [Цена за единицу товара], [Общая стоимость товара], [Итоговая сумма]) VALUES
(1, 1, 2, 4, 5, 590, 2950, 2950),
(2, 2, 1, 4, 10, 1000, 10000, 10000),
(3, 3, 12, 4, 2, 4000, 8000, 8000),
(4, 1, 2, 4, 10, 590, 5900, 5900),
(5, 2, 1, 4, 1, 1000, 1000, 1000)


INSERT INTO [Код] ([Код товара], [Код заказа]) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4)
INSERT INTO [Доставка] ([Ключ], [Дата], [Время]) VALUES 
(1, N'2008.09.01', N'9:40:00'),
(2, N'2009.10.02', N'11:20:00'),
(3, N'2015.01.01', N'13:20:00')
INSERT INTO [Документ] ([Код], [Код реквизитов предприятия], [Вид оплаты], [ФИО оператора], [Должность оператора], [ФИО сотрудника], [Должность сотрудника]) VALUES
(1, 1, N'Наличный', N'Иванов Иван Иванович', N'Оператор', N'Сергеев Сергей Сергеевич', N'Бухгалтер'),
(2, 2, N'Безналичный', N'Шариков Иван Сергеевич',N'Оператор', N'Петров Сергей Константинович', N'Документовед'),
(3, 3, N'Безналичный', N'Рычкова Анастасия Сергеевна', N'Оператор', N'Сарайкин Александр Константинович', N'Бухгалтер')
INSERT INTO [Реквизиты предприятия] ([Код], [Название], [Адрес], [Контактный телефон]) VALUES
(1, 1, N'ул. Терешковой, д.10', N'8 800 777 33 55'),
(2, 2, N'пр. Победы, д.17', N'8 890 333 77 56'),
(3, 3, N'ул. Октябрьская, д.20', N'8 810 751 55 61') 
INSERT INTO [Адрес] ([Код], [Номер дома], [Корпус], [Квартира]) VALUES
(1, 55, NULL, NULL),
(2, 11, NULL, NULL),
(3, 1, NULL, 20)
INSERT INTO [Договор] ([Код], [Дата начала], [Дата окончания], [Ставка]) VALUES
(1, N'2008.09.01', N'2010.09.01', NULL),
(2, N'2009.10.02', N'2011.10.02', NULL), 
(3, N'2015.01.01', N'2017.10.02', 10)