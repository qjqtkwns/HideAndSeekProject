<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="dto" value="${eventCont}" />

<jsp:include page="../banner/admin_top.jsp" />


<title>관리자 이벤트</title>

<script type="text/javascript">


	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview1').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview1').src = "";
		}
	}

	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview2').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview2').src = "";
		}
	}

	function readURL3(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview3').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview3').src = "";
		}
	}

	$(function() {

		function adjustHeight1() {
			var textEle = $('#event_cont1');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight + 8);
		}
		;
		function adjustHeight2() {
			var textEle = $('#event_cont2');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight + 8);
		}
		;
		function adjustHeight3() {
			var textEle = $('#event_cont3');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight + 8);
		}
		;

		adjustHeight1();
		adjustHeight2();
		adjustHeight3();

	});

	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
<style>
#event {
	min-height: 100%;
}

.title {
	margin-top: 30px;
	font-size: 3em;
	font-family: 'yg-jalnan';
}

#event_center {
	display: flex;
	flex-direction: column;
}

.event_span {
	margin-top: 20px;
	margin-bottom: 50px;
}

.event_wrap {
	margin-bottom: 30px;
}

.event_img {
	width: 70%;
	height: 100%;
	object-fit: cover;
	border-radius: 15px;
}

.admin_event1Wrap {
	display: flex;
}

.admin_event_cont1Wrap {
	flex-grow: 1;
	width: 55%;
	border-bottom: 0.1px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file1Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 45%;
}

.admin_event_file1 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

/*  */

.admin_event2Wrap {
	display: flex;
	flex-direction: row-reverse;
}

.admin_event_cont2Wrap {
	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file2Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 40%;
}

.admin_event_file2 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

/*  */

.admin_event3Wrap {
	display: flex;
	
}

.admin_event_cont3Wrap {
	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 6rem 4rem 6rem 4rem;
}

.admin_event_file3Wrap {
	flex-grow: 0;
	flex-shrink: 0;
	border-radius: 0;
	width: 40%;
}

.admin_event_file3 {
	display: block;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: right;
}

