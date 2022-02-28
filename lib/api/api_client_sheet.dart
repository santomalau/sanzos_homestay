import 'package:gsheets/gsheets.dart';

class ApiClientSheet {
  static const credentials = r''' 
  {
    "type": "service_account",
    "project_id": "sanzoshomestay",
    "private_key_id": "9f8d16187b4cc66516893b160b77a8c678194ad6",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCjaItjEn9oUQGQ\nPlNC8j+BJS//HzygS9tib5fS0aS+PISt9acyMhV0zfsiHZ4iXbXBwejkInfO9D30\nMIdjyS5Yd9RSTudgnH+OvT56JwNv6EPkdreRU9wFqP6ybtPIQgkBNKfw5BoUnN5x\nzp3ts5v+WeWKxZZnoqE0fh3DO4wFP5YD2ueRWD5pHXzLpC2IQhz+AuYxCqf2y47t\n4roiNIVmho34iuKbsfOqlFSvt4OUGciBwQxMpHI87e8WPJkRGlDJ7olHYAZwrKFg\n2EJWxb3Odaqb7BV3UqQ5gqBlqMNu728WaazSUzB6tZhDUrb4qS5p4nyB2XpmXUEg\n58vlq6VZAgMBAAECggEABzFZH1eHWatlJvkDV7lLj873/aIdnE2yfrL8SxiUyJXn\n3jNntGcteBqAASiuFwOqdjinnHEi9m5cUsUXFI6ctmKx6xyThTZmS/1rBFv2xASE\nhoguPNyk3O/rJCYKNvCnLlEnykv0FO+xv+8xFu82wNuqpbDcVbv8HhAmFbunhmyL\nxN7EVuc577fu9XDWBLUSuM8JUrOxKvYrVSF2QdlYgdrQeNXR+QQUozmi5pWkO9rB\n4iwWVU4d2P7rpp8PMls1QbqTG6Xrl+vIP0KERCr4EpFY4qEw8vjATsixweQzka+n\nbcK3WjjZcBUqzjvUyZJy0MIey3Rli1dc3ckz+LMqTQKBgQDf1u+Cvs5tViD9M9Sr\n2apSV9tHfbAbiHzk5FarsDa93HEkS1K21ib5jsqBnoma4Nv+m2xytUbiMbDHRX+8\n76Y+sXFa1L3eWnpoqzauahQNVkrjOpAxbVe4h87orB7xdgi0Js0bsLTUAjofX2O6\nmImvAD9WxJ9tfVDpxUSz/EskFQKBgQC64uIDTSy3w+f2AkaDkF40OACbG4k9GobP\n51rnK9p5AbPEW7SmQDmFGLmBwmT3uF31eoLKO1JeGBUvqlaC87FhuboYcSqqX/PG\nt0s6oht4paefHY2JBOHCcqwmEYe8/qCoZXiSYRLjXYR3onOcE4RuHJeg3N5hJnde\nVU7amWK5NQKBgD5QswseHY/Yy4RSGqHhDgawiM5lUlLH86UxYGOZwhOnPCRTh+p4\nwg71zrC5NyvT78r47/8bMmmkVceUNJSfzxNjCOC1m0o8vBlJmQaDZ6Oy41RRKHVq\nMGKiBFtIF7E3IAMvTiioUB85o366aqQ29RWwJvH7+TpdCdqa3Z6R3UVlAoGAPMJk\nzsP5hOlZcd79g+qc5gdLEyKZtNb5+3/xSvUz+2F1S6KxEdgRm1cVgL1tzCgRzCx/\ndzZgKh1UTgHoTHzkL6yNd0Lbpza47+NJvw9TNR9OZunZyTFgILLdiybp5aU3IGiV\nEaoj1O3jkm2rfpPN22rKVU9ZsWYrKu07TNDPiv0CgYAvfoQBrQ54Txzt5bCRPNhs\ndmZAbRSfbI4XXGfDL4VR8EBsFgevWNESEDMgURQ+sV6wKxCfBYFbFFZvdSWJoahx\no//z+GL1iN/SLnPZlP/8AVXlJCsHI179B8vMXCl3s40NejFkBrdvwPD4KjjC9Bcj\nkb/UnyKsEajSa2afrE1oTA==\n-----END PRIVATE KEY-----\n",
    "client_email": "sanzos-homestay@sanzoshomestay.iam.gserviceaccount.com",
    "client_id": "106341207016047846470",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sanzos-homestay%40sanzoshomestay.iam.gserviceaccount.com"
  }
  ''';
  static const spreadsheetId = '10H_6nc-qDke38PgnVQdGfclqGlF_PHTbO2wR7pAYpN8';

  static Future<Worksheet> getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
