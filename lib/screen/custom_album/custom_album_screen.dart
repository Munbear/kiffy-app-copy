import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';

class Album {
  String id;

  Album({
    required this.id,
  });
}

class CustomAlbumScreen extends StatefulWidget {
  static String get routeName => "customAlbum";
  static String get routeLocation => "/customAlbum";

  const CustomAlbumScreen({super.key});

  @override
  State<CustomAlbumScreen> createState() => _CustomAlbumScreenState();
}

class _CustomAlbumScreenState extends State<CustomAlbumScreen>
    with WidgetsBindingObserver {
  List<AssetPathEntity>? _paths;
  // 앨범 종류ㅗ
  List<Album> _albums = [];
  //  선택한 이미지
  List<File> selectedImages = [];
  // 선택한 이미지 id
  List<String> selectedImagesId = [];
  // 앨범에서 가져옴 이미지 모음
  late List<AssetEntity> _images;

  int _currentPage = 0;
  // 선택된 앨범
  late Album _currentAlbum;
  // 권한 확인
  Future<void> checkPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      await getAlbum();
    } else {
      print("뭔가 안됨");
      await PhotoManager.openSetting();
    }
  }

  // 갤러리 오픈
  Future<void> getAlbum() async {
    // getAssetsPathList : 모든 파일 정보 불러오기
    print("엘범 가져오기");
    try {
      _paths = await PhotoManager.getAssetPathList(type: RequestType.image);
      // _paths = paths;
      _albums = _paths!.map((e) => Album(id: e.id)).toList();
      await getPhotos(_albums[0], albumChange: true);
      // if (_albums.isNotEmpty) {
      //   await getPhotos(_albums.first, isInitAlbum: true);
      // }
    } catch (e) {
      setState(() {
        _paths = [];
        _images = [];
        _albums = [];
      });
    }
  }

  // 갤러릴 이미지 가져오기
  Future<void> getPhotos(Album album, {bool albumChange = false}) async {
    _currentAlbum = album;
    albumChange ? _currentPage = 0 : _currentPage++;

    final loadImages = await _paths!
        .singleWhere((AssetPathEntity e) => e.id == album.id)
        .getAssetListPaged(
          page: _currentPage,
          size: 20,
        );

    setState(() {
      if (albumChange) {
        _images = loadImages;
      } else {
        _images.addAll(loadImages);
      }
    });

    // final albumImages = await _paths!
    //     .singleWhere((element) => element.id == album.id)
    //     .getAssetListPaged(page: _currentPage, size: 20);

    // if (albumChange) setState(() => _images = albumImages);
    // if (!albumChange) setState(() => _images.addAll(albumImages));
  }

  // // 이미지 지우기
  // void removeImages(imageFile, imageId) async {
  //   // 이미지 삭제
  //   setState(() => selectedImages = [
  //         ...selectedImages.where((element) => element.path != imageFile.path)
  //       ]);
  //   // 이미지 아이디 삭제
  //   setState(() => selectedImagesId = [
  //         ...selectedImagesId.where((element) => element != imageId)
  //       ]);
  // }

  // // 이미지 추가하기
  // void addImages(imageFile, imageId, fileSize) async {
  //   if (fileSize <= 5.0) {
  //     // 이미지 및 이미지 아이디 추가
  //     setState(() => selectedImages = [...selectedImages, imageFile]);
  //     setState(() => selectedImagesId = [...selectedImagesId, imageId]);
  //   }

  //   // if (fileSize > 5.0) {
  //   //   showToast("theImageExceedsMB".tr(), context);
  //   // }
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    checkPermission();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getAlbum();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text("0/5"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: GestureDetector(
                onTap: () {
                  // 나가기
                  // context.pop(selectedImages);
                },
                child: Text("complete"),
              ),
            ),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          final scrollPixels =
              scroll.metrics.pixels / scroll.metrics.maxScrollExtent;
          // 스크롤 70%센트 내려 갔을때 갤러리 이미지 더 불러옴
          if (scrollPixels > 0.7) getPhotos(_currentAlbum);
          return false;
        },
        child: SafeArea(
          child: _paths == null
              ? Center(child: CircularProgressIndicator())
              : _images.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AllowAccessToAllPhotosForEasyUpload',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          GestureDetector(
                            onTap: () => PhotoManager.openSetting(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('enableNotifications'),
                                const SizedBox(width: 10),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : GridView(
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      children: _images.map((image) {
                        return GestureDetector(
                          onTap: () async {
                            // 파일 사이즈 변환
                            // final convertMB =
                            //     ((await image.originBytes)?.length ?? 0) /
                            //         (1024 * 1024);

                            // image.file;
                            // .then(
                            //   (value) {
                            //     // 파일로 변환
                            //     final imageFile = File(value!.path);

                            //     // 중목 체크 확인
                            //     bool constainFile = selectedImages.any(
                            //         (element) =>
                            //             element.path == imageFile.path);

                            //     // 배열에서 이미지 삭제
                            //     if (constainFile) {
                            //       removeImages(imageFile, image.id);
                            //     }

                            //     // 중복 이미지가 없고 배열의 길이가 5개 이하 일때 이미지 추가하기
                            //     if (!constainFile &&
                            //         selectedImages.length < 5) {
                            //       addImages(imageFile, image.id, convertMB);
                            //     }

                            //     // 5MB 이상
                            //     if (selectedImages.length == 5) {
                            //       showToast("youCanAttachUpToFiveImages".tr(),
                            //           context);
                            //     }
                            //   },
                            // );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // AssetEntity(
                              //   key: ValueKey(image.id),
                              //   image,
                              //   isOriginal: false,
                              //   fit: BoxFit.cover,
                              // ),
                              // FutureBuilder<File?>(
                              //     future: image.file,
                              //     builder: (context, snapshot) {
                              //       if (snapshot.data != null) {
                              //         return Image.file(
                              //           snapshot.data!,
                              //           fit: BoxFit.cover,
                              //         );
                              //       } else {
                              //         return Container();
                              //       }
                              //     }),
                              FutureBuilder<Uint8List?>(
                                  future: image.thumbnailData,
                                  builder: (context, snapshot) {
                                    if (snapshot.data != null) {
                                      return Image.memory(snapshot.data!);
                                    } else {
                                      return Container();
                                    }
                                  }),
                              // // 선택된 이미지 체크 UI
                              // if (selectedImagesId
                              //     .any((element) => element == image.id))
                              //   Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 5, vertical: 4),
                              //     color: Colors.black.withOpacity(0.2),
                              //     child: Align(
                              //       alignment: Alignment.bottomRight,
                              //       child: SizedBox(child: Icon(Icons.check)),
                              //     ),
                              //   ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
        ),
      ),
    );
  }
}
