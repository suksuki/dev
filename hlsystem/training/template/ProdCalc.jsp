<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/prodcalc.css">
	
	<!-- Bilboard Chart(https://naver.github.io/billboard.js) -->
	<script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="/static_resources/system/js/datatables/billboard.js"></script>
	<link rel="stylesheet" href="/static_resources/system/js/datatables/billboard.css">
	
	<title>��������</title> 
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>��������</strong></li>
		</ol>
	
		<h2>��ǰ���� > ��������</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" class="right flex-column flex-100">
				<template>
				<div class="right-top flex-100">
					<ul class="nav">
						<li class="nav-tab active">nav 1</li>
						<li class="nav-tab">nav 2</li>
						<li class="nav-tab">nav 3</li>
						<li class="nav-tab">nav 4</li>
					</ul>
					<div class="column-group flex-column flex-gap-10">
						<div class="form-group flex-gap-10" style="justify-content: left">
							<label class="width-100">search:</label>
							<input class="width-100" id="prod_cd" value="1" v-model="info.prod_cd" disabled/>
							<input class="width-100" id="prod_nm" value = "2" v-model="info.prod_nm" disabled/>
							<button type="button" class="btn" @click="popupProd()">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<div class="form-group" style="justify-content: left">
							<label class="width-100">one:</label>
							<select class="width-100" id="pay_ty_cd" v-model="info.pay_ty_cd">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
						<div class="form-group flex-gap-10" style="justify-content:left">
							<label class="width-100">label 2:</label>
							<input type="number" min="0" placeholder="10" class="width-100" id="circle_acml_amt" v-model="info.circle_acml_amt" />
							<button type="button" class="btn btn-transparent flex-10" @click="setCircleAcmlAmt(10)">+10</button>
							<button type="button" class="btn btn-transparent flex-10" @click="setCircleAcmlAmt(50)">+50</button>
							<button type="button" class="btn btn-transparent flex-10" @click="setCircleAcmlAmt(100)">+100</button>
							<button type="button" class="btn btn-navy flex-10" @click="setCircleAcmlAmt(0)">clear</button>
						</div>
						<div class="form-group flex-gap-10" style="justify-content: left">
							<label class="width-100">label 3:</label>
							<input class="width-100" value="3" min="0" type="number" id="goal_prd" v-model="info.goal_prd" />
							<button type="button" class="btn btn-transparent flex-10" @click="setGoalPrd(3)">+3</button>
							<button type="button" class="btn btn-transparent flex-10" @click="setGoalPrd(6)">+6</button>
							<button type="button" class="btn btn-transparent flex-10" @click="setGoalPrd(12)">+12</button>
							<button type="button" class="btn btn-navy flex-10" @click="setGoalPrd(0)">clear</button>
						</div>
						<div class="form-group flex-gap-10" style="justify-content: left">
							<label class="width-100">label 4:</label>
							<input class="width-100" type="number" id="aply_rate" value="3" placeholder="3" v-model="info.aply_rate" />
						</div>
						<div class="form-group flex-gap-10" style="justify-content: left;position: relative;">
							<label class="width-100">label 6:</label>
							<input type="date" value="2024-01-01" class="width-200" id="date" v-model="info.date" />
							<button type="button" style="position:absolute;right: 0;bottom:10px;height: 50px;" class="btn btn-red" @click="prcCalc()">CALCULATE</button>
						</div>
					</div>
				</div>
				<div class="right-middle">
					<ul class="nav">
						<li class="nav-tab active">nav</li>
					</ul>		
				</div>
				<div class="right-bottom flex-100 flex">
					<div class="column-group  data-display ">
						<div class="column-group flex-column flex-33 flex-gap-10" style="margin-bottom:30px ;" >
							<div class="form-group">
								<label class="width-100">amt:</label>
								<input class="form-control" id="tot_dpst_amt" v-model="info.tot_dpst_amt" disabled />
							</div>
							<div class="form-group gap">
								<label class="width-100">dps_int:</label>
								<input class="form-control" id="tot_dpst_int" v-model="info.tot_dpst_int" disabled />
							</div>
							<div class="form-group">
								<label class="width-100">rcv_amt:</label>
								<input class="form-control" id="bfo_rcve_amt" v-model="info.bfo_rcve_amt" disabled />
							</div>
							<div class="form-group">
								<label class="width-100">tax_amt:</label>
								<input class="form-control" id="int_tax_amt" v-model="info.int_tax_amt" disabled />
							</div>
							<div class="form-group">
								<label class="width-100">rcv_amt:</label>
								<input class="form-control" id="atx_rcve_amt" v-model="info.atx_rcve_amt" disabled />
							</div>
			
						</div>
					</div>	
					<div class="column-group flex-33">
						<div style="top: -40px; right: 10px; position: absolute;">
							<button type="button"  class="btn btn-blue" @click="save()">save</button>
							<button type="button"  class="btn btn-blue" @click="save()">close</button>
						</div>
						<div style="border: 1px solid #CCCCCC;">
							<table class="table table-bordered datatable dataTable" id="grid_app">
								<thead>
									<tr class="replace-inputs">
										<th style="width: 10%;" class="center">one</th>
										<th style="width: 23%;" class="center">two</th>
										<th style="width: 23%;" class="center">three</th>
										<th style="width: 21%;" class="center">four</th>
										<th style="width: 23%;" class="center">five</th>
									</tr>
								</thead>
								<tbody id="grid_tbody"></tbody>
							</table>			
	
						</div>
					</div>
					<div class="flex-33">
						<div class="chart-display" id="chart">
						</div>

					</div>
				</div>
			</div>
			</template>
			</div>
		</div>
		
		<br />
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>

<!-- �˾� -->
<div class="modal fade" id="pop_code">
<template>
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="dataTables_wrapper">					
					<div class="dt-buttons">
						<div>
							<input type="search" id="prod_cd" style="width: 100px;" v-model="prod_cd">
							<input type="search" id="prod_nm" style="width: 250px;" v-model="prod_nm">
							<button type="button" class="btn btn-red" style="margin-left: 5px;" @click="getList">
								�˻�
							</button>
						</div>
					</div>
				</div>
				<div style="height: 400px;overflow: auto;" class="dataTables_wrapper">		
					<table class="table table-bordered datatable dataTable">
						<thead style="position: sticky;top: 0px;">
							<tr>
								<th class="center" style="width: 15%;">��ǰ�ڵ�</th>
								<th class="center" style="width: 55%;">��ǰ��</th>
								<th class="center" style="width: 30%;">���Դ��?</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" @click="selItem(item.prod_cd)" style="cursor: pointer;">
								<td class="center">{{item.prod_cd}}</td>
								<td class="left">{{item.prod_nm}}</td>
								<td class="left">{{item.sbstg_ty_cd_nm}}</td>
							</tr>
						</tbody>
					</table>	
				</div>				
			</div>
		</div>
	</div>
</template>
</div>

</body>
<script>
var vueapp = new Vue({
	el : "#vueapp",
	data : {
		info : {
			prod_cd : "${prod_cd}",
			prod_nm : "${prod_nm}",
			goal_prd : "${goal_prd}",
			circle_acml_amt : "${circle_acml_amt}",
			tot_dpst_amt : "${tot_dpst_amt}",
			tot_dpst_int : "${tot_dpst_int}",
			int_tax_amt : "${int_tax_amt}",
			bfo_rcve_amt : "${bfo_rcve_amt}",
			atx_rcve_amt : "${atx_rcve_amt}",
		},
	},
	mounted : function(){
		if(!cf_isEmpty(this.info.prod_cd)){
			this.getInfo();
		}
	},
	methods : {
		getInfo : function(){
			cf_ajax("/prod_calc/getInfo", this.info, this.getInfoCB);
		},
		getInfoCB : function(data){
			this.info = data;
		},
		save : function(){
			
			if(!confirm("�����Ͻðڽ��ϱ�?")) return;
			
			cf_ajax("/prod_calc/save", this.info, this.saveCB);
		},
		saveCB : function(data){
			alert("����Ǿ����ϴ�?.");
		},
		setCircleAcmlAmt : function(nAmt){
			if(nAmt == 0) {
				this.info.circle_acml_amt = 0;
			}else {
				this.info.circle_acml_amt += nAmt*10000;
			}
		},
		setGoalPrd : function(nPrd){
			if(nPrd == 0) {
				this.info.goal_prd = 0;
			}else {
				this.info.goal_prd += nPrd;
			}
		},
		popupProd : function(){
			$("#pop_code").modal("show");
		},
		prcCalc : function(){
			
			var nRvcy		= this.info.pay_ty_cd; // �����ֱ�
			var nPymAmt		= this.info.circle_acml_amt; // ���Աݾ�
			var nRvpd		= this.info.goal_prd; // ���ԱⰣ
			var nApplItr	= this.info.aply_rate; // ����ݸ�?
			var nIntLvy		= this.info.pay_ty_cd; // ���ڰ���
			
			var nAmt1	= 0;	// ���ӱݾ�
			var nAmt2	= 0;	// �Ѻ��Ա�
			var nAmt3	= 0;	// �����ؿ�����
			var nInt	= 0;	// ����������
			var nTotInt	= 0;	// ��������
			var nTax	= 0;	// ���ڰ���
			
			var html = '';
			for(var i=1; i<=nRvpd; i++) {
				
				if(nRvcy == 1) {
					nAmt1 = nPymAmt;
				} else if(i % nRvcy == 1) {
					nAmt1 = nPymAmt * nRvcy;
				} else {
					nAmt = 0;
				}
				
				nAmt2 += nAmt1;
				nInt = nAmt2 * (nApplItr / 12 / 100);
				nAmt3 = nAmt3 + nAmt1 + nInt;
				nTotInt += nInt;
				
				html += '<tr>';
				html += '<td class="right" style="text-align: right;">' + i + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nAmt1)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nAmt2)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nInt)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nAmt3)) + '</td>';
				html += '</tr>';
			}
			
			if(this.info.int_tax_ty_cd == "1") {		// �Ϲݰ���
				nTax = Math.round(nTotInt * 15.4 / 100);
			} else if(this.info.int_tax_ty_cd == "2") {	// ���ݿ��?
				nTax = Math.round(nTotInt * 9.5 / 100);
			}else {										// �����?
				nTax = 0;
			}
			nAmt3 = Math.round(nAmt3);
			
			this.info.tot_dpst_amt = nAmt2;
			this.info.tot_dpst_int = nTotInt;
			this.info.int_tax_amt = nTax;
			this.info.bfo_rcve_amt = nAmt3;
			this.info.atx_rcve_amt = nAmt3 - nTax;
			$("#grid_tbody").html(html);
			
			// ��Ʈ
			var chart = bb.generate({
                data: {
                    columns: [
                        ["�����հ�"	, nAmt2],
                        ["��������"	, nTotInt],
                        ["�������ɾ�"	, nAmt3],
                        ["���ڰ���"	, nTax],
                        ["���ļ��ɾ�"	, nAmt3 - nTax],
                    ],
                    type: "bar",
                    groups: [
                        []
                    ],
                    order: null
                },
                bindto: "#chart"
            });
			
		},
	}
});

var pop_code = new Vue({
	el : "#pop_code",
	data : {
		dataList : [],
		prod_cd : "",
	},
	mounted : function(){
		this.getList();
	},
	methods : {
		getList : function(){
			this.dataList = [];
			var params = {
				prod_cd : this.prod_cd,
				prod_nm : this.prod_nm,
			}
			
			cf_ajax("/prod_mng/getList", params, function(data){
				pop_code.dataList = data;
			});
		},
		selItem : function(prod_cd){
			
			vueapp.info.prod_cd = prod_cd;
			vueapp.getInfo();
			
			$("#pop_code").modal("hide");
		},
	},
});

</script>

<script>
    // Nav �� Ŭ�� �̺�Ʈ ���?
    document.querySelector('.right-top .nav').addEventListener('click', (e) => {
    	e.target.closest('.nav').querySelectorAll('.nav-tab').forEach((elem) => {
            elem.classList.remove('active');
        });
        e.target.classList.add('active');
    });
    
    function numberFormat(num) {
		num = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return num;
	}
</script>
</html>