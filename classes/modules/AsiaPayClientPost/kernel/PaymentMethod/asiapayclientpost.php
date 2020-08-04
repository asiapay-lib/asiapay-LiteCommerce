<?php
/*
+------------------------------------------------------------------------------+
| LiteCommerce                                                                 |
| Copyright (c) 2003-2007 Creative Development <info@creativedevelopment.biz>  |
| All rights reserved.                                                         |
+------------------------------------------------------------------------------+
| PLEASE READ  THE FULL TEXT OF SOFTWARE LICENSE AGREEMENT IN THE  "COPYRIGHT" |
| FILE PROVIDED WITH THIS DISTRIBUTION.  THE AGREEMENT TEXT  IS ALSO AVAILABLE |
| AT THE FOLLOWING URLs:                                                       |
|                                                                              |
| FOR LITECOMMERCE                                                             |
| http://www.litecommerce.com/software_license_agreement.html                  |
|                                                                              |
| FOR LITECOMMERCE ASP EDITION                                                 |
| http://www.litecommerce.com/software_license_agreement_asp.html              |
|                                                                              |
| THIS  AGREEMENT EXPRESSES THE TERMS AND CONDITIONS ON WHICH YOU MAY USE THIS |
| SOFTWARE PROGRAM AND ASSOCIATED DOCUMENTATION THAT CREATIVE DEVELOPMENT, LLC |
| REGISTERED IN ULYANOVSK, RUSSIAN FEDERATION (hereinafter referred to as "THE |
| AUTHOR")  IS  FURNISHING  OR MAKING AVAILABLE TO  YOU  WITH  THIS  AGREEMENT |
| (COLLECTIVELY,  THE "SOFTWARE"). PLEASE REVIEW THE TERMS AND  CONDITIONS  OF |
| THIS LICENSE AGREEMENT CAREFULLY BEFORE INSTALLING OR USING THE SOFTWARE. BY |
| INSTALLING,  COPYING OR OTHERWISE USING THE SOFTWARE, YOU AND  YOUR  COMPANY |
| (COLLECTIVELY,  "YOU")  ARE ACCEPTING AND AGREEING  TO  THE  TERMS  OF  THIS |
| LICENSE AGREEMENT. IF YOU ARE NOT WILLING TO BE BOUND BY THIS AGREEMENT,  DO |
| NOT  INSTALL  OR USE THE SOFTWARE. VARIOUS COPYRIGHTS AND OTHER INTELLECTUAL |
| PROPERTY  RIGHTS PROTECT THE SOFTWARE. THIS AGREEMENT IS A LICENSE AGREEMENT |
| THAT  GIVES YOU LIMITED RIGHTS TO USE THE SOFTWARE AND NOT AN AGREEMENT  FOR |
| SALE  OR  FOR TRANSFER OF TITLE. THE AUTHOR RETAINS ALL RIGHTS NOT EXPRESSLY |
|                                                                              |
| The Initial Developer of the Original Code is Creative Development LLC       |
| Portions created by Creative Development LLC are Copyright (C) 2003 Creative |
| Development LLC. All Rights Reserved.                                        |
+------------------------------------------------------------------------------+
*/

/* vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */

/**
* This implementation complies the following documentation: <br>
* Cart Payment Routine 2 Specifications (Authorize.net) - <br>
*   http://www.2checkout.com/cart_specs.htm <br>
* 2Checkout MD5 Specifications - <br>
*   http://www.2checkout.com/md5_specs.htm <br>
*
* @package Module_AsiaPayClientPost
* @access public
* @version $Id: asiapayclientpost.php,v 1.20 2007/08/03 09:53:31 alien Exp $
*/
class PaymentMethod_asiapayclientpost extends PaymentMethod_credit_card
{
    
    var $configurationTemplate = "modules/AsiaPayClientPost/config.tpl";
	var $formTemplate = "modules/AsiaPayClientPost/checkout.tpl";
	var $processorName = "AsiaPayClientPost";
	var $hasConfigurationForm = true;
	
	/**
	* Overridden function of class PaymentMethod_credit_card
	*/
    function handleRequest($cart) {
		
		$this->processAsiaPayCallback($cart);
		
    }
	
