<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>订单列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
<link rel="stylesheet" href="${pageContext.request.contextPath }/jquery/jquery.datepick.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-1.4.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery.datepick-zh-CN.js"></script>

<script type="text/javascript">
	$(function(){
		$('#orderTime').datepick({dateFormat: 'yy-mm-dd'}); 
		$('#endTime').datepick({dateFormat: 'yy-mm-dd'}); 
	});
</script>
<script type="text/javascript">
/* $(function() {
	$.post("${pageContext.request.contextPath }/order_findAllOrders.action",{}
	,function(data){
		 $(data).each(function(i, n) {
			$("#categoryID").append("<option value='" + n.categoryId + "'>" + n.categoryName + "</option>");
		}); 
	},"json"); 
	
}); */

</script>
<SCRIPT language=javascript>
	function to_page(page){
		if(page){
			$("#page").val(page);
		}
		document.customerForm.submit();
		
	}
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/order_findAllOrders.action"
		method=post>
		
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：订单管理 &gt; 订单列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>订单时间：从</TD>
													<TD>
													<input type="text" id="orderTime" name="orderTime" readonly="readonly" value="<s:date name="orderTime" format="yyyy-MM-dd"/>"/>
													</TD>
													<TD>到</TD>
													<TD>
													<input type="text" id="endTime" name="endTime" readonly="readonly" value="<s:date name="endTime" format="yyyy-MM-dd"/>"/>
													</TD>
													<TD>订单状态：</TD>
													<TD>
														<s:select theme="simple" name="orderStatus" list="#{'0':'完成','1':'待付款','2':'待发货','3':'待签收'}" headerKey="" headerValue="-请选择-"></s:select>
													</TD>
													<TD><INPUT class=button id=sButton2 type=submit
														value=" 筛选 " ></TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
							    
								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>订单编号</TD>
													<TD>订单时间</TD>
													<TD>收货地址</TD>
													<TD>订单总价</TD>
													<TD>订单状态</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator value="list" >
												<TR
													style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD><s:property value="orderId"/></TD>
													<TD><s:date name="orderTime" format="yyyy-MM-dd HH:mm:ss"/></TD>
													<TD><s:property value="address"/></TD>
													<TD><s:property value="total"/> 元</TD>
													<TD>
														<s:if test='orderStatus == "0"'>
															完成
														</s:if>
														<s:elseif test='orderStatus == "1"'>
															待付款
														</s:elseif>
															<s:if test='orderStatus == "2"'>
															待发货
														</s:if>
														<s:elseif test='orderStatus == "3"'>
															待签收
														</s:elseif>
													</TD>
													<TD>
													<s:if test='orderStatus == "0"'>
														<a href="${pageContext.request.contextPath }/order_deleteOrder.action?orderId=<s:property value="orderId" />">删除订单(订单已完成)</a>
													</s:if>
													<s:elseif test='orderStatus == "1"'>
														<a href="${pageContext.request.contextPath }/order_deleteOrder.action?orderId=<s:property value="orderId" />">删除订单(订单待付款)</a>
													</s:elseif>
													<s:if test='orderStatus == "2"'>
														<a href="${pageContext.request.contextPath }/order_updateOrder.action?orderId=<s:property value="orderId" />">修改为已发货</a>
													</s:if>
													<s:elseif test='orderStatus == "3"'>
														<a href="${pageContext.request.contextPath }/order_deleteOrder.action?orderId=<s:property value="orderId" />">删除订单(订单待签收)</a>
													</s:elseif>
												
													</TD>
												</TR>
												</s:iterator>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B><s:property value="totalCount"/></B>]条记录,[<B><s:property value="totalPage"/></B>]页
												,每页显示
												
												<select name="pageSize" onchange="to_page()">
													<option value="3"  <s:if test="pageSize == 3">selected</s:if>>3</option>
													<option value="5" <s:if test="pageSize == 5">selected</s:if>>5</option>
													<option value="10" <s:if test="pageSize == 10">selected</s:if>>10</option>
												</select>
												条
												<s:if test="currPage != 1">
												[<A href="javascript:to_page(1)">首页</A>]
												[<A href="javascript:to_page(<s:property value="currPage-1"/>)">前一页</A>]
												</s:if>&nbsp;&nbsp;
												<B>
												
												<s:iterator var="i" begin="1" end="totalPage">
													<s:if test="#i == currPage">
														<s:property value="#i"/>
													</s:if>
													<s:else>
														<a href="javascript:to_page(<s:property value="#i"/>)"><s:property value="#i"/></a>
													</s:else>
												</s:iterator>
												
												</B>&nbsp;&nbsp;
												<s:if test="currPage != totalPage">
												[<A href="javascript:to_page(<s:property value="currPage+1"/>)">后一页</A>] 
												[<A href="javascript:to_page(<s:property value="totalPage"/>)">尾页</A>]
												</s:if>
												到
												<input type="text" size="3" id="page" name="currPage" />
												页
												
												<input type="button" value="Go" onclick="to_page()"/>
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
