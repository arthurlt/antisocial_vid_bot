import 'dart:io';

class ytdlp {
  String? url;
  String? localFile;
  List<String>? arguments;
  static const List<String> defaultArguments = ['--force-overwrites'];
  static const String defaultFile = 'download.mp4';

  ///
  static Future<File> download(
      {required String url,
      String localFile = defaultFile,
      List<String> arguments = defaultArguments}) async {
    List<String> _arguments = [];
    _arguments.addAll(arguments);
    _arguments.add('-o$localFile');
    print('downloading $url with $_arguments');
    _arguments.add(url);
    final result = await Process.run('yt-dlp', _arguments, workingDirectory: '/tmp/');
    print(result.stdout);
    return (File('/tmp/$localFile'));
  }
}