	/**
	* Function for Datafeed/Callback/IPN
	*/
	function processAsiaPayCallback($cart) {		
		/**
		* Parameters from AsiaPay
		*/
		$successCode = isset($_POST['successcode']) ? $_POST['successcode'] : "" ;
		$src = isset($_POST['src']) ? $_POST['src'] : "" ;
		$prc = isset($_POST['prc']) ? $_POST['prc'] : "" ;
		$ref = isset($_POST['Ref']) ? $_POST['Ref'] : "" ;
		$payRef = isset($_POST['PayRef']) ? $_POST['PayRef'] : "" ;
		$ord = isset($_POST['Ord']) ? $_POST['Ord'] : "" ;		
		$cur = isset($_POST['Cur']) ? $_POST['Cur'] : "" ;
		$amt = isset($_POST['Amt']) ? $_POST['Amt'] : "" ;
		$payMethod = isset($_POST['payMethod']) ? $_POST['payMethod'] : "" ;
		$holder = isset($_POST['Holder']) ? $_POST['Holder'] : "" ;
		$authId = isset($_POST['AuthId']) ? $_POST['AuthId'] : "" ;
		$payerAuth = isset($_POST['payerAuth']) ? $_POST['payerAuth'] : "" ;
		$sourceIp = isset($_POST['sourceIp']) ? $_POST['sourceIp'] : "" ;
		$ipCountry = isset($_POST['ipCountry']) ? $_POST['ipCountry'] : "" ;		
		$secureHash = isset($_POST['secureHash']) ? $_POST['secureHash'] : "" ;
		$panFirst4 = isset($_POST['panFirst4']) ? $_POST['panFirst4'] : "" ;
		$panLast4 = isset($_POST['panLast4']) ? $_POST['panLast4'] : "" ;		
		echo "OK"; 
		
		/**
		* The IF statement assumes successcode/prc/src parameters are unique and can only be from AsiaPay
		*/
		if( $successCode != "" && $prc != "" && $src != "" ){	
		
			$params = $this->get("params");
			$orderStatus = $cart->get("status");		
		
			if ($orderStatus == "I" || $orderStatus == "F") {							
				/**
				* Validate secureHash from AsiaPay 
				*/				
				if( $params["secure_hash_secret"] != "" && $secureHash != "" ){
					if( $this->verifyPaymentDatafeed($src,$prc,$successCode,$ref,$payRef,$cur,$amt,$payerAuth,$params["secure_hash_secret"],$secureHash) == "failed" ){
						echo " - SecureHash validation failed.";
						exit();
					}
				}				
				/**
				* Store Parameters from AsiaPay to be displayed on the order details page
				*/
				if($payMethod != ""){
					$cart->set("details.payMethod", $payMethod);
					$cart->set("detailLabels.payMethod", "Payment Method"); 				
				}
				if($panFirst4 != "" && $panLast4 != ""){
					$cart->set("details.maskedCardNo", $panFirst4 . "********" . $panLast4);
					$cart->set("detailLabels.maskedCardNo", "Card/Account");
				}				
				if($holder != ""){
					$cart->set("details.holder", $holder);
					$cart->set("detailLabels.holder", "Holder Name"); 
				}	
				if($payRef != ""){
					$cart->set("details.payRef", $payRef);
					$cart->set("detailLabels.payRef", "Payment Reference Number"); 
				}
				if($ord != ""){
					$cart->set("details.ord", $ord);
					$cart->set("detailLabels.ord", "Bank Reference Number"); 
				}
				if($authId != ""){
					$cart->set("details.authId", $authId);
					$cart->set("detailLabels.authId", "Approval Code");					
				}
				if($sourceIp != ""){
					$cart->set("details.sourceIp", $sourceIp);
					$cart->set("detailLabels.sourceIp", "Source IP");					
				}
				if($ipCountry != ""){
					$cart->set("details.ipCountry", $ipCountry);
					$cart->set("detailLabels.ipCountry", "IP Country");					
				}
				
				if($successCode == "0"){
					/**
					* Set to P if the payment is successful at the AsiaPay side
					*/
					$cart->set("status", "P");
					$cart->update();
					echo " - Order status updated to \"P.\"";
				}else{					
					/**
					* Set to F if the payment is unsuccessful at the AsiaPay side
					*/					
					$cart->set("status", "F");
					$cart->update();
					echo " - Order status updated to \"F.\"";
				}
			}else{
				/**
				* Unable to update status as it is NOT in "I" or "F"
				*/
				echo " - Unable to update order status. Status is NOT \"I.\" or \"F.\"";
			}
		}		
	}
	
	/**
	* Function for generating the order reference number based from Prefix + Order Id
	*/
	function generateOrderRef($merchantReferenceNumber) {
		$params = $this->get("params");
		if($params["prefix"] != ""){
			$buffer = $params["prefix"] . '-' . $merchantReferenceNumber;
		}else{
			$buffer = $merchantReferenceNumber;
		}
		return $buffer;
	}
	
	/**
	* Function for generating the secureHash to be sent to AsiaPay
	*/
	function generatePaymentSecureHash($merchantReferenceNumber, $amount) {		
		$params = $this->get("params");
		$buffer = $params["merchant_id"] . '|' . $this->generateOrderRef($merchantReferenceNumber) . '|' . $params["currency"] . '|' . $amount . '|' . $params["pay_type"] . '|' . $params["secure_hash_secret"];
		return sha1($buffer);
	}
	
	/**
	* Function for verifying the secureHash sent by AsiaPay
	*/
	function verifyPaymentDatafeed($src, $prc, $successCode, $merchantReferenceNumber, $paydollarReferenceNumber, $currencyCode, $amount, $payerAuthenticationStatus, $secureHashSecret, $secureHash) {		
		$buffer = $src . '|' . $prc . '|' . $successCode . '|' . $merchantReferenceNumber . '|' . $paydollarReferenceNumber . '|' . $currencyCode . '|' . $amount . '|' . $payerAuthenticationStatus . '|' . $secureHashSecret; 
		$verifyData = sha1($buffer);		
		echo " [$buffer][$verifyData][$secureHash]";
		if ($secureHash == $verifyData) { 
			return "success"; 
		}else{
			return "failed";
		}
	}

}
// WARNING :
// Please ensure that you have no whitespaces / empty lines below this message.
// Adding a whitespace or an empty line below this line will cause a PHP error.
?>