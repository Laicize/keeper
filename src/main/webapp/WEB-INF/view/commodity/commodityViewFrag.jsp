<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
<table class="table table-striped table-bordered table-hover" id="sample-table">
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
        <c:forEach var="commodity" items="${commodities}" varStatus="status">
            <tr>
                <td width="25px"><label><input type="checkbox" class="ace" ><span class="lbl"></span></label></td>
                <td width="80px">${status.index+1 }</td>
                <td>${commodity.name }</td>
                <td>${commodity.number }</td>
                <td>${commodity.price}</td>
                <td width="200px">${commodity.description }</td>
                <td class="td-manage" style="text-align: center">
                    <a onClick="member_stop(this,'10001')"  href="javascript:;" title="查看"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                    <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                    <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<input type="hidden" value="${pageTotal }" id="pageTotal">
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
