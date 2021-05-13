<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <link href="./css/challenge.css" rel="stylesheet">   

<div class="container-fluid" style="background-color: red;height: 100px">
	

</div>    
 
   
   <div class="container">
   	 
   	 <ul class="nav nav-pills mb-3" id="pills-tab2" role="tablist">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="pills-home-tab2" data-mdb-toggle="pill" data-mdb-target="#pills-home2" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Home</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="pills-profile-tab2" data-mdb-toggle="pill" data-mdb-target="#pills-profile2" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="pills-contact-tab2" data-mdb-toggle="pill" data-mdb-target="#pills-contact2" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Contact</button>
		  </li>
		</ul>
		<div class="tab-content" id="pills-tabContent2">
		  <div class="tab-pane fade show active" id="pills-home2" role="tabpanel" aria-labelledby="pills-home-tab2">Tab 1 content</div>
		  <div class="tab-pane fade" id="pills-profile2" role="tabpanel" aria-labelledby="pills-profile-tab2">Tab 2 content</div>
		  <div class="tab-pane fade" id="pills-contact2" role="tabpanel" aria-labelledby="pills-contact-tab2">Tab 3 content</div>
		</div>
   	 
   	 
   	    
		
			<div class="md-form md-outline d-flex Search">

					<input type="text" class="form-control input-Search" id="search" placeholder="인기있는 챌린지를 검색하세요" name="search">
			
		    		<button type="submit" class="btn btn-Search">SEARCH</button>
		    </div>
		    
		    
		    <form class="d-flex input-group w-auto">
        <input
          type="search" class="form-control" placeholder="Type query"   aria-label="Search"/>
        <button class="btn btn-outline-primary" type="button"  data-mdb-ripple-color="dark">
          Search
        </button>
      </form>
		  
   </div>
 