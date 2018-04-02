<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentReceived.aspx.cs"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>데모사전질의</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
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
        /*.form-group.form-md-line-input {
            position: relative;
            margin: 0px;
            padding-top: 0px; 
        }*/
    </style>
</head>
<body>
    <div id="loading">
        <img id="loading-image" src="../Content/asset/global/831.gif" alt="Loading..." /></div>
    <div class="banner" id="banner">
        <img src="../Content/ms.png" alt="배너" width="100%" id="img-b"/>
    </div>
    <div class="container">
        <div class="portlet light bordered" id="border">
            <div class="portlet-title">
                <div class="row">
                    <div class="col-md-3 col-xs-6" >
                    <asp:Image ID="Image1" runat="server" ImageUrl="http://www.qualisoft.co.kr/xe/layouts/KSO_QualiSoft/img/logo.png" />
                    <i class="icon-settings font-green-ha ze"></i>
                </div>
                <div class="col-md-9 col-xs-6" style="margin: 18px 0px;">
                    <h3 style="color: #414099; font-weight: 600;">
                        DEMO 신청</h3>
                </div>
                </div>
            </div>
            <div class="portlet-body form">
                <form id="form1" runat="server">
                <div class="form-body">
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_subject">
                            항목</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="form_control_1">
                            회사<span class="required" aria-required="true"> * </span>
                        </label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_company" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_name">
                            이름<span class="required" aria-required="true"> * </span>
                        </label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" OnTextChanged="SubjectLoad"
                                AutoPostBack="true"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_rank">
                            직함</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_rank" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_department">
                            부서</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_department" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_emali">
                            전자메일<span class="required" aria-required="true"> * </span>
                        </label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_emali" runat="server" CssClass="form-control">
                            </asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_moblie">
                            핸드폰<span class="required" aria-required="true"> * </span>
                        </label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_moblie" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row has-success">
                        <label class="col-md-2 control-label" for="txt_desc">
                            기타문의사항</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_desc" runat="server" CssClass="form-control" Height="300" TextMode="MultiLine"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btn_save" runat="server" Text="신청하기" CssClass="btn default" OnClientClick="if (!Validation_Save()) return false;"
                                OnClick="btn_save_Click" />
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div id="footer" style="border-top: 2px solid #ccc; margin-top: 50px;">
            <br />
            <p style="padding-top: 10px;">
                ㈜퀄리소프트&nbsp;&nbsp;&nbsp;&nbsp;대표이사 : 변유신&nbsp;&nbsp;&nbsp;&nbsp;TEL : 02. 6925.
                1279&nbsp;&nbsp;&nbsp;&nbsp;FAX :0504. 022. 7650&nbsp;&nbsp;&nbsp;&nbsp;E-mail :patrick@qualisoft.co.kr</p>
            <p>
                서울특별시 마포구 상암동 마포비즈니스센터 508호(우 03911)</p>
            <p style="font-size: 9px;">
                COPYRIGHTS © QUALISOFT. ALL RIGHTS RESERVED.</p>
        </div>
    </div>
</body>
</html>
