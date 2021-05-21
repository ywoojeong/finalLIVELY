
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

// 구글 API 등록
function googleInit(data) {
	gapi.load('auth2', function() { 
	var gauth = gapi.auth2.init({
		client_id: data
	});
                    
	gauth.then(function(){
		console.log('init success');
	 }, function(){
		 console.error('init fail');
	 })
	 });
};

function googleLoginPro(profile){
	console.log(profile.getEmail())
	$.ajax({
		type : 'POST',
		url : 'googleLoginPro.do',
		data : {email: profile.getEmail(), id:profile.getId()},
		dataType : 'json',
		success : function(data){
			if(data.JavaData == "YES"){
				location.href = 'memberCon.do'
			}else if(data.JavaData == "register"){
				console.log(profile.getEmail())
				$("#googleEmail").val(profile.getEmail());
				$("#googleId").val(profile.getId());
				$("#memberPhoto").val(memberPhoto);
				$("#googleForm").submit();
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
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	}
	
};

 function signOut() {
	if(gapi.auth2 != undefined){
	 	var auth2 = gapi.auth2.getAuthInstance();
   		 auth2.signOut().then(function () {
    	  console.log('User signed out.');
    });
};
   
if (Kakao.Auth.getAccessToken()) {
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function (response) {
			console.log(response)
		},
		fail: function (error) {
			console.log(error)
		},
	})
	Kakao.Auth.setAccessToken(undefined) 
}
	
	location.href= "/user/logOut.do"
};

