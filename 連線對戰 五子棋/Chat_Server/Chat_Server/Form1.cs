﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;//匯入網路通訊協定相關函數
using System.Net.Sockets;//匯入網路插座功能函數
using System.Threading;//匯入多執行緒功能函數
using System.Collections;//匯入集合物件功能

namespace TCP_Server
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //公用變數宣告
        TcpListener Server;//伺服端網路監聽器(相當於電話總機)
        Socket Client;//給客戶用的連線物件(相當於電話分機)
        Thread Th_Svr;//伺服器監聽用執行緒(電話總機開放中)
        Thread Th_Clt;//客戶用的通話執行緒(電話分機連線中)
        Hashtable HT = new Hashtable();//儲存客戶名稱與通訊物件的集合物件(雜湊表)(key:Name, Socket)
        int a = 0;//同時連線上限人數
        //顯示本機IP
        private void Form1_Load(object sender, EventArgs e)
        {
            TextBox1.Text = MyIP(); //呼叫函數找本機IP
        }
        //找出本機IP
        private string MyIP()
        {
            string hn = Dns.GetHostName();
            IPAddress[] ip = Dns.GetHostEntry(hn).AddressList; //取得本機IP陣列
            foreach (IPAddress it in ip)
            {
                if (it.AddressFamily == AddressFamily.InterNetwork)
                {
                    return it.ToString();//如果是IPv4回傳此IP字串
                }
            }
            return ""; //找不到合格IP回傳空字串
        }
        //啟動監聽連線要求
        private void Button1_Click(object sender, EventArgs e)
        {
            CheckForIllegalCrossThreadCalls = false; //忽略跨執行緒處理的錯誤(允許跨執行緒存取變數)
            Th_Svr = new Thread(ServerSub); //宣告監聽執行緒(ServerSub)
            Th_Svr.IsBackground = true; //設定為背景執行緒
            Th_Svr.Start(); //啟動監聽執行緒
            Button1.Enabled = false; //讓按鍵無法使用(不能重複啟動伺服器)
        }
        //接受客戶連線要求的程式(如同電話總機)，針對每一客戶會建立一個連線，以及獨立執行緒
        private void ServerSub()
        {
            IPEndPoint EP = new IPEndPoint(IPAddress.Parse(TextBox1.Text), int.Parse(TextBox2.Text)); //Server IP 和 Port
            Server = new TcpListener(EP); //建立伺服端監聽器(總機)
            Server.Start(100); //啟動監聽設定允許最多連線數100人
            while (true)
            {
                Client = Server.AcceptSocket(); //建立此客戶的連線物件Client
                Th_Clt = new Thread(Listen); //建立監聽這個客戶連線的獨立執行緒
                Th_Clt.IsBackground = true; //設定為背景執行緒
                Th_Clt.Start(); //開始執行緒的運作
            }
        }
        //監聽客戶訊息的程式
        private void Listen()
        {
            Socket sck = Client;//複製Client通訊物件到個別客戶專用物件Sck
            Thread Th = Th_Clt;//複製執行緒Th_Clt到區域變數Th
            while (true) //持續監聽客戶傳來的訊息
            {
                try //用 Sck 來接收此客戶訊息，inLen 是接收訊息的 Byte 數目
                {
                    byte[] B = new byte[1023];    //建立接收資料用的陣列，長度須大於可能的訊息
                    int inLen = sck.Receive(B); //接收網路資訊(Byte陣列)
                    string Msg = Encoding.Default.GetString(B, 0, inLen); //翻譯實際訊息(長度inLen)
                    string Cmd = Msg.Substring(0, 1); //取出命令碼 (第一個字)
                    string Str = Msg.Substring(1);    //取出命令碼之後的訊息
                    switch (Cmd)
                    {
                        case "0"://有新使用者上線：新增使用者到名單中
                            if (a == 2)
                            {//若已有兩人連線則不再與新的Client建立連線
                                break;
                            }
                            a++;//連線人數+1
                            HT.Add(Str, sck); //連線加入雜湊表，Key:使用者，Value:連線物件(Socket)
                            Listbox1.Items.Add(Str); //加入上線者名單
                            SendAll(OnlineList()); //將目前上線人名單回傳剛剛登入的人(包含他自己)
                            break;
                        case "9":
                            a--;
                            HT.Remove(Str); //移除使用者名稱為Name的連線物件
                            Listbox1.Items.Remove(Str); //自上線者名單移除Name
                            SendAll(OnlineList()); //將目前上線人名單回傳剛剛登入的人(不包含他自己)
                            Th.Abort(); //結束此客戶的監聽執行緒
                            break;
                        case "2"://使另一方為乙方(白棋)
                            SendAll("2" + Str);
                            break;
                        case "5"://接收對手下棋位置的x
                            Str = Msg.Substring(1, 1);
                            SendAll("5" + Str);
                            break;
                        case "6"://接收對手下棋位置的y
                            Str = Msg.Substring(1, 1);
                            SendAll("6" + Str);
                            break;
                        case "3":
                            TextBox1.Text = "error server " + Str;
                            SendAll("7" + Str);
                            break;
                        case "4"://接收對手下棋位置的y
                            Str = Msg.Substring(1, 1);
                            TextBox1.Text = "error server " + Str;
                            SendAll("7");
                            break;
                    }
                }
                catch (Exception)
                {
                    //有錯誤時忽略，通常是客戶端無預警強制關閉程式，測試階段常發生
                }
            }
        }
        //建立線上名單
        private string OnlineList()
        {
            string L = "L"; //代表線上名單的命令碼(字頭)
            for (int i = 0; i < Listbox1.Items.Count; i++)
            {
                L += Listbox1.Items[i]; //逐一將成員名單加入L字串
                //不是最後一個成員要加上","區隔
                if (i < Listbox1.Items.Count - 1) { L += ","; }
            }
            return L;
        }
        //傳送訊息給指定的客戶
        private void SendTo(string Str, string User)
        {
            byte[] B = Encoding.Default.GetBytes(Str); //訊息轉譯為Byte陣列
            Socket Sck = (Socket)HT[User]; //取出發送對象User的通訊物件
            Sck.Send(B, 0, B.Length, SocketFlags.None); //發送訊息
        }
        //傳送訊息給所有的線上客戶
        private void SendAll(string Str)
        {
            byte[] B = Encoding.Default.GetBytes(Str); //訊息轉譯為Byte陣列
            foreach (Socket s in HT.Values) s.Send(B, 0, B.Length, SocketFlags.None); //傳送資料
        }
        //關閉視窗時
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.ExitThread();//關閉所有執行緒
        }
    }
}

