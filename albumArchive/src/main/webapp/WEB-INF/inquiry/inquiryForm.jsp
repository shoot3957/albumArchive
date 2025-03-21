<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="inner">
  <h2>문의 작성</h2>
  <form action="${ctx}/insertInquiry.do?id=${id}" method="post" enctype="multipart/form-data">
    <table class="table table-bordered">
      <tr>
        <th>제목</th>
        <td><input type="text" class="form-control" name="title" required></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><textarea class="form-control" name="info" rows="5" required></textarea></td>
      </tr>
      <!-- <tr>
        <th>이미지 업로드</th>
        <td><input type="file" class="form-control" name="image"></td>
      </tr> -->
    </table>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" class="btn btn-secondary" onclick="location.href='${ctx}/adminInquiryList.do'">취소</button>
    </div>
  </form>
</div>

<%@ include file="../parts/footer.jsp"%>