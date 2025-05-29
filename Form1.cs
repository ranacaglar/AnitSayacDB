using System.Data.SqlClient;

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AnitSayacUygulama
{
    public partial class Form1 : Form
    {

        string connectionString = @"Server=DESKTOP-AJNP9HE\SQLEXPRESS;Database=AnitSayacDB;Trusted_Connection=True;";
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DoldurComboBoxlar();
            
            cmbCinsiyet.Items.Add("Kadın");
            cmbCinsiyet.Items.Add("Diğer");

            
            
            cmbCinsiyet.SelectedIndex = 0;

            
            ListeleKadinlar();
            ListeleFailler();    
            ListeleKaynaklar();   
            ListeleOlaylar();
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Kadinlar (AdSoyad, Yas, CocukMu, KorumaTalebiVarMi, Sehir, Cinsiyet) VALUES (@AdSoyad, @Yas, @CocukMu, @KorumaTalebiVarMi, @Sehir, @Cinsiyet)", conn);
            cmd.Parameters.AddWithValue("@AdSoyad", txtAdSoyad.Text);
            cmd.Parameters.AddWithValue("@Yas", Convert.ToInt32(txtYas.Text));
            cmd.Parameters.AddWithValue("@CocukMu", chkCocuk.Checked); 
            cmd.Parameters.AddWithValue("@KorumaTalebiVarMi", chkKoruma.Checked); 
            cmd.Parameters.AddWithValue("@Sehir", txtSehir.Text);
            cmd.Parameters.AddWithValue("@Cinsiyet", cmbCinsiyet.Text);
            cmd.ExecuteNonQuery();
            conn.Close();

            MessageBox.Show("Kayıt başarıyla eklendi.");
            ListeleKadinlar();


        }


        void ListeleKadinlar()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Kadinlar", conn);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["KadinID"].Value);

                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM Kadinlar WHERE KadinID = @KadinID", conn);
                cmd.Parameters.AddWithValue("@KadinID", id);
                cmd.ExecuteNonQuery();
                conn.Close();

                MessageBox.Show("Kayıt başarıyla silindi.");
                ListeleKadinlar();
            }
            else
            {
                MessageBox.Show("Lütfen silmek için bir kayıt seçin.");
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                txtAdSoyad.Text = row.Cells["AdSoyad"].Value.ToString();
                
                txtYas.Text = row.Cells["Yas"].Value.ToString();
                txtSehir.Text = row.Cells["Sehir"].Value.ToString();
                cmbCinsiyet.Text = row.Cells["Cinsiyet"].Value.ToString();
            }
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells["KadinID"].Value);

                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Kadinlar SET AdSoyad=@AdSoyad, Yas=@Yas, CocukMu=@CocukMu, KorumaTalebiVarMi=@KorumaTalebiVarMi, Sehir=@Sehir, Cinsiyet=@Cinsiyet WHERE KadinID=@id", conn);

                cmd.Parameters.AddWithValue("@AdSoyad", txtAdSoyad.Text);
                cmd.Parameters.AddWithValue("@Yas", Convert.ToInt32(txtYas.Text));
                cmd.Parameters.AddWithValue("@CocukMu", chkCocuk.Checked);
                cmd.Parameters.AddWithValue("@KorumaTalebiVarMi", chkKoruma.Checked);
                cmd.Parameters.AddWithValue("@Sehir", txtSehir.Text);
                cmd.Parameters.AddWithValue("@Cinsiyet", cmbCinsiyet.Text);
                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteNonQuery();
                conn.Close();

                MessageBox.Show("Kayıt başarıyla güncellendi.");
                ListeleKadinlar();
            }
            else
            {
                MessageBox.Show("Lütfen önce bir satır seçin.");
            }

        }

        private void dataGridView1_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                txtAdSoyad.Text = dataGridView1.SelectedRows[0].Cells["AdSoyad"].Value.ToString();
                txtYas.Text = dataGridView1.SelectedRows[0].Cells["Yas"].Value.ToString();
                txtSehir.Text = dataGridView1.SelectedRows[0].Cells["Sehir"].Value.ToString();
                cmbCinsiyet.Text = dataGridView1.SelectedRows[0].Cells["Cinsiyet"].Value.ToString();
                chkCocuk.Checked = Convert.ToBoolean(dataGridView1.SelectedRows[0].Cells["CocukMu"].Value);
                chkKoruma.Checked = Convert.ToBoolean(dataGridView1.SelectedRows[0].Cells["KorumaTalebiVarMi"].Value);
            }
        }

        private void chkCocuk_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void btnEkleFail_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Failler (Iliski, HukukiDurum) VALUES (@Iliski, @HukukiDurum)", conn);
            cmd.Parameters.AddWithValue("@Iliski", txtIliski.Text);
            cmd.Parameters.AddWithValue("@HukukiDurum", txtHukukiDurum.Text);
            cmd.ExecuteNonQuery();
            conn.Close();

            MessageBox.Show("Fail eklendi.");
            ListeleFailler();

        }

        void ListeleFailler()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Failler", connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridViewFailler.DataSource = dt;
        }

        private void btnEkleKaynak_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Kaynaklar (MedyaLinki, MedyaAdi) VALUES (@MedyaLinki, @MedyaAdi)", conn);
            cmd.Parameters.AddWithValue("@MedyaLinki", txtMedyaLinki.Text);
            cmd.Parameters.AddWithValue("@MedyaAdi", txtMedyaAdi.Text);
            cmd.ExecuteNonQuery();
            conn.Close();

            MessageBox.Show("Kaynak eklendi.");
            ListeleKaynaklar();

        }

        void ListeleKaynaklar()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Kaynaklar", connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridViewKaynaklar.DataSource = dt;
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnEkleOlay_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Olaylar (KadinID, OlumTarihi, Sehir, Yontem, FailID, KaynakID) VALUES (@KadinID, @OlumTarihi, @Sehir, @Yontem, @FailID, @KaynakID)", conn);
            cmd.Parameters.AddWithValue("@KadinID", cmbKadinID.SelectedValue);
            cmd.Parameters.AddWithValue("@OlumTarihi", dtOlumTarihi.Value);
            cmd.Parameters.AddWithValue("@Sehir", txtOlaySehir.Text);
            cmd.Parameters.AddWithValue("@Yontem", txtYontem.Text);
            cmd.Parameters.AddWithValue("@FailID", cmbFailID.SelectedValue);
            cmd.Parameters.AddWithValue("@KaynakID", cmbKaynakID.SelectedValue);
            cmd.ExecuteNonQuery();
            conn.Close();

            MessageBox.Show("Olay eklendi.");
            ListeleOlaylar();

        }


        void ListeleOlaylar()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Olaylar", connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridViewOlaylar.DataSource = dt;
        }


        void DoldurComboBoxlar()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("SELECT KadinID FROM Kadinlar", connectionString);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            cmbKadinID.DataSource = dt1;
            cmbKadinID.DisplayMember = "KadinID";
            cmbKadinID.ValueMember = "KadinID";

            SqlDataAdapter da2 = new SqlDataAdapter("SELECT FailID FROM Failler", connectionString);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            cmbFailID.DataSource = dt2;
            cmbFailID.DisplayMember = "FailID";
            cmbFailID.ValueMember = "FailID";

            SqlDataAdapter da3 = new SqlDataAdapter("SELECT KaynakID FROM Kaynaklar", connectionString);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            cmbKaynakID.DataSource = dt3;
            cmbKaynakID.DisplayMember = "KaynakID";
            cmbKaynakID.ValueMember = "KaynakID";
        }

        private void btnSilFail_Click(object sender, EventArgs e)
        {
            if (dataGridViewFailler.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewFailler.SelectedRows[0].Cells["FailID"].Value);
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Failler WHERE FailID = @FailID", conn);
                cmd.Parameters.AddWithValue("@FailID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt silindi.");
                ListeleFailler(); 
            }
        }

        private void btnFailDuzenle_Click(object sender, EventArgs e)
        {
            if (dataGridViewFailler.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewFailler.SelectedRows[0].Cells["FailID"].Value);
                string iliski = txtIliski.Text;
                string hukuki = txtHukukiDurum.Text;

                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Failler SET Iliski = @Iliski, HukukiDurum = @HukukiDurum WHERE FailID = @FailID", conn);
                cmd.Parameters.AddWithValue("@Iliski", iliski);
                cmd.Parameters.AddWithValue("@HukukiDurum", hukuki);
                cmd.Parameters.AddWithValue("@FailID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt güncellendi.");
                ListeleFailler();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dataGridViewKaynaklar.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewKaynaklar.SelectedRows[0].Cells["KaynakID"].Value);
                string link = txtMedyaLinki.Text;
                string ad = txtMedyaAdi.Text;

                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Kaynaklar SET MedyaLinki = @MedyaLinki, MedyaAdi = @MedyaAdi WHERE KaynakID = @KaynakID", conn);
                cmd.Parameters.AddWithValue("@MedyaLinki", link);
                cmd.Parameters.AddWithValue("@MedyaAdi", ad);
                cmd.Parameters.AddWithValue("@KaynakID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt güncellendi.");
                ListeleKaynaklar();
            }
        }

        private void btnSilKaynak_Click(object sender, EventArgs e)
        {
            if (dataGridViewKaynaklar.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewKaynaklar.SelectedRows[0].Cells["KaynakID"].Value);
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Kaynaklar WHERE KaynakID = @KaynakID", conn);
                cmd.Parameters.AddWithValue("@KaynakID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt silindi.");
                ListeleKaynaklar();
            }
            else
            {
                MessageBox.Show("Lütfen bir kayıt seçin.");
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            if (dataGridViewOlaylar.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewOlaylar.SelectedRows[0].Cells["OlayID"].Value);

                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Olaylar SET KadinID = @KadinID, OlumTarihi = @OlumTarihi, Sehir = @Sehir, Yontem = @Yontem, FailID = @FailID, KaynakID = @KaynakID WHERE OlayID = @OlayID", conn);
                cmd.Parameters.AddWithValue("@KadinID", Convert.ToInt32(cmbKadinID.SelectedValue));
                cmd.Parameters.AddWithValue("@OlumTarihi", dtOlumTarihi.Value.Date);
                cmd.Parameters.AddWithValue("@Sehir", txtOlaySehir.Text);
                cmd.Parameters.AddWithValue("@Yontem", txtYontem.Text);
                cmd.Parameters.AddWithValue("@FailID", Convert.ToInt32(cmbFailID.SelectedValue));
                cmd.Parameters.AddWithValue("@KaynakID", Convert.ToInt32(cmbKaynakID.SelectedValue));
                cmd.Parameters.AddWithValue("@OlayID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt güncellendi.");
                ListeleOlaylar();
            }
        }

        private void btnSilOlay_Click(object sender, EventArgs e)
        {
            if (dataGridViewOlaylar.SelectedRows.Count > 0)
            {
                int id = Convert.ToInt32(dataGridViewOlaylar.SelectedRows[0].Cells["OlayID"].Value);
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Olaylar WHERE OlayID = @OlayID", conn);
                cmd.Parameters.AddWithValue("@OlayID", id);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Kayıt silindi.");
                ListeleOlaylar();
            }
        }

        private void cmbSehir_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
