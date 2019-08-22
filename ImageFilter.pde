class ImageFilter implements FilenameFilter {
  public boolean accept(File directory, String fileName) {
    if (fileName.endsWith(".jpg") || fileName.endsWith(".png")){
      return true;
    }
    return false;
  }
}
