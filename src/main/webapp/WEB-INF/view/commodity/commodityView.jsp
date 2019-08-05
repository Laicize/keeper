<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${path}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${path}/css/style.css"/>
    <link href="${path}/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${path}/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${path}/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${path}/js/jquery-1.9.1.min.js"></script>
    <script src="${path}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="${path}/assets/js/typeahead-bs2.min.js"></script>
    <script src="${path}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${path}/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${path}/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${path}/js/lrtk.js" type="text/javascript" ></script>
    <script src="${path}/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${path}/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理员 - 素材牛模板演示</title>
</head>
<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <div class="border clearfix">
               <span class="l_f">
                <a href="javascript:ovid()" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加商品</a>
                <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
                </span>
                <span class="r_f">共：<b>5</b>人</span>
            </div>
            <div class="margin clearfix">
                <div class="compete_list" id="showData">
                    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="80px">ID</th>
                            <th width="120px">商品名称</th>
                            <th width="130px">商品数目</th>
                            <th width="180px">商品价格</th>
                            <th width="200px">描述</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="commodity" items="${commodities }" varStatus="status">
                            <tr>
                                <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
                                <td width="80px">${status.index+1 }</td>
                                <td>${commodity.name }</td>
                                <td>${commodity.number }</td>
                                <td>${commodity.price}</td>
                                <td width="200px">${commodity.description }</td>
                                <td class="td-manage" style="text-align: center">
                                    <a onClick="commodityView()"  title="查看"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                                    <a title="编辑" onclick="commodityEdit()" class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                                    <a title="删除"  onclick="commodityDelete()" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav style="float: right">
                        <ul class="pagination">
                            <li>
                                <input type="button" aria-hidden="true" value="上一页" onclick="pageUp()">
                            </li>
                            <li>
                                <input type="button" aria-hidden="true" value="下一页" onclick="pageDown()">
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">

    var pageNo = 1;
    var pageTotal=${pageTotal };
        function pageUp(){
            if(pageNo==1){
                alert("已经是第一页了！");
                return;
            }
            pageNo--;
            page();
        }

    function pageDown(){
        if(pageNo==pageTotal){
            alert("已经是最后一页了!");
            return;
        }
        pageNo++;
        page();
    }

    function page(){
        var object ={
            url:"${path }/commodity/commodityViewFrag.do?pageNo="+pageNo,
            success:function(data){
                $("#showData").empty();
                $("#showData").append(data);
                pageTotal=$("#pageTotal").val();
            }
        }
        $.ajax(object);
    }

    function commodityView(){

    }

    function commodityEdit(){

    }

    function commodityAdd(){

    }

    function commodityDelete(){

    }

    jQuery(function($) {
        var oTable1 = $('#sample_table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    });

</script>
<script type="text/javascript">
    $(function() {
        $("#administrator").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false,
            spacingw:50,//设置隐藏时的距离
            spacingh:270,//设置显示时间距
        });
    });
    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
        if(which.value.length > maxChars){
            layer.open({
                icon:2,
                title:'提示框',
                content:'您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0,maxChars);
            return false;
        }else{
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height()-215);
    $(".table_menu_list").width($(window).width()-260);
    $(".table_menu_list").height($(window).height()-215);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height()-215);
        $(".table_menu_list").width($(window).width()-260);
        $(".table_menu_list").height($(window).height()-215);
    })
    laydate({
        elem: '#start',
        event: 'focus'
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }
    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    /*产品-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*产品-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /*添加管理员*/
    $('#administrator_add').on('click', function(){
        layer.open({
            type: 1,
            title:'添加管理员',
            area: ['700px',''],
            shadeClose: false,
            content: $('#add_administrator_style'),

        });
    })
    //表单验证提交
    $("#form-admin-add").Validform({

        tiptype:2,

        callback:function(data){
            //form[0].submit();
            if(data.status==1){
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){
                    location.reload();//刷新页面
                });
            }
            else{
                layer.msg(data.info, {icon: data.status,time: 3000});
            }
            var index =parent.$("#iframe").attr("src");
            parent.layer.close(index);
            //
        }


    });
</script>
