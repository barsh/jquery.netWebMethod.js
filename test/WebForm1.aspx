﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="jquery.netWebMethod.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {

            $("#doSomething").click(function () {
                $.netWebMethod({
                    methodName: 'DoSomething'
                });
                alert('did something');                
            });

            $("#doSomethingWith").click(function () {
                $.netWebMethod({
                    methodName: 'DoSomethingWith',
                    params: { favFruit: 'apple', favNumber: 1, isMale: true },
                });
                alert('did something with');
            });

            $("#throwException").click(function () {
                $.netWebMethod({
                    methodName: 'ThrowException',
                    error: function (error) { alert(error); }
                });
            });

            $("#getDate").click(function () {
                $.netWebMethod({
                    methodName: 'GetDate',
                    success: function (response) { alert(response); },
                    error: function (error) { alert(error); },
                    loadingMessageSelector: '#loadingMessage'
                });
            });

            $("#getDateWith").click(function () {
                $.netWebMethod({
                    methodName: 'GetDateWith',
                    params: { favFruit: 'apple', favNumber: 1, isMale: true },
                    success: function (response) { alert(response); },
                    error: function (error) { alert(error); },
                    loadingMessageSelector: '#loadingMessage'
                });
            });
            

        });

    </script>
</head>
<body>
    <form id="form2" runat="server">
        
        <input type="button" value="Do Something" id="doSomething"/><br/><br/><br/>
        
        <input type="button" value="Do Something With" id="doSomethingWith"/><br/><br/><br/>
        
        <input type="button" value="Throw Exception" id="throwException"/><br/><br/><br/>
        
        <input type="button" value="Get Date" id="getDate"/><br/><br/><br/>
        
        <input type="button" value="Get Date With" id="getDateWith"/><br/><br/><br/>
        
        <div id="loadingMessage" style="display:none">Loading...</div>
    </form>
</body>
</html>