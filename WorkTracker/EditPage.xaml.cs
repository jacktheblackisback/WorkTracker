using SqlFramework;

namespace WorkTracker;

public partial class EditPage : ContentPage
{
	Supplier supplier = new();
	public EditPage(Supplier s)
	{
		InitializeComponent();
		supplier = s;
		this.BindingContext = supplier;
	}

    private void Button_Clicked(object sender, EventArgs e)
    {
		Navigation.PopAsync();
    }
}