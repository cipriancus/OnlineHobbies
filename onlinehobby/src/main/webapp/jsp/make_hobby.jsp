<%@page import="ro.oho.rest.facadeDataBase.PostariFacade"%>
<%@page import="ro.oho.rest.facadeDataBase.HobbyFacade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ro.oho.rest.facadeDataBase.UserFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ro.oho.rest.model.User"%>
<%@page import="ro.oho.rest.model.Hobby"%>
<%@page import="ro.oho.rest.model.Postare"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/onlinehobby/css/profile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/onlinehobby/images/logo.png">
<title>OHO Create Hobbby</title>
</head>
<body onload="loadDoc(); loadMembers(); loadPosts(); addUserToHobby;">
	<%
		HttpSession sessionUser = request.getSession(false);
		User user = (User) sessionUser.getAttribute("user");
		HobbyFacade hobbyFacade = new HobbyFacade();

		String HobbyName=(String) request.getAttribute("HobbyName");

		
		List<Hobby> allHobby = hobbyFacade.getAllUserHobby(user.getIdUser());
	%>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">
				<div class="content">
					<header>
						<div class="header-wrapper">
							<div class="leftMenuBar">
								<ul>

									<li><a href="http://localhost:8017/onlinehobby/home"><img
											align="center" width="40px" height="40px"
											src="/onlinehobby/images/logo.png" /></a></li>


									<li><a
										href="http://localhost:8017/onlinehobby/usr/<%out.print(user.getIdUser());%>">
											<img align="center" src="<%out.print(user.getPicture());%>"
											alt="Profile Picture" /> <%
 	out.print(user.getNume() + " " + user.getPrenume());
 %>
									</a></li>
								</ul>
							</div>

							<div class="rightMenuBar">
								<ul>
									<li id="menuItem"><a
										href="http://localhost:8017/onlinehobby/home">Home</a></li>


									<li id="menuItem"><a
										href="http://localhost:8017/onlinehobby/usr/<%out.print(user.getIdUser());%>">Profile</a></li>
									<%
										if (user.getGrad() == 1) {
											out.print("<li id=\"menuItem\"><a href=\"http://localhost:8017/onlinehobby/admin\">Admin</a></li>");
										}
									%>
									<li id="menuItem"><a
										href="http://localhost:8017/onlinehobby/ContactPage">Contact</a></li>
									<li id="menuItem"><a href="http://localhost:8017/onlinehobby/jsp/logout.jsp">Logout</a></li>

								</ul>
							</div>

						</div>
					</header>
					<div class="main">
						<div class="main-wrapper">
							<div class="profilePlusFeed">
								<div class="profilFeed">
									<div class="profile">
										<div class="profileContent">
											<div class="hobbies">
												<div class="head">
													<a>Hobbies you follow</a>
												</div>
												<%
													for (Hobby iterator : allHobby) {
														out.print("<div class=\"hobby-content\"><a href=\"http://localhost:8017/onlinehobby/hobby/");
														out.print(iterator.getIdHobby());
														out.print("\">");
														out.print(iterator.getHobbyName());
														out.print("</a></div>");
													}
												%>

											</div>


										</div>
									</div>
								</div>
								<div class="feed">
									<div class="feedContent">
										<div class="comments-container">

												<div id='hobby_container'>

													<div id='info_box_noMargin'>
														
														<div id="info-box">
															<div id="info-name">
													
															<b ><%out.print(HobbyName);%></b>
															</div>
															<a onClick="addNewHobby()" id="addButton">Add Hobby</a>
														</div>
													</div>

												</div>

												<div id="container-content">
												<textarea
													 class="text_area_class" id="HobbyDescription" placeholder="Hobby Description"></textarea>

													<input class="dashed_class" placeholder="Enter hobby picture url ex: http://www.ebay.com or www.google.com"   id="HobbyVideo"> 
													&nbsp;
													<input class="dashed_class" placeholder="Enter youtube embeded url ex: https://www.youtube.com/embed/qFFejoQn9C" id="HobbyURL">
													&nbsp;
													<p> The hobby and message will not appear until validated by an administrator</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="hobby_suggestions">
								<div id="hobbies"></div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="/onlinehobby/js/comunicare.js"></script>

</body>
</html>
