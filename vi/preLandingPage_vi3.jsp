﻿<%@page import="java.lang.reflect.Field"%>
<%@page import="cknb.qrjoy.iqr.model.iqrDetModel"%>
<%@page import="cknb.qrjoy.iqr.model.iqrModel"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Enumeration<String> attributeNames = request.getAttributeNames();
%>
<%
  String appGubun = request.getParameter("app_gubun");
  String appClass = "";
  if ("1".equals(appGubun)) {
    appClass = "ht";
  } else if ("2".equals(appGubun)) {
    appClass = "cop";
  } else if ("20".equals(appGubun)) {
    appClass = "gl";
  } else {
	appClass = "ht";
  }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>preLandingPage_vi3</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	vertical-align: baseline;
	font-size: 10px;
	font-weight: 500;
	box-sizing: border-box;
	list-style: none;
	text-decoration: none;
	scroll-behavior: smooth;
    background: transparent;
	font-family: 'Inter', sans-serif;
	color : black;
	letter-spacing: -0.9px;
	-webkit-tap-highlight-color: transparent;
}

:root {
	--vh : 100%;
}

:focus {
  outline: none;
}

html {
	overflow-x: hidden;
	overscroll-behavior: contain; /* 또는 none */
}

body {
	 overscroll-behavior: contain; /* 또는 none */
}

img {
	width: 100%;
}

/* 제목 컴포넌트 */
h2 {
	font-size: 1.4rem;
	font-weight: 600;
	/* font-size: 3.7rem; */
}

/* box-row 컴포넌트 */
.box-row {
	width: 100%;
	display : flex;
	justify-content: flex-start;
	align-items: center;
	flex-wrap: wrap;
	row-gap: 0.5rem;
    column-gap: 1rem;
}

/* 버튼 컴포넌트 */
.btn {
	font-size: 1.2rem;
	border : 0.1rem solid #BCBCBC;
	border-radius: 0.6rem;
	background: white;
	cursor: pointer;
	padding: 0.55rem 4%;
	overflow: hidden; 
	text-overflow: ellipsis;
	white-space: nowrap; 
}

.wrap {
	position: relative;
	background-color: white;
	width: 100%;
 	/* height: calc(var(--vh) * 100); /* 안전한 높이 사용 */
	height: 100vh;
	min-height: 56.8rem;
}

.wrap::before {
	content: '';
	position: absolute;
	top : 0;
	left : 0;
	right : 0;
	bottom : 0;
	background: url('./images/img-landing.jpg') no-repeat center/cover;
	background-size: 100% 100%;
	filter: grayscale(100%) brightness(50%);
	-webkit-filter: grayscale(100%) brightness(50%);
	opacity: 0.05;
  	z-index: 0;
}

.wrap1::before {
	opacity: 0.08;
}
.wrap2::before {
	opacity: 0.11;
}
.wrap3::before {
	opacity: 0.14;
}
.wrap4::before {
	opacity: 0.17;
}
.wrap5::before {
	opacity: 0.2;
}


header {
	width: 100%;
	padding : 2rem 2rem 0 2rem;
	display : flex;
	justify-content: flex-start;
	align-items: center;
	position: relative;
	z-index: 10;
}
main {
	position: relative;
	width: 100%;
	padding : 0 2rem 2rem 2rem;
	display : flex;
    justify-content: center;
	align-content: center;
	flex-direction: column;
	height: calc(100% - 15.8rem);
	gap : 1rem;
	z-index: 10;
}

main h1 {
	text-align: center;
	/* font-size: 5.3vw; */
	font-size: 2rem;
	font-weight: 600;
}

main h1 strong {
	/* font-size: 6.9vw; */
	font-size: 2.6rem;
	font-weight: bold;
}

main h1 p {
	font-size: 1.4rem;
	font-weight: bold;
}

main h1 .tit {
	font-size: 1.8rem;
	font-weight: bold;
}

main .contents  {
	display : flex;
	justify-content: center;
	align-items: flex-start;
	flex-direction: column;
	gap : 0.5rem;
}

