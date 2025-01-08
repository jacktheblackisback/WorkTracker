using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SqlFramework;


namespace WorkTracker
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
            List<Supplier> sl = SqlUtility.GetGenericObjectListFromDB<Supplier>(new SqlCommand("select * from Supplier"));
            temp.ItemsSource = sl;
            List<Supplier> sl2 = AppDbContext.GetSqlResults<Supplier>("select * from supplier");
            pmet.ItemsSource = sl2;
        }

    }
}