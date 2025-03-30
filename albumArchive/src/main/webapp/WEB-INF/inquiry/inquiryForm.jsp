<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/inquiry.css">
<div class="container inquiry-form-inner">
    <h2 class="text-center my-4">문의 작성</h2>
    
    <form action="${ctx}/insertInquiry.do?id=${id}" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" id="title" name="title" class="form-control" required>
        </div>
        
        <div class="mb-3">
            <label for="info" class="form-label">내용</label>
            <textarea id="info" name="info" class="form-control" rows="5" required></textarea>
        </div>
        
        <!-- 이미지 업로드 기능 (추후 활성화 가능) -->
        <%-- 
        <div class="mb-3">
            <label for="image" class="form-label">이미지 업로드</label>
            <input type="file" id="image" name="image" class="form-control">
        </div>
        --%>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary px-4">저장</button>
            <button type="button" class="btn btn-secondary px-4" onclick="location.href='${ctx}/adminInquiryList.do'">취소</button>
        </div>
    </form>
</div>

<%@ include file="../parts/footer.jsp"%>
