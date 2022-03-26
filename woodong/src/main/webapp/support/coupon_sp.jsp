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
			for="check_box1">Q.쿠폰은 어떻게 사용하는 건가요?</label>
		<ul class="list1">
			<li>쿠폰을 받았다면 쿠폰을 받으면 채팅으로 안내 메시지가 와요<br> 받은 쿠폰을 가게에 보여주고,
				해당 서비스를 받아요<br> 직접 [사용확인] 버튼을 눌러도 되고, 가게 사장님께 부탁해도 됩니다<br>
				사용완료 처리를 하면 해당 쿠폰은 더 이상 사용할 수 없어요<br></li>
		</ul>
		<hr>

		<br> <input type="checkbox" id="check_box2"><label
			for="check_box2">Q.나눔의 날이 궁금해요!</label>
		<ul class="list2">
			<li>매월 32일은 우동마켓 이웃과 추억을 함께 나누는 '나눔의 날'입니다<br> 우리는 어떤 마음으로
				물건을 나눔 할까요? 옷 한 벌, 장난감 하나에도 그 물건에 담긴 따뜻한 추억이 있답니다<br> 아이가 커버려
				더는 가지고 놀지 않는 모빌, 그 모빌 하나에는 부모와 아이의 추억이 고스란히 담겨 있지 않을까요? 매월 11일, 1+1,
				나누면 2배가 되는 나눔의 날에 참여해 보세요 :) 매달 따뜻한 나눔을 실천한 이웃 중 11명을 뽑아 따뜻한 추억을 영원히
				간직할 수 있는 선물을 드립니다<br> 나눔의 날에 참여하기 전에 아래 내용을 읽어 보세요 :) 판매할 가치가
				없는 물건은 나눔 하지 않기로 해요<br> 자신의 판매목록을 홍보하는 나눔은 하지 않기로 해요<br>
				(예시: 제 상점 구경하고 가세요~) 조건부 나눔은 우동마켓 운영정책에 어긋나기 때문에 제재를 받을 수 있습니다<br>
				(예시: 제 상품 사시면 무료로 드려요~) 나눔 받은 것은 절대! 되팔지 말아 주세요<br> 한 사람이 여러 개의
				나눔을 받지 않기로 해요<br> 나눔 받은 사람은 꼭 다른 사람에게 나눔을 실천하기로 해요<br> 나눔은
				선착순이 아니에요<br> 따뜻한 나눔을 하는 이웃의 결정을 존중해 주세요<br> 나눔 글을 올릴 때 나눔
				조건을 정할 수 있어요! 빛나는 센스를 보여 주세요~ (예시: 예비 엄마에게 드려요~, 우리 아이처럼 잘 물어 뜯는
				아이에게 주고 싶어요~) 나눔을 받으면 거래후기를 꼭 남겨주는 센스를 보여 주세요<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box3"><label
			for="check_box3">Q.서로간의 매너</label>
		<ul class="list3">
			<li>우동마켓에서 따뜻한 경험을 함께 나눠요😊 여러분의 작은 친절이 우동 이웃에게 큰 감동을 줄 수 있어요<br>
				우동마켓의 모든 사용자가 우리 동네의 이웃이라는 점을 기억해 주세요<br> 여러분 근처의 이웃에게 따뜻한 배려를
				베풀어 주세요<br> 기본 매너 기본적으로 지켜야 하는 매너에는 무엇이 있을까요? 기본 매너인 만큼 꼭 지켜 주실
				거라고 믿어요 :) • 서로 존중해요<br> 우리 존댓말로 대화해요<br> • 모두의 시간은 소중합니다<br>
				시간 약속을 꼭 지켜주세요<br> • 절대로 중간에 연락 끊기는 일이 없도록 해요<br> (잠수는 절대
				안 돼요!) • 따뜻한 감사 인사로 마무리를 지어요<br> • 어떤 상황에서도 욕설, 비방, 명예훼손 등의 언행은
				지양해 주세요<br> • 늦은 시간 채팅은 부담스러울 수 있어요<br> 특히 새벽 시간에는 채팅을 자제해
				주세요<br> • 택배 거래는 부득이한 경우에만 요청하시고 가능한 한 직거래로 해주세요<br> 구매자
				매너 이웃의 상품을 구매하는 구매자로서 따뜻함을 나눠주세요:) • 신중하게 고민한 뒤 판매자와 확실하게 거래 약속을 잡아요<br>
				• 질문하기 전에 판매글을 꼼꼼히 읽어 주세요<br> • 지나치게 가격을 깎지 말아 주세요<br>
				가격제안 할 수 있는 경우에만 가격제안 해주세요<br> (정말 구매할 마음이 있을 때만 해주실 거죠?) •
				직거래할 땐 판매자에게 가까운 장소에서 만나요<br> • 물건 금액에 맞게 현금을 미리 준비해 주세요<br>
				• 무료나눔을 받은 경우 감사 인사로 마무리해 주세요<br> 판매자 매너 개인 간의 거래인 만큼 신뢰할 수 있는
				매너를 보여주세요:) • 직접 촬영한 사진으로 판매글을 작성해 주세요<br> • 물품에 대한 설명을 자세하게
				써주세요<br> 특히, 주요 하자에 대한 내용은 꼭 명시해 주세요<br> (명시되지 않은 하자는 환불
				사유가 돼요<br>) • 판매하기 전에 깨끗하게 세탁 또는 관리해 주세요<br> 사용감이 있더라도 청결한
				물건은 서로의 기분을 좋게 한답니다<br> • 물품의 시세를 알아보고 가격을 정해주세요<br> 판매확률을
				높일 수 있어요<br> • 거래 약속이 정해지면 게시글의 상태를 '예약중'으로 바꿔주세요<br> •
				예약한 분이 있다면 그분에게 판매해 주세요<br> • 우동마켓에서 구매한 상품을 불가피한 사정 때문에 재판매하면
				재판매하는 이유와 함께 구매한 가격과 동일하거나 더 싼 가격에 판매해 주세요<br> 커뮤니티 매너 따뜻한 동네생활
				커뮤니티를 만들기 위한 약속을 지켜주세요<br> :) • 항상 솔직하게 대화해요<br> • 서로
				배려하며, 약속을 잘 지켜요<br> • 이웃들이 잘 이해할 수 있도록 자세하고 정확한 정보를 제공해요<br>
				• 동네생활은 우리 동네 근처 이웃을 위한 공간이에요<br> 동네생활과 관련된 글을 작성해 주세요<br>
				• 광고/홍보 등의 게시글은 지역광고를 이용해주세요<br> • 중고거래는 중고거래 게시판을 이용해 주세요<br>
				• 친분을 과시하지 않기로 해요<br> 혹시라도 다른 이웃들이 소외되지 않도록 도와주세요<br> •
				남녀노소 다양한 이웃이 함께하는 공간이에요<br> 누군가에게 불편할 수 있는 글들은 올리지 않기로 해요<br></li>
		</ul>
		<hr>
		<br> <input type="checkbox" id="check_box4"><label
			for="check_box4">Q.해외에서도 우동마켓을 이용하고 싶어요!</label>
		<ul class="list4">
			<li>우동마켓은 한국뿐만 아니라 미국, 캐나다, 영국, 일본의 일부 지역에서 이용이 가능해요<br> 혹시
				이 국가에서 거주중이라면 현지의 이웃들에게도 우동마켓의 따뜻한 중고거래 경험을 나누어주세요! 해외에서 우동마켓을 이용하려면
				그 국가의 계정을 만들어야 해요<br> 다른 국가에서 만드는 계정은 한국과 연결되지 않은 새로운 계정이에요<br>
				계정을 만들기 위해서는 그 국가의 휴대폰 번호가 필요해요<br> 계정을 만드는 방법은 한국 우동마켓의 계정을
				만드는 방법과 동일해요<br> 먼저 아래의 링크를 눌러서 이용을 원하는 국가로 우동마켓 설정을 변경해보세요!<br>
			</li>
		</ul>
		<hr>
	</section>
</body>
</html>