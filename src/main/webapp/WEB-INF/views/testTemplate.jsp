<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
/* Clearfix */
.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
	}
* html .clearfix             { zoom: 1; } /* IE6 */
*:first-child+html .clearfix { zoom: 1; } /* IE7 */

/* General */
body {
  background-color: #f3f3f3;
  color: #000;
  padding: 50px 0;
}

/* Trolley content - Product listing */
#ct-content {
	width: 320px;
	margin: 0 auto;
	clear: both;
	padding: 20px;
	background-color: #ffffff;
	opacity: 1;
	
	-webkit-transition: all 400ms linear;
	-moz-transition: all 400ms linear;
	-ms-transition: all 400ms linear;
	-o-transition: all 400ms linear;
	transition: all 400ms linear;
		
}
  #ct-content h1 {
    text-align: center;
  }
	#ct-content .unitPrice {
		display: none;
	}

	/* Product Item */
	#ct-content .prodListDisplay {
		max-height: 60px;
		-webkit-transition: max-height 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-moz-transition: max-height 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-ms-transition: max-height 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-o-transition: max-height 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		transition: max-height 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);

		transition-delay: 500ms;
		-webkit-transition-delay: 500ms; /* Safari */

	}
	#ct-content .product-box {
		position: relative;
		width: 100%;
		margin: 0;
		padding: 0;
		border-left: none;
		color: #436D6B;
		border-bottom: #d3d3d3 1px solid;
		min-height: 32px;
		height: auto !important;
		height: 32px;
		overflow: hidden;
	}
#ct-content .prodListDisplay:last-child .product-box {
	border: none;
}
	#ct-content .product-box .productItem {
		padding: 10px 0 8px 0;
	}
	#ct-content .product-box .productTitle {
		float: left;
		display: inline;
		width: 170px;
		margin: 0;
		min-height: inherit;
		margin: 0;
		color: #262626;
	}
		#ct-content .product-box .product-url {
			font-size: .75em;
			line-height: 1.25em;
			margin: 0;
			color: #262626;
			font-weight: bold;
		}
		#ct-content .productTitle h3 {
			margin: 0;
			position: relative;
		}
		#ct-content .product-box p {
			margin: 0;
		}
	
	#ct-content .purchaseBlock {
		float: right;
		width: 125px;
		min-height: inherit;	
	}
		#ct-content .priceBlock {
			float: left;
			display: inline;
			width: 50px;
			text-align: right;
			margin-right: 5px;
		}
			#ct-content .product-box .price {
				display: block;
				font-size: .923em;
				padding-top: 6px;
				color: #4c4c4c;
				font-weight: bold;
			}
			#ct-content .productInput {
				margin-right: 10px;
				display: inline;
				float: left;
			}
			#ct-content .productInput input {
				width: 36px;
				color: #4c4c4c;
				font-weight: bold;
				margin: 0;
				padding: 0;
				text-align: center;
				width: 40px;
				height: 26px;
				border: 1px solid #ccc;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
				border-radius: 5px;
			}
		#ct-content .ct-removeSingle {
			display: block;
			float: right;
			width: 18px;
			height: 18px;
			overflow: hidden;
			text-indent: -9999em;
			margin-top: 5px;
		}
		#ct-content .ct-removeSingle .ico {
			display: block;
			margin: 5px 0 0 9px;
			width: 9px;
			height: 9px;
			background: url(https://ihatetomatoes.net/assets/ico_delete.png) no-repeat 0 0;
		}
		#ct-content .btn-update .btn-grey {
			display: none;
		}	
	
	
