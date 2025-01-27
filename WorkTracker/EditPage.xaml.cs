using Microsoft.Data.SqlClient;
using SqlFramework;
using MiddleTier;

namespace WorkTracker;

public partial class EditPage : ContentPage
{
	//private int _supplierid;
	Supplier supplier = new();
	public EditPage(Supplier s)
	{
		InitializeComponent();
        //_supplierid = id;
		//List<Supplier> s = SqlUtility.GetGenericObjectListFromDB<Supplier>(new SqlCommand($"select * from Supplier where SupplierId = {_supplierid}"));
		//supplier = s.First();
		supplier = s;
		this.BindingContext = supplier;
	}

	public void Save()
	{
		SqlCommand cmd = SqlUtility.GetSqlCommand("SupplierInfoUpdate");
		cmd.Parameters["@SupplierId"].Value = supplier.SupplierId;
		cmd.Parameters["@FirstName"].Value = supplier.FirstName;
		cmd.Parameters["@LastName"].Value = supplier.LastName;
		cmd.Parameters["@NickName"].Value = supplier.NickName;
		cmd.Parameters["@IsVerified"].Value = supplier.IsVerified;
		SqlUtility.ExecuteCRUDWrapper(cmd);

  //      foreach(var p in supplier.GetType().GetProperties())
		//{
		//	supplier.InvokePropertyChanged(p.Name);
		//}
    }

    private void CancelButton_Clicked(object sender, EventArgs e)
    {
		Navigation.PopAsync();
    }

    private void SaveButton_Clicked(object sender, EventArgs e)
    {
		try
		{
			Save();
			//Navigation.PopAsync();
		}
		catch (Exception ex)
		{
			throw new Exception(ex.Message);
		}
    }
}