main .contents-gender {
	justify-content: center;
	flex-direction: row;
	gap : 3rem;
}

main .contents-gender .gender {
	width: 8rem;
	max-width: 21.6vw;
	height: 8rem;
	max-height: 21.6vw;
	cursor: pointer;
	font-size: unset;
	border : unset;
	border-radius: unset;
	padding : unset;
	overflow: unset;
	text-overflow: unset;
	white-space: unset;
}

main .contents-gender .gender:active {
	filter : brightness(0.95);
}

main .contents-gender .gender.img-men {
	background: url('./images/img-men-vi.svg') no-repeat center/contain;
}

main .contents-gender .gender.img-women {
	background: url('./images/img-women-vi.svg') no-repeat center/contain;
}

.complete-btn {
	width: 100%;
	height: 5rem;
	font-size: 1.4rem;
	font-weight: bold;
	color: white;
	background-color: #368AFE;
	cursor: pointer;
	display: inline-flex;
    align-items: center;
    justify-content: center;
	position: relative;
	z-index: 10;
}

.complete-btn:active {
	filter : brightness(0.95);
}

.complete-btn.change {
	animation: pulse-shadow-cop 2s infinite; 
}

@keyframes pulse-shadow-cop {
  0%, 100% {
    box-shadow: none;
  }
  50% {
    box-shadow: 0 0 3rem rgba(3, 113, 238, 0.75);
  }
}

.count-wrap {
	display : flex;
	justify-content: center;
	align-items: center;
	gap : 0.5rem;
}

.br {
	display : block;
}

.br.none {
	display : none;
}

.count-wrap span {
	font-size: 1.5rem;
}

.count-wrap span:first-of-type {
	font-size: 2.6rem;
	font-weight: 800;
	color : #368AFE;
}

.ic-arrowDown {
	content: '';
	bottom : 0.5rem;
	left : 50%;
	position: absolute;
	display : inline-flex;
	justify-self: center;
	align-items: center;
	width: 2.7rem;
	height: 2.9rem;
	animation: scaleUpDown 2s infinite; 
}

@keyframes scaleUpDown {
	0%, 100% {
		transform: scale(1);
	}
	50% {
		transform: scale(1.2);
	}
}

/* 애니메이션 [s] */
	.step {
		position: relative;
		width: 100%;
		height: 6.1rem;
	}
	.step .stepbox {
		width: 6.8rem;
		height: 6.1rem;
		background: url('./images/img-charAnimation.png');
		border-radius: 0;
		position: absolute;
		left: 0%;
		/* left: calc(100% - 6.4rem); */
		top: 10%;
		animation: ani 1s steps(4, start) infinite;
		transition: left 1s linear;
	}
	.step .img-flag {
		position: absolute;
		width: 3rem;
		height: 4.5rem;
		right: 0.4rem;
		bottom: 0;
	}

	@keyframes ani {
	0% {
		background-position: 0 0;
	}
	100% {
		background-position: -27.2rem 0;
	}
	}
/* 애니메이션 [e] */

/* 프로그래스바 [s] */
.progressbar-wrap {
  width: 100%;
  position: relative;
  overflow: hidden;
  height: 0.4rem;
  .ing-bar {
    width: 0%;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    height: 100%;
    background: #000A78;
    z-index: 3;
	transition: width 1s linear;
  }
  .leftover-bar {
    width: 100%;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    height: 100%;
    background: #BCBCBC;
    z-index: 2;
  }
}
/* 프로그래스바 [e] */

/* 모달 팝업 [s] */
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color:rgba(0,0,0,.3);
  backdrop-filter: blur(1px);
  z-index: 20;
}

.modal .modal-popup {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 68.5%;
	height: 36%;
    padding: 2rem;
    background: white;
    border-radius: 0.8rem;
	overflow: hidden;
    gap: 1rem;
	box-shadow: 1px 1px 8px 0px;
}

