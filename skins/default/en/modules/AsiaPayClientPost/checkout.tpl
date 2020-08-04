<form action="{cart.paymentMethod.params.payment_url}" method="POST" name="asiapayclientpost_form">

<input type="hidden" name="merchantId" 	value="{cart.paymentMethod.params.merchant_id:r}" />
<input type="hidden" name="orderRef" 	value="{cart.paymentMethod.generateOrderRef(cart.order_id)}" />
<input type="hidden" name="amount" 		value="{cart.total}" />
<input type="hidden" name="currCode" 	value="{cart.paymentMethod.params.currency:r}" />
<input type="hidden" name="payType" 	value="{cart.paymentMethod.params.pay_type:r}" />
<input type="hidden" name="payMethod" 	value="{cart.paymentMethod.params.pay_method:r}" />
<input type="hidden" name="lang" 		value="{cart.paymentMethod.params.language:r}" />    
<input type="hidden" name="successUrl" 	value="{shopURL(#cart.php?target=checkout#,config.Security.customer_security)}&amp;action=return&amp;order_id={cart.order_id:r}">
<input type="hidden" name="failUrl" 	value="{shopURL(#cart.php?target=checkout#,config.Security.customer_security)}&amp;action=return&amp;order_id={cart.order_id:r}">
<input type="hidden" name="cancelUrl" 	value="{shopURL(#cart.php?target=checkout#,config.Security.customer_security)}&amp;cancel=true">
<input type="hidden" name="secureHash"	value="{cart.paymentMethod.generatePaymentSecureHash(cart.order_id,cart.total)}">
<input type="hidden" name="remark"		value="{cart.order_id}">
    
<p>By clicking "SUBMIT" you agree with our "Terms &amp; Conditions" and "Privacy statement".<br>
<br>
<input type="submit" value="Submit order">
</form>