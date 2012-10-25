using System;
using System.Diagnostics;
using System.Web.Services;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        [WebMethod]
        public static void DoSomething()
        {
            Debug.WriteLine("Did Something");
        }
        [WebMethod]
        public static void DoSomethingWith(string favFruit, int favNumber, bool isMale)
        {
            Debug.WriteLine("Did Something with:");
            Debug.WriteLine(favFruit);
            Debug.WriteLine(favNumber);
            Debug.WriteLine(isMale);
        }
        [WebMethod]
        public static void ThrowException()
        {
            throw new Exception("Exception thrown at " + DateTime.Now);
        }
        [WebMethod]
        public static string GetDate()
        {
            return DateTime.Now.ToString();
        }
        [WebMethod]
        public static string GetDateWith(string favFruit, int favNumber, bool isMale)
        {
            return string.Format("now={0}\r\nfavFruit={1}\r\nfavNumber={2}\r\nisMale={3}",
                          DateTime.Now,
                          favFruit,
                          favNumber,
                          isMale
            );
        }
    }
}