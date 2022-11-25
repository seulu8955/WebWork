<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String thisPage=request.getParameter("thisPage"); %>    
<%--/include/navbar.jsp --%>
<header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${pageContext.request.contextPath }/index.jsp" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
          <li><a href="#" class="nav-link px-2 text-white">About</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2" onclick="location.href='${pageContext.request.contextPath }/users/lofin_form.jsp';">회원가입</button>
          <button type="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath }/users/signup_form.jsp';">회원가입</button>
          <%-- onclick 으로 주소를 넣을 경우onclick="location.herf=''" = 이후 쌍따옴표로 묶고 주소를 따옴표로 묶어서 총 2번 묶고 ;도 적어야 한다.  --%>
        </div>
      </div>
    </div>
  </header>