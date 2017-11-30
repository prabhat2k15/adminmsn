<!DOCTYPE html>
<html lang="en" data-textdirection="ltr" class="loading">
  <head>
   {include file="header.tpl"}
  </head>
  <body data-open="click" data-menu="vertical-menu" data-col="2-columns" class="vertical-layout vertical-menu 2-columns  fixed-navbar">

    <!-- navbar-fixed-top-->
   {include file="navbartop.tpl"}

    <!-- ////////////////////////////////////////////////////////////////////////////-->


    <!-- main menu-->
   {include file="navbar.tpl"}
    <!-- / main menu-->

    <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
          <div class="content-header-left col-md-6 col-xs-12 mb-1">
            <h2 class="content-header-title">Invoice </h2>
          </div>
          <div class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-xs-12">
            <div class="breadcrumb-wrapper col-xs-12">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a>
                </li>
                <li class="breadcrumb-item"><a href="#">Invoice</a>
                </li>
                <li class="breadcrumb-item active">Invoice Template
                </li>
              </ol>
            </div>
          </div>
        </div>
        <div class="content-body"><section class="card">
	<div id="invoice-template" class="card-block">
		<!-- Invoice Company Details -->
		<div id="invoice-company-details" class="row">
			<div class="col-md-6 col-sm-12 text-xs-center text-md-left">
				<img src="/src/app-assets/images/logo/modestreet.png" alt="company logo" class=""/>
				<ul class="px-0 list-unstyled">
					<li class="text-bold-800">Modestreet Internet Pvt. Ltd</li>
					<li>C2 Sector 1,</li>
					<li>Noida,</li>
					<li>UP 301201,</li>
					<li>India</li>
				</ul>
			</div>
			<div class="col-md-6 col-sm-12 text-xs-center text-md-right">
				<h2>INVOICE</h2>
				<p class="pb-3"># INV-{$res->order_id}</p>
				<ul class="px-0 list-unstyled">
					<li>Amount</li>
					<li class="lead text-bold-800">&#8377; {$res->totalamount}</li>
				</ul>
			</div>
		</div>
		<!--/ Invoice Company Details -->

		<!-- Invoice Customer Details -->
		<div id="invoice-customer-details" class="row pt-2">
			<div class="col-sm-12 text-xs-center text-md-left">
				<p class="text-muted">Bill To</p>
			</div>
			<div class="col-md-6 col-sm-12 text-xs-center text-md-left">
				<ul class="px-0 list-unstyled">
					<li class="text-bold-800">{$res->user->name}</li>
					<li>[{$res->user->address_type}]{$res->user->address},</li>
					<li>{$res->user->city},</li>
					<li>{$res->user->state}-{$res->user->pincode}.</li>
				</ul>
			</div>
			<div class="col-md-6 col-sm-12 text-xs-center text-md-right">
				<p><span class="text-muted">Invoice Date :</span> {$res->date}</p>
				<p><span class="text-muted">Terms :</span> NA</p>
				<p><span class="text-muted">Due Date :</span> NA</p>
			</div>
		</div>
		<!--/ Invoice Customer Details -->

		<!-- Invoice Items Details -->
		<div id="invoice-items-details" class="pt-2">
			<div class="row">
				<div class="table-responsive col-sm-12">
					<table class="table">
					  <thead>
					    <tr>
					      <th>#</th>
					      <th>Item & Description</th>
					      <th class="text-xs-right">Price</th>
					      <th class="text-xs-right">Qty</th>
					      <th class="text-xs-right">Amount</th>
					    </tr>
					  </thead>
					  <tbody>
            {for $i=0 to (count($res->suborder)-1)}
					    <tr>
					      <th scope="row">{$res->suborder[$i]->suborder_id}</th>
					      <td>
					      	<p>{$res->suborder[$i]->title}</p>
					      	<p class="text-muted">{$res->suborder[$i]->description}</p>
					      </td>
					      <td class="text-xs-right">{$res->suborder[$i]->price}</td>
					      <td class="text-xs-right">{$res->suborder[$i]->qty}</td>
					      <td class="text-xs-right">&#8377; {$res->suborder[$i]->price * $res->suborder[$i]->qty}</td>
					    </tr>

            {/for}
					  </tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 col-sm-12 text-xs-center text-md-left">
					<p class="lead">Payment Methods: Online / Offline</p>
					<div class="row">
						<div class="col-md-8">
						<table class="table table-borderless table-sm">
							<tbody>
								<!-- <tr>
									<td>Bank name:</td>
									<td class="text-xs-right">ABC Bank, USA</td>
								</tr>
								<tr>
									<td>Acc name:</td>
									<td class="text-xs-right">Amanda Orton</td>
								</tr>
								<tr>
									<td>IBAN:</td>
									<td class="text-xs-right">FGS165461646546AA</td>
								</tr>
								<tr>
									<td>SWIFT code:</td>
									<td class="text-xs-right">BTNPP34</td>
								</tr> -->
							</tbody>
						</table>
						</div>
					</div>
				</div>
				<div class="col-md-5 col-sm-12">
					<p class="lead">Total due</p>
					<div class="table-responsive">
						<table class="table">
						  <tbody>
						  	<tr>
						  		<td>Sub Total</td>
						  		<td class="text-xs-right">&#8377; {$res->totalamount}</td>
						  	</tr>
						  	<!--< tr>
						  		<td>TAX (12%)</td>
						  		<td class="text-xs-right">&#8377; {$res->totalamount*12/100}</td>
						  	< /tr> -->
						  	<tr>
						  		<td class="text-bold-800">Total</td>
						  		<td class="text-bold-800 text-xs-right"> &#8377; {$res->totalamount}</td>
						  	</tr>
						  	<tr>
						  		<td>Payment (online)</td>
						  		<td class="pink text-xs-right">(-) &#8377; {$res->amount}</td>
						  	</tr>
						  	<tr class="bg-grey bg-lighten-4">
						  		<td class="text-bold-800">Balance Due(COD)</td>
						  		<td class="text-bold-800 text-xs-right">&#8377; {$res->totalamount-$res->amount}</td>
						  	</tr>
						  </tbody>
						</table>
					</div>
					<div class="text-xs-center">
						<p>Authorized person</p>
						<img src="/src/app-assets/images/pages/signature-scan.png" alt="signature" class="height-100"/>
						<h6>Prabhat Kumar</h6>
						<p class="text-muted">Sales Head</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Invoice Footer -->
		<div id="invoice-footer">
			<div class="row">
				<div class="col-md-7 col-sm-12">
					<h6>Terms & Condition</h6>
					<p>You know, being a test pilot isn't always the healthiest business in the world. We predict too much for the next year and yet far too little for the next 10.</p>
				</div>
				<div class="col-md-5 col-sm-12 text-xs-center">
					<button type="button" class="btn btn-primary btn-lg my-1"><i class="icon-paperplane"></i> Send Invoice</button>
					<button type="button" class="btn btn-primary btn-lg my-1"><i class="icon-paperplane" onclick="prt();"></i> Print</button>
					<script type="text/javascript">function prt(){ window.print();}</script>
				</div>
			</div>
		</div>
		<!--/ Invoice Footer -->

	</div>
</section>
        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->

{include file="footer.tpl"}
  </body>
</html>
