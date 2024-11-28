class EndPoints {
  static String login = 'user/login';
  static String register = 'user/register';
  static String forgotpass = 'user/forgotpassword';
  static String getProfile = 'user/profile';

  static String postUploadProfile = 'user/profile';
  static String repairOrderList = 'user/repairingorders';
  static String getOneRepairOrder = 'user/repairingorders/getone';
  static String repairOrderImage = 'user/repairingorders/upload';
  static String postRepairOrder = 'user/repairingorders/save';
  static String sampleOrderImage = 'user/sampleorders/upload';
  static String postSampleOrder = 'user/sampleorders/save';
  static String sampleOrderHistory = 'user/sampleorders';
  static String getOneSampleOrder = 'user/sampleorders/getone';

  static String postOrderHistory = 'user/orders/history';
  static String postOrderGetOne = 'user/orders/getone';
}
