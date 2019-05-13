<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>修改图书</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		$.post("${pageContext.request.contextPath }/category_findAllCategories.action",{}
		,function(data){
			 $(data).each(function(i, n) {
				$("#categoryID").append("<option value='" + n.categoryId + "'>" + n.categoryName + "</option>");
			}); 
			 $("#categoryID option[value='${category.categoryId}']").prop("selected","selected");
		},"json"); 
		
	});
	
</script>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<s:actionerror/>
	<s:fielderror/>
	<s:form name="form1" id="form1" action="book_updateBook" namespace="/" method="post" enctype="multipart/form-data" theme="simple">
	<s:hidden name="bookId"/><s:hidden name="smallImage"/><s:hidden name="bigImage"/>
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
								<TD class=manageHead>当前位置：图书管理 &gt; 修改图书信息</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						
						<TABLE cellSpacing=0 cellPadding=5  border=0>
						  
						    
							<TR>
								<td>图书名称：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="bookName" value="%{bookName}"/>
								</td>
								<td>图书分类 ：</td>
								<td>
									<select id="categoryID" name="category.categoryId">
										<option value="">--请选择--</option>
									</select>
								</td>
							</TR>
							
							<TR>
								<td>作者 ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="author" value="%{author}"/>
								</td>
								<td>进货价 ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="price" value="%{price}"/>
								</td>
							</TR>
							
							<TR>
								
								<td>当前价 ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="currentPrice" value="%{currentPrice}"/>
								</td>
								<td>折扣 ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="discount" value="%{discount}"/>
								</td>
							</TR>
							<TR>
								
								<td>ISBN ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="ISBN" value="%{ISBN}"/>
								</td>
								<td>出版社 ：</td>
								<td>
								<s:textfield cssClass="textbox" cssStyle="WIDTH: 180px" maxlength="50" 
									name="press" value="%{press}"/>
								</td>
							</TR>
							
							<TR>
								<td>小图 ：</td>
								<td colspan="3">
								<!-- 文件上传的3个属性,下面2个属性加上 form 里面的enctype属性 -->
									<input type="file" name="smallImg">
								</td>
								<td>大图 ：</td>
								<td colspan="3">
								<!-- 文件上传的3个属性,下面2个属性加上 form 里面的enctype属性 -->
									<input type="file" name="bigImg">
								</td>
							</TR>
							
							<tr>
								<td rowspan=2>
								<INPUT class=button id=sButton2 type=submit
														value=" 修改 ">
								</td>
							</tr>
						</TABLE>
						
						
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg">
					<IMG src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
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
	</s:form>
</BODY>
</HTML>
