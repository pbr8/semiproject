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
	color: #ff0000;
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
			for="check_box1">Q.직거래 잘하는 법</label>
		<ul class="list1">
			<li>우동마켓에서는 우리 동네 근처의 이웃과 거래하는 만큼 직거래하는 것을 권장하고 있어요<br> :)
				우동마켓에서 직거래를 잘한다는 건 이웃과 거래를 통해 따뜻하고 건강한 경험을 주고 받는 걸 의미해요<br>
				직거래를 잘하기 위해서 지켜야할 점은 무엇이 있을까요? 공공장소에서 만나 거래해요! 미성년자라면, 반드시 보호자와 함께
				해주세요<br> 모두의 시간은 소중해요<br> 약속 시간을 꼭 지켜주세요! 만나서 가격을 무리하게 깎지
				말아주세요<br> 거래 후에는 따뜻한 감사 인사로 마무리해요😊 우동마켓에서의 거래 경험이 모든 이웃에게 소중한
				경험으로 남기를 바라요<br> 함께 건강하고 따뜻한 직거래 문화를 만들어가요 🥰
			</li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box2"><label
			for="check_box2">Q.거래 상대방이 거래 약속을 안 지켰어요! 어떻게 해야 하나요?</label>
		<ul class="list2">
			<li>거래 상대방이 거래 약속을 지키지 않아 많이 황당하셨을 것 같아요<br> :( 거래 약속을 소중하게
				생각하지 않는 상대방에게 비매너 평가를 남겨 주세요<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box3"><label
			for="check_box3">Q.판매금지 물품</label>
		<ul class="list3">
			<li>품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품) 주류(무알콜 주류 포함),
				담배, 전자담배, 모의총포 및 그 부속품 일체 (ex: 라이터, 비비탄 총알 등 청소년 유해물건) 경유, LPG, 휘발유
				등의 유류 거래 반려동물, 생명이 있는 동물·곤충 (무료분양, 열대어 포함) 한약∙의약품 ∙ 의료기기∙마약류 (청소년
				유해약물∙유해화학물질) 반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글 수제 음식물∙건강기능식품
				: 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매할 수 있음) 유통기한이 지난 제품,
				포장이 훼손되거나 개봉된 식품 도수 있는 안경∙선글라스 (온라인 판매 불법) 콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)
				반복/다량 판매하는 핸드메이드 제품 화장품 샘플 (온라인 판매 불법) 음란물 (청소년 유해 매체물) 촬영 여부를 상대방이
				알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법 카메라 등) 성생활용품 개인정보 (게임 계정, 추천인
				계정 포함) 조건부 무료나눔 렌탈 제품 헌혈증 (무료나눔만 가능) 초대권 (무료로 받은 초대권을 유료로 판매하는 경우 /
				무료나눔만 가능) 군용품∙군마트용품∙경찰용품∙도검∙화약류∙분사기∙전자충격기∙석궁∙활 (안전확인∙안전인증표시 없는 전기용품
				및 단전지 또는 공산품) USD 1000달러 이상의 외환 거래나 매매차익을 목적으로 하는 반복적인 외환 거래 (매매차익을
				목적으로 하지 않는 1000달러 미만의 외환 거래는 허용) 나라미, 정부 지원 생필품, 지역상품권, 문화누리카드 등 법률에
				의해 재판매 할 수 없는 물품 종량제봉투 통신사 데이터, 인터넷 상품 반입한 날로부터 1년 이상 경과하지 않은 전파인증이
				면제된 해외직구 전자제품을 판매하는 행위 낚시로 포획한 수산물 거래 행위 암표매매 행위 종자 (삽수,어린묘목 등) 100만
				원 이상 금 제품 (골드바, 금괴, 금으로 제작된 목걸이, 팔찌, 귀걸이 등) 이외 법률을 위반하는 모든 물품 우동마켓
				광고주센터에 등록되지 않은 모든 홍보/광고</li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box4"><label
			for="check_box4">Q.거래 및 환불 정책</label>
		<ul class="list4">
			<li>우동마켓의 모든 거래는 기본적으로 거래 당사자들끼리 자유롭게 진행할 수 있어요<br> 가급적
				우동마켓은 거래에 개입하지 않아요<br> 그래서 거래 중에 이견이 있어도 거래 당사자들끼리 직접 대화하여 해결하는
				것을 권장해요<br> 하지만 대화로 해결하기 어렵다면 우동마켓은 아래와 같은 정책을 따르고 있어요<br>
				거래 중에 분쟁이 발생하더라도 우동마켓의 기본매너를 지키는 건 잊지 말아 주세요<br> 휴대폰 너머 나와 똑같은
				사람이 있다는 것을 기억해 주세요<br> :) 🔸 판매자에게는 이런 권리가 있어요<br> 판매자는
				우동마켓의 소중한 주민이자 여러분의 이웃이에요<br> 우리는 모두 판매자이면서 구매자예요<br> 구매자의
				무리한 요구는 거절할 권리가 있어요<br> 매너없는 이야기에 답하지 않을 권리도 있어요<br> 무리한
				요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의 및 제안하기'를 통해서 알려주세요<br>
				환불 관련 문제가 생겼을 때, 판매자의 실수나 잘못이 없는 다음과 같은 상황이라면 거부할 권리가 있습니다<br>
				단순한 변심으로 인한 환불 요청 객관적인 정보가 아닌 주관적인 판단에 의한 환불 요청(예: M사이즈 명시된 제품을 구매
				후, 맞지 않는다고 환불 요청) 판매글에 명시한 내용을 몰랐다는 이유로 환불 요청 거래 후 오랜 기간이 지난 후에 환불
				요청(예: 구매 후 한 달이 지난 시점에서 환불 요청) 위 제시한 상황 외에 명백한 잘못이 구매자에게 있는 경우 🔸
				판매자에게는 이런 의무도 있어요<br> 우리는 모두 우동마켓의 주민이에요<br> 우동마켓의 거래매너를
				지켜주세요<br> 판매를 원활히 하기 위해서는 자세한 설명과 사진을 첨부해주세요<br> 신경 쓰이는
				부분이 있다면 꼭 사진을 찍거나 설명에 적어주세요<br> 나에게는 익숙하고 당연한 부분도 구매자에게는 처음 보는
				생소한 물건이라는 점을 기억해주세요<br> 거래 약속 후 취소하는 것을 지양해주세요<br> 내 시간이
				소중한 만큼, 상대방의 시간도 소중히 여겨주세요<br> 판매자의 잘못이 명백한 다음과 같은 상황에서는 환불을
				해주셔야 해요<br> 판매글(사진, 설명, 채팅 내용 등)과 실제 물건이 객관적으로 상이한 경우 판매 물품에 주요
				하자가 있음에도 불구하고 판매글에 명확히 밝히지 않고 판매한 경우<br> 판매자가 배송한 물품이 배송 과정에서
				분실된 경우(택배 배송의 경우 택배사 잘못으로 물품이 분실된 경우 판매자는 택배사로부터 보상 가능) (환불할 물품을
				양도받으면 거래대금을 구매자에게 바로 보내주세요<br> 입금을 미룬다면 '거래 불이행' 사유로 이용 제한될 수
				있습니다<br>) 🔸 구매자에게는 이런 권리가 있어요<br> 구매자 또한, 우동마켓의 소중한 주민이자
				여러분의 이웃이에요<br> 판매자의 무리한 요구는 거절할 권리가 있어요<br> 매너없는 이야기에 답하지
				않을 권리도 있어요<br> 무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기',
				'문의 및 제안하기'를 통해서 알려주세요<br> 거래 관련 문제가 생겼을 때, 판매자의 의무에 명시된 상황에
				해당하면 환불을 요구할 권리가 있어요<br> 🔸 구매자에게는 이런 의무도 있어요<br> 우리는 모두
				우동마켓의 주민이에요<br> 우동마켓의 거래매너를 지켜주세요<br> 채팅을 시작할 때는 가벼운 인사로
				건네보는 건 어떨까요? 구매를 원활히 하기 위해서 구매 의사가 명확한 경우에만 약속을 잡아주세요<br> 거래 약속
				후 취소하는 것은 판매자와 구매자 모두에게 손해예요<br> 내 시간이 소중한 만큼, 상대방의 시간도 소중히
				여겨주세요<br> 거래 관련 문제가 생겼다고 해서 거래와 관련 없는 욕설/비방을 삼가세요<br> 거래와
				관련 없는 욕설/비방 등의 비매너 행위를 할 경우, 제재당할 수 있어요<br> 물건을 받고 돈을 지불하지
				않았다면, 물건의 값은 1일 이내에 지급해주세요<br> 입금을 미룬다면 '거래 불이행' 사유로 이용 제한될 수
				있습니다<br> 구매하신 물품은 당일날 꼼꼼하게 확인해주세요<br> 구매 후 오랜 시간이 지난 다음
				문제가 발생한 경우 문제 해결이 어려워요<br> 🔸 예약금/계약금은 보호받기 어려워요<br> 물건을
				양도하기 전이라면 구매자와 판매자는 거래를 취소할 수 있어요 다만, 예약금/계약금 관련된 규정은 없으나 상호 합의에 따른
				예약금/계약금 선입금 진행시 구매자의 사정으로 거래 약속이 취소된다면 예약금은 보호받지 못할 수도 있어요<br>
				민법상 구두계약이라 하더라도 개인거래상의 계약이 성립될 수 있으며, 구매자의 사정으로 계약이 파기되면 계약금을 보호받지
				못할 수 있기 때문에, 가급적 계약금/예약금을 선입금하지 않도록 주의해주세요<br> 🔸 미성년자와의 거래시
				거래가 취소될 수 있어요<br> 민법상 미성년자가 법률행위를 하기 위해서는 법정 대리인의 동의서를 받아야 해요<br>
				개별적으로 거래하는 경우에는 민법상 거래가 무효 처리될 수 있어요<br> 다만, 미성년자가 속임수로 동의되었다고
				믿게 한 경우에는 그 행위를 취소할 수 없어요<br> 🔸 우동마켓은 이런 정책으로 운영됩니다<br>

				우동마켓은 중고 거래를 위한 서비스를 운영정책에 따라 제공하고 거래에 대한 모든 책임은 거래 당사자에게 있어요<br>
				따라서 거래 관련 문제가 발생했을 경우 구매자와 판매자가 직접 합의하여 해결하는 것을 기본으로 합니다<br>
				하지만 합의가 어려운 경우 위에 명시한 권리 및 의무에 따라 구매자나 판매자를 이용제재 할 수 있고, 분쟁이 해결된
				경우에만 이용제재를 해제합니다<br> 구매자와 판매자 모두 분쟁을 해결하는 과정에서 상대방에게
				비하/조롱/모욕/반말 등의 언행을 했다면 비매너 경고 또는 이용제재 받을 수 있습니다<br> 분쟁이 발생했으나
				우동마켓 정책상 구매자 또는 판매자에게 환불을 강제하거나, 이용제재 하기 어려운 상황이 있을 수 있습니다<br>
				이 경우 과학기술정보통신부 산하 한국인터넷진흥원 내에 설치된 전자문서・전자거래분쟁조정위원회에 조정 신청을 하여 분쟁 조정을
				받아 보실 수 있습니다<br> <전자문서·전자거래분쟁조정위원회 안내>
				전자문서·전자거래분쟁조정위원회는 「전자문서 및 전자거래기본법」 제32조에 따라 설립되었으며, 분쟁 조정 신청을 받은
				날로부터 45일 이내에 조정안을 작성하여 분쟁 조정 당 사자에게 권고하며, 권고를 받은 당사자는 권고를 받은 날로부터
				15일 이내에 조정안에 대한 수락 여부를 위원회에 통지하여야 합니다<br>
				조정안에 대하여 양 당사자가 수락한 경우 조정이 성립되며, 이때의 조정조서는 「민사소송법」에 따른 재판상 화해와 동일한
				효력을 갖습니다<br>

				분쟁 조정 신청은 판매자·구매자 구분 없이 누구나 신청 가능 하지만, 어느 일방이 조정에 불응할 경우 조정은 성립되지
				않습니다<br>
				<br></li>
		</ul>
		<hr>
	</section>
</body>
</html>