using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using MiddleTier;
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
            List<InvoiceTotals> sl2 = SqlUtility.GetGenericObjectListFromDB<InvoiceTotals>(new SqlCommand("select sum(InvoiceTotal) as InvoiceTotal from Invoice"));
            InvoiceTotals t = sl2.First();
            tot.BindingContext = t;
        }

        private void TapGestureRecognizer_Tapped(object sender, TappedEventArgs e)
        {
            if (sender is Label l)
            {
                var bc = l.BindingContext;
                if (bc is Supplier s)
                {
                    Navigation.PushAsync(new SupplierDetail(s.SupplierId));
                }
            }
        }

    }
}