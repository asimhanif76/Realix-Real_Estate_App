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

  List<PropertyModel> addedProperties = [
    PropertyModel(
      streetAddress: "123 Main Street",
      city: "Los Angeles",
      state: "California",
      zipCode: "90001",
      timeToSell: "Within 3 months",
      reasonForSelling: "Relocating to a new city",
      description:
          "A beautiful 3-bedroom family house located near downtown. Recently renovated and well-maintained.",
      propertyType: "Single Family Home",
      lotSize: 3500.0,
      yearBuilt: 2010,
      fullBaths: 2,
      bedrooms: 3,
      monthlyRent: 3200.0,
      securityDeposit: 1500.0,
      phoneNumber: "+1 310 123 4567",
      amenities: [
        "Swimming Pool",
        "Gym",
        "Garage",
        "WiFi",
        "CCTV",
      ],
    ),
    PropertyModel(
      streetAddress: "123 Main Street",
      city: "Los Angeles",
      state: "California",
      zipCode: "90001",
      timeToSell: "Within 3 months",
      reasonForSelling: "Relocating to a new city",
      description:
          "A beautiful 3-bedroom family house located near downtown. Recently renovated and well-maintained.",
      propertyType: "Single Family Home",
      lotSize: 3150.0,
      yearBuilt: 2010,
      fullBaths: 4,
      bedrooms: 3,
      monthlyRent: 2500.0,
      securityDeposit: 1500.0,
      phoneNumber: "+1 310 123 4567",
      amenities: [
        "Swimming Pool",
        "Gym",
        "Garage",
        "WiFi",
        "CCTV",
      ],
    )
  ];

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

  void updatePropertyType({
    required String type,
  }) {
    property.update((val) {
      val!.propertyType = type;
    });
  }

  void updateHomeFacts({
    required double lotSize,
    required int yearBuilt,
    required int fullBaths,
    required int bedrooms,
    required double monthlyRent,
    required double securityDeposit,
  }) {
    property.update((val) {
      val!.lotSize = lotSize;
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

      print('Phone Number IS ${val.phoneNumber}');
      print(val.additionalInfo);
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
  RxInt selectedDateIndex = 2.obs;
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

  RxString timePeriodForSell = ''.obs;
  RxInt selectedPeriod = 0.obs;

  List sellingPeriod = [
    'Within 3 days',
    'Within 1 week',
    'Within 1 month',
    'Within 2 months',
    'In more than 3 months',
    'I’m not sure',
  ];

  TextEditingController otherReasonController = TextEditingController();
  TextEditingController finishedSqFtController = TextEditingController();
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController yearBuiltController = TextEditingController();
  TextEditingController bedroomsController = TextEditingController();
  TextEditingController fullBathsController = TextEditingController();
  TextEditingController securityDepositController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  void clearHomeFactsFields() {
    finishedSqFtController.clear();
    lotSizeController.clear();
    yearBuiltController.clear();
    bedroomsController.clear();
    fullBathsController.clear();
    securityDepositController.clear();
    monthlyRentController.clear();
  }

  RxString reasonForSelling = ''.obs;
  RxInt reasonSellingIndex = 0.obs;

  List reasonSelling = [
    'Upgrading my home',
    'Selling secondary home',
    'Relocating',
    'Downsizing my home',
    'Retiring',
    'Other',
  ];

  TextEditingController discriptionController = TextEditingController();

  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  var selectedCountry = <String, dynamic>{
    'name': 'pk',
    'code': '+92',
    'image': 'assets/images/icons/pakistan.png',
  }.obs;

  void printCountry() {
    print(selectedCountry['name']);
    print(selectedCountry['code']);
    print(selectedCountry['image']);
  }

  RxList<String> facilities = <String>[
    'Free WiFi',
    'Pool',
    'Apartment',
    'Air Conditioning',
    'Spa',
    'View',
    'Elevator',
    'Garage Spots',
    'Gym',
    'Balcony',
    'Furnished',
    'Pet Friendly',
    'Security',
    'Garden',
    'Smart Home',
    'Fireplace',
    'Washer/Dryer',
    'Play Area',
    'Private Entrance',
    'Gated Community',
    'BBQ Area',
    'Dishwasher',
    'Heated Floors',
    'Storage Space',
    'Rooftop Access',
    'Concierge',
  ].obs;

  RxList<String> selectedFacilities = <String>[].obs;
}
