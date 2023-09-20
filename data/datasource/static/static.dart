import 'package:delivery/core/constant/image.dart';
import 'package:delivery/data/model/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "choose your product",
      body: "here you can get\n super affordable products\n with high quality ",
      image: onBoardingImages.choosepic),
  OnBoardingModel(
      title: "safe payment",
      body: "trusted payment method",
      image: onBoardingImages.paypic),
  OnBoardingModel(
      title: "track your order",
      body:
          "track your order\n on google map to check\n the current location\n of your order",
      image: onBoardingImages.trackpic),
  OnBoardingModel(
      title: "Delivery",
      image: onBoardingImages.carpic,
      body: "we deliver your order \n by the fastest way"),
];