.modal .modal-popup .box {
	display : flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-around;
	height: 100%;
}

.modal .modal-popup .box .ic-warning {
	width: 100%;
	height: 100%;
	background: url('./images/img-popupChar.png');
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
}

.modal .modal-popup .box .txt {
	/* font-size: 4.2vw; */
	font-size: 1.6rem;
	font-weight: 600;
	color : #000; 
}

.modal .modal-popup .box .txt .ic-handUp {
	display : inline-flex;
	justify-content: center;
	align-items: center;
	width: 1.6rem;
	height: 1.6rem;
	background: url('./images/ic-handUp.png');
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
	margin-left : 0.5rem;
}

.modal .modal-popup .box .txt:last-of-type {
	/* font-size: 3.7vw; */
	font-size: 1.4rem;
	margin-top : 0.5rem;
} 
/* 모달 팝업 [e] */

/* cop 전용 [s] */
.cop header .img-logo {
	background: url('./images/img-logo.svg') no-repeat center/cover;
	width: 10.7rem;
	height: 2.3rem;
	/* max-width: 31.5% */
}

.cop .btn.active {
	background-color: #368afe;
	color : white;
	border : 0.1rem solid #368afe;
}

.cop .btn.active {
	background-color: #368afe;
	color : white;
	border : 0.1rem solid #368afe;
}

.cop .img-men.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-men-active-cop-vi.svg') no-repeat center/cover !important;
}

.cop .img-women.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-women-active-cop-vi.svg') no-repeat center/cover !important;
}

.cop .step [class*=img-talk] {
	position: absolute;
	background: url('./images/img-wait-cop-vi.png') no-repeat center/cover;
	width: 17.1rem;
	height: 4.7rem;
	left : 5.2rem;
	top: -2rem;
}

.cop .img-talk1 {
	background: url('./images/img-info-cop-vi.png') no-repeat center/cover !important;
	width: 15.8rem !important;
	left : 5.1rem !important;
}
.cop .img-talk2 {
	background: url('./images/img-data-cop-vi.png') no-repeat center/cover !important;
	width: 16rem !important;
	left : 5.4rem !important;
}
.cop .img-talk3 {
	background: url('./images/img-almost-cop-vi.png') no-repeat center/cover !important;
	width: 14.4rem !important;
	height: 4.8rem !important;
	left : -13rem !important;
}
.cop .img-talk4 {
	background: url('./images/img-complete-cop-vi.png') no-repeat center/cover !important;
	width: 15.9rem !important;
	height: 4.7rem !important;
	left : -14.4rem !important;
}
.cop .step .img-flag {
	background: url('./images/img-flag.png') no-repeat center/cover !important;
	position: absolute !important;
	width: 3rem !important;
	height: 4.5rem !important;
	right: 0.4rem !important;
	bottom: 0 !important;
}

.cop .modal .modal-popup .box .check-btn {
	/* font-size: 4vw;  */
	font-size: 1.6rem;	
	font-weight: 600;
	color : white; 
	width: 100%;
	padding : 0.75rem 0.25rem;
	background-color: #368AFE;
	border-radius: 0.8rem;
	cursor: pointer;
	transition: all 0.2s;
}

.cop .ic-arrowDown {
	background: url('./images/ic-arrowDown-cop.png') no-repeat center/cover;
}
/* cop 전용 [e] */

/* ht 전용 [s] */
.ht header .img-logo {
	background: url('./images/img-logo-ht.svg') no-repeat center/cover;
	width: 10.7rem;
	height: 2.3rem;
	/* max-width: 31.5% */
}

.ht .btn.active {
	background-color: #000;
	color : white;
	border : 0.1rem solid #000;
}

.ht .btn.active {
	background-color: #000;
	color : white;
	border : 0.1rem solid #000;
}

.ht .img-men.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-men-active-ht-vi.svg') no-repeat center/cover !important;
}

.ht .img-women.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-women-active-ht-vi.svg') no-repeat center/cover !important;
}

