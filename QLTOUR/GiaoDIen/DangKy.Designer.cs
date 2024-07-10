namespace QLTOUR.GiaoDIen
{
    partial class DangKy
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
               System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DangKy));
               this.label1 = new System.Windows.Forms.Label();
               this.label2 = new System.Windows.Forms.Label();
               this.label3 = new System.Windows.Forms.Label();
               this.txt_TenDN = new System.Windows.Forms.TextBox();
               this.txt_MK = new System.Windows.Forms.TextBox();
               this.txt_XNMK = new System.Windows.Forms.TextBox();
               this.btn_DangKy = new System.Windows.Forms.Button();
               this.exitButton = new System.Windows.Forms.Button();
               this.cbShowPass = new System.Windows.Forms.CheckBox();
               this.label4 = new System.Windows.Forms.Label();
               this.pictureBox1 = new System.Windows.Forms.PictureBox();
               this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
               this.label5 = new System.Windows.Forms.Label();
               this.cbb_MaNV = new System.Windows.Forms.ComboBox();
               ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
               this.SuspendLayout();
               // 
               // label1
               // 
               this.label1.AutoSize = true;
               this.label1.Font = new System.Drawing.Font("Roboto", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.label1.Location = new System.Drawing.Point(467, 193);
               this.label1.Name = "label1";
               this.label1.Size = new System.Drawing.Size(109, 18);
               this.label1.TabIndex = 0;
               this.label1.Text = "Tên đăng nhập:";
               // 
               // label2
               // 
               this.label2.AutoSize = true;
               this.label2.Font = new System.Drawing.Font("Roboto", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.label2.Location = new System.Drawing.Point(467, 262);
               this.label2.Name = "label2";
               this.label2.Size = new System.Drawing.Size(74, 18);
               this.label2.TabIndex = 1;
               this.label2.Text = "Mật khẩu:";
               // 
               // label3
               // 
               this.label3.AutoSize = true;
               this.label3.Font = new System.Drawing.Font("Roboto", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.label3.Location = new System.Drawing.Point(467, 335);
               this.label3.Name = "label3";
               this.label3.Size = new System.Drawing.Size(129, 18);
               this.label3.TabIndex = 2;
               this.label3.Text = "Nhập lại mật khẩu";
               // 
               // txt_TenDN
               // 
               this.txt_TenDN.BackColor = System.Drawing.SystemColors.Window;
               this.txt_TenDN.BorderStyle = System.Windows.Forms.BorderStyle.None;
               this.txt_TenDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F);
               this.txt_TenDN.Location = new System.Drawing.Point(470, 214);
               this.txt_TenDN.Name = "txt_TenDN";
               this.txt_TenDN.Size = new System.Drawing.Size(318, 31);
               this.txt_TenDN.TabIndex = 4;
               // 
               // txt_MK
               // 
               this.txt_MK.BackColor = System.Drawing.SystemColors.Window;
               this.txt_MK.BorderStyle = System.Windows.Forms.BorderStyle.None;
               this.txt_MK.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F);
               this.txt_MK.Location = new System.Drawing.Point(470, 283);
               this.txt_MK.Name = "txt_MK";
               this.txt_MK.Size = new System.Drawing.Size(318, 31);
               this.txt_MK.TabIndex = 5;
               this.txt_MK.UseSystemPasswordChar = true;
               // 
               // txt_XNMK
               // 
               this.txt_XNMK.BackColor = System.Drawing.SystemColors.Window;
               this.txt_XNMK.BorderStyle = System.Windows.Forms.BorderStyle.None;
               this.txt_XNMK.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F);
               this.txt_XNMK.Location = new System.Drawing.Point(470, 356);
               this.txt_XNMK.Name = "txt_XNMK";
               this.txt_XNMK.Size = new System.Drawing.Size(318, 31);
               this.txt_XNMK.TabIndex = 6;
               this.txt_XNMK.UseSystemPasswordChar = true;
               // 
               // btn_DangKy
               // 
               this.btn_DangKy.BackColor = System.Drawing.Color.Red;
               this.btn_DangKy.FlatAppearance.BorderSize = 0;
               this.btn_DangKy.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
               this.btn_DangKy.Font = new System.Drawing.Font("Segoe UI Semibold", 12F, System.Drawing.FontStyle.Bold);
               this.btn_DangKy.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
               this.btn_DangKy.Location = new System.Drawing.Point(614, 425);
               this.btn_DangKy.Name = "btn_DangKy";
               this.btn_DangKy.Size = new System.Drawing.Size(174, 40);
               this.btn_DangKy.TabIndex = 7;
               this.btn_DangKy.Text = "Đăng Ký";
               this.btn_DangKy.UseVisualStyleBackColor = false;
               this.btn_DangKy.Click += new System.EventHandler(this.btn_DangKy_Click);
               // 
               // exitButton
               // 
               this.exitButton.BackColor = System.Drawing.Color.Transparent;
               this.exitButton.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("exitButton.BackgroundImage")));
               this.exitButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
               this.exitButton.Cursor = System.Windows.Forms.Cursors.Hand;
               this.exitButton.FlatAppearance.BorderSize = 0;
               this.exitButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
               this.exitButton.ForeColor = System.Drawing.Color.Transparent;
               this.exitButton.Location = new System.Drawing.Point(791, 8);
               this.exitButton.Name = "exitButton";
               this.exitButton.Size = new System.Drawing.Size(56, 51);
               this.exitButton.TabIndex = 9;
               this.exitButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
               this.exitButton.UseVisualStyleBackColor = false;
               this.exitButton.Click += new System.EventHandler(this.exitButton_Click);
               // 
               // cbShowPass
               // 
               this.cbShowPass.AutoSize = true;
               this.cbShowPass.BackColor = System.Drawing.Color.Transparent;
               this.cbShowPass.FlatAppearance.BorderSize = 0;
               this.cbShowPass.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
               this.cbShowPass.Font = new System.Drawing.Font("Roboto", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.cbShowPass.Location = new System.Drawing.Point(657, 396);
               this.cbShowPass.Name = "cbShowPass";
               this.cbShowPass.Size = new System.Drawing.Size(131, 22);
               this.cbShowPass.TabIndex = 11;
               this.cbShowPass.Text = "Show Password";
               this.cbShowPass.UseVisualStyleBackColor = false;
               this.cbShowPass.CheckedChanged += new System.EventHandler(this.cbShowPass_CheckedChanged);
               // 
               // label4
               // 
               this.label4.AutoSize = true;
               this.label4.Font = new System.Drawing.Font("Roboto", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.label4.Location = new System.Drawing.Point(570, 69);
               this.label4.Name = "label4";
               this.label4.Size = new System.Drawing.Size(114, 33);
               this.label4.TabIndex = 12;
               this.label4.Text = "Đăng Ký";
               // 
               // pictureBox1
               // 
               this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
               this.pictureBox1.Location = new System.Drawing.Point(42, 145);
               this.pictureBox1.Name = "pictureBox1";
               this.pictureBox1.Size = new System.Drawing.Size(338, 320);
               this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
               this.pictureBox1.TabIndex = 13;
               this.pictureBox1.TabStop = false;
               // 
               // backgroundWorker1
               // 
               this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
               // 
               // label5
               // 
               this.label5.AutoSize = true;
               this.label5.Font = new System.Drawing.Font("Roboto", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.label5.Location = new System.Drawing.Point(467, 124);
               this.label5.Name = "label5";
               this.label5.Size = new System.Drawing.Size(77, 18);
               this.label5.TabIndex = 14;
               this.label5.Text = "Nhân Viên";
               // 
               // cbb_MaNV
               // 
               this.cbb_MaNV.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
               this.cbb_MaNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
               this.cbb_MaNV.FormattingEnabled = true;
               this.cbb_MaNV.Location = new System.Drawing.Point(470, 145);
               this.cbb_MaNV.Name = "cbb_MaNV";
               this.cbb_MaNV.Size = new System.Drawing.Size(318, 33);
               this.cbb_MaNV.TabIndex = 15;
               // 
               // DangKy
               // 
               this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
               this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
               this.BackColor = System.Drawing.Color.PowderBlue;
               this.ClientSize = new System.Drawing.Size(865, 548);
               this.Controls.Add(this.cbb_MaNV);
               this.Controls.Add(this.label5);
               this.Controls.Add(this.pictureBox1);
               this.Controls.Add(this.label4);
               this.Controls.Add(this.cbShowPass);
               this.Controls.Add(this.exitButton);
               this.Controls.Add(this.btn_DangKy);
               this.Controls.Add(this.txt_XNMK);
               this.Controls.Add(this.txt_MK);
               this.Controls.Add(this.txt_TenDN);
               this.Controls.Add(this.label3);
               this.Controls.Add(this.label2);
               this.Controls.Add(this.label1);
               this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
               this.Name = "DangKy";
               this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
               this.Text = "DangKy";
               this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.DangKy_FormClosing);
               this.Load += new System.EventHandler(this.DangKy_Load);
               ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
               this.ResumeLayout(false);
               this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_TenDN;
        private System.Windows.Forms.TextBox txt_MK;
        private System.Windows.Forms.TextBox txt_XNMK;
        private System.Windows.Forms.Button btn_DangKy;
          private System.Windows.Forms.Button exitButton;
          private System.Windows.Forms.CheckBox cbShowPass;
          private System.Windows.Forms.Label label4;
          private System.Windows.Forms.PictureBox pictureBox1;
          private System.ComponentModel.BackgroundWorker backgroundWorker1;
          private System.Windows.Forms.Label label5;
          private System.Windows.Forms.ComboBox cbb_MaNV;
     }
}