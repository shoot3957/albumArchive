<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inquiry-inner">
  <c:choose>
    <c:when test="${empty list}">
      <h2 class="no-reservation">문의가 없습니다</h2>
        <c:if test="${loginId ne 'admin'}">
            <a href="${ctx}/inquiryForm.do">문의하기</a>
        </c:if>
    </c:when>
    <c:otherwise>
      <h2 class="inquiry-list">문의 리스트</h2>
      <table border="1">
        <c:forEach var="list" items="${list}">
          <tr>
            <td align="center">
              <img src="${ctx}/${list.img}" alt="문의 이미지" width="100" height="100">
            </td>
            <td align="center">
                   <%-- 본인이거나 admin 일때 상세정보 접근 가능 --%>
                   <a href="${ctx}/adminInquiryAnswer.do?num=${list.num}&id=${loginId}">${list.title}</a>
            </td>
            <td align="center">${list.user_id}</td>
            <td align="center">${list.info}</td>
            <td align="center">
              <c:if test="${loginId eq list.user_id or loginId eq 'admin'}">
                <a href="${ctx}/adminDeleteInquiry.do?id=${list.num}">삭제</a>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </table>

      <!-- 문의하기 버튼 추가 -->
      <c:if test="${loginId ne 'admin'}">
        <a href="${ctx}/inquiryForm.do?id=${loginId}">문의하기</a>
      </c:if>

      <!-- 페이징 컨트롤 추가 -->
      <div class="pagination" style="text-align: center; margin-top: 20px;">
        <!-- 처음으로 -->
        <c:if test="${currentPage > 1}">
          <a href="${ctx}/adminInquiryList.do?page=1">처음으로</a>
        </c:if>
        <c:if test="${currentPage <= 1}">
          <span>처음으로</span>
        </c:if>

        <!-- 이전 -->
        <c:if test="${currentPage > 1}">
          <a href="${ctx}/adminInquiryList.do?page=${currentPage - 1}">이전</a>
        </c:if>
        <c:if test="${currentPage <= 1}">
          <span>이전</span>
        </c:if>

        <!-- 페이지 번호 -->
        <c:set var="startPage" value="${currentPage - 2}"/>
        <c:if test="${startPage < 1}">
          <c:set var="startPage" value="1"/>
        </c:if>
        <c:set var="endPage" value="${currentPage + 2}"/>
        <c:if test="${endPage > totalPages}">
          <c:set var="endPage" value="${totalPages}"/>
        </c:if>
        <c:if test="${startPage > 1}">
          <span>•••</span>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
          <c:if test="${i == currentPage}">
            <span>${i}</span>
          </c:if>
          <c:if test="${i != currentPage}">
            <a href="${ctx}/adminInquiryList.do?page=${i}">${i}</a>
          </c:if>
        </c:forEach>
        <c:if test="${endPage < totalPages}">
          <span>•••</span>
        </c:if>

        <!-- 이후 -->
        <c:if test="${currentPage < totalPages}">
          <a href="${ctx}/adminInquiryList.do?page=${currentPage + 1}">이후</a>
        </c:if>
        <c:if test="${currentPage >= totalPages}">
          <span>이후</span>
        </c:if>

        <!-- 끝으로 -->
        <c:if test="${currentPage < totalPages}">
          <a href="${ctx}/adminInquiryList.do?page=${totalPages}">끝으로</a>
        </c:if>
        <c:if test="${currentPage >= totalPages}">
          <span>끝으로</span>
        </c:if>
      </div>
    </c:otherwise>
  </c:choose>
</div>
<%@ include file="../parts/footer.jsp"%>