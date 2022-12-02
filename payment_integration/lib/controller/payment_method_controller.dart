import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import '../config.dart';


class PaymentMethodController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String payment = "razor";
  List paymentMethods = [];
  Map<String, dynamic>? paymentIntentData;
  Razorpay razorpay = Razorpay();
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? checkoutUrl;
  String? executeUrl;
  String? accessToken;
  PaypalServices services = PaypalServices();
  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  // item name, price and quantity
  String itemName = 'iPhone X';
  String itemPrice = '1.99';
  int quantity = 1;

  @override
  void onReady() {
    dynamic data = Get.arguments;
    amountController = data["controller"];
    emailController = data["eController"];
    nameController = data["nController"];
    update();
    Future.delayed(Duration.zero, () async {
      // Paypal Payment Method
      try {
        accessToken = await services.getAccessToken();
      } catch (e) {
       throw Exception("");
      }
    });
    update();
    // TODO: implement onReady
    super.onReady();
  }

  // Loading Stop Method
  onLoadingFalse() {
    isLoading = false;
    update();
  }

  // Loading Start Method
  onLoadingTrue() {
    isLoading = true;
    update();
  }

  // All Payment's Button Method
  payButton() async {
    if (payment == "stripe") {
      stripePayment(amount: amountController.text, currency: 'INR');
    } else if (payment == "razor") {
      openCheckout();
    } else if (payment == "paypal") {
      try {
        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        checkoutUrl = res["approvalUrl"];
        executeUrl = res["executeUrl"];
        update();
        var data = {
          "payment": payment,
          "controller": amountController,
        };
        Get.to(() => PaypalPayment(onFinish: (number) async {
              Get.toNamed(routeName.paymentSuccess, arguments: data);
            }));
      } catch (e) {
        var data = {
          "payment": payment,
          "controller": amountController,
        };
        Get.toNamed(routeName.paymentFailed, arguments: data);
      }
    }
    update();
  }

  // Stripe Payment Method
  Future<void> stripePayment(
      {required String amount, required String currency}) async {
    try {
      onLoadingTrue();
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                merchantDisplayName: 'JUSTIN',
                customerId: paymentIntentData!['customer'],
                paymentIntentClientSecret: paymentIntentData!['client_secret'],
                customerEphemeralKeySecret:
                    paymentIntentData!['ephemeralKey']));
        onLoadingFalse();
        displayPaymentSheet();
      }
    } catch (e) {
      throw Exception("");
    }
    update();
  }

  // Stripe Error handler
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      var data = {
        "payment": payment,
        "controller": amountController,
      };
      Get.toNamed(routeName.paymentSuccess, arguments: data);
    } on Exception {
      var data = {
        "payment": payment,
        "controller": amountController,
      };
      Get.toNamed(routeName.paymentFailed, arguments: data);
    }
    update();
  }

  // Stripe Create payment Method
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51M6vfUSAD9ydEJ0JuQLM88YVQReoYs0FdkmEIK9RaQg95Y84jIPTP5eOFxIiX2eUhj8c22OB2ElJoCjYjt0R5K4i00zmsoHA8K',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception("");
    }
    update();
  }

  // Stripe amount calculate
  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  // Razor Pay Payment Method
  openCheckout() {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_yw7RdKNen8WdHE',
      'amount': int.parse(amountController.text),
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': "test@gmail.com"},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.open(options);
  }

  @override
  void onInit() {
    paymentMethods = appArray.paymentMethod;
    update();
    // TODO: implement onInit
    super.onInit();
  }

  // Razorpay error response
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    var data = {
      "payment": payment,
      "controller": amountController,
    };
    Get.toNamed(routeName.paymentFailed, arguments: data);
  }

  // Razorpay success response
  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    var data = {
      "payment": payment,
      "controller": amountController,
    };
    Get.toNamed(routeName.paymentSuccess, arguments: data);
  }

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  // Paypal Order create method
  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": amountController.text.toString(),
        "currency": defaultCurrency["currency"]
      }
    ];

    // checkout invoice details
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = 'Gulshan';
    String userLastName = 'Yadav';
    String addressCity = 'Delhi';
    String addressStreet = 'Mathura Road';
    String addressZipCode = '110014';
    String addressCountry = 'India';
    String addressState = 'Delhi';
    String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": amountController.text.toString(),
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": amountController.text.toString(),
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": "$userFirstName $userLastName",
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              }
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }
}
