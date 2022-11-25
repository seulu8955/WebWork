package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * [요청을 가로체서 중간에 원하는 작업을 할수 있는 필터 만들기]
 * 
 * 1. java.servlet.Filter 인터페이스를 구현한다.
 * 2. 어떤 요청에 대해 필터링 할것인지 맵핑한다.
 * 
 */

@WebFilter(urlPatterns = {"/private/*","/users/private/*", "/file/private/*", "/cafe/private/*"})
public class LoginFilter implements Filter{

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 로그인된 클라이언트인지 확인
		//부모 타입을 자식타입으로 캐스팅!
		HttpServletRequest req=(HttpServletRequest)request;
		//자식 타입을 이용해서 httpsession 객체의 참조값 얻어내기
		HttpSession session=req.getSession();
		// 로그인된 아이디가 있는지 읽어오기
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			//로그인 됐으면 관ㅇ여할 필요 X
			chain.doFilter(request, response);
		}else {
	         /*
	          *  로그인 페이지로 강제 리다일렉트 됬다면 
	          *  로그인 성공후에 원래 가려던 목적지로 다시 보내야 하고
	          *  GET 방식 전송 파라미터가 있다면 파라미터 정보도 같이 가지고 갈수 있도록 해야한다.
	          */
	         //원래 가려던 url 정보 읽어오기
	         String url=req.getRequestURI();
	         //GET 방식 전송 파라미터를 query 문자열로 읽어오기 ( a=xxx&b=xxx&c=xxx )
	         String query=req.getQueryString();
	         //특수 문자는 인코딩을 해야한다.
	         String encodedUrl=null;
	         if(query==null) {//전송 파라미터가 없다면 
	            encodedUrl=URLEncoder.encode(url);
	         }else {
	            // 원래 목적지가 /test/xxx.jsp 라고 가정하면 아래와 같은 형식의 문자열을 만든다.
	            // "/test/xxx.jsp?a=xxx&b=xxx ..."
	            encodedUrl=URLEncoder.encode(url+"?"+query);
	         }
			
			//로그인 하지 않았으면 로그인폼으로 이동하도록 리다일렉트 응답
			String cPath=req.getContextPath();
			//servletresponse 타입을 HttpServletResponse 타입으로 캐스팅
			HttpServletResponse res=(HttpServletResponse)response;
			
			res.sendRedirect(cPath+"/users/loginform.jsp?url="+encodedUrl);
			
			
			
		}
		
	}
}
