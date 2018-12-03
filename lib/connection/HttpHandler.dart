import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sii_patm/utils/settings.dart';
import 'package:sii_patm/models/list.dart';
import 'package:sii_patm/models/kardex.dart';
import 'package:sii_patm/models/studentMatter.dart';
import 'package:sii_patm/models/student.dart';

class HttpHandler{

  static String nombre = "";
  Future<dynamic> getLogin(String url) async {

    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});
    Map<String, dynamic> user = json.decode(response.body);
    return json.decode(response.body);

  }

  /**
   * Carga datos de la lista. (Cursos que esta tomando el alumno y sus profesores)
   */
  Future<dynamic> getLista(String url) async{
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});
    return json.decode(response.body);
  }

  Future<List<Lista>> fetchLista(String url){
    return getLista(url).then((data) => data['lista'].map<Lista>((item) => new Lista.fromJson(item)).toList());
  }

  /**
   * Carga datos StudentMatter (Materia alumnos)
   */
  Future<dynamic> getStudentMatter(String url) async{
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    return json.decode(response.body);
  }

  Future<List<StudentMatter>> fetchStudentMatter(String url){
    return getStudentMatter(url).then((data) => data['studentmatter'].map<StudentMatter>((item) => new StudentMatter.fromJson(item)).toList());
  }

  /**
   * Carga datos del kardex
   */
  Future<dynamic> getKardex(String url) async{
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});
    return json.decode(response.body);
  }

  Future<List<Kardex>> fetchKardex(String url){
    return getKardex(url).then((data) => data['kardex'].map<Kardex>((item) => new Kardex.fromJson(item)).toList());
  }

  Future<dynamic> getStudent(String url) async{
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});
    return response.body.toString();
  }

  Future cargaLista(url) async{
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.get(url, headers: {'authorization': basicAuth});

    //Lista lista = new Lista.fromJson(json.decode(response.body));
    //print("---------------------->"+lista.periodo);
    print("---------------------->"+response.body);
  }

  /**
   * Actualizacion de datos
   */
  Future putStudent(String url, String data) async{
    print(data);
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.put(url, headers: {'authorization': basicAuth, "Content-Type" : "application/json"}, body: data);
    print(response.statusCode);
    Settings.statusCode = response.statusCode;
  }

  Future postMatter(String url, String data) async{
    print(data);
    String basicAuth = 'Basic ' + base64Encode(utf8.encode(Settings.username+":"+Settings.password));
    http.Response response = await http.post(url, headers: {'authorization': basicAuth, "Content-Type" : "application/json"}, body: data);
    print(response.statusCode);
    Settings.statusCode = response.statusCode;
  }

}