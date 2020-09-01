# PayDollar/PesoPay/SiamPay Payment plugin for LiteCommerce
Use PayDollar/PesoPay/SiamPay plugin for LiteCommerce to offer ALL payments option.

## Download
Please download the latest plugin version. [Download](https://github.com/asiapay-lib/asiapay-LiteCommerce/releases/latest)

## Integration
The plugin integrates LiteCommerce with PayDollar/PesoPay/SiamPay payment gateway with All payment method.

## Requirements
This plugin supports LiteCommerce version 2.2.

## Installation
1.	Login to your LiteCommerce Administrator Zone. E.g. (http://www.yoursite.com/admin.php)
2.	After login, go to left sidebar  on ***Settings > Modules***.
3.	Browse for the Module (AsiaPayClientPost_add-on-2.0.tar) and click install.
4.	After Installation, click the **“Payment method setup page”** link.
5.	Set the module configurations

## Setup the Datafeed URL on PayDollar/PesoPay/SiamPay
 1. Login to your PayDollar/PesoPay/SiamPay account.
 2. After login, Go to left sidebar on Profile > Profile Settings > Payment Options.
 3. Click the “Enable” radio and set the datafeed URL on “Return Value Link” and click the “Update” button. The datafeed URL should be like this:http://www.yoursite.com/cart.php?target=callback&action=callback&order_id_name=remark
 4. On the confirmation page, review your changes then click the “Confirm button”.

 ## Documentation
[LiteCommerce documentation](https://github.com/asiapay-lib/asiapay-LiteCommerce/blob/master/AsiaPay%20PayGate%20Integration%20Guide%20-%20For%20LiteCommerce%202.2.%20module%20using%20CPTB.doc?raw=true)

## Support
If you have a feature request, or spotted a bug or a technical problem, create a GitHub issue. For other questions, contact our [Customer Service](https://www.paydollar.com/en/contactus.html).

## License
MIT license. For more information, see the LICENSE file.
