import 'package:components/common/title.dart';
import 'package:components/components/media/model/file_details.dart';
import 'package:components/components/media/service/file_handling_service.dart';
import 'package:flutter/material.dart';

class PickFilesComponent extends StatefulWidget {
  const PickFilesComponent({super.key});

  @override
  State<PickFilesComponent> createState() => _PickFilesComponentState();
}

class _PickFilesComponentState extends State<PickFilesComponent> {
  final FileHandlingService _service = FileHandlingService();
  FileDetailsModel? _singleFile;
  List<FileDetailsModel> _multipleFiles =  [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Files & Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            TitleText("Pick Single File"),
            ElevatedButton(
              onPressed: () async {
                FileDetailsModel? file = await _service.getSingleFile();
                setState(() {
                  _singleFile = file;
                });
              }, 
              child: Text("Pick Single image")
            ),
            TitleText("Shoot from camera"),
            ElevatedButton(
              onPressed: () async {
                FileDetailsModel? file = await _service.getCameraFile();
                setState(() {
                  _singleFile = file;
                });
              }, 
              child: Text("Pick Camera image")
            ),
            TitleText("Pick Multiple Files"),
            ElevatedButton(
              onPressed: () async {
                List<FileDetailsModel> files = await _service.multipleFilesWithDifferentTypes();
                setState(() {
                  _multipleFiles = files;
                });
              }, 
              child: Text("Pick Multiple Files")
            ),
            if(_multipleFiles.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _multipleFiles.length,
                  itemBuilder: (context, index) {
                    return FileDetailsList(file: _multipleFiles[index], service: _service);
                  },
                )
              ),
            if(_singleFile != null)
              Column(
                children: [
                  TitleText("Tab to Open the File"),
                  FileDetailsList(file: _singleFile!, service: _service,),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class FileDetailsList extends StatelessWidget {
  final FileDetailsModel file;
  final FileHandlingService service;
  const FileDetailsList({super.key, required this.file, required this.service});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async => await service.openFile(file.filePath),
      title: TitleText(file.fileName),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Text(file.filePath, style: TextStyle(fontSize: 12, color: Colors.grey),)),
          Text(file.fileSize, style: TextStyle(fontSize: 12, color: Colors.grey),)
        ],
      ),
    );
  }
}