.ht .step [class*=img-talk] {
	position: absolute;
	background: url('./images/img-wait-ht-vi.png') no-repeat center/cover;
	width: 17.1rem;
	height: 4.7rem;
	left : 5.2rem;
	top: -2rem;
}

.ht .img-talk1 {
	background: url('./images/img-info-ht-vi.png') no-repeat center/cover !important;
	width: 15.8rem !important;
	left : 5.1rem !important;
}
.ht .img-talk2 {
	background: url('./images/img-data-ht-vi.png') no-repeat center/cover !important;
	width: 16rem !important;
	left : 5.4rem !important;
}
.ht .img-talk3 {
	background: url('./images/img-almost-ht-vi.png') no-repeat center/cover !important;
	width: 14.4rem !important;
	height: 4.8rem !important;
	left : -13rem !important;
}
.ht .img-talk4 {
	background: url('./images/img-complete-ht-vi.png') no-repeat center/cover !important;
	width: 15.9rem !important;
	height: 4.7rem !important;
	left : -14.4rem !important;
}
.ht .step .img-flag {
	background: url('./images/img-flag-ht.png') no-repeat center/cover !important;
	position: absolute !important;
	width: 3rem !important;
	height: 4.5rem !important;
	right: 0.4rem !important;
	bottom: 0 !important;
}
.ht .complete-btn {
	background-color: #000;
}
.ht .progressbar-wrap .ing-bar {
	background-color: #000;
}

.ht .modal .modal-popup .box .check-btn {
	background-color: #000;
}

.ht .modal .modal-popup .box .check-btn {
	/* font-size: 4vw;  */
	font-size: 1.6rem;	
	font-weight: 600;
	color : white; 
	width: 100%;
	padding : 0.75rem 0.25rem;
	background-color: #000;
	border-radius: 0.8rem;
	cursor: pointer;
	transition: all 0.2s;
}
.ht .ic-arrowDown {
	background: url('./images/ic-arrowDown-ht.png') no-repeat center/cover;
}

.ht .count-wrap span:first-of-type {
	color : black !important;
}

.ht .complete-btn.change {
	animation: pulse-shadow-ht 2s infinite !important; 
}

@keyframes pulse-shadow-ht {
  0%, 100% {
    box-shadow: none;
  }
  50% {
    box-shadow: 0 0 3rem black;
  }
}	
/* ht 전용 [e] */

/* gl 전용 [s] */
.gl header .img-logo {
	background: url('./images/img-logo-gl.svg') no-repeat center/cover;
	width: 10.7rem;
	height: 2.3rem;
	/* max-width: 31.5% */
}

.gl .btn.active {
	background-color: #367f76;
	color : white;
	border : 0.1rem solid #367f76;
}

.gl .btn.active {
	background-color: #367f76;
	color : white;
	border : 0.1rem solid #367f76;
}

.gl .img-men.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-men-active-gl-vi.svg') no-repeat center/cover !important;
}

.gl .img-women.active {
	background-color: unset;
	color : unset;
	border: unset;
	background: url('./images/img-women-active-gl-vi.svg') no-repeat center/cover !important;
}

.gl .step [class*=img-talk] {
	position: absolute;
	background: url('./images/img-wait-gl-vi.png') no-repeat center/cover;
	width: 17.1rem;
	height: 4.7rem;
	left : 5.2rem;
	top: -2rem;
}