/* Trolley confirmation - remove all pruducts */
	/* Center content vertically */
	.centerContent {
		display: table;
		table-layout: fixed;
		width: 100%;
		height: 100%;
		overflow: hidden;
		position: relative;
	}
	.centerContentInner {
		margin: 0 auto;
		display: table-cell;
		vertical-align: middle;
		text-align: left;
		padding: 0 22px 0 32px;
	}
	.ct-buttons {
		padding: 0 20px;
	}
		.ct-buttons a {
			display: block;
			margin-bottom: 20px;
			text-align: center;
			padding: 9px 24px;
		}
		.ct-buttons a span {
			padding: 0;
		}
		.btn-grey,
		.btn-red  {
			font-size: .8125em;
			color: #ffffff;
			font-weight: normal;
			cursor: pointer;
			position: relative;
			display: inline-block;
			min-height: 22px;
			margin: 0 0 0 8px;
			padding: 0 6px 1px 6px;
			text-decoration: none;
			line-height: 22px;
			border: none;
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			text-align: center;
		}
		
	.btn-grey {background: #5a5a5a;}
    .btn-grey:hover {background: #222222;}
	
	/* Inline buttons - Used in Remove single product */
	.ct-buttons.ct-inline-buttons {
		display: block;
		float: right;
		padding: 0;
	}

	.ct-inline-buttons .ct-singleRemoveCancel {margin-left: 0;}
	.ct-inline-buttons .ct-singleRemoveOK {margin-right: 11px;}
	
/* Trolley confirmation - remove single pruduct */
.ct-confirmation-single {
	width: 100%;
	height: 100%;
	background-color: #ffe7e7;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	opacity: 1;

	-webkit-transition: all 400ms linear;
	-moz-transition: all 400ms linear;
	-ms-transition: all 400ms linear;
	-o-transition: all 400ms linear;
	transition: all 400ms linear;
	
	-webkit-transform: translate3d(0, 100%, 0);
	-moz-transform: translate3d(0, 100%, 0);
	-ms-transform: translate3d(0, 100%, 0);
	-o-transform: translate3d(0, 100%, 0);
	transform: translate3d(0, 100%, 0);
	
}
	.no-csstransforms3d .ct-confirmation-single {
		display: none;
	}
	
	/* Animation In */
	.trolley-conf-single-in .ct-confirmation-single,
	.trolley-conf-single-in .productItem {
	
		-webkit-transform: translate3d(0, 0, 0);
		-moz-transform: translate3d(0, 0, 0);
		-ms-transform: translate3d(0, 0, 0);
		-o-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);

		-webkit-transition: -webkit-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-moz-transition: -moz-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-ms-transition: -ms-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-o-transition: -o-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		transition: transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
	}
	.trolley-conf-single-in .productItem {
		-webkit-transform: translate3d(0, -100%, 0);
		-moz-transform: translate3d(0, -100%, 0);
		-ms-transform: translate3d(0, -100%, 0);
		-o-transform: translate3d(0, -100%, 0);
		transform: translate3d(0, -100%, 0);
	}
	.no-csstransforms3d .trolley-conf-single-in .ct-confirmation-single { 
		display: block; 
	}
	.no-csstransforms3d .trolley-conf-single-in .productItem { display: none; }
	
	/* Animation Out */
	.trolley-conf-single-out .ct-confirmation-single,
	.trolley-conf-single-out .productItem {
	
		-webkit-transform: translate3d(0, 100%, 0);
		-moz-transform: translate3d(0, 100%, 0);
		-ms-transform: translate3d(0, 100%, 0);
		-o-transform: translate3d(0, 100%, 0);
		transform: translate3d(0, 100%, 0);

		-webkit-transition: -webkit-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-moz-transition: -moz-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-ms-transition: -ms-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-o-transition: -o-transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		transition: transform 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
	}
	.trolley-conf-single-out .productItem {
		-webkit-transform: translate3d(0, 0, 0);
		-moz-transform: translate3d(0, 0, 0);
		-ms-transform: translate3d(0, 0, 0);
		-o-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);
	}
	.no-csstransforms3d .trolley-conf-single-out .ct-confirmation-single { display: none; }
	.no-csstransforms3d .trolley-conf-single-out .productItem { display: block; }

	/* Remove Product */
	.trolley-remove-product .productItem {
		visibility: hidden;
	}
	.trolley-remove-product .product-box {
		border-color: #f3f3f3 !important;
	}
	.trolley-remove-product .ct-confirmation-single {
		
		opacity: 0;

		-webkit-transform: translate3d(0, 0, 0);
		-moz-transform: translate3d(0, 0, 0);
		-ms-transform: translate3d(0, 0, 0);
		-o-transform: translate3d(0, 0, 0);
		transform: translate3d(0, 0, 0);

		-webkit-transition: opacity 400ms linear;
		-moz-transition: opacity 400ms linear;
		-ms-transition: opacity 400ms linear;
		-o-transition: opacity 400ms linear;
		transition: opacity 400ms linear;	
	}
	.trolley-remove-product.prodListDisplay {
		max-height: 0px !important;
		
		-webkit-transition: all 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-moz-transition: all 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-ms-transition: all 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		-o-transition: all 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);
		transition: all 400ms cubic-bezier(0.645, 0.045, 0.355, 1.000);

	}
	.no-csstransitions .trolley-remove-product.prodListDisplay,
	.no-csstransitions .trolley-remove-product .ct-confirmation-single { display: none; }
	
