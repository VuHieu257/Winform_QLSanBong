using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLTOUR.GiaoDIen
{
    public partial class QLTour : Form
    {
        DBConnection db = new DBConnection();
        public QLTour()
        {
            InitializeComponent();
        }

        void Reset()
        {
            txt_matour.Clear();
            txt_tentour.Clear();
            txt_anhtour.Clear();
            txt_giatour.Clear();
            txt_mota.Clear();
        }
        void HienThiDSTour()
        {
            //string chuoitruyvan = "SELECT * FROM THONGTINSAN";
            string chuoitruyvan = "SELECT MaSan,TenSan,MoTaSan,AnhSan,GiaSan,TGBatDau,TGKetThuc,ttt.MaLoaisan,lt.TenLoaisan FROM LOAISAN lt JOIN THONGTINSAN ttt ON lt.MaLoaisan = ttt.MaLoaisan";
            DataTable dt = db.getDataTable(chuoitruyvan);

            dgv_thongtintour.DataSource = dt;

        }

        void Load_CbbMaLoaiTour()
        {
            string chuoitruyvan = "SELECT * FROM LOAISAN";
            DataTable dt = db.getDataTable(chuoitruyvan);

            DataRow dr = dt.NewRow();
            dr["Maloaisan"] = "All";
            dr["TenLoaisan"] = "Chọn loại sân";
            dt.Rows.InsertAt(dr, 0);

            cbb_maloaitour.DataSource = dt;
            cbb_maloaitour.DisplayMember = "TenLoaisan";
            cbb_maloaitour.ValueMember = "Maloaisan";
        }


        private void QLTour_Load(object sender, EventArgs e)
        {
            HienThiDSTour();
            Load_CbbMaLoaiTour();
  
        }

        private void dgv_dstour_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            dgv_thongtintour.ReadOnly = true;
            if (e.RowIndex >= 0)
            {

                DataGridViewRow row = dgv_thongtintour.Rows[e.RowIndex];
                txt_matour.Text = row.Cells["MaSan"].Value.ToString();
                txt_tentour.Text = row.Cells["TenSan"].Value.ToString();
                txt_mota.Text = row.Cells["MoTaSan"].Value.ToString();
                txt_anhtour.Text = row.Cells["AnhSan"].Value.ToString();
                txt_giatour.Text = row.Cells["GiaSan"].Value.ToString();
                dpt_batdau.Value = DateTime.Parse(row.Cells["TGBatDau"].Value.ToString());
                dpt_ketthuc.Value = DateTime.Parse(row.Cells["TGKETTHUC"].Value.ToString());

                cbb_maloaitour.SelectedValue = row.Cells["MaLoaisan"].Value.ToString();
            }

        }

        private void btn_them_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkMa(txt_matour.Text))
                {
                    MessageBox.Show("Mã Sân này đã bị trùng. Hãy kiểm tra lại ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txt_matour.Clear();
                }
                else
                {
                    dgv_thongtintour.ReadOnly = false;
                    btn_luu.Enabled = true;


                    if (string.IsNullOrWhiteSpace(txt_matour.Text) == false)
                    {

                        DataTable dt = (DataTable)dgv_thongtintour.DataSource;
                        DataRow dr = dt.NewRow();

                        dr["MaSan"] = txt_matour.Text;
                        dr["TenSan"] = txt_tentour.Text;
                        dr["MoTaSan"] = txt_mota.Text;
                        dr["AnhSan"] = txt_anhtour.Text;
                        dr["TGBatDau"] = dpt_batdau.Value.ToString();
                        dr["TGKETTHUC"] = dpt_ketthuc.Value.ToString();
                        dr["MaLoaiSan"] = cbb_maloaitour.SelectedValue.ToString();
                        dr["GiaSan"] = txt_giatour.Text;


                        dr["TGBatDau"] = dpt_batdau.Value.ToString();
                        dr["TGKETTHUC"] = dpt_ketthuc.Value.ToString();

                        dt.Rows.Add(dr);

                        // Cập nhật DataSource của DataGridView
                        dgv_thongtintour.DataSource = dt;

                        // Hiển thị dữ liệu trên DataGridView
                        dgv_thongtintour.Refresh();

                        btn_luu.Visible = true;
                    }
                    else
                    {
                        MessageBox.Show("Hãy Tạo Mã ");
                    }

                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        bool checkTourHoatDong()
        {
            string chuoitruyvan = "SELECT Masan FROM HOADON  Where Masan = (SELECT MaSan FROM THONGTINSAN Where MaSan ='" + txt_matour.Text + "')";
            int kq = db.CheckData(chuoitruyvan);
            if (kq > 0)
            {
                return true;
            }

            return false;
        }
        private void btn_xoa_Click(object sender, EventArgs e)
        {
            if (checkTourHoatDong())
            {
                MessageBox.Show("Sân này có khách đặt vé. Không thể xóa được");
            }
            else
            {
                DataTable dt = (DataTable)dgv_thongtintour.DataSource;
                dt.PrimaryKey = new DataColumn[] { dt.Columns["Masan"] };
                DataRow dr = dt.Rows.Find(txt_matour.Text);
                //Xóa
                if (dr != null)
                {
                    dr.Delete();
                    //cap nhat csdl
                    string chuoitruyvan = "Select * from THONGTINSAN";
                    int k = db.updateDataTable(dt, chuoitruyvan);
                    if (k != 0)
                    {
                        MessageBox.Show("Đã xóa thành công");
                        Reset();
                    }
                    else
                        MessageBox.Show("Xóa không thành công");
                }
                else
                {
                    MessageBox.Show("Không tìm thấy Sân cần xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btn_sua_Click(object sender, EventArgs e)
        {
            dgv_thongtintour.AllowUserToAddRows = false;
            btn_luu.Visible = true;
            btn_luu.Enabled = true;
            btn_them.Enabled = false;



            DataTable dt = (DataTable)dgv_thongtintour.DataSource;
            DataColumn[] key = new DataColumn[1];
            key[0] = dt.Columns[0];
            dt.PrimaryKey = key;
            DataRow dr = dt.Rows.Find(txt_matour.Text);
            if (dr != null)
            {
                dr["MaSan"] = txt_matour.Text;
                dr["TenSan"] = txt_tentour.Text;
                dr["MoTaSan"] = txt_mota.Text;
                dr["AnhSan"] = txt_anhtour.Text;
                dr["TGBatDau"] = dpt_batdau.Value.ToString();
                dr["TGKETTHUC"] = dpt_ketthuc.Value.ToString();
                dr["MaLoaiSan"] = cbb_maloaitour.SelectedValue.ToString();
                dr["GiaSan"] = txt_giatour.Text;
            }



            // Cập nhật DataSource của DataGridView
            dgv_thongtintour.DataSource = dt;

            // Hiển thị dữ liệu trên DataGridView
            dgv_thongtintour.Refresh();
        }


        private string TaoMa()
        {
            int maTangDan = 1;
            string Lay3KiTuCuoi = Lay3KiTuCuoiTuCSDL();

            // Nếu có mã sản phẩm trong CSDL, sử dụng 3 kí tự cuối cùng của mã SP để tăng dần
            if (!string.IsNullOrEmpty(Lay3KiTuCuoi))
            {
                maTangDan = int.Parse(Lay3KiTuCuoi) + 1;
            }
            string ma = "TO" + maTangDan.ToString("D3");

            return ma;
        }
        private string Lay3KiTuCuoiTuCSDL()
        {
            db.Open();
            string maToCheck = txt_matour.Text;

            string sql = "SELECT TOP 1 RIGHT(MaSan, 3) FROM THONGTINSAN ORDER BY MaSan DESC";


            object result = db.getScalar(sql);

            // Trả về 3 kí tự cuối hoặc chuỗi rỗng nếu không có mã SP trong CSDL
            return result != null ? result.ToString() : string.Empty;


        }


        private void btn_taoma_Click_1(object sender, EventArgs e)
        {
            string ma = TaoMa();
            txt_matour.Text = ma;
        }

        bool checkMa(string MaTour)
        {
            string checkMa = "SELECT MaSan FROM THONGTINSAN Where MaSan = '" + MaTour + "'";
            int kq = db.CheckData(checkMa);
            if (kq != 0)
            {
                return true;
            }
            return false;
        }

        private void btn_luu_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)dgv_thongtintour.DataSource;


                DataColumn[] key = new DataColumn[1];
                key[0] = dt.Columns[0];
                dt.PrimaryKey = key;
                DataRow dr = dt.Rows.Find(txt_matour.Text);
                if (dr != null)
                {
                    dr["MaSan"] = txt_matour.Text;
                    dr["TenSan"] = txt_tentour.Text;
                    dr["MoTaSan"] = txt_mota.Text;
                    dr["AnhSan"] = txt_anhtour.Text;
                    dr["TGBatDau"] = dpt_batdau.Value.ToString();
                    dr["TGKETTHUC"] = dpt_ketthuc.Value.ToString();
                    dr["MaLoaiSan"] = cbb_maloaitour.SelectedValue.ToString();

                    dr["GiaSan"] = txt_giatour.Text;
                }
                string chuoitruyvan = "Select * from THONGTINSAN";
                int kq = db.updateDataTable(dt, chuoitruyvan);
                if (kq > 0)
                {
                    MessageBox.Show("Cập nhật thành công");
                    btn_them.Enabled = true;
                    btn_luu.Visible = false;
                }
                else
                    MessageBox.Show("Cập nhật không thành công");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Ngày bắt đầu phải bé hơn ngày kết thúc", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void dpt_batdau_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