.gl .img-talk1 {
	background: url('./images/img-info-gl-vi.png') no-repeat center/cover !important;
	width: 15.8rem !important;
	left : 5.1rem !important;
}
.gl .img-talk2 {
	background: url('./images/img-data-gl-vi.png') no-repeat center/cover !important;
	width: 16rem !important;
	left : 5.4rem !important;
}
.gl .img-talk3 {
	background: url('./images/img-almost-gl-vi.png') no-repeat center/cover !important;
	width: 14.4rem !important;
	height: 4.8rem !important;
	left : -13rem !important;
}
.gl .img-talk4 {
	background: url('./images/img-complete-gl-vi.png') no-repeat center/cover !important;
	width: 15.9rem !important;
	height: 4.7rem !important;
	left : -14.4rem !important;
}
.gl .step .img-flag {
	background: url('./images/img-flag-gl.png') no-repeat center/cover !important;
	position: absolute !important;
	width: 3rem !important;
	height: 4.5rem !important;
	right: 0.4rem !important;
	bottom: 0 !important;
}
.gl .complete-btn {
	background-color: #367f76;
}
.gl .progressbar-wrap .ing-bar {
	background-color: #000;
}
.gl .modal .modal-popup .box .check-btn {
	background-color: #367F76;
}
.gl .modal .modal-popup .box .check-btn {
	/* font-size: 4vw;  */
	font-size: 1.6rem;	
	font-weight: 600;
	color : white; 
	width: 100%;
	padding : 0.75rem 0.25rem;
	background-color: #367F76;
	border-radius: 0.8rem;
	cursor: pointer;
	transition: all 0.2s;
}
.gl .ic-arrowDown {
	background: url('./images/ic-arrowDown-gl.png') no-repeat center/cover;
}

.gl .count-wrap span:first-of-type {
	color : #367F76 !important;
}

.gl .complete-btn.change {
	animation: pulse-shadow-gl 2s infinite !important; 
}

@keyframes pulse-shadow-gl {
  0%, 100% {
    box-shadow: none;
  }
  50% {
    box-shadow: 0 0 3rem #367f76;
  }
}	

/* gl 전용 [e] */
@media (min-width : 500px) {
	main .contents:first-of-type {
		padding : 0;
	}
	main .contents {
		padding-left: 8vw;
	}
}

@media (min-width : 589px) {
	main {
		justify-content: space-around;
	}
	main .contents {
		padding-left: 18vw;
		padding-right : 14vw;
	}
	.step .img-wait {
		top : -1rem;
	}
}

@media (min-width : 691px) {
	main .contents {
		padding-left: 20vw;
	}
}


@media (min-width : 736px) {
	main .contents {
		padding-left: 23vw;
		padding-right : 18vw;
	}
}

@media (min-width : 880px) {
	main .contents {
		padding-left: 25vw;
	}
}

@media (min-width : 1024px) {
	main .contents {
		padding-left: 27vw;
	}
}


@media (min-width : 1280px) {
	main .contents {
		padding-left: 30vw;
	}
}

@media (max-height: 660px) {
	main {
		gap : 0.5rem;
	}
	br {
		display : none;
	}
}

@media (max-width : 379px) {
	main {
		justify-content: center;
		gap : 0.5rem;
	}
	h1 {
		font-size: 5vw !important;
	}
	h1 strong {
		font-size: 6.3vw !important;
	}
	h2 {
		font-size: 3.7vw;
	}
	.btn {
		font-size: 3.2vw;
	}
	.complete-btn {
		/* height: 10.6vw; */
		font-size: 3.6vw;
	}
	.progress-count {
		font-size: 5.5vw;
	}
	.end-count {
		font-size: 4vw;
	}
}

</style>
</head>

