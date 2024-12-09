import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:file_picker/file_picker.dart' show FileType;

class FileHandler {
  static const String _authenticationEmailKey = "authenticationEmailKey";
  static const String _authenticationPasswordKey = "authenticationPasswordKey";
  static const String _authenticationAccessTokenKey =
      "authenticationAccessTokenKey";
  static const String _authenticationUserIdKey = "authenticationUserIdKey";
  static const String _authenticationRoleKey = "authenticationRoleKey";

  // static Future<bool> get hasAuthDetails async {
  //   var result = await loadAuthDetails();
  //   return result != null;
  // }

  //Login details for both email and password
  static Future<void> saveAuthDetails(Map<String, String>? auth) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(
        _authenticationEmailKey, auth == null ? "" : auth["email"]!);
    await instance.setString(
        _authenticationPasswordKey, auth == null ? "" : auth["password"]!);
  }

  static Future<Map<String, String?>?> loadAuthDetails() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? email = instance.getString(_authenticationEmailKey);
    String? password = instance.getString(_authenticationPasswordKey);
    return {
      "email": email,
      "password": password,
    };
  }

  //Login details for email only
  static Future<void> saveAuthEmail(String? authEmail) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    if (authEmail == null) {
      await instance.remove(_authenticationEmailKey);
    } else {
      await instance.setString(_authenticationEmailKey, authEmail);
    }
  }

  static Future<String?> loadAuthEmail() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? email = instance.getString(_authenticationEmailKey);
    return email;
  }

  //Dashboard Authentication Details
  static Future<void> saveAuthDetailsDashboard(
      Map<String, String>? auth) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(_authenticationAccessTokenKey,
        auth == null ? "" : auth["accessToken"]!);
    await instance.setString(
        _authenticationUserIdKey, auth == null ? "" : auth["userId"]!);
    await instance.setString(
        _authenticationRoleKey, auth == null ? "" : auth["role"]!);
    print("AUths : ${instance.getString(_authenticationAccessTokenKey)}");
  }

  static Future<Map<String, String?>?> loadAuthDetailsDashboard() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? accessToken = instance.getString(_authenticationAccessTokenKey);
    String? userid = instance.getString(_authenticationUserIdKey);
    String? role = instance.getString(_authenticationRoleKey);
    return {"accessToken": accessToken, "userid": userid, "role": role};
  }

  //Others
  static Future<void> saveString(String key, String value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(key, value);
  }

  static Future<String?> loadString(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? value = instance.getString(key);
    return value;
  }

  static Future<void> saveInt(String key, int value) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setInt(key, value);
  }

  static Future<int?> loadInt(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    int? value = instance.getInt(key);
    return value;
  }

  static Future<Uint8List> convertFilePathToUint8List(String path) async =>
      File(path).readAsBytes();

  static Future<List<Uint8List>> convertFilePathsToListOfUint8List(
      List<String> paths) async {
    List<Uint8List> listOfByteData = [];
    for (var path in paths) {
      Uint8List byteData = await convertFilePathToUint8List(path);
      listOfByteData.add(byteData);
    }
    return listOfByteData;
  }

  static List<Uint8List> decodeBase64StringsToListOfUint8List(
      List<String> encodedData) {
    List<Uint8List> listOfByteData = [];
    for (var data in encodedData) {
      listOfByteData.add(base64.decode(data));
    }
    return listOfByteData;
  }

  static Future<String> convertFilePathToBase64String(String path) async {
    Uint8List data = await convertFilePathToUint8List(path);
    return convertUint8ListToBase64String(data);
  }

  static String convertUint8ListToBase64String(Uint8List data) =>
      base64.encode(data);

  static Future<FileResponse?> selectSingleFile({
    List<String> extensions = const [],
    FileType type = FileType.custom,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: type == FileType.custom ? extensions : null,
      type: type,
      allowMultiple: false,
    );
    if (result != null) {
      return _convertPlatformFileToFileResponse(result.files.single);
    }
    return null;
  }

  static Future<List<FileResponse>?> selectMultipleFiles({
    List<String> extensions = const [],
    FileType type = FileType.custom,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: type == FileType.custom ? extensions : null,
      type: type,
      allowMultiple: true,
    );

    if (result != null) {
      List<FileResponse> response = [];
      List<PlatformFile> files = result.files;
      for (PlatformFile file in files) {
        response.add(await _convertPlatformFileToFileResponse(file));
      }
      return response;
    }

    return null;
  }

  static Future<FileResponse> _convertPlatformFileToFileResponse(
      PlatformFile file) async {
    Uint8List data = await convertFilePathToUint8List(file.path!);

    return FileResponse(
      path: file.path!,
      extension: file.extension!,
      filename: file.name,
      size: file.size,
      data: data,
    );
  }
}

class FileResponse {
  String path;
  String filename;
  String extension;
  int size;
  Uint8List data;

  FileResponse({
    this.path = "",
    this.filename = "",
    this.extension = "",
    this.size = 0,
    required this.data,
  });

  @override
  String toString() =>
      "{name: $filename, path: $path, extension: $extension, size: $size}";
}
