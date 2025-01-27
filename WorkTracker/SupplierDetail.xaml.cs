using Microsoft.Data.SqlClient;
using MiddleTier;
using SqlFramework;

namespace WorkTracker;

public partial class SupplierDetail : ContentPage
{
    //private int _supplierid;
    Supplier supplier = new();
    public SupplierDetail(/*int id*/ Supplier s)
    {
        InitializeComponent();
        //_supplierid = id;
        //List<Supplier> s = SqlUtility.GetGenericObjectListFromDB<Supplier>(new SqlCommand($"select * from Supplier where SupplierId = {_supplierid}"));
        //supplier = s.First();
        supplier = s;
        this.BindingContext = supplier;
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new EditPage(supplier));
    }
}