<p>
	<span class="SuccessMessage" IF="updated">AsiaPayClientPost parameters were successfully changed. Please make sure that the AsiaPayClientPost payment method is enabled on the <a href="admin.php?target=payment_methods">Payment methods</a> page before you can start using it.</span>
</p>

<form action="admin.php" method="POST">

    <input type="hidden" name="target" value="payment_method">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="payment_method" value="{pm.payment_method}">
    
	<p>Use this page to configure your store to communicate with your AsiaPay payment processing gateway. Complete the fields below and press the "Update" button. </p>
    
	For <b>Payment Gateway URL</b>, please use the specific URL from AsiaPay.
    
    <ul>
        <li>
            <b>PayDollar</b>:<br/>
            Live: https://www.paydollar.com/b2c2/eng/payment/payForm.jsp
            <br/>
            Test: https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp
        </li>
        <li>
            <b>PesoPay</b>:<br/>
            Live: https://www.pesopay.com/b2c2/eng/payment/payForm.jsp
            <br/>
            Test: https://test.pesopay.com/b2cDemo/eng/payment/payForm.jsp
        </li>
        <li>
            <b>SiamPay</b>:<br/>
            Live: https://www.siampay.com/b2c2/eng/payment/payForm.jsp
            <br/>
            Test: https://test.siampay.com/b2cDemo/eng/payment/payForm.jsp
        </li>
    </ul>        
    
    <p>For <b>Merchant ID</b>, please specify your PayDollar/PesoPay/SiamPay Merchant ID.</p>
    
    <p>For <b>Secure Hash Secret</b> (optional), You may get this value from PayDollar/PesoPay/SiamPay.</p>
    
    <p>For the <b>Datafeed Feature (a.k.a. Callback/IPN)</b>, You may set the datafeed URL ( {shopURL(#cart.php?target=callback&action=callback&order_id_name=remark#):h} ) on your AsiaPay Merchant Admin Panel > Profile > Profile Settings > Payment Options > Return Value Link (Datafeed)</p>

	<hr/>

  <table border="0" cellspacing="10">
    
        <tr>
            <td valign="top">Payment Gateway URL:</td>
            <td valign="top"><input type="text" name="params[payment_url]" value="{pm.params.payment_url:r}" /></td>
        </tr>
        
        <tr>
            <td valign="top">Merchant ID:</td>
            <td valign="top"><input type="text" name="params[merchant_id]" value="{pm.params.merchant_id:r}" /></td>
        </tr>
        
        <tr>
            <td valign="top">PayType:</td>
            <td valign="top">
                <select name="params[pay_type]">
                    <option value="N" selected="{pm.params.pay_type=#N#}">Normal (Sale)</option>
                    <option value="H" selected="{pm.params.pay_type=#H#}">Hold (Authorize)</option>    
                </select>
            </td>
		</tr>
        
        <tr>
            <td valign="top">PayMethod:</td>
            <td valign="top">
                <select name="params[pay_method]">
                    <option value="ALL" selected="{pm.params.pay_method=#ALL#}">ALL</option>
                    <option value="CC" selected="{pm.params.pay_method=#CC#}">CC</option>   
                    <option value="VISA" selected="{pm.params.pay_method=#VISA#}">VISA</option>
                    <option value="Master" selected="{pm.params.pay_method=#Master#}">Master</option>   
                    <option value="JCB" selected="{pm.params.pay_method=#JCB#}">JCB</option>
                    <option value="AMEX" selected="{pm.params.pay_method=#AMEX#}">AMEX</option>   
                    <option value="Diners" selected="{pm.params.pay_method=#Diners#}">Diners</option>                       
                    <option value="PPS" selected="{pm.params.pay_method=#PPS#}">PPS</option>   
                    <option value="PAYPAL" selected="{pm.params.pay_method=#PAYPAL#}">PAYPAL</option>
                    <option value="CHINAPAY" selected="{pm.params.pay_method=#CHINAPAY#}">CHINAPAY</option>
                    <option value="ALIPAY" selected="{pm.params.pay_method=#ALIPAY#}">ALIPAY</option>
                    <option value="TENPAY" selected="{pm.params.pay_method=#TENPAY#}">TENPAY</option>
                    <option value="99BILL" selected="{pm.params.pay_method=#99BILL#}">99BILL</option>
                    <option value="MEPS" selected="{pm.params.pay_method=#MEPS#}">MEPS</option>                    
                    <option value="SCB" selected="{pm.params.pay_method=#SCB#}">SCB</option>
                    <option value="BPM" selected="{pm.params.pay_method=#BPM#}">BPM</option>
                    <option value="KTB" selected="{pm.params.pay_method=#KTB#}">KTB</option>
                    <option value="UOB" selected="{pm.params.pay_method=#UOB#}">UOB</option>
                    <option value="KRUNGSRIONLINE" selected="{pm.params.pay_method=#KRUNGSRIONLINE#}">KRUNGSRIONLINE</option>   
                    <option value="TMB" selected="{pm.params.pay_method=#TMB#}">TMB</option>   
                    <option value="IBANKING" selected="{pm.params.pay_method=#IBANKING#}">IBANKING</option>   
                    <option value="BancNet" selected="{pm.params.pay_method=#BancNet#}">BancNet</option>   
                    <option value="GCash" selected="{pm.params.pay_method=#GCash#}">GCash</option>   
                    <option value="SMARTMONEY" selected="{pm.params.pay_method=#SMARTMONEY#}">SMARTMONEY</option>   
                </select>
            </td>
        </tr>
        
        <tr>
            <td valign="top">Currency:</td>
            <td valign="top">
                <select name="params[currency]">
                    <option value="344" selected="{pm.params.currency=#344#}">HKD</option>
                    <option value="840" selected="{pm.params.currency=#840#}">USD</option>
                    <option value="702" selected="{pm.params.currency=#702#}">SGD</option>
                    <option value="156" selected="{pm.params.currency=#156#}">CNY (RMB)</option>
                    <option value="392" selected="{pm.params.currency=#392#}">JPY</option>
                    <option value="901" selected="{pm.params.currency=#901#}">TWD</option>
                    <option value="036" selected="{pm.params.currency=#036#}">AUD</option>
                    <option value="978" selected="{pm.params.currency=#978#}">EUR</option>
                    <option value="826" selected="{pm.params.currency=#826#}">GBP</option>
                    <option value="124" selected="{pm.params.currency=#124#}">CAD</option>
                    <option value="446" selected="{pm.params.currency=#446#}">MOP</option>
                    <option value="608" selected="{pm.params.currency=#608#}">PHP</option>
                    <option value="764" selected="{pm.params.currency=#764#}">THB</option>
                    <option value="458" selected="{pm.params.currency=#458#}">MYR</option>
                    <option value="360" selected="{pm.params.currency=#360#}">IDR</option>
                    <option value="410" selected="{pm.params.currency=#410#}">KRW</option>
                    <option value="682" selected="{pm.params.currency=#682#}">SAR</option>
                    <option value="554" selected="{pm.params.currency=#554#}">NZD</option>
                    <option value="784" selected="{pm.params.currency=#784#}">AED</option>
                    <option value="096" selected="{pm.params.currency=#096#}">BND</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <td valign="top">Language:</td>
            <td valign="top">
                <select name="params[language]">
                    <option value="C" selected="{pm.params.language=#C#}">Traditional Chinese</option>
                    <option value="E" selected="{pm.params.language=#E#}">English</option>   
                    <option value="X" selected="{pm.params.language=#X#}">Simplified Chinese</option>
                    <option value="K" selected="{pm.params.language=#K#}">Korean</option>   
                    <option value="J" selected="{pm.params.language=#J#}">Japanese</option>
                    <option value="T" selected="{pm.params.language=#T#}">Thai</option>   
                    <option value="F" selected="{pm.params.language=#F#}">French</option>
                    <option value="G" selected="{pm.params.language=#G#}">German</option>   
                    <option value="R" selected="{pm.params.language=#R#}">Russian</option>
                    <option value="S" selected="{pm.params.language=#S#}">Spanish</option>    
                </select>
            </td>
        </tr>
        
        <tr>
            <td valign="top">Secure Hash Secret (optional):</td>
            <td valign="top">
            	<input type=text name="params[secure_hash_secret]" value="{dialog.pm.params.secure_hash_secret:r}" /><br/>
                Note: SecureHash must be enabled on PayDollar/PesoPay/SiamPay.
            </td>
        </tr>
        
        <tr>
            <td valign="top">Prefix for Order Reference # (optional):</td>
            <td valign="top">
            	<input type=text name="params[prefix]" value="{dialog.pm.params.prefix:r}" /><br/>
                Note: Do not use a dash "-" because the system uses it as a separator between the prefix and the order reference no.
            </td>
        </tr>
        
        <tr>
            <td valign="top" colspan="2">
            	&nbsp;            	            	            	            	                
            </td>
        </tr>
    
        <tr>
            <td valign="top" colspan="2">
                <input type="submit" value=" Update ">
            </td>
        </tr>
        
  </table>

</form>