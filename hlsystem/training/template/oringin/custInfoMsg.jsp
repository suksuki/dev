<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
	
	<script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
	<script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>
	<!-- Imported styles on this page -->
	<title>관리자시스템</title>
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li><a href="#gm">고객관리</a></li>
			<li class="active"><strong>고객정보 관리</strong></li>
		</ol>
	
		<h2>고객정보 관리</h2>
		<br/>
		
		<div id="vueapp">
		<template>
			<div class="row">
				<div style="width: 910px; margin-left: 15px;">
					<div class="panel panel-primary">
						<div class="panel-body">
						<form class="form-horizontal form-groups-bordered">
							<div class="form-group">
							    고객명 : <input type="text" placeholder="" style="width: 120px;" v-model="cust_nm">
								<button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 10px;" @click="custInfo(true)">
						         검색
						        <i class="entypo-search"></i>
					            </button>				
				            </div>
				            <div class="form-group">
						       <label for="err_eng_nm" class="col-sm-3 control-label">고객명 : </label>
						       <div class="col-sm-9">
							      <input type="text" id="cust_nm2" v-model="cust_nm2">
						       </div>  
					        </div>
			                <div class="form-group">
						       <label for="err_eng_nm" class="col-sm-3 control-label">작성일자 : </label>
						       <div class="col-sm-9">
							      <input type="text" id="wrt_dt" v-model="wrt_dt">
						       </div>  
					        </div>
				            <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">실명번호 : </label>
						     <div class="col-sm-9">
							  <input type="text" id="rrno" v-model="rrno">
						     </div>  
					        </div>
					        <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">E-mail : </label>
						      <div class="col-sm-9">
						    	<input type="text" id="cust_eml_addr" v-model="cust_eml_addr">
					      	  </div>
					        </div>
					        <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">전화번호 : </label>
						      <div class="col-sm-9">
							    <input type="text" id="co_telno" v-model="co_telno">
						      </div>
					        </div>
					        <div class="form-group">
					  	      <label for="err_eng_nm" class="col-sm-3 control-label">핸드폰번호 : </label>
						      <div class="col-sm-9">
							    <input type="text" id="cust_mbl_telno" v-model="cust_mbl_telno">
						      </div>
					        </div>
					        <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">직업 : </label>
						        <div class="col-sm-9">
						          <select id="occp_ty_cd" v-model="occp_ty_cd">
								    <option value="10000000">관리자(사무직)</option>
								    <option value="10100000">전문가 및 관련 종사자</option>
								    <option value="10200000">사무 종사자</option>
								    <option value="10300000">서비스 종사자</option>
								    <option value="10400000">판매 종사자</option>
								    <option value="10500000">농림어업 숙련 종사자</option>
								    <option value="10600000">기능원 및 관련 기능 종사자</option>
								    <option value="10700000">장치·기계조작 및 조립 종사자</option>
								    <option value="10800000">단순노무 종사자</option>
								    <option value="10900000">군인</option>
								    <option value="11000000">주부,학생 및 기타 비경제활동인구</option>
							      </select>
							      <input type="text" id="occp_ty_cd_nm" v-model="occp_ty_cd_nm">
						       </div>  
					        </div>
					       <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">주소 : </label>
						      <div class="col-sm-9">
							    <textarea  id="cust_addr" v-model="cust_addr"style="width:100%;" ></textarea>
						      </div>
					       </div>
					       <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">상담내역 : </label>
						      <div class="col-sm-9">
							    <textarea  id="tsk_dtl_cn" v-model="tsk_dtl_cn"style="width:100%;" ></textarea>
						      </div>
					       </div>
					       <div class="form-group">
						      <label for="err_cd" class="col-sm-3 control-label">관리담당자 : </label>
						      <div class="col-sm-9">
							    <input type="text" id="pic_nm" v-model="pic_nm">
							    <button type="button" class="btn" @click="popupPicInfo">
                                 <i class="fa fa-search"></i>
                                </button>
						      </div>
					       </div> 
					       <div class="form-group">
						     <label for="err_kor_nm" class="col-sm-3 control-label">부서명 : </label>
						     <div class="col-sm-9">
							   <input type="text" id="dept_nm" v-model="dept_nm">
						     </div>  
					       </div>
					       <div class="form-group">
						     <label for="err_eng_nm" class="col-sm-3 control-label">직위 : </label>
						     <div class="col-sm-9">
							    <input type="text" id="jbps_ty_cd_nm" v-model="jbps_ty_cd_nm">
						     </div>  
					       </div>
					       <div class="form-group">
						      <label for="err_eng_nm" class="col-sm-3 control-label">연락처 : </label>
						      <div class="col-sm-9">
						        <input type="text" id="pic_mbl_telno" v-model="pic_mbl_telno">
						      </div>
						   </div>
						   <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="custInsert">
							등록
							<i class="entypo-search"></i>
						   </button>  
						   <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="custUpdate">
							변경
							<i class="entypo-search"></i>
						   </button>
						   <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="custDelete">
							삭제
							<i class="entypo-search"></i>
						   </button>
						   <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="uiClear">
							신규
							<i class="entypo-search"></i>
						   </button>
						   <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="custInfoList">
							고객목록
							<i class="entypo-search"></i>
						   </button>
					</form>
				</div>
			</div>
		</div>
	</div>	
