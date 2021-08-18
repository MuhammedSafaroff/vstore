abstract class Assets {
  static final images = _Images();
  static final fonts = _Fonts();
}

class _Images {
  static final _basePath = 'assets/images';
  final mail = '$_basePath/mail.svg';
  final facebook = '$_basePath/facebook.svg';
  final instagram = '$_basePath/instagram.svg';
  final twitter = '$_basePath/twitter.svg';
  final whatsapp = '$_basePath/whatsapp.svg';
}

class _Fonts {}
