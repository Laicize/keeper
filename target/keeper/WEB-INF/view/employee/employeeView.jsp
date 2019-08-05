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
        <title>管理员</title>
    </head>
<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
			<div class="search_style">
			  <ul class="search_content clearfix" style="height: 30px;">
				   <li><label class="l_f">员工名称</label><input name="" type="text"  class="text_add" placeholder=""  style=" width:400px"/></li>
				   <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
				   <li style="width:90px;"><button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
			  </ul>
			</div>
    <!--操作-->
			 <div class="border clearfix">
			   <span class="l_f">
				<a href="javascript:ovid()" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
				<a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
			   </span>
			   <span class="r_f">共：<b>5</b>人</span>
			 </div>
			 <div class="margin clearfix">
				  <div class="compete_list" id="showData">
					  <table id="sample-table-1" class="table table-striped table-bordered table-hover">
					     <thead>
						   <tr>
							   <th class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
							   <th>员工序号</th>
							   <th>员工名字</th>
							   <th>员工电话</th>
							   <th>员工地址</th>
							   <th class="hidden-480">权限</th>
							   <th class="hidden-480">操作</th>
						   </tr>
						 </thead>
						  <tbody>
							   <c:forEach var="employee" items="${employees}" varStatus="status">
								   <tr>
									   <td class="center"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									   <td>${status.index+1 }</td>
									   <td>${employee.name }</td>
									   <td>${employee.mobile }</td>
									   <td>${employee.address }</td>
									   <td class="hidden-480">${employee.permission }</td>
									   <td>
										   <a title="查看" href="javascript:;"  onclick="employeeView(${employee.id })" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										   <a title="编辑" href="javascript:;"  onclick="employeeEdit(${employee.id })"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
										   <a title="删除" href="javascript:;"  onclick="employeeDelete(${employee.id })" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
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
			url:"${path }/employee/employeeViewFrag.do?pageNo="+pageNo,
			success:function(data){
				$("#showData").empty();
				$("#showData").append(data);
				pageTotal=$("#pageTotal").val();
			}
		}
		$.ajax(object);
	}
	function employeeView(){
		console.log("fsjdkfljsldkf");
	}

	function employeeEdit(){

	}

	function employeeAdd(){

	}

	function employeeDelete(id){
		var object = {
			url:"${path}/employee/employeeDelete.do?id="+id,
			success:function(data){
				console.log(data);
				if(data=="0"){
					alert("删除失败");
				}else{
					page();
					alert("删除成功");
				}
			}
		}
	}

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

