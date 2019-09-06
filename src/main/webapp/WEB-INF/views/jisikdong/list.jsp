<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
    <title>커뮤니티 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row d-flex d-md-block flex-nowrap wrapper">
        <main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
            <div class="page-header mt-3">
                <h2>지식動</h2>
            </div>
            <p class="lead">반려동물에 대해 궁금한 것을 묻고 답해보세요</p>
            <hr>
            <table class="table table-striped" style="max-width: 1080px;">
                <thead>
                <tr>
                    <th scope="col" class="mobile" style="width:55px; text-align:center;">번호</th>
                    <th scope="col" class="mobile" style="text-align:center;">제목</th>
                    <th scope="col" class="mobile" style="width:80px; text-align:center;">작성자</th>
                    <th scope="col" class="mobile" style="width:120px; text-align:center;">날짜</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${contentList}" var="content">
                <tr>
                    <th scope="row" class="mobile" style="text-align:center;"><c:out value="${content.id}"/></th>
                    <td><a class='move' href='<c:out value="${content.id}"/>'><c:out value="${content.title}"/></a></td> 
                    <td class="mobile" style="text-align:center;"><c:out value="${content.userEmail}"/></td>
                    <td class="mobile" style="text-align:center;"><fmt:formatDate value="${content.createdDate}" pattern="yyyy-MM-dd"/> </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            
            <div style="max-width: 1080px;">
                <a href="/jisikdong/register" class="btn btn-primary float-right">글쓰기</a>
            </div>
            
            
            
            <!-- Paging 처리 -->
            <div class='pull-right'>
              <ul class="pagination">
                
                <c:if test="${pageMaker.prev}">
                  <li class="paginate_button previous">
                    <a href="${pageMaker.startPage -1}">Previous</a>
                  </li>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }">
                    <a href="${num}">${num}</a>
                  </li>
                </c:forEach>
                
                <c:if test="${pageMaker.next}">
                  <li class="paginate_button next">
                    <a href="${pageMaker.endPage+1 }">Next</a>
                  </li>
                </c:if>
              
              </ul>
            </div>
            
            
            
            <form id='actionForm' action="/jisikdong/list" method='get'>
              <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
              <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            </form>
            
            <footer class="text-center" style="max-width: 1080px;">
                <p>Copyright ⓒ 2019 <b>zalbazo</b> All Rights Reserved.</p>
            </footer>
        </main>
    </div>
</div>

<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='id' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/jisikdong/get");
		actionForm.submit();
	});
	
});
</script>
</body>
</html>