</template>
</div>
<br />
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
</div>
</div>
<!-- 고객명 팝업 -->
<div class="modal fade" id="pop_cust_info">
<template>
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<div class="modal-body">
				<div style="height: 400px;overflow: auto;" class="dataTables_wrapper">		
					<table class="table table-bordered datatable dataTable">
						<thead style="position: sticky;top: 0px;">
							<tr>
								<th class="center" style="width: 20%;">고객명</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in custList" @click="selCustItem(item.cust_nm)" style="cursor: pointer;">
								<td class="center">{{item.cust_nm}}</td>
							</tr>
						</tbody>
					</table>	
				</div>				
			</div>
		</div>
	</div>
</template>
</div>
<!-- 고객명 팝업 -->
<!-- 담당자 팝업 -->
<div class="modal fade" id="pop_pic_info">
<template>
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<div class="modal-body">
				<div style="height: 400px;overflow: auto;" class="dataTables_wrapper">		
					<table class="table table-bordered datatable dataTable">
						<thead style="position: sticky;top: 0px;">
							<tr>
								<th class="center" style="width: 20%;">담당자명</th>
								<th class="center" style="width: 20%;">부서명</th>
								<th class="center" style="width: 20%;">직위</th>
								<th class="center" style="width: 50%;">연락처</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" @click="selItem(item.pic_nm)" style="cursor: pointer;">
								<td class="center">{{item.pic_nm}}</td>
								<td class="center">{{item.dept_nm}}</td>
								<td class="center">{{item.jbps_ty_cd_nm}}</td>
								<td class="center">{{item.pic_mbl_telno}}</td>
							</tr>
						</tbody>
					</table>	
				</div>				
			</div>
		</div>
	</div>
