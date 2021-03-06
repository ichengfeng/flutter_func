import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_func/network/network.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

String _networkEnvKey = 'network_env_key';
String _networkProxyKey = 'network_proxy_key';

class NetworkEnvRoute extends StatefulWidget {
  const NetworkEnvRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkEnvState();
  }
}

class _NetworkEnvState extends State<NetworkEnvRoute> {
  Future<String> _getEnv() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_networkEnvKey) ?? 'dev';
  }

  _getNetworkEnv(void Function() callback) {
    if (NetworkEnv().initialized) {
      callback();
    } else {
      NetworkEnv().addListener(() {
        callback();
      });
    }
  }

  String _env = 'dev';

  bool _localProxy = false;

  @override
  void initState() {
    super.initState();
    _getNetworkEnv(() {
      setState(() {
        _env = NetworkEnv().current;
        _localProxy = NetworkEnv().openProxy;
      });
    });
  }

  _changeEnv(BuildContext context, String env) {
    setState(() {
      _env = env;
      network.cancel(force: true);
      Provider.of<NetworkEnv>(context, listen: false).env = env;
      network.resetBaseUrl();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);

    ButtonStyle buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent));

    Widget selected = Image.asset(
      'images/publish/icon_selected_red@3x.png',
      width: 18,
      height: 18,
    );
    selected = Padding(
      padding: const EdgeInsets.only(right: 6),
      child: selected,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('????????????'),
        actions: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '??????????????????:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333)),
            ),
          ),
          StatefulBuilder(builder: ((context, setState) {
            return Switch(
                value: _localProxy,
                onChanged: (on) {
                  setState(() {
                    _localProxy = !_localProxy;
                    NetworkEnv().openProxy = _localProxy;
                    Fluttertoast.showToast(
                        msg: _localProxy ? '?????????????????????' : '?????????????????????');
                  });
                });
          }))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    _changeEnv(context, 'dev');
                  },
                  style: buttonStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_env == 'dev') selected,
                      Text(
                        '[dev] https://shequ-dev.xinc818.com',
                        style: textStyle,
                      )
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    _changeEnv(context, 'gray');
                  },
                  style: buttonStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_env == 'gray') selected,
                      Text(
                        '[gray] https://shequ-gray.xinc818.com',
                        style: textStyle,
                      )
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    _changeEnv(context, 'daily');
                  },
                  style: buttonStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_env == 'daily') selected,
                      Text(
                        '[daily] https://shequ-daily.xinc818.com',
                        style: textStyle,
                      )
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    _changeEnv(context, 'mock');
                  },
                  style: buttonStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_env == 'mock') selected,
                      Text(
                        '[mock] http://127.0.0.1:4523/mock/968685',
                        style: textStyle,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class NetworkEnv with ChangeNotifier {
  String _env = 'dev';

  /// ???????????????????????????
  bool _openProxy = false;

  set openProxy(bool value) {
    if (_openProxy == value) return;
    _openProxy = value;
    SharedPreferences.getInstance().then((pre) {
      pre.setBool(_networkProxyKey, _openProxy);
    });
    if (_openProxy) {
      if (_localIp.isEmpty) {
        _getLocalAddress((address) {
          _localIp = address;
        });
      }
    }
  }

  bool get openProxy => _openProxy;

  String _localIp = '';

  /// ??????IP
  String get localIp => _localIp;

  bool _changed = false;

  /// ?????????????????????
  bool get changed => _changed;

  void closeChange() => _changed = false;

  bool _initialized = false;

  /// ?????????????????????
  bool get initialized => _initialized;

  NetworkEnv._instance() {
    if (kReleaseMode) {
      _initialized = true;
      return;
    }
    debugPrint('??????????????????????????????...');
    SharedPreferences.getInstance().then((pre) {
      final saved = pre.getString(_networkEnvKey) ?? _defaultEnv;
      _changed = saved != _env;
      // env = saved;
      _env = saved;
      debugPrint('?????????????????????$_env');
      network.resetBaseUrl();
      _openProxy = pre.getBool(_networkProxyKey) ?? _defaultProxy;
      debugPrint('?????????${_openProxy ? "??????" : "??????"} ');
      if (_openProxy) {
        _tryConnectLocalProxy((success) {
          if (success) {
            debugPrint('??????????????????8888?????????????????????');
            _getLocalAddress((address) {
              _localIp = address;
              debugPrint('dio?????????????????????');
              _setInitializeFinished();
            });
          } else {
            _localIp = '';
            debugPrint('??????????????????8888????????????????????????????????????????????????????????????????????????dio??????');
            Fluttertoast.showToast(
              msg: '????????????8888????????????????????????charles????????????????????????????????????dio??????',
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
            );
            _setInitializeFinished();
          }
        });
      } else {
        _setInitializeFinished();
      }
    });
  }

  void _setInitializeFinished() {
    _initialized = true;
    notifyListeners();
  }

  void _tryConnectLocalProxy(void Function(bool success) callback) {
    if (!_openProxy) return;
    callback(true);
    return;
    //  bool refused = false;
    // final testDio = Dio();
    // testDio.get('http://127.0.0.1:8888').catchError((e, _) {
    //   if (e is DioError) {
    //     debugPrint('+++++++++++Connection refused');
    //     refused = true;
    //     return Response(requestOptions: e.requestOptions);
    //   } else {
    //     return Response(requestOptions: RequestOptions(path: 'http://127.0.0.1:8888'));
    //   }
    // });

    // Future.delayed(const Duration(milliseconds: 300), () {
    //   debugPrint('+++++++++++Test connect proxy callback [${!refused}]');
    //   testDio.close(force: true);
    //   callback.call(!refused);
    // });
  }

  void _getLocalAddress(void Function(String address) callback) {
    String _address = '';
    NetworkInterface.list(includeLoopback: false, type: InternetAddressType.any)
        .then((List<NetworkInterface> interfaces) {
      InternetAddress address = interfaces.first.addresses.first;
      _address = address.address;
      // for (var interface in interfaces) {
      //   if (interface.name == 'en0') {
      //     InternetAddress address = interface.addresses.first;
      //     _address = address.address;
      //     break;
      //   }
      // }
      debugPrint('????????????IP???$_address');
      callback.call(_address);
    });
  }

  static final NetworkEnv _manager = NetworkEnv._instance();
  factory NetworkEnv() => _manager;

  set env(String value) {
    if (value == _env) return;
    _env = value;
    _changed = true;
    network.resetBaseUrl();
    SharedPreferences.getInstance().then((pre) {
      pre.setString(_networkEnvKey, _env);
      notifyListeners();
    });
  }

  /// ???????????????
  String get current => _env;

  String get _defaultEnv => 'mock';
  bool get _defaultProxy => true;
}
