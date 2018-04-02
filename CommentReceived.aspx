<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentReceived.aspx.cs" %>

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
               <%--     <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_leadqna" style="text-align: left;">
                            잠재고객에 대해 알고 있고<br />
                            관리를 하고 있는지요 ?</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_leadqna" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#lead">
                                            자세히보기</a>
                                    </h4>
                                </div>
                                <div id="lead" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <iframe src="https://www.microsoft.com/dynamics/crm/content/rc/2011/ko-kr/on-prem/5.0/leadroutingdiagram.aspx?c=hv"
                                            frameborder="0" width="100%" height="300" marginwidth="0" marginheight="0"></iframe>
                                    </div>
                                </div>
                            </div>
                            <!-- /panel -->
                        </div>
                    </div>
                    <div class="form-group form-md-line-input row">
                        <label class="col-md-2 control-label" for="txt_opptyqny">
                            영업기회 관리를<br />
                            하고 있는지요 ?</label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txt_opptyqny" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="form-control-focus">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="panel-group" id="accordion2">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#oppty">
                                            자세히보기 </a>
                                    </h4>
                                </div>
                                <div id="oppty" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <iframe src="https://www.microsoft.com/dynamics/crm/content/rc/2011/ko-kr/on-prem/5.0/opportunitydiagram.aspx?c=hv"
                                            frameborder="0" width="100%" height="300" marginwidth="0" marginheight="0"></iframe>
                                    </div>
                                </div>
                            </div>
                            <!-- /panel -->
                        </div>
                    </div>--%>
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
        <%--<div id="footer" style="border-top: 2px solid #ccc; margin-top: 50px;">
            <br />
            <p style="padding-top: 10px;">
                ㈜퀄리소프트&nbsp;&nbsp;&nbsp;&nbsp;대표이사 : 변유신&nbsp;&nbsp;&nbsp;&nbsp;TEL : 02. 6925.
                1279&nbsp;&nbsp;&nbsp;&nbsp;FAX :0504. 022. 7650&nbsp;&nbsp;&nbsp;&nbsp;E-mail :patrick@qualisoft.co.kr</p>
            <p>
                서울특별시 마포구 상암동 마포비즈니스센터 508호(우 03911)</p>
            <p style="font-size: 9px;">
                COPYRIGHTS © QUALISOFT. ALL RIGHTS RESERVED.</p>
        </div>--%>
    </div>
    <script src="../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Scripts/three.min.js" type="text/javascript"></script>
    <script src="../Scripts/BVHLoader.js" type="text/javascript"></script>
    <script src="../Scripts/OrbitControls.js" type="text/javascript"></script>
       <script type="text/javascript">

           window.onload = function () {
               Remove_loading();
               Remove_border();
               init();
               animate();
           }

           function Validation_Save() {
               if ($("#txt_name").val() == null || $("#txt_name").val() == "") {
                   alert("이름을 입력해주세요");
                   $("#txt_name").focus();
                   return false;
               }
               return true;
           }

           function Remove_border() {
               if (window.innerWidth < 700) {
                   document.getElementById('border').classList.remove('bordered');
               }
               return;
           }

           function Remove_loading() {
               document.getElementById('loading').style.display = 'none';
               return;
           }

           var clock = new THREE.Clock();
           var camera, controls, renderer;
           var scene = new THREE.Scene();
           var mixer, skeletonHelper;


           var loader = new THREE.BVHLoader();
           loader.load("../Scripts/pirouette.bvh", function (result) {
               skeletonHelper = new THREE.SkeletonHelper(result.skeleton.bones[0]);
               skeletonHelper.skeleton = result.skeleton; // allow animation mixer to bind to SkeletonHelper directly
               var boneContainer = new THREE.Group();
               boneContainer.add(result.skeleton.bones[0]);
               scene.add(skeletonHelper);
               scene.add(boneContainer);
               // play animation
               mixer = new THREE.AnimationMixer(skeletonHelper);
               mixer.clipAction(result.clip).setEffectiveWeight(1.0).play();
           });

           function init() {
               camera = new THREE.PerspectiveCamera(300, window.innerWidth / window.innerHeight, 1, 1000);
               camera.position.set(0, 200, 400);
               //controls = new THREE.OrbitControls(camera);
               //controls.enable = false;
               //controls.minDistance = 300;
               //controls.maxDistance = 700;            
               // renderer
               renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
               renderer.setClearColor(0x000000, 0);
               renderer.setPixelRatio(window.devicePixelRatio);               
               renderer.setSize(window.innerWidth*0.3, window.innerHeight*0.3);
               document.getElementById('banner').appendChild(renderer.domElement);
               window.addEventListener('resize', onWindowResize, false);
           }

           function onWindowResize() {
               camera.aspect = window.innerWidth / window.innerHeight;
               camera.updateProjectionMatrix();
               renderer.setSize(window.innerWidth*0.3, window.innerHeight*0.1);
           }
           function animate() {
               requestAnimationFrame(animate);
               var delta = clock.getDelta();
               if (mixer) mixer.update(delta);
               renderer.render(scene, camera);
           }

    </script>
</body>
</html>
