<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0 auto;
	background-color: #F5F5F5;
}

section {
	margin: 0 auto;
	width: 780px;
	height: 100%;
	background-color: white;
}

li {
	list-style: none;
	width: 680px;
	text-align: left;
}

#check_box1 {
	display: none;
}

.list1 {
	display: none;
}

#check_box1:checked ~ .list1 {
	display: block;
}

#check_box2 {
	display: none;
}

.list2 {
	display: none;
}

#check_box2:checked ~ .list2 {
	display: block;
}

#check_box3 {
	display: none;
}

.list3 {
	display: none;
}

#check_box3:checked ~ .list3 {
	display: block;
}

#check_box4 {
	display: none;
}

.list4 {
	display: none;
}

#check_box4:checked ~ .list4 {
	display: block;
}

#check_box5 {
	display: none;
}

.list5 {
	display: none;
}

#check_box5:checked ~ .list5 {
	display: block;
}

#img_c {
	text-align: center;
}
</style>
</head>
<body>
	<div id="img_c">
		<img src="/woodong/img/sp_main_img.jpg">
	</div>
	<section>
		<h1>자주 묻는 질문</h1>
		<hr>
		<!-- 라벨 태그는 input값의 id를 받아서 for로 활용할때 쓴다 -->
		<!-- ~ = 동위선택자 -->
		<br> <input type="checkbox" id="check_box1"><label
			for="check_box1">중고거래 운영정책</label>
		<ul class="list1">
			<li>가까운 이웃과의 만남이 따뜻함이 될 수 있도록 거래매너를 지켜요<br> 서로 존중하고 배려해요<br>
				존댓말로 솔직하게 대화해요<br> 모두의 시간은 소중해요<br> 약속은 반드시 지켜요<br>
				절대로 중간에 연락 끊기는 일이 없도록 해요<br> 언제나 따뜻한 인사로 시작하고 마무리해요<br> 늦은
				시간, 특히 모두가 자고 있는 새벽 시간에는 채팅을 자제해 주세요<br> 택배 거래보다는 만나서 직거래하기로 해요<br>
				이웃과의 거래는 만 14세 이상 부터 하기로 해요<br> 구매자, 판매자가 함께 노력하여 신뢰를 만들어요<br>
				구매할 때: 판매글을 꼼꼼히 읽고 질문해요<br> 미리 신중하게 고민한 뒤 판매자와 거래 약속을 잡아요<br>
				직거래할 땐 판매자에게 가까운 장소에서 만나요<br> 지나치게 가격을 깎지 않아요<br> 판매자의 가격
				책정을 존중해요<br> 가격제안불가 게시글에는 가격 할인을 요구하지 않아요<br> 물건 금액에 맞게
				현금을 미리 준비해요<br> 나눔을 받으면 따뜻한 감사인사로 마무리해요<br> 판매할 때: 직접 촬영한
				사진으로 판매글을 작성해요<br> 실제 물품 사진이 아닌 경우 오해가 생길 수 있어요<br> 물품에 대한
				설명을 자세히 써요<br> 특히, 주요 하자에 대한 내용은 꼭 명시하기로 해요<br> 판매하기 전에
				깨끗하게 세탁 또는 관리해요<br> 사용감이 있더라도 청결한 물건은 서로의 기분을 좋게 한답니다<br>
				거래 약속이 잡았다면 게시글의 상태를 '예약중'으로 바꿔요<br> 예약한 이웃이 있다면 그 분에게 판매해요<br>
				예약 파기는 서로의 신뢰를 무너뜨리는 행동이에요<br> 우동마켓에서 구매한 상품을 다시 팔아야 한다면, 반드시
				재판매 사유와 함께 적어주세요<br> 구매가격과 동일하거나 더 저렴한 가격으로만 판매할 수 있어요<br>


				직거래할 때: 누구나 찾기 쉽고 안전한 공공장소에서 만나요<br> 밝고 사람이 많은 장소에서 거래해요<br>
				서로의 집 앞까지 오더라도 집 밖에서 거래하기로 해요<br> 우리 동네 이웃 중 누군가는 남의 공간에 들어가는
				것을 꺼려할 수 있어요<br> 혹시 차를 타고 이동하셨나요? 먼저 차에서 내려 인사를 건네보세요<br>
				좁은 차보다는 넓은 공간에서 서로 물건 상태를 확인하고 거래해요<br> 판매중인 물건도 여전히 판매자의 소중한
				물품이에요<br> 구매자는 판매자를 배려하며 물건 상태를 조심히 확인해요<br> 물건의 정보는 판매자가
				누구보다 잘 알고 있어요<br> 구매자가 물품의 동작, 착용 등을 궁금해할 때, 판매자가 직접 시연하거나 착용하여
				구매자에게 자세하게 보여주면 좋아요<br> 높은 가격의 물품은 판매자, 구매자 모두 더 신중하게 거래해요<br>
				지금 이 거래가 상대방의 첫 중고거래일 수도 있어요<br> 중고거래에 익숙하지 않더라도 배려하며 거래해요<br>
				첫 기억을 따뜻하게 만들어주세요<br> 우리 주변에는 정말 다양한 이웃이 있어요<br> 언제나 나와 다른
				사람을 만나게 될 거예요<br> 성별, 나이, 종교, 혼인 여부, 인종, 장애 등 이웃의 다양성을 존중해 주세요<br>
				온라인으로 연결되어 만났지만, 동네 어디서나 마주칠 수 있는 이웃이라는 사실을 기억해요<br> 물품의 상태를
				꼼꼼하게 확인해주세요<br> 직접 만나 구매한 경우 사용감으로 인한 환불은 어려워요<br> 거래 관련
				모든 문제는 중고거래 게시판 거래 및 환불 정책을 따르고 있어요<br> 문제가 발생했을 때는 해당 정책을 확인해
				주세요<br> 비대면 거래할 때: 먼저, 우동마켓에서는 직거래를 권장하고 있어요! 부득이하게 택배 또는 문고리
				거래 등 비대면 거래가 필요하신 경우 아래 내용을 꼭 확인해주세요<br> 파손 가능성이 있는 물품은 되도록 직접
				만나서 거래해주세요<br> 만약, 직거래가 불가한 경우라면 파손되지 않도록 완충재 사용해주세요<br>
				판매 글에서 확인이 되지 않는 부분이 있다면 판매자에게 사진 촬영을 요청해 꼼꼼하게 확인해주세요<br> 따뜻한
				거래 문화를 만들기 위해서는 우리 모두의 관심과 노력이 필요해요<br> 우동마켓은 사용자들을 보호하기 위하여
				여러가지 정책을 운영하고 있어요<br> 아래의 운영 정책을 위반하였다고 생각되는 행위나 사용자를 발견하면 적극적인
				신고로 참여해 주세요<br> 판매 금지 물품을 판매할 수 없어요<br> 우동마켓은 현행법상 판매가
				허용되지 않는 불법 판매 및 유해 상품을 판매를 금지하고 있어요<br> 또한, 반려동물 판매 등 일부 품목에
				대해서는 우동마켓 운영 정책을 기준으로 판매를 제한하고 있어요<br> 의약품, 의료기기 : 의약품을 온라인을 통해
				판매하는 행위, 허가 받지 않은 개인이 의료기기를 판매하는 행위는 관련법 (약사법, 의료기기법) 위반으로 처벌받을 수
				있어요<br> 해외 직구 물품 판매 : 국내 적합성 평가를 받지 않은 기기를 판매하거나, 인터넷에 게시하는 행위는
				전파법 위반으로 처벌받을 수 있어요<br> 암표 매매 : 공연장, 경기장, 역, 나루터 정류장 그 밖에 요금을
				받고 입장하거나,승차/승선을 하는 곳에 표를 되파는 행위는 경범죄처벌법과 철도사업법 위반으로 처벌받을 수 있어요<br>
				나라미, 정부 지원 생필품, 지역상품권 : 정부 지원 물품을 재판매하면 관련법 위반으로 처벌 받을 수 있어요<br>
				그 외 우동마켓에서 판매할 수 없는 판매 금지 물품을 반드시 확인해주세요<br> 판매 금지 물품은 무료나눔,
				삽니다 게시글 또한 허용되지 않아요<br> 중고 거래와 관련 없는 정치적, 종교적 목적의 캠페인 및 홍보 게시글은
				허용되지 않아요<br> 우동마켓에서 판매 금지 물품을 게시하면 어떻게 되나요? 판매 금지 물품 관련법 위반은 불법
				행위로 관련 기관 혹은 다른 사용자의 신고로 처벌을 받을 수 있어요<br> 판매 금지 물품 게시로 신고를 받으면,
				해당 게시물은 미노출 처리가 되며 글을 게시한 사용자에게 주의/경고 메시지를 보내요<br> 운영 정책 위반으로
				우동마켓 이용이 한시적 또는 영구적으로 제한될 수 있어요<br> 우리는 지역 사회의 규범과 가치관을 존중해요<br>
				우동마켓에는 청소년을 포함한 다양한 연령대의 이웃이 있어요<br> 사용자를 보호하기 위해 선정적, 폭력적이거나
				사회 통념상 용인이 어려운 글 등은 제한됩니다<br> 생명 판매, 자살 암시, 살해/폭력 청탁 등 이웃에게
				불쾌감, 성적 수치심, 왜곡된 성의식, 공포감 등을 일으킬 수 있는 게시글 상대방의 닉네임을 공개 저격하거나 명예를
				훼손하는 게시글 사회 통념상 용인되기 어려운 모든 게시글 우동마켓에서 이런 글을 게시하면 어떻게 되나요? 사용자 보호를
				위하여 불건전한 내용이 포함된 게시글을 게시한 사용자는 우동마켓 이용이 한시적 혹은 영구적으로 제한돼요<br>
				긴급 상황 발생으로 수사기관이 협조를 요청할 경우, 우동마켓은 수사기관에 적극 협조하여 대응하고 있어요<br>
				이웃을 현혹하고 속이는 행위는 용인될 수 없어요<br> 우동마켓은 사용자 보호를 위해 다양한 사기 사례와 패턴을
				분석하고 신속히 대응하고 있어요<br> 동네 이웃을 속이고, 교묘한 수법으로 많은 사용자에게 피해를 주는 행위는
				제한됩니다<br> 타지역 인증을 위한 대리 인증 행위 : 대리 인증 과정에서 확보한 정보를 이용해 계정을 도용하여
				사기에 사용될 수 있어요<br> 선입금 요구, 외부 메신저 유도 등 사기 이용자들의 다양한 사기 행위 수수료
				지급하며 상품권 대리 구매를 요구하는 행위 계좌 번호나 전화 번호를 사진이나 이미지로 보내는 행위 그 외 이웃을 현혹하고
				속이려는 의도가 있는 모든 행위 우동마켓 이용 중 사기로 의심되는 행위가 발견되면 우동마켓에서 검토하고 막을 수 있도록
				반드시 신고해주세요! 우동마켓에서 사기 행위가 적발되면 어떻게 되나요? 사기 피해 확산을 막기 위해 사기 이용자의 계정을
				이용할 수 없도록 즉시 조치하고 있어요<br> 사기로 이용 정지된 사용자는 우동마켓을 다시 가입할 수 없어요<br>
				우동마켓은 사기 행위를 근절하고, 피해를 최소화 하기 위해 경찰 등 수사기관에 적극 협조하고 있어요<br> 얼굴이
				보이지 않아도 서로 존중하고 배려하며 이야기해요<br> 욕설이나 폭력적인 언행으로 상대방을 위협하거나, 성적인
				내용이 포함되어 불쾌감을 주는 행위는 제한하고 있어요<br> 욕설, 폭력적인 내용으로 상대를 위협하는 행위 상대를
				존중, 배려하지 않는 행위 (혐오, 비하 발언 등) 상대가 원하지 않는 채팅을 지속하는 행위 상대를 현혹하거나 속이는 행위
				불건전 만남, 마사지 혹은 성매매를 요구하는 행위 음란물, 청소년 유해물, 노골적인 성적 묘사 등 그 외 불쾌감, 성적
				수치심, 왜곡된 성의식을 불러 일으키는 모든 행위 우동마켓에서 이런 행위를 하면 어떻게 되나요? 이러한 내용의 채팅,
				댓글, 게시글 등을 작성하여 상대방의 신고가 누적되면 우동마켓 이용이 한시적 또는 영구적으로 제한돼요<br>
				특히, 불건전한 내용이 포함된 채팅을 보내는 사용자는 우동마켓에서 영구적으로 퇴출되며, 우동마켓을 다시는 가입하여 사용할
				수 없어요<br> 동네 이웃끼리 거래하는 공간이에요<br> 우동마켓은 동네 이웃과 서로 사용하지 않지만
				누군가에게는 쓸모 있고 좋은 물품을 저렴하게 판매하고 나누는 곳이에요<br> 이윤 추구를 목적으로 하는
				전문판매업자의 거래는 제한하고 있어요<br> 전문판매업자 유형을 확인해보세요<br> 광고, 홍보 관련
				게시글은 우동마켓 광고주 센터에 등록된 지역 광고를 사용해주세요<br> 이 외에도 서비스 이용이 제한될 수 있어요<br>
				위 운영 정책과 더불어 우동마켓을 정상적으로 사용하는 사용자 보호를 위해 사전 안내 없이 서비스 이용이 한시적 또는
				영구적으로 제한될 수 있어요<br> 외부 관계법령을 위반한 경우 앱 시스템 및 다른 사용자의 정상적인 앱 사용을
				방해하는 활동을 한 경우 범죄 행위(사기, 성범죄, 폭력 등) 기록이 있거나 확인되는 경우 믿을 수 있고 따뜻한 거래
				문화를 함께 만들어요! 따뜻한 거래 문화를 만들기 위해 우리 모두의 관심과 노력이 필요해요<br> 운영 정책은
				동네 이웃과 따뜻하고 믿을 수 있는 거래 문화를 만들고 우리 동네 선한 이웃들을 보호하기 위한 최소한의 장치에요<br>
				우동마켓은 앞으로도 여러분의 많은 관심과 애정, 의견을 바탕으로 중고거래 운영정책에 필요한 부분들을 채워나갈거에요<br>
				지금처럼 목소리를 내고, 적극적으로 참여해주세요<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box2"><label
			for="check_box2">자유게시판 가이드라인</label>
		<ul class="list2">
			<li>우동마켓은 동네 이웃 간의 연결을 도와 따뜻하고 활발한 교류가 있는 지역 사회를 만들기 위해 노력하고 있어요<br>
				<br>이웃을 향한 당신의 따뜻한 관심과 애정은 우동마켓의 가장 큰 동력이에요<br> <br>우동마켓을
				사용하는 이웃 모두가 커뮤니티 가이드라인을 지키며 따뜻한 지역 커뮤니티를 함께 만들어요<br> 혼자 힘으로는 할
				수 없지만, 우리가 함께라면 할 수 있어요!<br> 우동마켓은 신뢰, 존중, 윤리를 서비스의 중요한 가치라고
				생각해요<br> <br>우리는 이 가치를 지키기 위해 언제나 최선을 다할 거예요<br> 더
				가깝고 따뜻한 지역 커뮤니티를 위해 동참해주세요<br> <br> 신뢰 우리의 따뜻함은 신뢰로부터 나와요<br>
				우리는 가까운 이웃과의 만남이 따뜻함이 될 수 있도록 노력해요<br> <br> 우동마켓은 언제나
				사용자에게 귀 기울이고, 사용자를 위한 서비스를 제공하며 신뢰를 만들어요 우리는 함께 신뢰를 만들어요<br> 항상
				솔직하게 대화해요<br> 서로 배려하며, 약속은 반드시 지켜요<br> 자세하고 정확한 정보를 제공해요<br>
				따뜻한 매너를 함께 만들어요 누구나 찾기 쉽고 안전한 공공장소에서 만나요<br> 이런 행동은 할 수 없어요<br>
				판매 금지 물품 거래 중고거래 사기 등 이웃에게 손해를 입히는 행위 허위 정보 게시 등 이웃을 속이거나 기만하는 행위 존중
				우동마켓의 모든 사용자가 우리 동네 이웃이라는 걸 기억해주세요<br> 어떠한 상황에서도 우리는 이웃의 다양성을
				존중하고, 배려하기로 약속해요<br> 우동마켓은 누구나 존중받는 따뜻한 지역 커뮤니티를 지향하고 있어요<br>
				우리는 서로 존중해요<br> 성별, 나이, 종교, 혼인 여부, 인종, 장애 등 이웃의 다양성을 존중해요<br>
				우리 모두는 이 세상에 단 한 명 뿐인 소중한 사람이에요<br> 따뜻하게 배려해요<br> 온라인으로
				연결되어 있지만, 동네에서 마주쳤던 이웃일 수 있다는 사실을 기억해요<br> 개인 정보와 사생활은 소중해요<br>
				지나치게 묻거나 공개하지 않아요<br> 이런 행동은 할 수 없어요<br> 다양성을 존중하지 않는 차별 및
				혐오 거래 불이행 등 불쾌한 거래 경험을 주는 행위 욕설, 괴롭힘 등 불쾌감, 성적 수치심 등을 주는 행위 ﻿﻿﻿﻿이웃을
				배제하거나 소외시키는 행위 윤리 우리는 지역사회의 규범과 가치관을 존중해요<br> 지역사회에서 다양한 문제가
				발생할 수 있다는 것을 알고 있어요<br> 서비스 내에 우려되는 문제들은 우동마켓에 적극적으로 알리고, 함께
				해결해요<br> 우리는 윤리적으로 행동해요<br> 이웃이 어려움을 겪고 있다면, 기꺼이 도와요<br>
				따뜻한 지역 커뮤니티를 위해 도덕적으로 선하게 행동해요<br> 이웃의 안전이 염려된다면 즉시 가까운 경찰서나
				구조대에 연락해요<br> 지역사회 구성원인 우리는 서로가 서로에게 영향을 준다는 사실을 알고, 책임감 있게
				행동해요<br> 관련 법규를 준수해요<br> 이런 행동은 할 수 없어요<br> 생명의 소중함을
				스스로 버리는 행위(혹은 그에 준하는 모든 행위) 생명을 거래하는 행위 불법 행위 사회 통념상 용인되기 어려운 모든 행위
				따뜻한 지역 커뮤니티를 만들기 위해서는 우리 모두의 관심과 노력이 필요해요<br> 부적절한 게시글이나 사용자를
				발견하면 적극적으로 신고해주세요<br> 우동마켓의 가치를 훼손하는 행위에 대한 기술적 조치 및 신속한 신고처리를
				약속해요<br> 지금처럼 목소리를 내고, 적극적으로 참여해주세요<br> 우리가 함께 지켜나갈 신뢰,
				존중, 윤리 이 세가지 가치들을 누구나 볼 수 있도록 이 페이지도 계속해서 다듬고 업데이트할 거예요<br> 우리
				함께 소중한 가치들을 지켜내요<br> 서로 신뢰하고 존중하는 따뜻한 커뮤니티를 만들어가요<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box3"><label
			for="check_box3">사기 피싱을 방지하는 방법</label>
		<ul class="list3">
			<li>다음중 3가지 이상 해당된다면 사기꾼일 가능성이 매우 높다<br> 거래 내역이 없거나 최근 며칠
				이내 뿐이다<br>(커뮤니티라면 활동 내역도 참고) 전화번호가 없고 카카오톡 등 메신저로 연락을 유도한다<br>
				어디서 직거래 가능한지 지역이 없거나 택배 거래만을 요구한다<br> 시세보다 20~30% 이상 저렴하다<br>
				선불 폰이다<br> 가상 계좌이다<br> (커뮤니티일 경우) 아이디 실명과 예금주의 이름이 일치하지
				않는다<br> 다음의 경우는 하나라도 해당되면 명백하게 사기꾼이다<br> 사기꾼 조회 사이트(더치트,
				노스캠, 경찰청 사이버안전국) 검색에서 이름, 계좌, 전화번호로 사기 신고 내역이 조회된다<br> 판매자가
				결제하라고 보내준 안전거래 사이트가 네이버에서 검색을 통해 찾아봐도 나오지 않는다<br> 네이버페이 안전결제 시
				예금주가 '네이버페이'가 아니다<br> 인증 사진이 퍼온 사진이다<br> 도용된 계정이다<br>
				환불을 요구할때나 가격의 단위가 맞지 않아 출금이 안 된다는 등의 이유를 대며 2번, 3번 재차 입금을 요구한다<br>
				수수료 또는 기타 이유로 재차 입금을 요구한다<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box4"><label
			for="check_box4">우동 알바 운영정책</label>
		<ul class="list4">
			<li>[근로시간을 확인해주세요] 기본 근로 시간은 일 8시간+휴게시간 1시간이에요<br> 야근을 하더라도
				근로시간은 12시간을 초과할 수 없어요<br> 또한 주 52시간을 초과할 수 없어요<br> [주휴수당을
				확인해주세요] 주휴수당은 주 15시간 미만 근로자(단기 근로자)에게는 발생하지 않아요<br> 1주일 동안 소정의
				근로일수를 개근한 노동자에게 '1주일에 평균 1회 이상'의 유급휴일을 주어야 해요<br> 이 유급휴일에 받는 것을
				주휴수당이라고 해요<br> 주 40시간을 근무하게 되면 48시간을 근무한 기준으로 수당이 지급되어야 해요<br>
				만약 주 20시간을 근무했다고 한다면 24시간을 근무한 기준으로 수당이 지급되어야 해요<br> [연차 부여 기준을
				확인해주세요] 연차는 주 15시간 미만 근로자(단기 근로자)에게는 발생하지 않아요<br> 입사 1년 미만 근로자의
				연차 유급휴가 발생 기준은 1개월 개근 시 1일의 유급휴가를 부여해야 해요<br> 기존 1개월 개근 시 발생되는
				1일의 연차 유급휴가의 소멸 시점은 발생일로부터 1년이에요<br> 그 안에 사용하실 수 있어요<br>
				입사 1년이 초과한 경우 15개의 연차가 발생해요<br> 입사 1년 후 매 2년마다 1일을 가산한 연차가 발생해요<br>
				[괴롭힘은 없는지 확인해주세요] (직장 내 괴롭힘의 금지) 사용자 또는 근로자는 직장에서의 지위 또는 관계 등의 우위를
				이용하여 업무상 적정범위를 넘어 다른 근로자에게 신체적ㆍ정신적 고통을 주거나 근무환경을 악화시키는 행위(이하 "직장 내
				괴롭힘")를 금지해요<br> [성희롱은 없는지 확인해주세요] “직장 내 성희롱”이란 사업주·상급자 또는 근로자가
				직장에서의 지위를 이용하거나 업무와 관련하여 다른 근로자에게 성적 언동 등으로 성적 굴욕감 또는 혐오감을 느끼게 하거나
				성적 언동 또는 그 밖의 요구 등에 따르지 아니하였다는 이유로 근로조건 및 고용에서 불이익을 주는 것을 말해요<br></li>
		</ul>
		<hr>
	</section>
</body>
</html>