</template>
</div>
<!-- 담당자 팝업 -->  
</body>
<script>
var vueapp = new Vue({
	el : "#vueapp",
	data : {
			cust_nm : "",
			cust_nm2 : "",
			wrt_dt : "",
			rrno : "",
			cust_eml_addr : "",
			co_telno : "",
			cust_mbl_telno : "",
			occp_ty_cd : "",
			occp_ty_cd_nm : "",
			cust_addr : "",
			tsk_dtl_cn : "",
			pic_nm : "",
			dept_nm : "",
			jbps_ty_cd_nm : "",
			pic_mbl_telno : "",
	},
	mounted : function(){
		this.getInitInfo();
		var params = cv_sessionStorage.getItem("params");
 		this.cust_nm = params.cust_nm;
	},
	methods : {
		custInfo : function(isInit){
			cust_nm = this.cust_nm;
			pop_cust_info.init(cust_nm);
			$('#pop_cust_info').modal('show');
		},
		gotoDtl : function(cust_nm){
			var params = {
					cust_nm : cust_nm,
				}
				cf_ajax("/custMng/getCustOne", params, this.getCustCB);	
		},
		getCustCB : function(data){
			this.cust_nm = data.cust_nm2;
			this.cust_nm2 = data.cust_nm2;
			this.wrt_dt = data.wrt_dt;
			this.rrno = data.rrno;
			this.cust_eml_addr = data.cust_eml_addr;
			this.co_telno = data.co_telno;
			this.cust_mbl_telno = data.cust_mbl_telno;
			this.occp_ty_cd_nm = data.occp_ty_cd_nm;
			this.cust_addr = data.cust_addr;
			this.tsk_dtl_cn = data.tsk_dtl_cn;
			this.occp_ty_cd = data.occp_ty_cd;
			
			var cust_mbl_telno = data.cust_mbl_telno;
			
			var params = {
					cust_mbl_telno : cust_mbl_telno,
				}
				cf_ajax("/custMng/getPicOne", params, this.getInfoCB);
		},
		getInitInfo : function(){
			var params = {
					pic_nm : "admin001",
				}
			cf_ajax("/custMng/getInitInfo", params, this.getInfoCB);
		},
		getInfoCB : function(data){
			this.pic_nm = data.pic_nm;
			this.dept_nm = data.dept_nm;
			this.jbps_ty_cd_nm = data.jbps_ty_cd_nm;
			this.pic_mbl_telno = data.pic_mbl_telno;
		},
		popupPicInfo : function(){
			pop_pic_info.init();
			$('#pop_pic_info').modal('show');
		},
		getPicSelInfo : function(pic_nm){
			var params = {
					pic_nm : pic_nm,
				}
			cf_ajax("/custMng/getInitInfo", params, this.getInfoCB);
		},
        custUpdate : function(){
					   
        	var cust_nm = vueapp.cust_nm2;
        	var wrt_dt  = vueapp.wrt_dt;
        	var rrno    = vueapp.rrno;
        	var cust_eml_addr = vueapp.cust_eml_addr;
        	var co_telno = vueapp.co_telno;
        	var cust_mbl_telno = vueapp.cust_mbl_telno;
        	var occp_ty_cd = vueapp.occp_ty_cd;
        	var cust_addr = vueapp.cust_addr;
		    
			var params = {
					cust_nm : cust_nm,
					wrt_dt  : wrt_dt,
					rrno    : rrno,
					cust_eml_addr : cust_eml_addr,
					co_telno : co_telno,
					cust_mbl_telno : cust_mbl_telno,
					occp_ty_cd : occp_ty_cd,
					cust_addr : cust_addr,
				}
			cf_ajax("/custMng/updateCust", params, this.changeStsCB);
			
			var pic_mbl_telno = vueapp.pic_mbl_telno;
			
			var params = {
					cust_mbl_telno : cust_mbl_telno,
					pic_mbl_telno  : pic_mbl_telno,	
				}
			cf_ajax("/custMng/updatePicTelno", params, this.changePicCB);
		},
		changeStsCB : function(data){
			if(data.status == "OK"){
			   alert("고객정보 변경 완료");
			}
		},
		changePicCB : function(data){
			if(data.status == "OK"){
				
			}
		},
		custDelete : function(){
			   
        	var cust_mbl_telno = vueapp.cust_mbl_telno;
        	
			var params = {
					cust_mbl_telno : cust_mbl_telno,
				}
			cf_ajax("/custMng/updateCustStcd", params, this.deleteStsCB);
			
			var params = {
					cust_mbl_telno : cust_mbl_telno,
				}
			cf_ajax("/custMng/updatePicRelStcd", params, this.deletePicRelCB);
		},
		deleteStsCB : function(data){
			if(data.status == "OK"){
			   alert("고객정보 삭제 완료");
			}
		},
		deletePicRelCB : function(data){
			if(data.status == "OK"){
				
			}
		},
		custInsert : function(){
			   
        	var cust_nm = vueapp.cust_nm2;
        	var rrno    = vueapp.rrno;
        	var cust_eml_addr = vueapp.cust_eml_addr;
        	var co_telno = vueapp.co_telno;
        	var cust_mbl_telno = vueapp.cust_mbl_telno;
        	var occp_ty_cd = vueapp.occp_ty_cd;
        	var cust_addr = vueapp.cust_addr;
        	var wrter_nm  = "정약용";
        	var curr_stcd = "0";
		    
			var params = {
					cust_nm : cust_nm,
					rrno    : rrno,
					cust_eml_addr : cust_eml_addr,
					co_telno : co_telno,
					cust_mbl_telno : cust_mbl_telno,
					occp_ty_cd : occp_ty_cd,
					cust_addr : cust_addr,
					wrter_nm : wrter_nm,
					curr_stcd : curr_stcd,
				}
			cf_ajax("/custMng/insertCustInfo", params, this.insertStsCB);
			
			var pic_mbl_telno = vueapp.pic_mbl_telno;
			var rel_ty_cd     = "10";
			
			var params = {
					cust_mbl_telno : cust_mbl_telno,
					pic_mbl_telno  : pic_mbl_telno,
					rel_ty_cd : rel_ty_cd,
					wrter_nm : wrter_nm,
					curr_stcd : curr_stcd,
				}
			cf_ajax("/custMng/insertPicRel", params, this.insertPicCB);
		},
		insertStsCB : function(data){
			if(data.status == "OK"){
			   alert("고객정보 입력 완료");
			}
		},
		insertPicCB : function(data){
			if(data.status == "OK"){
				
			}
		},
		uiClear : function(){
			cf_movePage('/custMng/custInfoMng');
		},
		custInfoList : function(){
			cf_movePage('/custMng/custInfoList');
		},
	},
});

var pop_cust_info = new Vue({
	el : "#pop_cust_info",
    data : {
		custList : [],
	},
	methods : {
		init : function(cust_nm){
			this.getCustInfo(cust_nm);
		},
		getCustInfo : function(cust_nm){
			this.custList = [];
			var params = {
				cust_nm : cust_nm,
			}
			
			cf_ajax("/custMng/getCustInfo", params, function(data){
				pop_cust_info.custList = data;
			});
		},
		selCustItem : function(cust_nm){
			
 			$('#pop_cust_info').modal('hide');
 			vueapp.gotoDtl(cust_nm);
		},
	},
});

var pop_pic_info = new Vue({
	el : "#pop_pic_info",
    data : {
		dataList : [],
	},
	methods : {
		init : function(){
			this.getPicInfo();
		},
		getPicInfo : function(){
			this.dataList = [];
			var params = {
				pic_nm : " ",
			}
			
			cf_ajax("/custMng/getPicInfo", params, function(data){
				pop_pic_info.dataList = data;
			});
		},
		selItem : function(pic_nm){
			
 			$('#pop_pic_info').modal('hide');
			//$('#pop_pic_info').hide();
			vueapp.getPicSelInfo(pic_nm);
		},
	},
});

</script>
</html>