.admin_event3In{
	height: 100%;
	display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.btn.btn-light-eventItemBtn{
	width: 120px;
	font-size: 1.5em;
	border: 1px solid gray;
}


.admin_event_cont1WrapEdit{
	flex-grow: 1;
	width: 55%;
	border-bottom: 0.1px solid lightgray;
	padding: 1rem 2rem 3rem 4rem;
}

.admin_event_cont2WrapEdit{

	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 1rem 3rem 3rem 1rem;
}

.admin_event_cont3WrapEdit{
	flex-grow: 1;
	width: 60%;
	border-bottom: 0.05px solid lightgray;
	padding: 1rem 2rem 3rem 4rem;
}


</style>
<div class="admin_main_Wrab" style="height: auto; min-height: 100%;" align="center">
	<br> <br> <br>


<button type="submit" class="btn btn-success">이벤트 생성</button>
<br />
<div align = "center" id = "event">
		<h1 class = "title">EVENT</h1>
		<div id = "event_center">
		<input type = "hidden" name = "event_no">
			<div class = "event_span" align = "center">
				<h3 class = "event_ing">이벤트 상세</h3>
			</div>

			<div class = "event_wrap">
				<img src = "resources/image/${dto.event_thumbnail}" class = "event_img" >
			</div>
			

		</div>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_event_update_ok.do?no=${dto.event_no }" class="border-top">
		<input type="hidden" name="event_no" value="${dto.event_no }" />
			<br />
			
		<button type="submit" class="btn btn-secondary" >
			상세정보 수정완료</button>
			<br />
			<br />
			
			
			<div style="width: 80%">
			<%-- 이벤트 진행 상태 --%>
			<div class="form-group row border-bottom py-2">
				<label for="event_status" class="col-sm-4 col-form-label">상태</label>
				<div class="col-sm-8">

					<input class="form-check-input" type="radio" name="event_status" id="event_status" value="진행예정" <c:if test="${dto.event_status eq '진행예정'}">checked</c:if> required> 
					<label class="form-check-label" for="inlineRadio1">진행예정</label>
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="form-check-input" type="radio" name="event_status" id="event_status" value="진행중" <c:if test="${dto.event_status eq '진행중'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">진행중</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="form-check-input" type="radio" name="event_status" id="event_status" value="진행종료" <c:if test="${dto.event_status eq '진행종료'}">checked</c:if> required>
					<label class="form-check-label" for="inlineRadio1">진행종료</label>

				</div>
			</div>
			
			<%--이벤트 상품 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">상품번호</label>
                <div class="col-sm-8">
                    <input type="number" name="product_no" id="product_no" value="${dto.product_no }" style="text-align: center; font-size: 1.2em; font-weight: bold;" class="form-control-plaintext" required/>
                </div>
            </div>
            
            <%--이벤트 진행날짜 --%>
            <div class="form-group row border-bottom py-2">
                <label for="product_name" class="col-sm-4 col-form-label">이벤트 기간</label>
                <div class="col-sm-8">
                <input type="date" id="event_start" name="event_start" value="${dto.event_start.substring(0,10) }"> ~ 
				<input type="date" id="event_end" name="event_end" value="${dto.event_end.substring(0,10) }">
	
                
                </div>
            </div>
            
            
            
			</div>
			
			
			<br /><br />


		<!-- 첫번째 영역 -->
		<div class="admin_event1Wrap" style="display: flex;">
			<div class="admin_event_cont1WrapEdit">
			<div align="right">
			<span style="color: gray;">[새로 첨부하는]</span>
					<input type="file" name="event_file1file" id="event_file1file" class="thumbnailInput" onchange="readURL1(this);"/>
			</div>
				<textarea class="event_cont1" id="event_cont1" name="event_cont1"
					spellcheck="false"
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"
					onkeydown="resize(this)" onkeyup="resize(this)"> ${dto.event_cont1 } </textarea>
			</div>
			<div class="admin_event_file1Wrap">
			
						<img class="admin_event_file1" width="300px;" id="preview1"
							<c:if test="${!empty dto.event_file1 }" >
							src = "resources/image/${dto.event_file1 }"
							</c:if>
							<c:if test="${empty dto.event_file1 }" >
							src = "resources/image/image_not_found.jpg"
							</c:if>
						 />
			
<%-- 				<img width="50%" src="resources/image/${dto.event_file1}" --%>
<!-- 					class="admin_event_file1"> -->
			</div>
		</div>
		
		<!-- 두번째 영역 -->
		<div class="admin_event2Wrap" style="display: flex;">
			<div class="admin_event_cont2WrapEdit">
			<div align="left">
			<span style="color: gray;">[새로 첨부하는]</span>
			<input type="file" name="event_file2file" id="event_file2file" class="thumbnailInput" onchange="readURL2(this);"/>
			</div>
			
				<textarea class="event_cont2" id="event_cont2" name="event_cont2"
					spellcheck="false"
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"
					onkeydown="resize(this)" onkeyup="resize(this)"> ${dto.event_cont2 } </textarea>
			</div>
			<div class="admin_event_file2Wrap">
			
						<img class="admin_event_file2" width="300px;" id="preview2"
							<c:if test="${!empty dto.event_file2 }" >
							 src = "resources/image/${dto.event_file2 }"
							</c:if>
							<c:if test="${empty dto.event_file2 }" >
							src = "resources/image/image_not_found.jpg"
							</c:if>
						 />
			
			
<%-- 				<img width="30%" src="resources/image/${dto.event_file2}" --%>
<!-- 					class="admin_event_file2"> -->
					
					
			</div>
		</div>
		
		<!-- 세번째 영역 -->
		<div class="admin_event3Wrap" style="display: flex;">
			<div class="admin_event_cont3WrapEdit">
			<div class="admin_event3In">
			<div>
			<div align="right">
				<span style="color: gray;">[새로 첨부하는]</span><input type="file" name="event_file3file" id="event_file3file" class="thumbnailInput" onchange="readURL3(this);"/>
				</div>
				<textarea class="event_cont3" id="event_cont3" name="event_cont3"
					spellcheck="false"
					style="width: 100%; resize: none; font-size: 1.4em; border: 0px;"
					onkeydown="resize(this)" onkeyup="resize(this)"> ${dto.event_cont3 } </textarea>
			</div>

			</div>
			</div>
			<div class="admin_event_file3Wrap">
			
				<img class="admin_event_file3" width="300px;" id="preview3"
				<c:if test="${!empty dto.event_file3 }" >
					src = "resources/image/${dto.event_file3 }"
				</c:if>
				<c:if test="${empty dto.event_file3 }" >
				src = "resources/image/image_not_found.jpg"
				</c:if>
				/>
			
<%-- 				<img width="30%" src="resources/image/${dto.event_file3}" --%>
<!-- 					class="admin_event_file3"> -->
					
					
					
			</div>
		</div>

		
		
		
		
		
		
			<br />
			<br />
			<br />
		
			<button type="submit" class="btn btn-secondary">
			상세정보 수정완료</button>
			</form>
			<br />
			<br />
			<br />
			<br />
			<br />
			
	</div>

	</div>

<jsp:include page="../banner/bottom.jsp" />