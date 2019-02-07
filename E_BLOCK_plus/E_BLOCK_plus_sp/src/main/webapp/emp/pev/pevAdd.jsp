<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 평가 작성</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<style>
	.ui.disabled.input{
		opacity:1;
	}
</style>
</head>
<body>

	<!--=============== 작성부분 ===============-->

		<div class="ui container" >
			<form class="ui form" id="pev_AddForm" method="post" action="/E_BLOCK_plus/emp/pev/add.ebp">
				<h4 class="ui dividing header">인사평가작성</h4>
				<div class="two fields">
					<div class="field">
						<label>평가사원이름</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="e_name" placeholder="평가사원이름" value='<%=request.getParameter("e_name")%>'>
							</div>
						</div>
					</div>
					<div class="field">
						<label>평가점수(하트는 개당 2점입니다.)</label>
						<div class="field">
							<div id="heart" class="ui massive heart rating" style="margin-top: 6px; margin-left: 30px"></div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>인사평가작성</label>
					<textarea style="resize: none; height: 80%" name="ev_content"></textarea>
				</div>
				<input type="hidden" id="tg_eno" name="tg_eno"/>
				<input type="hidden" id="ev_score" name="ev_score"/>
				<div align="center">
					<button class="ui teal button" id="btn" onclick="pevAdd()" >등록</button>
					<div class="ui grey button" onclick="">취소</div>
				</div>
			</form>
		</div>
	<script type="text/javascript">

		$('#heart').rating({ initialRating : 0, maxRating : 5 });
		
		function cntrPevAdd(){
			var new_score = $('#heart').rating('get rating')*2;
        	//alert(new_score);
        	$("#ev_score").val(new_score);
        	//alert($("#ev_score").val());
/*         	$("#pev_AddForm").attr("method","post");
    		$("#pev_AddForm").attr("action","/E_BLOCK_plus/emp/pev/add.ebp");  
    		$('#pev_AddForm').submit(); */
		}
		
		
		function pevAdd(){
			var new_score = $('#heart').rating('get rating')*2;
        	$("#ev_score").val(new_score);
			$('#pev_AddForm').submit();
		}

		

	</script>

	<!--=============== 작성부분 ===============-->

	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>