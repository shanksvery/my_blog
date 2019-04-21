<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2>記事　詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>name</th>
                            <td><c:out value="${report.member.name}" /></td>
                        </tr>
                        <tr>
                            <th>profile</th>
                            <td><c:out value="${report.member.profile}" /></td>
                        </tr>
                        <tr>
                            <th>date</th>
                            <td><fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                        </tr>
                        <tr>
                            <th>内容</th>
                            <td>
                                <pre><c:out value="${report.content}" /></pre>
                            </td>
                        </tr>
                        <tr>
                            <th>photo</th>
                            <img src = "/Applications/Eclipse_4.6.3.app/Contents/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/my_blog/WEB-INF\views\reports\file\スクリーンショット 2019-04-21 22.06.01.png">
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${report.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${report.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_member.id == report.member.id}">
                    <p><a href="<c:url value='/reports/edit?id=${report.id}' />">この記事を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/reports/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>