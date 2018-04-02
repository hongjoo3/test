<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentReceived.aspx.cs"
    Inherits="QualiDemo.Report.CommentReceived" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>데모사전질의</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/asset/global/components.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/asset/global/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/asset/global/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="../Content/asset/global/font-awesome.css" rel="stylesheet" type="text/css" /> 
    <style type="text/css">
        *
        {
            font-size: 12px; /*font-family: Arial, sans-serif;*/
            font-family: Arial, sans-serif;
            margin: 0px;
        }
        #footer
        {
            color: #514f4f;
            font-size: 11px;
        }
        #loading
        {
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            position: fixed;
            display: block;
            opacity: 0.7;
            background-color: #fff;
            z-index: 99;
            text-align: center;
        }
        
        #loading-image
        {
            position: absolute;
            top: 50%;
            left: 50%;
            z-index: 100;
        }
        #img-b
        {
            position:absolute;
        }
        canvas
        {
            position:relative;
            z-index:99;
        }
    </style>
</head>
<body>
    <div>test 입니다.</div>
</body>
</html>
