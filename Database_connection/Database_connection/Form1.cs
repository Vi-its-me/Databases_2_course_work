using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Database_connection
{
    public partial class Form1 : Form
    {
        private SqlConnection sqlConnection = null;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConnection.Open();
            if (sqlConnection.State == ConnectionState.Open) MessageBox.Show("Подключение установлено");
            else MessageBox.Show("Подключение не установлено");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand(
            $"INSERT INTO [Предприятие] ([Код], [Название], [Краткое название]) VALUES (N'{textBox1.Text}', N'{textBox2.Text}', N'{textBox3.Text}')",
            sqlConnection);
            //MessageBox.Show(command.ExecuteNonQuery().ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(
            "SELECT * FROM [" + textBox5.Text + "]", sqlConnection);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                dataGridView1.DataSource = dataSet.Tables[0];
            }
            catch { MessageBox.Show("Не найдено такой таблицы в базе данных, попробуйте снова"); }
        }

        //Запрос 1
        private void tabControl1_Click_1(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(
            "USE [C:\\USERS\\USERM\\DOCUMENTS\\2 КУРС 2 СЕМЕСТР\\БД\\DATABASE_CONNECTION\\DATABASE_CONNECTION\\COURSEWORK.MDF] SELECT[Товар].*, [Заказ].[Цена за единицу товара] * [Заказ].[Количество товара] AS[Всего куплено на сумму] FROM[Заказ] INNER JOIN[Товар] ON[Заказ].[Код товара] = [Товар].[Код] WHERE([Заказ].[Количество товара] * [Заказ].[Цена за единицу товара]) > (SELECT AVG([Количество товара] * [Цена за единицу товара]) FROM[Заказ])", sqlConnection);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            dataGridView2.DataSource = dataSet.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(
            "USE [C:\\USERS\\USERM\\DOCUMENTS\\2 КУРС 2 СЕМЕСТР\\БД\\DATABASE_CONNECTION\\DATABASE_CONNECTION\\COURSEWORK.MDF] SELECT[Товар].* , [Заказ].[Цена за единицу товара], CASE DATEDIFF(DAY, '30-05-2022', GETDATE()) WHEN 1 THEN[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.005 WHEN 2 THEN[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.01 ELSE[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.1 END AS 'Изменённая стоимость товара', [Заказ].[Цена за единицу товара] - (SELECT CASE DATEDIFF(DAY, '30-05-2022', GETDATE()) WHEN 1 THEN[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.005 WHEN 2 THEN[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.01 ELSE[Заказ].[Цена за единицу товара] - [Заказ].[Цена за единицу товара] * 0.1 END) AS 'Динамика изменения стоимости' FROM[Товар] INNER JOIN[Заказ] ON[Заказ].[Код товара] = [Товар].[Код]", sqlConnection);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            dataGridView3.DataSource = dataSet.Tables[0];
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(
            "USE [C:\\USERS\\USERM\\DOCUMENTS\\2 КУРС 2 СЕМЕСТР\\БД\\DATABASE_CONNECTION\\DATABASE_CONNECTION\\COURSEWORK.MDF] SELECT[Клиент].*, [Адрес].[Номер дома], [Адрес].[Корпус], [Адрес].[Квартира] FROM[Адрес] INNER JOIN[Клиент] ON[Клиент].[Код] = [Адрес].[Код] ORDER BY[Клиент].[ФИО] DESC", sqlConnection);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            dataGridView4.DataSource = dataSet.Tables[0];
        }
    }
}
