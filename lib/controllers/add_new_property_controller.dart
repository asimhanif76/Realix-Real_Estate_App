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
  RxInt selectedMonth = 8.obs;
  RxBool animateRight = false.obs;
  RxInt selectedDateIndex = 1.obs;
  RxInt selectedTimeIndex = 1.obs;

  RxString month = 'January'.obs;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  RxList<DateTime> daysOfMonth = <DateTime>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _generateDaysOfMonth();
    ever(selectedMonth, (_) {
      _generateDaysOfMonth();
      update(); // if using GetBuilder
    });
  }

  void _generateDaysOfMonth() {
    DateTime now = DateTime.now();
    int totalDays = DateUtils.getDaysInMonth(now.year, now.month);

    daysOfMonth.value = List.generate(totalDays, (index) {
      return DateTime(now.year, selectedMonth.value + 1, index + 1);
    });
  }

  List time = [
    '12:00 AM',
    '12:30 AM',
    '01:00 AM',
    '01:30 AM',
    '02:00 AM',
    '02:30 AM',
    '03:00 AM',
    '03:30 AM',
    '04:00 AM',
    '04:30 AM',
    '05:00 AM',
    '05:30 AM',
    '06:00 AM',
    '06:30 AM',
    '07:00 AM',
    '07:30 AM',
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:30 PM',
    '07:30 PM',
    '08:00 PM',
    '08:30 PM',
    '09:00 PM',
    '09:30 PM',
    '10:00 PM',
    '10:30 PM',
    '11:00 PM',
    '11:30 PM',
  ];
}
