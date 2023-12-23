import 'package:flutter/cupertino.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';


class FileDownload extends StatefulWidget {
  const FileDownload({super.key});

  @override
  State<FileDownload> createState() => _FileDownloadeState();
}

class _FileDownloadeState extends State<FileDownload> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  void download( String url){
    FileDownloader.downloadFile(
        url: url,

        onProgress: (fileName, progress) {
          print('file to download $fileName and the progress is $progress');
        },
        onDownloadCompleted: (String path) {
          print('FILE DOWNLOADED TO PATH: $path');
        },
        onDownloadError: (String error) {
          print('DOWNLOAD ERROR: $error');
        });
  }
}
