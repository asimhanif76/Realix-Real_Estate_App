import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/new_property_model.dart';

class AddNewPropertyController extends GetxController {
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  void clearTextFields() {
    streetAddressController.clear();
    unitNumberController.clear();
    cityNameController.clear();
    stateController.clear();
    zipCodeController.clear();
  }

  var property = PropertyModel(
    streetAddress: '',
    city: '',
    state: '',
    zipCode: '',
    timeToSell: '',
    reasonForSelling: '',
    description: '',
    propertyType: '',
    lotSize: 0,
    yearBuilt: 0,
    fullBaths: 0,
    bedrooms: 0,
    monthlyRent: 0,
    securityDeposit: 0,
    phoneNumber: '',
    amenities: [],
  ).obs;

  void varPrint() {
    print("Street: ${property.value.streetAddress}");
    print("City: ${property.value.city}");
    print("State : ${property.value.state}");
    print("Zip Code: ${property.value.zipCode}");
  }

  void updateAddress({
    required String street,
    required String city,
    required String state,
    required String zip,
  }) {
    property.update((val) {
      val!.streetAddress = street;
      val.city = city;
      val.state = state;
      val.zipCode = zip;
    });
  }

  void updateMeeting(DateTime date, String time) {
    property.update((val) {
      val!.meetingDate = date;
      val.meetingTime = time;
    });
  }

  void updateTimeToSell(String value) {
    property.update((val) {
      val!.timeToSell = value;
    });
  }

  void updateReason(String reason) {
    property.update((val) {
      val!.reasonForSelling = reason;
    });
  }

  void updateDescription(String desc) {
    property.update((val) {
      val!.description = desc;
    });
  }

  void updateHomeFacts({
    required String type,
    required double lotSize,
    required int yearBuilt,
    required int fullBaths,
    required int bedrooms,
    required double monthlyRent,
    required double securityDeposit,
  }) {
    property.update((val) {
      val!.propertyType = type;
      val.lotSize = lotSize;
      val.yearBuilt = yearBuilt;
      val.fullBaths = fullBaths;
      val.bedrooms = bedrooms;
      val.monthlyRent = monthlyRent;
      val.securityDeposit = securityDeposit;
    });
  }

  void updateContact(String phone, String? note) {
    property.update((val) {
      val!.phoneNumber = phone;
      val.additionalInfo = note;
    });
  }

  void updateAmenities(List<String> amenitiesList) {
    property.update((val) {
      val!.amenities = amenitiesList;
    });
  }

  RxString selectedState = ''.obs;
}
