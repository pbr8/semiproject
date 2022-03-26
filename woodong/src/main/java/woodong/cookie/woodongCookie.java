package woodong.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class woodongCookie {

	//쿠키 저장하는 메서드
	
	public static void setCookie(String key,String value,int time,HttpServletResponse resp) {
		
		Cookie ck=new Cookie(key, value);
		ck.setMaxAge(time);
		resp.addCookie(ck);
		
	}
	
	//쿠키 가져오는 메서드
	
	public static String getCookie(String key,HttpServletRequest req) {
		
		Cookie cks[]=req.getCookies();
		String value=null;
		if(cks!=null) {
			for(int i=0;i<cks.length;i++) {
				if(cks[i].getName().equals(key)) {
					value=cks[i].getValue();
				}
			}
		}
		return value;
	}
	
}
