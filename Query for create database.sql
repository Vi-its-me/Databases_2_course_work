--CREATE DATABASE [Course_work]

USE [C:\USERS\USERM\DOCUMENTS\2 ���� 2 �������\��\DATABASE_CONNECTION\DATABASE_CONNECTION\COURSEWORK.MDF]

CREATE TABLE [�����������] (
	[���] INT PRIMARY KEY NOT NULL,
	[��������] NVARCHAR(50) NOT NULL,
	[������� ��������] NVARCHAR(50)
)

CREATE TABLE [�������������] (
	[���] INT NOT NULL FOREIGN KEY REFERENCES [�����������] ([���]),
	[��������] NVARCHAR(50) NOT NULL,
	[������� ��������] NVARCHAR(50)
)

CREATE TABLE [�����] (
	[���] INT NOT NULL PRIMARY KEY,
	[��� �����������] INT NOT NULL FOREIGN KEY REFERENCES [�����������] ([���]),
	[��������] NVARCHAR(50) NOT NULL,
	[������� ��������] NVARCHAR(50)
)

CREATE TABLE [������� ���������] (
	[���] INT NOT NULL PRIMARY KEY,
	[��������] NVARCHAR(50) NOT NULL,
	[������� ��������] NVARCHAR(50)
)

CREATE TABLE [������] (
	[���] INT NOT NULL PRIMARY KEY,
	[���] NVARCHAR(50) NOT NULL,
	[�����] NVARCHAR(50) NOT NULL,
	[�������] NVARCHAR(50) NOT NULL,
)

CREATE TABLE [�������] (
	[���] INT PRIMARY KEY FOREIGN KEY REFERENCES [������] ([���]),
	[�����] INT NOT NULL,
	[�����] INT NOT NULL,
	[���� ������] DATE NOT NULL,
	[��� �����] NVARCHAR(50) NOT NULL
)

CREATE TABLE [�����] (
	[���] INT NOT NULL PRIMARY KEY,
	[��� �������] INT NOT NULL FOREIGN KEY REFERENCES [������] ([���]),
	[��� ������] INT NOT NULL FOREIGN KEY REFERENCES [�����] ([���]),
	[��� ������� ���������] INT NOT NULL FOREIGN KEY REFERENCES [������� ���������] ([���]),
	[���������� ������] INT NOT NULL,
	[���� �� ������� ������] INT NOT NULL,
	[����� ��������� ������] INT NOT NULL,
	[�������� �����] INT NOT NULL,
)

CREATE TABLE [���] (
	[��� ������] INT NOT NULL REFERENCES [�����] ([���]),
	[��� ������] INT NOT NULL REFERENCES [�����] ([���]),
)

CREATE TABLE [��������] (
	[����] INT NOT NULL FOREIGN KEY REFERENCES [������] ([���]),
	[����] DATE NOT NULL,
	[�����] TIME
)

CREATE TABLE [��������] (
	[���] INT NOT NULL FOREIGN KEY REFERENCES [������] ([���]),
	[��� ���������� �����������] INT NOT NULL PRIMARY KEY,
	[��� ������] NVARCHAR(50) NOT NULL,
	[��� ���������] NVARCHAR(50) NOT NULL,
	[��������� ���������] NVARCHAR(50),
	[��� ����������] NVARCHAR(50) NOT NULL,
	[��������� ����������] NVARCHAR(50)
) 

CREATE TABLE [��������� �����������] (
	[���] INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES [��������] ([��� ���������� �����������]),
	[��������] NVARCHAR(50) NOT NULL,
	[�����] NVARCHAR(50) NOT NULL,
	[���������� �������] NVARCHAR(50) NOT NULL
)

CREATE TABLE [�����] (
	[���] INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES [������] ([���]),
	[����� ����] INT NOT NULL,
	[������] INT,
	[��������] INT
)

CREATE TABLE [�������] (
	[���] INT NOT NULL FOREIGN KEY REFERENCES [������] ([���]),
	[���� ������] DATE NOT NULL,
	[���� ���������] DATE,
	[������] INT
)
