import 'package:flip_coin/app/core/custom/app_button.dart';
import 'package:flip_coin/app/core/custom/text.dart';
import 'package:flip_coin/app/core/extensions/context_extension.dart';
import 'package:flip_coin/app/core/helper_function/helper_function.dart';
import 'package:flip_coin/app/core/theme/app_palette.dart';
import 'package:flip_coin/app/features/cart/presentation/widgets/address_list.dart';
import 'package:flip_coin/app/features/cart/presentation/widgets/billing_details.dart';
import 'package:flip_coin/app/features/cart/presentation/widgets/cart_widget.dart';
import 'package:flip_coin/app/features/home/presentation/widgets/product_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, String>> addressList = [
    {
      "label": "Home",
      "address":
      "Dharmendra Kumar, 4 489, ChaCha cycle store, Vibhav Khand, Gomti Nagar, Lucknow",
      "phone": "9847858536",
      "distance": "16.48 km away",
    },
    {
      "label": "Work",
      "address":
      "Times value, Central academy, Sector 9, Indira Nagar, Lucknow",
      "phone": "9876543241",
      "distance": "18.93 km away",
    },
    {
      "label": "Other",
      "address":
      "53/Aawdh bihar, Indira Nagar, Near BD Palace, Harihar Nagar, Lucknow",
      "phone": "6473829292",
      "distance": "19.1 km away",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: true,
      bottomNavigationBar: checkoutWidget(),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppPaletteLight.secondaryLight,
                AppPaletteLight.background,
                AppPaletteLight.background,
                AppPaletteLight.background,
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: boxShadow(),
                      color: AppPaletteLight.background),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        DesignConfiguration.setSvgPath('sel_home'),
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivering to Home",
                              style: context.themeData.textTheme.bodyMedium
                                  ?.copyWith(
                                  fontSize: 14.0,
                                  color: AppPaletteLight.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Dharmendra Kumar, 4 484,Gomti Nagar Lucknow",
                              style: context.themeData.textTheme.bodyMedium
                                  ?.copyWith(
                                  fontSize: 12.0,
                                  color: AppPaletteLight.textColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Change",
                          style: context.themeData.textTheme.bodyMedium
                              ?.copyWith(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              color: AppPaletteLight.greenColor,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () =>
                            showAddressBottomSheet(context, addressList),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CartWidget(),
                const SizedBox(
                  height: 20,
                ),
                ProductList(
                  sectionTitle: texts.alsoLike,
                  seeAll: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const BillingDetails(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: boxShadow(),
                      color: AppPaletteLight.gray.withOpacity(0.20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cancellation Policy",
                        style: context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 16.0,
                            color: AppPaletteLight.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Order cannot be cancelled once packed for delivery. In case of unexpected delays, a refund will be provided, if applicable.",
                        style: context.themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 12.0,
                            color: AppPaletteLight.textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkoutWidget() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: AppPaletteLight.primary,
        boxShadow: boxShadow(
          color: AppPaletteLight.greenColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "₹6,371",
                textAlign: TextAlign.start,
                maxLines: 1,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  color: AppPaletteLight.background,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "TOTAL",
                textAlign: TextAlign.start,
                maxLines: 1,
                style: context.themeData.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: AppPaletteLight.background,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            height: 38,
            padding: EdgeInsets.only(left: 12, right: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppPaletteLight.background),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Place Order",
                  style: context.themeData.textTheme.labelLarge?.copyWith(
                      fontSize: 16.0, color: AppPaletteLight.textColor),
                ),
                const Icon(
                  size: 25,
                  Icons.arrow_right,
                  color: AppPaletteLight.textColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAddressBottomSheet(
      BuildContext context, List<Map<String, String>> addresses) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.blue.shade50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Adjusts the height to 70% of the screen
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select address',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppPaletteLight.background),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: AppPaletteLight.textColor,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Add New Addresses',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              fontSize: 14,
                              color: AppPaletteLight.greenColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppPaletteLight.textColor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your saved addresses',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    final address = addresses[index];
                    return AddressList(
                      label: address['label']!,
                      address: address['address']!,
                      phone: address['phone']!,
                      distance: address['distance']!,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 8);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