<body>
	<div class="wrap <%= appClass %>">
		<header>	
			<i class="img-logo"></i>
		</header>
		<main>
			<h1><strong>Đợi một chút</strong><br class="br"><p class="tit">Đang tiến hành xác minh sản phẩm</p><br><p>Xin vui lòng chọn giới tính.</p></h1>
			<article class="contents contents-gender">
				<button class="btn gender img-men" value="2"></button>
				<button class="btn gender img-women" value="1"></button>	
			</article>
			<article class="contents contents-age">
				<h2>1. Xin vui lòng chọn độ tuổi</h2>
				<div class="box-row">
					<button class="btn age" value="1">10-19</button>
					<button class="btn age" value="2">20-29</button>
					<button class="btn age" value="3">30-39</button>
					<button class="btn age" value="4">40-49</button>
					<button class="btn age" value="5">Trên 50</button>
				</div>
			</article>
			<article class="contents contents-show">
				<h2>2. Bạn đã xác minh tính chính hãng của sản phẩm trước khi mua như thế nào?</h2>
				<div class="box-row">
					<button class="btn platform" value="1">Mua từ nơi bán đáng tin cậy</button>
					<button class="btn platform" value="2">Kiểm tra các nguồn chứng nhận khác nhau</button>
					<button class="btn platform" value="3">Xem đánh giá (nhận xét) của người dùng</button>
				</div>
			</article>
			<article class="contents contents-preference">
				<h2>3. Lý do bạn quét sản phẩm đã mua là gì?</h2>
				<div class="box-row">
					<button class="btn situation" value="1">Vì nghi ngờ hàng giả</button>
					<button class="btn situation" value="2">Để nhận dịch vụ bảo hành (A/S)</button>
					<button class="btn situation" value="3">Để tham gia sự kiện</button>
					<button class="btn situation" value="4">Khác</button>
				</div>
			</article>
		</main>
		<!-- <button id="moveBtn">이동</button> -->
		<!-- 애니메이션 구간 [s]-->
		<div class="svgBox timing step">
			<div class="stepbox"><i class="img-talk" alt="img-wait"></i></div>
			<i class="img-flag"></i>
		</div>
		<!-- 애니메이션 구간 [e]-->
		<!-- 프로그래스 바 [s] -->
		<div class="progressbar-wrap">
			<span class="ing-bar"></span>
			<span class="leftover-bar"></span>
		</div>
		<!-- 프로그래스 바 [e] -->
		<!-- 선택 안되었을 때 팝업 [s] -->
		<div class="modal modal-select">
			<div class="modal-popup">
				<div class="box">
					<p class="txt">Đợi một chút! Vẫn chưa hoàn thành xong<i class="ic-handUp"></i></p>
					<p class="txt">( Hãy nhấn nút xác nhận sau hoàn thành! )Xác nhận</p>
					<i class="ic-warning"></i>
					<button class="check-btn">Click</button>
				</div>
			</div>
		</div>
		<!-- 선택 안되었을 때 팝업 [e] -->
		<button class="complete-btn"></button>
	</div>
	
<script>
$(document).ready(function() {
	btnClick();
	updateUI(); // 초기 상태 맞추기
	iOSZoomScale();
	completeBtn();
	popCancle();
});


// 1) 버튼 토글 & 클릭 시 UI 업데이트 호출
function btnClick() {
$('.contents .btn').on('click', function() {
	const $btn   = $(this);
	const $group = $btn.closest('.contents');

	if ($btn.hasClass('active')) {
	$btn.removeClass('active');
	} else {
	$group.find('.btn.active').removeClass('active');
	$btn.addClass('active');
	}

	updateUI();
});
}

