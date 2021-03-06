<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <%--此页面备用，路径为 /in --%>

    <title>大屏系统后台任务数据</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" type="text/css" href="../vendor/font-awesome/css/font-awesome.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="../echarts/echarts.common.min.js"></script>


</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/mgr">大屏系统后台任务数据</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        欢迎您  ${username} &nbsp;<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a  id="logouts"><i class="fa fa-sign-out fa-fw"></i> 注销</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>

                        <li>
                            <a href="/mgr"><i class="fa   fa-home fa-fw"></i> 首页</a>
                        </li>

                        <li>
                            <a href="index.html"><i class="fa   fa-gear   fa-fw"></i> 系统管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/equ">设备管理</a>
                                </li>
                                <li>
                                </li>
                            </ul>
                        </li>


                        <li>
                            <a href="index.html"><i class="fa   fa-search   fa-fw"></i> 数据查询<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/history">历史数据</a>
                                </li>
                                <li>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="index.html"><i class="fa  fa-bar-chart-o  fa-fw"></i> 报表系统<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/sensor">传感器</a>
                                </li>
                                <li>
                                </li>
                            </ul>
                        </li>




                    </ul>
                            <!-- /.nav-second-level -->

                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">首页</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div id="countuser"  class="huge"></div>
                                    <div><font size="3">用户总数</font></div>
                                    <div>&nbsp;</div>
                                </div>
                            </div>
                        </div>
                        <a href="alluser.html">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-laptop  fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div  id="countequipment" class="huge"></div>
                                    <div><font size="3">设备总数</font></div>
                                    <div>正常：<span id="countonlineequ"></span>&nbsp;&nbsp;报警：<span id="countwarnequ"></span>&nbsp;&nbsp;离线：<span id="countofflineequ"></span></div>
                                </div>
                            </div>
                        </div>
                        <a href="allequ.html">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div  id="countnoticelog" class="huge"></div>
                                    <div><font size="3">报警总数</font></div>
                                    <div>邮件：<span id="countmailnotice"></span>&nbsp;&nbsp;微信：<span id="countwechatnotice"></span>&nbsp;&nbsp;短信：<span id="countsmsnotice"></span>&nbsp;&nbsp;语音：<span id="countphonenotice"></span></div>
                                </div>
                            </div>
                        </div>

                        <a href="allnotice.html">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>

                    </div>


                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>系统报警数据

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div  style="height:350px" id="systemalarm"></div>
                            <a href="flot.html" class="btn btn-default btn-block">查看更多<i class="fa fa-angle-double-right fa-fw"></i></a>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 报警设备

                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>设备名称</th>
                                                    <th>MAC地址</th>
                                                    <th>传感器</th>
                                                    <th>数值</th>
                                                    <th>等级</th>
                                                    <th>日期</th>
                                                </tr>
                                            </thead>
                                            <tbody id="alarmequs"></tbody>
                                        </table>
                                    </div>
                                    <a href="allalarm.html" class="btn btn-default btn-block">查看更多<i class="fa fa-angle-double-right fa-fw"></i></a>

                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <!--<div class="col-lg-8">
                                    <div id="morris-bar-chart"></div>
                                </div>-->
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->

                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i>通知用户
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="noticeusers" class="list-group">
                             <!--   <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i><em>测试用户3</em><span class="text-muted " style="display: inline-block;position: absolute;left:200px"><em>邮件通知</em></span>
                                    <span class="pull-right text-muted "><em>27 minutes ago</em>
                                    </span>
                                </a>-->
                            </div>
                            <a href="allnotice.html" class="btn btn-default btn-block">查看更多<i class="fa fa-angle-double-right fa-fw"></i></a>


                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i>报警类型占比
                        </div>
                        <div class="panel-body">
                            <div id="alarmtype"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->

                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <script>




        $(function(){
            //概况统计
            $.ajax({
                type:'POST',
                url:'/dashboard',
                contentType: "application/json;charset=UTF-8",
                dataType:'json',
                async:false,
                cache:false,
                success:function(data){
                    var countuser=data.countuser;
                    var countequipment= data.countequipment;
                    var countonlineequ=data.countonlineequ;
                    var countwarnequ =data.countwarnequ;
                    var countofflineequ =data.countofflineequ;

                    var countnoticelog =data.countnoticelog;
                    var countmailnotice =data.countmailnotice;
                    var countwechatnotice =data.countwechatnotice;
                    var countsmsnotice =data.countsmsnotice;
                    var countphonenotice =data.countphonenotice;

                    $("#countuser")[0].innerHTML =countuser;

                    $("#countequipment")[0].innerHTML =countequipment;
                    $("#countonlineequ")[0].innerHTML =countonlineequ;
                    $("#countwarnequ")[0].innerHTML =countwarnequ;
                    $("#countofflineequ")[0].innerHTML =countofflineequ;

                    $("#countnoticelog")[0].innerHTML =countnoticelog;
                    $("#countmailnotice")[0].innerHTML =countmailnotice;
                    $("#countwechatnotice")[0].innerHTML =countwechatnotice;
                    $("#countsmsnotice")[0].innerHTML =countsmsnotice;
                    $("#countphonenotice")[0].innerHTML =countphonenotice;
                }
            });




            //最近通知用户，报警设备，设备比例
            $.ajax({
                type:'GET',
                url:'/alarmequAndnoticeuser',
                contentType: "application/json;charset=UTF-8",
                dataType:'json',
                async:false,
                cache:false,
                success:function(data){
                    $("#alarmequs").html("");
                    $("#noticeusers").html("");

                    var one=  data.onecount;
                    var two= data.secondcount;
                    var third=  data.thirdcount;

                    var alarmlog= data.latelyalarmequ;
                    var noticelog=data.latelynoticeuser;


                    for(var i=0;i<alarmlog.length;i++){
                       var equname= alarmlog[i].equipment_name;
                       var mac= alarmlog[i].equipment_mac;
                       var sensor= alarmlog[i].sensor_name;
                       var data= alarmlog[i].sensor_data;
                       var alarmlevel= alarmlog[i].alarm_desc;
                       var time=alarmlog[i].desctime;
                       var unit= alarmlog[i].sensor_unit;
                        $("#alarmequs").append("<tr> <td>"+equname+"</td> <td>"+mac+"</td> <td>"+sensor+"</td> <td>"+data+unit+"</td> <td>"+alarmlevel+"</td> <td>"+time+"</td> </tr>");
                    }

                    for(var i=0;i<noticelog.length;i++){
                        var username= noticelog[i].user_name;
                        var notice_type=noticelog[i].notice_type;
                        var time=noticelog[i].desctime;
                        $("#noticeusers").append(' <a href="#" class="list-group-item"> <i class="fa fa-comment fa-fw"></i><span class="text-muted small">'+username+'</span><span class="text-muted small " style="display: inline-block;position: absolute;left:180px"><em>'+notice_type+'</em></span><span class="pull-right text-muted small"><em>'+time+'</em> </span> </a>');
                    }
                    var donut = new Morris.Donut({
                        element: 'alarmtype',
                        resize: true,
                        colors: ["#fce5cd", "#ff9900", "#ff0000"],
                        data: [
                            {label: "一级警报", value: one},
                            {label: "二级警报", value: two},
                            {label: "三级警报", value: third}
                        ],
                        hideHover: 'true'
                    });

                }


            });

           /* $("#alarmequs").html("");
            $("#alarmequs").append("<tr> <td>测试</td> <td>123456789</td> <td>甲醛</td> <td>20 mg/m3</td> <td>二级</td> <td>2017-05-26 22:35:29</td> </tr>");

           $("#noticeusers").html("");
            $("#noticeusers").append(' <a href="#" class="list-group-item"> <i class="fa fa-comment fa-fw"></i>测试用户2 <span class="pull-right text-muted small"><em>12 minutes ago</em> </span> </a>');
            */


            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('systemalarm'));

            // 指定图表的配置项和数据
            option = {
                /*  title: {
                 text: '未来一周气温变化',
                 subtext: '纯属虚构'
                 },*/
                tooltip: {
                    trigger: 'axis',
                    formatter: function(params)
                     {
                         var string=null;
                         var level=params[0].value;
                         if(level==1){
                             string=":三级"
                         }else if(level==2){
                             string=":二级"
                         }else if(level==3){
                             string=":一级"
                         }




                     return   params[0].name+'<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#c23531"></span>'+params[0].seriesName+string;
                     }
                },
                legend: {
                    /* data:['最高气温']*/
                },
                toolbox: {
                    show: true,
                    feature: {
                        magicType: {type: ['line', 'bar']},
                    },
                    right:90
                },
                xAxis:  {
                    type: 'category',
                    boundaryGap: true,
                    data: ["05-27 22:45","05-27 22:46","05-27 22:47","05-27 22:48","05-27 22:49","05-27 22:50","05-27 22:51","05-27 22:52","05-27 22:53","05-27 22:54"]
                },
                yAxis: {
                    type: 'value',
                    max:4,
                    axisLabel: {
                        formatter: function (value, index) {
                            var date = new Date(value);
                            var texts = [];
                            if (index === 2) {
                                texts.push('三级');
                            }
                            if (index === 4) {
                                texts.push('二级');
                            }
                            if(index==6){
                                texts.push('一级');
                            }
                            return texts;
                        }
                    }

                    ,
                    splitNumber:6
                },
                series: [
                    {

                        name:'警报级别',

                        type:'bar',
                        data:[1,2,3]

                    },

                ]
            };

            /*   option.series[0].type="bar"; */
            /*   option.xAxis.data=new Array("1","2");
                 option.series[0].data=new Array(2,1);
            */
            /*   myChart.setOption(option); */

            $.ajax({
                type:'GET',
                url:'/alarmtime',
                contentType: "application/json;charset=UTF-8",
                dataType:'json',
                async:false,
                cache:false,
                success:function(data){
                    option.xAxis.data=data.xtime;
                    option.series[0].data=data.yvalue;
                    myChart.setOption(option);
                }
            });





            $("#logouts").bind("click",function () {
                $.ajax({
                    type:'GET',
                    url:'/login/logout',
                    async:false,
                    cache:false,
                    success:function(data){
                        if(data=="true"){
                            window.location.href='/login'
                        }
                    }
                });
            })









        })



    </script>

</body>

</html>
