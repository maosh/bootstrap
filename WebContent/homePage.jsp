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
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="navbar navbar-default" role="navigation">
		<ul class="nav navbar-nav">
			<li><a href="#">主页</a></li>
			<li><a href="#">热门</a></li>
			<li><a href="#">图片</a></li>
			<li><a href="#">文字</a></li>
			<li><a href="#">其它</a></li>
	</div>
	</div>



	<%
		ArrayList al = (ArrayList) request.getAttribute("result");

		//	int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
	%>

	<div class="container">

		<div class="blog-header">
			<h1 class="blog-title"><%=request.getParameter("username")%></h1>
			<p class="lead blog-description"><%=(String) request.getAttribute("profile")%></p>
		</div>

		<div class="row">

			<div class=" input-group">
				<span class="input-group-addon">new</span>
				<textarea id=newPost class="form-control" rows="1"
					onclick="postClick(newPost)" placeholder="What's happening?"></textarea>
				<!--  span class="input-group-addon">.00</span> -->
			</div>
			<div class="content col-md-8 blog-main">


				<%
					for (int i = 0; i < al.size(); i++) {
						BlogBean bb = (BlogBean) al.get(i);
				%>

				<div class="row blog-post">
					<div class="col-sm-2">
						<img src="imgs/1.jpg" alt="photo" height="70" width="70" />
					</div>
					<div class="col-sm-10">
						<div class="row">
							<div>
								<font size="5" face="verdana"><%=bb.getAuthor()%></font>
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




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
