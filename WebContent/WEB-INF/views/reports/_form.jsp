<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="report_date">date</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">name</label><br />
<c:out value="${sessionScope.login_member.name}" />
<br /><br />

<label for="profile">profile</label><br />
<c:out value="${sessionScope.login_member.profile}" />
<br /><br />

<label for="title">title</label><br />
<input type="text" name="title" value="${report.title}" />
<br /><br />

<label for="content">content</label><br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br /><br />

<input type="file" name="file" >


<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>