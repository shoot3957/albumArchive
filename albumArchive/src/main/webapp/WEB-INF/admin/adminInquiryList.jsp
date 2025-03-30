<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/inquiry.css">
<div class="inquiry-inner">
    <c:choose>
        <c:when test="${empty list}">
            <h2 class="no-reservation">문의가 없습니다</h2>
            <c:if test="${loginId ne 'admin'}">
                <a href="${ctx}/inquiryForm.do" class="btn-inquiry">문의하기</a>
            </c:if>
        </c:when>
        <c:otherwise>
            <h2 class="inquiry-list">문의 리스트</h2>
            <div class="inquiry-grid">
                <c:forEach var="list" items="${list}">
                    <div class="inquiry-square">
                        <div class="inquiry-details">
                            <h3 class="inquiry-title">
                                <a href="${ctx}/adminInquiryAnswer.do?num=${list.num}&id=${loginId}">${list.title}</a>
                            </h3>
                            <p class="inquiry-user">작성자: ${list.user_id}</p>
                            <p class="inquiry-info">${list.info}</p>
                            <div class="inquiry-actions">
                                <c:if test="${loginId eq list.user_id or loginId eq 'admin'}">
                                    <a href="${ctx}/adminDeleteInquiry.do?id=${list.num}" class="btn-delete">삭제</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 문의하기 버튼 추가 -->
            <c:if test="${loginId ne 'admin'}">
                <a href="${ctx}/inquiryForm.do?id=${loginId}" class="btn-inquiry">문의하기</a>
            </c:if>

            <!-- 페이징 컨트롤 추가 -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="${ctx}/adminInquiryList.do?page=1" class="page-link">처음으로</a>
                </c:if>
                <c:if test="${currentPage <= 1}">
                    <span class="disabled">처음으로</span>
                </c:if>

                <c:if test="${currentPage > 1}">
                    <a href="${ctx}/adminInquiryList.do?page=${currentPage - 1}" class="page-link">이전</a>
                </c:if>
                <c:if test="${currentPage <= 1}">
                    <span class="disabled">이전</span>
                </c:if>

                <c:set var="startPage" value="${currentPage - 2}"/>
                <c:if test="${startPage < 1}">
                    <c:set var="startPage" value="1"/>
                </c:if>
                <c:set var="endPage" value="${currentPage + 2}"/>
                <c:if test="${endPage > totalPages}">
                    <c:set var="endPage" value="${totalPages}"/>
                </c:if>
                <c:if test="${startPage > 1}">
                    <span class="ellipsis">•••</span>
                </c:if>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:if test="${i == currentPage}">
                        <span class="page-number current">${i}</span>
                    </c:if>
                    <c:if test="${i != currentPage}">
                        <a href="${ctx}/adminInquiryList.do?page=${i}" class="page-link">${i}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${endPage < totalPages}">
                    <span class="ellipsis">•••</span>
                </c:if>

                <c:if test="${currentPage < totalPages}">
                    <a href="${ctx}/adminInquiryList.do?page=${currentPage + 1}" class="page-link">이후</a>
                </c:if>
                <c:if test="${currentPage >= totalPages}">
                    <span class="disabled">이후</span>
                </c:if>

                <c:if test="${currentPage < totalPages}">
                    <a href="${ctx}/adminInquiryList.do?page=${totalPages}" class="page-link">끝으로</a>
                </c:if>
                <c:if test="${currentPage >= totalPages}">
                    <span class="disabled">끝으로</span>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<%@ include file="../parts/footer.jsp"%>