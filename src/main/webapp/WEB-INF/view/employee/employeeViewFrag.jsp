<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>
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
                    <a onClick="commodityView()"  title="查看"  class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                    <a title="编辑" onclick="Competence_modify('560')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
                    <a title="删除" href="javascript:;"  onclick="Competence_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input value="${pageTotal }" type="hidden" id="pageTotal">
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
