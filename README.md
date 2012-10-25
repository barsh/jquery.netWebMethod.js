jquery.netWebMethod.js
======================

Make JavaScript calls to ASP.NET WebMethods without ScriptManager  (jQueryMobile compatible)

## $.netWebMethod(settings);
settings - A set of key/value pairs that configure the request. All settings are option except url.

### url (required)
A string n cotaining the URL to which the request is sent. 


###params (optional)
Data to be sent to the server as parameters to the web method. 
Must be a JSON Object made up of Key/Value pairs.


###success (optional)
A function to be called if the request succeeds.  
The function receives one argument: The data returned from the server.

###error (optional)
A function to be called if the request fails.  
The function receives one argument: The error message.

###cache (optional)
Default: false <br>
Forces requests not to be cached by the browser.
If set to true, requests can be cached by the browser.
When false, a POST parameter named $.netWebMethodTimeStamp is appended to the request.

###showLoadingMessage (optional)
Default: true <br>
Shows a message while the request is loading. This is useful when it is important to convey that a process is pending.
If jQueryMobile is detected the spinner will be displayed.  
If not, a loading message selector must be specified, see loadingMessageSelector.

###loadingMessageSelector (optional)
If a selector is specified matching elements will be made visible while the request is loading.
If jQueryMobile is detected the spinner will be displayed in place of matching elements.  
See jQuery documentation for help with selectors: http://api.jquery.com/category/selectors


##Installation
Include script after the jQuery library:


    <script src="/path/to/jquery.netWebMethod.js"></script>

Note: If using jQueryMobile with Ajax enabled, in some cases you may need to include 
the script tag inside each div with a data-role of page.

##Usage

Execute a web method:

    $.netWebMethod({
        url: 'WebForm1.aspx/DoSomething',
    });


Pass parameters to a web method:

    $.netWebMethod({
        url: 'WebForm1.aspx/DoSomethingWith',
        params: { favFruit: 'apple', favNumber: 1, isMale: true },
    });

Handle errors:

    $.netWebMethod({
        url: 'WebForm1.aspx/ThrowException',
        error: function (error) { alert(error); }
    });

Get the current date and time from the server:

    $.netWebMethod({
        url: 'WebForm1.aspx/GetDate',
        success: function (response) { alert(response); },
        error: function (error) { alert(error); }
    });

Pass parameters to a web method that get the current date and time from the server:

    $.netWebMethod({
        url: 'WebForm1.aspx/GetDateWith',
        params: { favFruit: 'apple', favNumber: 1, isMale: true },
        success: function(response) { alert(response); },
        error: function(error) { alert(error); }
    });

Show loading message:

    $.netWebMethod({
        url: 'WebForm1.aspx/GetDate',
        success: function (response) { alert(response); },
        error: function (error) { alert(error); },
		loadingMessageSelector: '#loadingMessage'
    });



## Sample ASPX server side code for Web Methods

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

### Copyright and License
Creative Commons Attribution 3.0 United States License +http://creativecommons.org/licenses/by/3.0/us/
