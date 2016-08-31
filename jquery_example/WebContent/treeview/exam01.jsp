<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>treeview-exam01</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/jquery.treeview.css" />
<script type="text/javascript" src="${cp }/resources/js/jquery.js"></script>
<script type="text/javascript" src="${cp }/resources/js/jquery.treeview.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#browser").treeview({	// treeview를 생성하고자 하는 ul 태그의 아이디를 찾아 .treeview 함수 호출
			collapsed : true, // 페이지 로드시, 모두 닫기
			animated : "fast",
			control : "#sidetreecontrol"
		});
	});

	var menuOpen = true;
	function fnToggleMenu() {
		if (menuOpen) {
			//$('#menuTd').css('width','22px');
			$('#menuTd').animate({
				width : "22px"
			});
			$('#MenuBg1').css('display', 'none');
			$('#MenuBg1-1').css('display', 'block');
			$('#MenuBg1-1').animate({
				width : "22px"
			});
			menuOpen = false;
		} else {
			//$('#menuTd').css('width','190px');
			$('#menuTd').animate({
				width : "190px"
			});
			$('#MenuBg1-1').css('display', 'none');
			$('#MenuBg1').css('width', '0px');
			$('#MenuBg1').css('display', 'block');
			$('#MenuBg1').animate({
				width : "190px"
			});
			menuOpen = true;
		}
	}
</script>
</head>
<body>
	<!--[ :: Left Menu ::] -->
	<div id="MenuBg1" style="display: block; width: 190px">
		<img src="${cp}/resources/images/treeview/menu_bg1.gif" width="181" height="6" />
		<div id="MenuList" style="height: 30px; align: right">
			<img src="${cp}/resources/images/treeview/menu_list.jpg" style="cursor: pointer" onclick="fnToggleMenu()" title="메뉴감추기" />
		</div>
		<div id="MenuAll">
			<ul>
				<li>
					<div id="sidetreecontrol">
						<a href="#">
							<img src="${cp}/resources/images/treeview/btn_alloff.gif" onmouseout="this.src='${cp}/resources/images/treeview/btn_alloff.gif'" onmouseover="this.src='${cp}/resources/images/treeview/btn_alloff2.gif'" style="cursor: hand;" />
						</a> 
						<a href="#"> 
							<img src="${cp}/resources/images/treeview/btn_allon.gif" onmouseout="this.src='${cp}/resources/imagestreeview/btn_allon.gif'" onmouseover="this.src='${cp}/resources/images/treeview/btn_allon2.gif'" style="cursor: hand;" />
						</a>
					</div>
				</li>
			</ul>
		</div>
		<div id="Menu">
			<div id="sidetree">
				<!-- 펼치고자 하는 주메뉴 li태그에 class="open" 지정 -->
				<ul id="browser" class="filetree" style="height: 650px; overflow: auto; overflow-x: hidden; overflow-y: auto;">
					<li><span class="folder">Folder 1</span>
						<ul>
							<li><span class="file">Item 1.1</span></li>
						</ul>
					</li>
					<li><span class="folder">Folder 2</span>
						<ul>
							<li class="closed"><span class="folder">Subfolder 2.1</span>
								<ul id="folder21">
									<li><span class="file">File 2.1.1</span></li>
									<li><span class="file">File 2.1.2</span></li>
								</ul>
							</li>
							<li><span class="file">File 2.2</span></li>
						</ul>
					</li>
					<li class="closed"><span class="folder">Folder 3</span>
						<ul>
							<li><span class="file">File 3.1</span></li>
						</ul>
					</li>
					<li><span class="file">File 4</span></li>
					<li><span class="file"><a href="${cp }/index.jsp">index</a></span></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="MenuBg1-1" style="display: none; width: 0px">
		<div id="MenuBg2-1" style="height: 6px"></div>
		<div id="MenuList" style="height: 30px; align: right">
			<img src="${cp}/resources/images/treeview/menu_list2.jpg" style="cursor: pointer" onclick="fnToggleMenu()" title="메뉴펼치기" />
		</div>
	</div>
	<!--[ :: Left Menu ::] -->
</body>
</html>