// 2) active 클래스 개수에 따라 UI 각 요소를 옮기거나 넓이 변경
function updateUI() {
  const activeCount = $('.contents .btn.active').length;
  const $talk = $('.img-talk');
  const $warp = $('.wrap');
  const $flag = $('.img-flag');
  const $box  = $('.step .stepbox');
  const $bar  = $('.progressbar-wrap .ing-bar');
  const $strong = $('main h1 strong');
  const isCompleted = activeCount === 4;
  const hasProgress = activeCount > 0;
  const $countWrap = $('.count-wrap');
  const $completeBtn = $('.complete-btn');

  // 3) img-talk 숫자 클래스 토글
  $talk.removeClass(function(i, cls) {
    return (cls.match(/(^|\s)img-talk\d+/g) || []).join(' ');
  });
  if (activeCount > 0) {
    $talk.addClass('img-talk' + activeCount);
    $flag.show();
  }
  if (activeCount >= 4) {
    $flag.hide();
  }

  // 4) warp 숫자 클래스 토글 (img-talk과 동일하게)
  $warp.removeClass(function(i, cls) {
    return (cls.match(/(^|\s)wrap\d+/g) || []).join(' ');
  });

	// 4-1. wrap 클래스 갱신
	if (hasProgress) {
		$warp.addClass('wrap' + activeCount);
	} else {
		$strong.html('Chờ đợi!');
	}

	// 4-2. strong 내 카운트 표시 갱신
	if (hasProgress) {
		const progressText = '0' + activeCount;
		const countEl = '<div class="count-wrap"><span class="progress-count">'+0+ + progressText + '</span> /<span class="end-count">4</span></div>';
		$('.br').addClass('none');

		if ($countWrap.length === 0) {
			$strong.html('').append(countEl);
		} else {
			$countWrap.find('.progress-count').text(progressText);
		}
	} else {
		$('.br').removeClass('none');
	}

	// 4-3. 버튼 상태 갱신
	$completeBtn.toggleClass('change', isCompleted) .text( isCompleted ? 'Check out now on your authentication result!' : 'Please take part in the official authenticity verification survey!');$completeBtn.toggleClass('change', isCompleted) .text( isCompleted ? 'Hãy xác nhận kết quả bây giờ!' : 'Hãy tham gia khảo sát chứng nhận hàng chính hãng!');
	
	// 4-4. 화살표 버튼 추가
	if (activeCount === 4) {
		const arrow = '<i class="ic-arrowDown"></i>'
		$('.svgBox').append(arrow);
	} else {
		$('.ic-arrowDown').remove();
	}

	// 4-5. 타이틀 텍스트 수정
	if (activeCount === 1) {
		$('.tit').text('Đang lấy thông tin quét')
	} else if (activeCount === 2 ) {
		$('.tit').text('Đang kiểm tra tính chính hãng')
	} else if (activeCount === 3 ) {
		$('.tit').text('Đang kiểm tra thông tin sản phẩm')
	} else if (activeCount === 4 ) {
		$('.tit').text('Đã hoàn tất! Vui lòng nhấn nút bên dưới')
	} else {
		$('.tit').text('Xác minh tính xác thực')
	}

  // 5) .stepbox 이동 (첫 클릭 25%, 그 외 count*20%)
  if (activeCount === 0) {
    $box.css('left', '0%');
  } else if (activeCount === 1) {
    $box.css('left', 'calc(30% - 6.8rem)');
  } else {
    $box.css('left', 'calc(' + (activeCount * 25) + '% - 6.8rem)');
  }

  // 6) 프로그래스바 (첫 클릭 25%, 그 외 count*20%)
  let $width;
  if (activeCount === 0) {
    $width = 0;
  } else if (activeCount === 1) {
    $width = 30;
  } else {
    $width = activeCount * 25;
  }
  $bar.css('width', $width + '%');
}

