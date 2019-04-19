<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="code">ログインID</label><br />
<input type="text" name="code" value="${member.code}" />
<br /><br />

<label for="name">お名前</label><br />
<input type="text" name="name" value="${member.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="password" name="password" />
<br /><br />

<label for="content">プロフィール</label><br />
<input type="text" name="profile" value="${member.profile}" />
<br /><br />

<label for="admin_flag">権限</label><br />
<select name="admin_flag">
    <option value="0"<c:if test="${member.admin_flag == 0}"> selected</c:if>>ーこちらを選択してくださいー</option>
    <option value="1"<c:if test="${member.admin_flag == 1}"> selected</c:if>>＊</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>