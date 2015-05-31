using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projekt2.CardsDataSetTableAdapters;

namespace Projekt2
{
    public partial class Decks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
            GridView2.DataBind();
        }

        // Dodawanie nowej talii
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox3.Text))
            {
                Master.ErrorMessage = "Musisz podać nazwę nowej talii.";
                return;
            }

            var adapter = new dodaj_talie();
            var result = adapter.talia_add(TextBox3.Text, Master.UserId, 1);

            if (result > 0)
            {
                Master.SuccessMessage = string.Format("Talia o nazwie {0} dodana.", TextBox3.Text);
            }
            else
            {
                Master.ErrorMessage = "Nieznany błąd.";
            }

            GridView1.DataBind();
            GridView2.DataBind();
        }

        // dodawanie karty do talii
        private void DodajKarte(int idTalii, int idKarty, int ilosc = 1)
        {
            var ktAdapter = new KARTA_TALIATableAdapter();

            var data = ktAdapter.GetData();
            var row = data.FirstOrDefault(kt => kt.ID_KARTY == idKarty && kt.ID_TALII == idTalii);

            if (row == null)
            {
                ktAdapter.Insert(idTalii, idKarty, ilosc);
            }
            else
            {
                row.LICZBA_KART += ilosc;
                ktAdapter.Update(row);
            }

            GridView1.DataBind();
            GridView2.DataBind();
        }

        private void UsunKarte(int idTalii, int idKarty, int ilosc = 1)
        {
            var ktAdapter = new KARTA_TALIATableAdapter();

            var data = ktAdapter.GetData();
            var row = data.FirstOrDefault(kt => kt.ID_KARTY == idKarty && kt.ID_TALII == idTalii);

            if (row == null)
            {
                return;
            }

            if (row.LICZBA_KART <= ilosc)
            {
                ktAdapter.Delete(idTalii, idKarty);
            }
            else
            {
                row.LICZBA_KART -= ilosc;
                ktAdapter.Update(row);
            }

            GridView1.DataBind();
            GridView2.DataBind();
        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            var idKarty = int.Parse(DropDownList2.SelectedValue);
            var idTalii = (int)GridView1.SelectedValue;
            DodajKarte(idTalii, idKarty);
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var idKarty = int.Parse(btn.CommandArgument);
            var idTalii = (int)GridView1.SelectedValue;
            DodajKarte(idTalii, idKarty);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var idKarty = int.Parse(btn.CommandArgument);
            var idTalii = (int)GridView1.SelectedValue;
            UsunKarte(idTalii, idKarty);
        }

    }
}