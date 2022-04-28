<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-3">
        <div class="alert alert-primary" role="alert">
          adminInsertForm.jsp
        </div>
      </div>
      <div class="col-9">
        <form method="post" action="adminInsertPro.jsp">
          <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력" 
            maxlength="50" required>
          </div>
          <div class="mb-3">
            <label for="passwd" class="form-label">비밀번호</label> 
            <input type="password" class="form-control" name="passwd" id="passwd" 
            placeholder="비밀번호 입력" maxlength="16" required>
          </div>
          <div class="mb-3">
            <label for="name" class="form-label">이름</label> 
            <input type="text" class="form-control" name="name" id="name" 
            placeholder="이름 입력" maxlength="10" required>
          </div>
          <div class="mb-3">
            <label for="postcode" class="form-label">우편번호</label><br/>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호" required>
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
          </div>
          <div class="mb-3">
            <label for="address" class="form-label">주소</label>
            <input type="text" class="form-control" name="address" id="address" placeholder="주소" required>
          </div>
          <div class="mb-3">
            <label for="detail" class="form-label">상세주소</label>
            <input type="text" class="form-control" name="detail" id="detail" placeholder="상세주소">
          </div>
          <div class="mb-3">
            <input type="submit" class="btn btn-primary" onclick="return userInsert()"value="입력완료">
            <script>
							function userInsert(){
								if(confirm("해당 아이디를 추가하시겠습니까?")){
									return true;
								}else {
									alert("취소하셨습니다.");
									return false;
								}
							}
						</script>
          </div>
      </form>
      </div>
    </div>
  </div>

  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      function sample6_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
                  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode').value = data.zonecode;
                  document.getElementById("address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("detail").focus();
              }
          }).open();
      }
  </script>
</body>
</html>