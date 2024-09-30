--CREATE DATABASE [Course_work]

USE [C:\USERS\USERM\DOCUMENTS\2 КУРС 2 СЕМЕСТР\БД\DATABASE_CONNECTION\DATABASE_CONNECTION\COURSEWORK.MDF]

CREATE TABLE [Предприятие] (
	[Код] INT PRIMARY KEY NOT NULL,
	[Название] NVARCHAR(50) NOT NULL,
	[Краткое название] NVARCHAR(50)
)

CREATE TABLE [Подразделение] (
	[Код] INT NOT NULL FOREIGN KEY REFERENCES [Предприятие] ([Код]),
	[Название] NVARCHAR(50) NOT NULL,
	[Краткое название] NVARCHAR(50)
)

CREATE TABLE [Товар] (
	[Код] INT NOT NULL PRIMARY KEY,
	[Код предприятия] INT NOT NULL FOREIGN KEY REFERENCES [Предприятие] ([Код]),
	[Название] NVARCHAR(50) NOT NULL,
	[Краткое название] NVARCHAR(50)
)

CREATE TABLE [Единица измерения] (
	[Код] INT NOT NULL PRIMARY KEY,
	[Название] NVARCHAR(50) NOT NULL,
	[Краткое название] NVARCHAR(50)
)

CREATE TABLE [Клиент] (
	[Код] INT NOT NULL PRIMARY KEY,
	[ФИО] NVARCHAR(50) NOT NULL,
	[Адрес] NVARCHAR(50) NOT NULL,
	[Телефон] NVARCHAR(50) NOT NULL,
)

CREATE TABLE [Паспорт] (
	[Код] INT PRIMARY KEY FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Серия] INT NOT NULL,
	[Номер] INT NOT NULL,
	[Дата выдачи] DATE NOT NULL,
	[Кем выдан] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Заказ] (
	[Код] INT NOT NULL PRIMARY KEY,
	[Код клиента] INT NOT NULL FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Код товара] INT NOT NULL FOREIGN KEY REFERENCES [Товар] ([Код]),
	[Код единицы измерения] INT NOT NULL FOREIGN KEY REFERENCES [Единица измерения] ([Код]),
	[Количество товара] INT NOT NULL,
	[Цена за единицу товара] INT NOT NULL,
	[Общая стоимость товара] INT NOT NULL,
	[Итоговая сумма] INT NOT NULL,
)

CREATE TABLE [Код] (
	[Код товара] INT NOT NULL REFERENCES [Товар] ([Код]),
	[Код заказа] INT NOT NULL REFERENCES [Заказ] ([Код]),
)

CREATE TABLE [Доставка] (
	[Ключ] INT NOT NULL FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Дата] DATE NOT NULL,
	[Время] TIME
)

CREATE TABLE [Документ] (
	[Код] INT NOT NULL FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Код реквизитов предприятия] INT NOT NULL PRIMARY KEY,
	[Вид оплаты] NVARCHAR(50) NOT NULL,
	[ФИО оператора] NVARCHAR(50) NOT NULL,
	[Должность оператора] NVARCHAR(50),
	[ФИО сотрудника] NVARCHAR(50) NOT NULL,
	[Должность сотрудника] NVARCHAR(50)
) 

CREATE TABLE [Реквизиты предприятия] (
	[Код] INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES [Документ] ([Код реквизитов предприятия]),
	[Название] NVARCHAR(50) NOT NULL,
	[Адрес] NVARCHAR(50) NOT NULL,
	[Контактный телефон] NVARCHAR(50) NOT NULL
)

CREATE TABLE [Адрес] (
	[Код] INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Номер дома] INT NOT NULL,
	[Корпус] INT,
	[Квартира] INT
)

CREATE TABLE [Договор] (
	[Код] INT NOT NULL FOREIGN KEY REFERENCES [Клиент] ([Код]),
	[Дата начала] DATE NOT NULL,
	[Дата окончания] DATE,
	[Ставка] INT
)
