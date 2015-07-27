<%@ page language="java"
	import="java.sql.*, com.maosh.model.*, java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>homePage</title>

<!-- Bootstrap core CSS -->
<link href="js/bootstrap-3.3.5-dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- 
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
-->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="js//bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script type="text/javascript">


$(document).ready(function(){

	  $("#newPostBTN").click(function(){
		  var aut=document.getElementById("blog-author");
		  var con=document.getElementById("newPost");
	    $.post("blogcl",
	    {
	      flag:"addBlog",
	      author:$("#author").text(),
	      content:$("#newPost").val(),
	    },
	    function(data,status){
			  var aut=document.getElementById("author").innerHTML;
			  var con=document.getElementById("newPost").value;   	
	      alert("发表成功"+data);
	      var res="<tr><td>"+aut+"</td></tr><tr><td>"+con+"</td></tr>"
	      $("#newInsert").append(res);
	    });
	  });
	/*  
	  $("#deletePostBTN").click(function(){
			alert("delete");
		  var aut=document.getElementById("blog-author");
		  var con=document.getElementById("newPost");
	    $.post("blogcl",
	    {
	      flag:"deleteBlog",
	      postId:postId,
	    },
	    function(data,status){
	    	
	      alert("发表成功");
	    });
	  });
	*/
	});

function changeRows(){
	document.getElementById("newPost").rows="4";

}
function deletePostById(blogId){
	    $.post("blogcl",
	    {
	      flag:"deleteBlog",
	      blogId:blogId,
	    },
	    function(data,status){
	    	alert("deleted");
	    	
	    		  $("#"+blogId).remove();
	    });
}
</script>
</head>

<body>

	<div class="navbar navbar-default" role="navigation">
		<ul class="nav navbar-nav">
			<li><a href="#">主页</a></li>
			<li><a href="#">热门</a></li>
			<li><a href="#">图片</a></li>
			<li><a href="#">文字</a></li>
			<li><a href="#">其它</a></li>
	</ul>
	</div>



	<%
		ArrayList al = (ArrayList) request.getAttribute("result");

		//	int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
	%>

	<div class="container">

		<div class="blog-header">
			<h1 class="blog-author" id="author"><%=request.getParameter("username")%></h1>
			<p class="lead blog-description"><%=(String) request.getAttribute("profile")%></p>
		</div>

		<div class="row">

			<div class="blog-post input-group  col-md-6">
				<span class="input-group-addon">new</span>
				<textarea id=newPost class="form-control" rows="2"  placeholder="What's happening?"></textarea>
				<ul>
				<span><a href="#">表情</a></span>
				<span><a href="#">图片</a></span>
				<span><a href="#">视频</a></span>
				<span><a href="#">@好友</a></span>
				<span><button type="button" class=" btn btn-default" id="newPostBTN"
									aria-label="Left Align">
									发布
								</button></span>
								</ul>	
				<!--  span class="input-group-addon">.00</span> -->
				
			</div>
			<div class="startList content col-md-6 blog-main">

<!-- 新插入
 -->
 <span id="newInsert"></span>
 


				<%
					for (int i = 0; i < al.size(); i++) {
						BlogBean bb = (BlogBean) al.get(i);
				%>

				<div class="row blog-post" id=<%=bb.getBlogId()%>>
					<div class="col-sm-2">
						<img src="imgs/1.jpg" alt="photo" height="70" width="70" />
					</div>
					<div class="col-sm-10">
						<div class="row">
							<div class="author col-sm-10"><a href="#"><%=bb.getAuthor()%></a></div>
							<div hidden="hidden" ><%=bb.getBlogId()%></div>

<div class="dropdown col-sm-2">
   <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
      data-toggle="dropdown">
      <span class="caret"></span>
   </button>
   <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
      <li role="presentation">
         <a id="deletePostBTN" role="menuitem" tabindex="-1" onclick="deletePostById(<%=bb.getBlogId()%>)">删除</a>
      </li>
   </ul>
</div>

						</div>
						<div class="row">
							<div class="col-sm-10">
								<div><%=bb.getContent()%></div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-10">
								<div><%=bb.getTs()%></div>
							</div>
							</div>
							<div class="row">
								<button type="button" class="col-sm-3 btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
								</button>
								<button type="button" class="col-sm-3 btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</button>
								<button type="button" class="col-sm-3 btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
								</button>
								<button type="button" class="col-sm-3 btn btn-default"
									aria-label="Left Align">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
								</button>
							</div>

						
					</div>

				</div>

				<%
					}
				%>




				<nav>
					<ul class="pager">
						<li><a href="#">Previous</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</nav>

			</div>
			<!-- /.blog-main -->

			<div class="col-md-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<h4>About</h4>
					<p>
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
						mattis consectetur purus sit amet fermentum. Aenean lacinia
						bibendum nulla sed consectetur.
					</p>
				</div>
				<div class="sidebar-module">
					<h4>Archives</h4>
					<ol class="list-unstyled">
						<li><a href="#">March 2014</a></li>
						<li><a href="#">February 2014</a></li>
						<li><a href="#">January 2014</a></li>
						<li><a href="#">December 2013</a></li>
						<li><a href="#">November 2013</a></li>
						<li><a href="#">October 2013</a></li>
						<li><a href="#">September 2013</a></li>
						<li><a href="#">August 2013</a></li>
						<li><a href="#">July 2013</a></li>
						<li><a href="#">June 2013</a></li>
						<li><a href="#">May 2013</a></li>
						<li><a href="#">April 2013</a></li>
					</ol>
				</div>
				<div class="sidebar-module">
					<h4>Elsewhere</h4>
					<ol class="list-unstyled">
						<li><a href="#">GitHub</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ol>
				</div>
			</div>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<footer class="blog-footer">
		<p>
			Blog template built for <a href="http://getbootstrap.com">Bootstrap</a>
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</footer>





</body>
</html>
