<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h2 {
	text-align: center;
}
fieldset {
	width: 800px;
	margin: 200px auto;
}
fieldset ul li{
	list-style-type: none;
	margin-left: 105px; 
}	
fieldset div {
	text-align: center;
}
.text {
	width: 500px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;
}
.text_half{
	width: 245px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;	
}
.button {
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	transition: 1.0s;
	border-radius: 10px;
	background-color: white;
	border: 1px solid black;
}
#button:hover {
	background-color: black;
	color: white;
	transform: scale(1.0);
}
div input {
	margin-top:10px;
	width: 150px;
	height: 30px;
}
.select {
	width: 253px;
	height: 60px;
	font-size: 20px;
	border-radius: 10px;
	border-color: black;
	border: 1px solid black;
	text-align: center;	
}
.text_button{
	width: 400px;
	height: 60px;
	font-size: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	
	var cnt = new Array();
	cnt[0]  = new Array('전체');
	cnt[1]  = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
	cnt[2]  = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
	cnt[3]  = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
	cnt[4]  = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
	cnt[5]  = new Array('전체','광산구','남구','동구','북구','서구');
	cnt[6]  = new Array('전체','대덕구','동구','서구','유성구','중구');
	cnt[7]  = new Array('전체','남구','동구','북구','중구','울주군');
	cnt[8]  = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
	cnt[9]  = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
	cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
	cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
	cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
	cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
	cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
	cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
	cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
	
	function addrSelect(addr) {
		addr2=document.userjoin.user_addr2
		for(i=addr2.length-1;i>=0;i--){
			addr2.options[i]=null
		}
		for(i=0;i<cnt[addr].length;i++){
			addr2.options[i]=new Option(cnt[addr][i],cnt[addr][i]);
		}
	}
	
	function openIdCheck() {
		window.open('user_idCheck.jsp','id','width=500px,height=300px');
	}

	function openNicknameCheck() {
		window.open('user_nicknameCheck.jsp','nickname','width=500px,height=300px');
	}
	function test1() {
		document.write('disabled');
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>				
<fieldset>
<h2>회원가입</h2>
<form action="userJoin_ok.jsp" name="userjoin" method="post">
	<ul>
		<li>
			<input type="text" name="user_name" placeholder="이름 입력" class="text" required>
		</li>
		<li>
			<input type="text" name="user_resident_num" placeholder="주민등록번호 입력 ) -입력X" class="text" maxlength="13" required
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</li>
		<li>
			<input type="text" name="user_id" placeholder="아이디 입력" class="text_button" readonly>
			<input type="button" value="중복검사" class="button" onclick="openIdCheck()" id="button">
		</li>
		<li>
			<input type="password" name="user_pwd" placeholder="비밀번호 입력" class="text" required >
		</li>
		<li>
			<input type="text" name="user_nickname" placeholder="별명 입력" class="text_button" readonly>
			<input type="button" value="중복검사" class="button" onclick="openNicknameCheck()" id="button">
		</li>
		<li>
			<input type="text" name="user_email" placeholder="이메일 입력" class="text_half" required>
			<select name="user_email2" class="select" required>
			<option value="@naver.com">@naver.com</option>
			<option value="@google.com">@google.com</option>
			<option value="@daum.net">@daum.net</option>
			<option value="@nate.com">@nate.com</option>
			<option value="@github.com">@github.com</option>
			<option value="notion.so">@notion.so</option>
			</select>
		</li>
		<li>
			<select name="user_addr" onchange="addrSelect(this.selectedIndex);" class="select" required>
				 <option selected disabled>시/도</option>
                 <option value='서울'>서울</option>
                 <option value='부산'>부산</option>
                 <option value='대구'>대구</option>
                 <option value='인천'>인천</option>
                 <option value='광주'>광주</option>
                 <option value='대전'>대전</option>
                 <option value='울산'>울산</option>
                 <option value='경기'>경기</option>
                 <option value='강원'>강원</option>
                 <option value='충북'>충북</option>
                 <option value='충남'>충남</option>
                 <option value='전북'>전북</option>
                 <option value='전남'>전남</option>
                 <option value='경북'>경북</option>
                 <option value='경남'>경남</option>
                 <option value='제주'>제주</option>
			</select>
			   
      		<select name='user_addr2' class="select" required>
                 <option  selected>구/군</option>
            </select>
												
		</li>
	</ul>
	<div>
		<input type="submit" value="회원가입" class="button" id="button">	
	</div>
</form>
</fieldset>
</article>

</section>
<%@include file="/footer.jsp" %>
</body>
</html>