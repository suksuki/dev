<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="./css/datatables.css">
	<link rel="stylesheet" href="./css/select2-bootstrap.css">
	<link rel="stylesheet" href=".css/select2.css">
	<link rel="stylesheet" href="./css/common1.css">
	
	<title>상품정보관리</title>
</head>
<body class="page-body">



	<div class="main-content">

		<div class="row">
			<div id="vueapp" margin-left: 15px;">
				<div class="panel panel-primary" data-collapsed="0">
									
					<div class="panel-body">
			
					<form class="form-horizontal">
						<table style="border: 0px;">
							<tr>
								<td style="width: 50%">
									<div class="form-group">
										<label for="prod_nm" class="sys_label_01 control-label">상품명</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_nm" v-model="info.prod_nm">
										</div>
									</div>
									<div class="form-group">
										<label for="prod_cd" class="sys_label_01 control-label">상품코드</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_cd" v-model="info.prod_cd">
										</div>
									</div>
									<div class="form-group">
										<label for="prod_ty_cd" class="sys_label_01 control-label">상품유형</label>
										<div class="sys_col_03">
											<select class="form-control" id="prod_ty_cd" v-model="info.prod_ty_cd">
												<option value="1">예금</option>
												<option value="2">적금</option>
											</select>
										</div>
									</div>
						
									<div class="form-group">
										<label for="sbstg_ty_cd" class="sys_label_01 control-label">가입대상</label>
										<div class="sys_col_03">
											<select class="form-control" id="sbstg_ty_cd" v-model="info.sbstg_ty_cd">
												<option value="1">일반개인</option>
												<option value="2">청년생활지원</option>
												<option value="3">장애자우선지원</option>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label for="ntsl_amt_min" class="sys_label_01 control-label">가입금액(최소)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="ntsl_amt_min" v-model="info.ntsl_amt_min">
										</div>
									</div>
									
									<div class="form-group">
										<label for="ntsl_amt_max" class="sys_label_01 control-label">가입금액(최대)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="ntsl_amt_max" v-model="info.ntsl_amt_max">
										</div>
									</div>
					
									<div class="form-group">
										<label for="prod_ty_cd" class="sys_label_01 control-label">납입주기</label>
										<div class="sys_col_03">
											<select class="form-control" id="pay_ty_cd" v-model="info.pay_ty_cd">
												<option value="1">월납</option>
												<option value="2">년납</option>
												<option value="3">일시납</option>
											</select>
										</div>
									</div>		
						
									<div class="form-group">
										<label for="prod_air_min" class="sys_label_01 control-label">적용이율(최저)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_air_min" v-model="info.prod_air_min">
										</div>
									</div>				
			
									<div class="form-group">
										<label for="prod_air_max" class="sys_label_01 control-label">적용이율(최대)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_air_max" v-model="info.prod_air_max">
										</div>
									</div>	
			
									<div class="form-group">
										<label for="prod_air_bgng_ymd" class="sys_label_01 control-label">적용기간(시작)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_air_bgng_ymd" v-model="info.prod_air_bgng_ymd">
										</div>
									</div>
			
									<div class="form-group">
										<label for="prod_air_end_ymd" class="sys_label_01 control-label">적용기간(종료)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="prod_air_end_ymd" v-model="info.prod_air_end_ymd">
										</div>
									</div>
									
									<div class="form-group">
										<label for="int_tax_ty_cd_nm" class="sys_label_01 control-label">이자과세구분</label>
										<div class="sys_col_03">
											<select class="form-control" id="int_tax_ty_cd" v-model="info.int_tax_ty_cd">
												<option value="1">일반과세</option>
												<option value="2">세금우대</option>
												<option value="3">비과세</option>
											</select>
										</div>
									</div>						
									
									<div class="form-group">
										<label for="curr_stcd" class="sys_label_01 control-label">판매상태</label>
										<div class="sys_col_03">
											<select class="form-control" id="curr_stcd" v-model="info.curr_stcd">
												<option value="0">정상(판매)</option>
												<option value="1">판매준비</option>
												<option value="2">판매인가</option>
												<option value="3">판매중지</option>
											</select>
										</div>
									</div>						
									
									<div class="form-group">
										<label for="ntsl_bgng_ymd" class="sys_label_01 control-label">팜매기간(시작)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="ntsl_bgng_ymd" v-model="info.ntsl_bgng_ymd">
										</div>
									</div>
			
									<div class="form-group">
										<label for="ntsl_end_ymd" class="sys_label_01 control-label">팜매기간(종료)</label>
										<div class="sys_col_03">
											<input type="text" class="form-control" id="ntsl_end_ymd" v-model="info.ntsl_end_ymd">
										</div>
									</div>
												
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-6">
											<button type="button" class="btn btn-green btn-icon btn-small" @click="save">
												저장
												<i class="entypo-check"></i>
											</button>
											<button type="button" id="btn_delete" class="btn btn-red btn-icon btn-small" @click="delInfo">
												삭제
												<i class="entypo-trash"></i>
											</button>
											<button type="button" class="btn btn-blue btn-icon btn-small" @click="gotoList">
												목록
												<i class="entypo-list"></i>
											</button>
										</div>
									</div>
								</td>
								<td style="width: 50%;">
									<div class="panel panel-primary" style="width: 100%; height: 100%; margin-left: 20px;">
										<div>
											<label>이율변동내역</label>
											<textarea type="text" style="width:100%;font-size:13px; border:3px;" rows="37" cols="33"  id="field_contents" ></textarea>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
<script>

var vueapp = new Vue({
	el : "#vueapp",
	data : {
		info : {
			prod_cd : "${prod_cd}",
			save_mode : "insert",
		},
	},
	mounted : function(){
			this.getInfo();
	},
	methods : {
		getInfo : function(){
		},
		getInfoCB : function(data){
			this.info = data;
			this.info.save_mode = "update";
		},
		save : function(){
			
			
		},
		saveCB : function(data){
			this.info.prod_cd = data.prod_cd;
			this.getInfo();
		},
		delInfo : function(){
			},
		delInfoCB : function(data){
		},
		gotoList : function(){
		},
	}
});
</script>
</html>