// 7) 정품결과 확인 버튼 
function completeBtn() {
		$('.complete-btn').on('click', function() {
		// 각 선택된 값을 가져오기
		if($('.gender').hasClass('active') && $('.age').hasClass('active') && $('.platform').hasClass('active') && $('.situation').hasClass('active')) {
			// form을 동적으로 생성
			let landingCheck = '<%= request.getAttribute("landingCheck") %>';  // JSP 값을 JS 변수로 저장
			let form = $('<form></form>'); // 새로운 form 생성
			form.attr('action', 'insertPreLanding.'+ landingCheck ); // 전송할 URL 설정	
			form.attr('method', 'POST'); // 전송 방식 설정

			// 선택된 값들을 hidden input으로 추가
			form.append('<input type="hidden" name="conditionCheck" value="정품">');
			form.append('<input type="hidden" name="page" value="3">');
			form.append('<input type="hidden" name="gender" value="' + $('.gender.active').val() + '">');
			form.append('<input type="hidden" name="age" value="' + $('.age.active').val() + '">');
			form.append('<input type="hidden" name="answer1" value="' + $('.platform.active').val() + '">');
			form.append('<input type="hidden" name="answer2" value="' + $('.situation.active').val() + '">');
			
			// request에 담긴 데이터를 hidden input으로 추가 (JSP에서 전달된 값 사용)
			form.append('<input type="hidden" name="iqrcategory" value="<%= request.getAttribute("iqrcategory") %>">');
			form.append('<input type="hidden" name="customerCd" value="<%= request.getAttribute("customerCd") %>">');
			form.append('<input type="hidden" name="idx" value="<%= request.getAttribute("idx") %>">');
			
			<%
				// request의 모든 파라미터 이름을 가져오는 반복문
				while (attributeNames.hasMoreElements()) {
					String attributeName = attributeNames.nextElement();
					Object attributeValue = request.getAttribute(attributeName);
					if(attributeName.equals("model")) {
						if (attributeValue instanceof iqrModel) {
							iqrModel model = (iqrModel) attributeValue;

							// 리플렉션을 사용하여 model 객체의 모든 필드에 접근
							Field[] fields = model.getClass().getDeclaredFields();  // 모든 필드 가져오기
							
							for (Field field : fields) {
								field.setAccessible(true);  // private 필드에 접근할 수 있도록 설정
								
								try {
									// 필드 이름과 값을 가져오기
									String fieldName = field.getName();
									Object fieldValue = field.get(model);  // 필드 값

									// 필드 값이 null일 경우를 방지
									if (fieldValue == null) {
										fieldValue = "";  // null 대신 빈 문자열로 처리
									}
									%>
											form.append('<input type="hidden" name="model_<%= fieldName %>" value="<%= fieldValue %>">');
									<%
									// hidden input으로 폼에 데이터 추가
								} catch (IllegalAccessException e) {
									e.printStackTrace();
								}
							}
						}
					}else if(attributeName.equals("iqrDetModel")){
						if (attributeValue instanceof iqrDetModel) {
							iqrDetModel iqrDet = (iqrDetModel) attributeValue;

							// 리플렉션을 사용하여 model 객체의 모든 필드에 접근
							Field[] fields = iqrDet.getClass().getDeclaredFields();  // 모든 필드 가져오기
							
							for (Field field : fields) {
								field.setAccessible(true);  // private 필드에 접근할 수 있도록 설정
								
								try {
									// 필드 이름과 값을 가져오기
									String fieldName = field.getName();
									Object fieldValue = field.get(iqrDet);  // 필드 값

									// 필드 값이 null일 경우를 방지
									if (fieldValue == null) {
										fieldValue = "";  // null 대신 빈 문자열로 처리
									}
									%>
											form.append('<input type="hidden" name="iqrDet_<%= fieldName %>" value="<%= fieldValue %>">');
									<%
									// hidden input으로 폼에 데이터 추가
								} catch (IllegalAccessException e) {
									e.printStackTrace();
								}
							}
						}
					}else{
			%>
					form.append('<input type="hidden" name="<%= attributeName %>" value="<%= attributeValue %>">');
			<%
					}
				}
			%>

			// form을 body에 추가하여 제출
			$('body').append(form);
			form.submit(); // 폼 제출
		} else {
			$('.modal').fadeIn(500); // 선택하지 않은 경우 모달 표시
		}
	});
}

// 8) 팝업 버튼
// 팝업 cancle 버튼 클릭 [s]
function popCancle() {
	$('.check-btn').on('click' , function() {
		$('.modal').fadeOut(500);
	});
}
// 팝업 cancle 버튼 클릭 [e]

// 9) iOS 줌 확대 기능
// iOS Zoom 및 확대기능 막기 [s]
function iOSZoomScale() {
	$(document).on('gesturestart', function(e) {
		e.preventDefault(); // iOS Pinch-to-Zoom 비활성화
	});

	let lastTouchEnd = 0;
	$(document).on('touchend', function(event) {
		let now = new Date().getTime();
		if (now - lastTouchEnd <= 300) {
			event.preventDefault(); // iOS 더블 탭 확대 방지
		}
		lastTouchEnd = now;
	});
}
// iOS 짐 및 확대기능 막기 [e]

</script>
</body>
</html>
