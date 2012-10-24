jquery.netWebMethod.js
======================

Make JavaScript calls to ASP.NET WebMethods without ScriptManager  (jQueryMobile compatible)

## Example:

    var params = { favFruit: 'apple', favNumber: 1, isMale: true };

    $.netWebMethod('WebForm1.aspx/GetDateWith', params, success, error);

    function success(response) {
        alert(response);
    }
    function error(response) {
        alert(response);
    }

## Inline Examples:

    $.netWebMethod('WebForm1.aspx/DoSomething');

    $.netWebMethod('WebForm1.aspx/DoSomethingWith', {favFruit: 'apple', favNumber: 1, isMale: true});

    $.netWebMethod('WebForm1.aspx/GetDate', {}, function (response) { alert(response); }, function (error) { alert(error); });
            
    $.netWebMethod('WebForm1.aspx/GetDateWith', { favFruit: 'apple', favNumber: 1, isMale: true }, function (response) { alert(response); }, function (error) { alert(error); });

## Sample methods for ASP.NET server side C# code:

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
