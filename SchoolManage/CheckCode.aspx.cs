using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class CheckCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateCheckCodeImage(GenerateCheckCode());
    }
    private string GenerateCheckCode()
    {
        int number;
        char code;
        string CheckCode = string.Empty;
        System.Random random = new Random();
        for (int i = 0; i < 4; i++)
        {
            number = random.Next();
            code = (char)('0' + (char)(number % 10));
            CheckCode += code.ToString();
        }
        Session["CheckCode"] = CheckCode;
        return CheckCode;
    }
    //产生验证码背景图像    
    private void CreateCheckCodeImage(string checkCode)
    {
        if (checkCode == null || checkCode.Trim() == string.Empty)
            return;
        System.Drawing.Bitmap image = new Bitmap((int)Math.Ceiling((checkCode.Length * 13.5)), 22);
        Graphics g = Graphics.FromImage(image);
        try
        {
            //生成随机生成器            
            Random random = new Random();
            //清空图片背景色            
            g.Clear(Color.White);
            //画图片的噪音线            
            for (int i = 0; i < 25; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);
                g.DrawLine(new Pen(Color.Silver), x1, x2, y1, y2);
            }
            Font font = new Font("Arial", 12, (FontStyle.Bold | FontStyle.Italic));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(checkCode, font, brush, 2, 2);
            //画图片的前景噪音点            
            for (int i = 0; i < 100; i++)
            {
                int x = random.Next(image.Width);
                int y = random.Next(image.Height);
                image.SetPixel(x, y, Color.FromArgb(random.Next()));
            }
            //画图片的边框线            
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/gif";
            Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }


}