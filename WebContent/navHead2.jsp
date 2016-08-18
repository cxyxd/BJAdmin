<!-- MetisMenu CSS -->
<link href="/BJAdmin/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/BJAdmin/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/BJAdmin/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<section class="vbox">
<!--  分公司 -->
	<header class="bg-dark dk header navbar navbar-fixed-top-xs">
	<div class="navbar-header aside-md" style=" height: 50px;  width: 800px;">
			<a class="btn btn-link visible-xs"
				data-toggle="class:nav-off-screen" data-target="#nav"> 
				<i class="fa fa-bars"></i>
			</a> 
			<a href="#" class="navbar-brand" data-toggle="fullscreen">
				<img src="/BJAdmin/images/logo.png" class="m-r-sm">毕加数据---总部/${branchCompany.companyName}
			</a> 
			<a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> 
				<i class="fa fa-cog"></i>
			</a>
		</div>
		<ul class="nav navbar-nav navbar-right hidden-xs nav-user">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
					<span class="thumb-sm avatar pull-left">
						<img src="/BJAdmin/images/avatar.jpg">
					</span> 管理员 
					<b class="caret"></b>
				</a>
				<ul class="dropdown-menu animated fadeInRight">
					<span class="arrow top"></span>
					<li class="divider"></li>
				<li><a href="/BJAdmin/"  target="_parent">退出</a></li>
				</ul>
			</li>
		</ul>
	</header>
	<section>
		<section class="hbox stretch">
			<!-- .aside -->
			<aside class="bg-dark lter aside-md hidden-print" id="nav">
				<section class="vbox">
					<section class="w-f scrollable">
						<div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
							<!-- nav -->
							<nav class="nav-primary hidden-xs">
								<ul class="nav">
									<li>
										<a href="/BJAdmin/mainPage.jsp"> 
											<i class="fa fa-dashboard icon"><b class="bg-danger"></b></i> 
											<span>概览</span>
										</a>
									</li>
							
									<li>
										<a href="" > 
											<i class="fa fa-user icon"> 
												<b class="bg-success"></b>
											</i> 
											<span class="pull-right"> 
												<i class="fa fa-angle-down text"></i> 
												<i class="fa fa-angle-up text-active"></i>
											</span> 
											<span>用户管理</span>
										</a>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/appclient/getAllAppClent"> 
													<i class="fa fa-angle-right"></i> 
													<span>业务员账号</span>
												</a>
											</li>
											<li>
												<a href="<%=request.getContextPath() %>/module/appclient/getByIdBranch?id=${branchCompany.id}">
													<i class="fa fa-angle-right"></i> 
													<span>分区经理账号</span>
												</a>
											</li>

										</ul>
									</li>
									<li>
										<a href="#pages"> 
											<i class="fa fa-file-text icon"> 
												<b class="bg-primary"></b>
											</i> 
											<span class="pull-right"> 
												<i class="fa fa-angle-down text"></i> 
												<i class="fa fa-angle-up text-active"></i>
											</span> 
											<span>信息查看</span>
										</a>
										<ul class="nav lt">
											<li>
												<a href="/BJAdmin/module/customer/getAllAppClent"> 
													<i class="fa fa-angle-right"></i> 
													<span>客户信息</span>
												</a>
											</li>
											<li>
												<a href="/BJAdmin/module/opponent/getAllAppClent"> 
													<i class="fa fa-angle-right"></i> 
													<span>竞争对手信息</span>
												</a>
											</li>
											<li>
												<a href="/BJAdmin/module/market/getAllAppClent"> 
													<i class="fa fa-angle-right"></i> 
													<span>市场信息</span>
												</a>
											</li>
										</ul>
									</li>
									<li>
										<a href="#pages"> 
											<i class="fa fa-map-marker icon"> 
												<b class="bg-info"></b>
											</i> 
											<span class="pull-right"> 
												<i class="fa fa-angle-down text"></i> 
												<i class="fa fa-angle-up text-active"></i>
											</span> 
											<span>地图显示</span>
										</a>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/map/getAllAppClent">
													<i class="fa fa-angle-right"></i> 
													<span>销售拜访记录</span>
												</a>
											</li>
										</ul>
									</li>
									<li>
										<a href="#pages"> 
											<i class="fa fa-envelope-o icon"> 
												<b class="bg-primary dker"></b>
											</i> 
											<span class="pull-right"> 
												<i class="fa fa-angle-down text"></i> 
												<i class="fa fa-angle-up text-active"></i>
											</span> 
											<span>售后服务&投诉</span>
										</a>
										<ul class="nav lt">
											<li>
											<a href="<%=request.getContextPath() %>/module/complain/getAllAppClent">
													<i class="fa fa-angle-right"></i> 
													<span>查看售后服务&投诉</span>
												</a>
											</li>
										</ul>
									</li>
									
											
									<li>
										<a href="#pages"> 
											<i class="fa fa-envelope-o icon"> 
												<b class="bg-primary dker"></b>
											</i> 
											<span class="pull-right"> 
												<i class="fa fa-angle-down text"></i> 
												<i class="fa fa-angle-up text-active"></i>
											</span> 
											<span>其他</span>
										</a>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/blank.jsp">
													<i class="fa fa-angle-right"></i> 
													<span>价格管理</span>
												</a>
											</li>
										</ul>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/blank.jsp">
													<i class="fa fa-angle-right"></i> 
													<span>合同管理</span>
												</a>
											</li>
										</ul>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/blank.jsp">
													<i class="fa fa-angle-right"></i> 
													<span>信用管理</span>
												</a>
											</li>
										</ul>
										<ul class="nav lt">
											<li>
												<a href="<%=request.getContextPath() %>/module/blank.jsp">
													<i class="fa fa-angle-right"></i> 
													<span>项目管理</span>
												</a>
											</li>
										</ul>
									</li>
									
									
								</ul>
							</nav> 
							<!-- / nav -->
						</div>
					</section>
					<footer class="footer lt hidden-xs b-t b-dark">
						<div id="chat" class="dropup">
							<section class="dropdown-menu on aside-md m-l-n">
								<section class="panel bg-white">
									<header class="panel-heading b-b b-light">西安毕加数据网络有限公司</header>
									<div class="panel-body animated fadeInRight">
										<p class="text-sm">绿豆芽科技</p>
										<p>
											<a href="#" class="btn btn-sm btn-default">访问绿豆芽，豆芽的人生</a>
										</p>
									</div>
								</section>
							</section>
						</div>						
						<a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon" > 
							<i class="fa fa-angle-left text"></i> 
							<i class="fa fa-angle-right text-active"></i>
						</a>
						<div class="btn-group hidden-nav-xs">
							<button type="button" title="Chats"
								class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
								data-target="#chat">
								<i class="fa fa-comment-o"></i>
							</button>	
						</div>
					</footer>
				</section>
			</aside>
			<!-- /.aside -->
		<section id = "content">
		<section class= "vbox">
			<section class= "scrollable padder">
			<div style="margin:20px">