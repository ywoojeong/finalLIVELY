
// 카카오 API 등록 확인 
$( document ).ready(function() {
	$.ajax({
		type : 'POST',
		url : 'getKakaoApi.do',
		data : {},
		dataType : 'text',
		success : function(data){
			Kakao.init(data);
		},
		error: function(xhr, status, error){
			alert("API 등록에 실패했습니다."+error);
		}
	});
	
});



// 카카오 로그인 정보 받아오기
// 받은 데이터를 객체로 변환해 넘김
function memberKakaoLoginPro(response){
	var data = {id:response.id,email:response.kakao_account.email}
	$.ajax({
		type : 'POST',
		url : 'memberKakaoLoginPro.do',
		data : data,
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == "YES"){
				alert("로그인되었습니다.");
				location.href = 'home.do'
			}else if(data.JavaData == "register"){
				alert("추가정보 입력 필요")
				$("#kakaoEmail").val(response.kakao_account.email);
				$("#kakaoId").val(response.id);
				$("#memberPhoto").val(memberPhoto);
				$("#kakaoForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
	
};

function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance()
	if(auth2.isSignedIn.get()){
	 var profile = auth2.currentUser.get().getBasicProfile();
	 googleLoginPro(profile)
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	}
	
};

function signOut() {
	if(gapi.auth2 != undefined){
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
			console.log('User signed out.');
   		});
	}
	location.href= "logOut.do"
  };