.ct-confirmation-single .centerContentInner {
	padding: 0 24px 0 11px;
}
	/* Confirmation */
	.ct-confirmation-single p {
		line-height: 22px;
	}
	.ct-confirmation-single .ct-removeSingleConfirmation {
		color: #ed1c24;
	}
	</style>
</head>
<body>
<div id="ct-content">

	<h1>My Shopping Cart</h1>
	
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>		
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->  
	
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
	  
	<div class="prodListDisplay">
									
	  <div class="product-box">			   
	    <form action="">		   
	
	      <div class="productItem clearfix">
	
	        <div class="productTitle">
	          <h3>
	            <span class="product-url">
	              Another Product
	            </span>	
	          </h3>
	
	        </div><!-- /.productTitle -->
	
	        <div class="purchaseBlock clearfix">	
	
	          <div class="productInput">
	            <input name="quantity" type="number" value="1" title="Quantity for Another Awesome Product">
	          </div>
	
	          <div class="priceBlock">
	
	            <span class="price currency">
	              <small>$</small>456.32
	            </span>
	
	          </div>
	
	          <a href="#" role="link" class="ct-removeSingle">
	            <span class="ico">Remove</span>
	          </a>
	
	        </div><!-- /.purchaseBlock -->
	
	      </div><!-- /.productItem -->
	
	      <!-- Remove Single Product Confirmation -->
	      <div class="ct-confirmation-single">
	        <div class="centerContent">
	          <div class="centerContentInner">
	            <p class="ct-removeSingleConfirmation clearfix">
	              <span class="message">Remove this item?</span>
	              <span class="ct-buttons ct-inline-buttons">
	                <button class="btn-red ct-singleRemoveOK">OK</button>
	                <button class="btn-grey ct-singleRemoveCancel">Cancel</button>
	              </span>
	            </p>
	
	          </div>
	        </div>
	      </div><!-- /.remove Confirmation -->
	
	    </form>
	
	  </div><!-- /.product-box -->
	
	</div><!-- /.prodListDisplay -->
  
</div>
<script>
$(document).ready(function() {

	$window = $(window);
	$body = $('body');
	
	// Show confirmation for Remove Single Product
	$(".ct-removeSingle").on( "click", function(event) {
		event.preventDefault();
		$(this).parents('form').removeAttr('class').addClass('trolley-conf-single-in');
	});

	// Hide confirmation for Remove Single Product
	$(".ct-singleRemoveCancel").on( "click", function(event) {
		event.preventDefault();
		$(this).parents('form').removeAttr('class').addClass('trolley-conf-single-out');
	});
	
	// Remove Single Product
	$(".ct-singleRemoveOK").on( "click", function(event) {
		event.preventDefault();
		$(this).parents('form').removeAttr('class');
		$(this).parents('.prodListDisplay').addClass('trolley-remove-product');
	});
  
});
</script>
</body>
</html>