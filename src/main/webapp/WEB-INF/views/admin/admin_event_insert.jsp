<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>


<jsp:include page="../banner/admin_top.jsp" />
<c:set var="dto" value="${list }"  />

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
	
	function readURL4(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview4').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview4').src = "";
	  }
	}
	
	function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}

</script>



<div style="min-height:100%; width:66em; height:auto; margin: 50px auto; text-align: center;" align="center">
<button type="button" class="btn btn-success"
onclick = "location.href ='<%=request.getContextPath() %>/admin_event.do'"
>이벤트 목록</button>
<br />
<br><br>
        <form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_product_content_update_ok.do" class="border-top">
        
			<br><br>

				<div class="form-group row border-bottom py-2">
						<img width="500px;" id="preview1" />
					<label for="product_file1" class="col-sm-2 col-form-label">이벤트 썸네일</label>
					<div class="col-sm-8">
						<input type="file" name="event_thumbnailfile" id="event_thumbnailfile"  class="thumbnailInput" onchange="readURL1(this);"/>
					</div>
				</div>

				<div class="form-group row border-bottom py-2">
					<label for="product_file1" class="col-sm-2 col-form-label">이벤트사진1</label>
					<div class="col-sm-8">
						<input type="file" name="event_file1file" id="event_file1file"  class="thumbnailInput" onchange="readURL2(this);"/>
						<img width="300px;" id="preview2" />
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont1" class="col-sm-2 col-form-label">이벤트설명1</label>
					<div class="col-sm-8">
					 <textarea class="form-control" name="event_cont1" id="event_cont1" onkeydown="resize(this);" onkeyup="resize(this);">${pcdto.product_cont1 }</textarea>
					</div>
				</div>

				<div class="form-group row border-bottom py-2">
					<label for="product_file2" class="col-sm-2 col-form-label">이벤트사진2</label>
					<div class="col-sm-8">
						<input type="file" class="thumbnailInput" name="event_file2file" id="event_file2file" onchange="readURL3(this);" value="${pcdto.product_file2 }"/> 
						<img width="300px;" id="preview3" />
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont2" class="col-sm-2 col-form-label">이벤트설명2</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="event_cont2" id="event_cont2" onkeydown="resize(this);" onkeyup="resize(this);">${pcdto.product_cont2 }</textarea>
					</div>
				</div>

				<div class="form-group row border-bottom py-2">
					<label for="product_file3" class="col-sm-2 col-form-label">이벤트사진3</label>
					<div class="col-sm-8">
						<input type="file" name="event_file3file" id="event_file3file" class="thumbnailInput" onchange="readURL4(this);" value="${pcdto.product_file3 }"/>
						<img width="300px;" id="preview4" />
					</div>
				</div>


				<div class="form-group row border-bottom py-2">
					<label for="product_cont3" class="col-sm-2 col-form-label">이벤트설명3</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="event_cont3" id="event_cont3" onkeydown="resize(this);" onkeyup="resize(this);">${pcdto.product_cont3 }</textarea>
					</div>
				</div>
				
				
         
         
			<div class="form-group row mt-4" align="center">
                <div>
                    <button type="submit" class="btn btn-success">등록하기</button>
                    &nbsp;&nbsp;
                    <button type="reset" class="btn btn-outline-danger">다시작성</button>
                    &nbsp;&nbsp;
                    <input type="button" class="btn btn-secondary" value="메인화면" onclick="location.href='admin_main.do'">
                </div>
            </div>
            <br>
	
		</form>
        </div>
<jsp:include page="../banner/bottom.jsp" />