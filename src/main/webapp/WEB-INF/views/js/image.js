async function uploadImageToServer(pngImage) {
  var base64Data = {};
  base64Data.userNo = "${dto.userNo}";
  base64Data.base64 = pngImage;
  base64Data.uuid = "";

  var uploadedImageUrl = "";

  try {
    const response = await $.ajax({
      url: "/sderp/imageInsert.do",
      data: base64Data,
      method: "POST",
      dataType: "json",
    });
    if (response.code == 10001) {
      uploadedImageUrl = response.url;
    } else {
      alert("이미지 업로드 실패");
    }
  } catch (e) {
    console.log(e);
    alert("통신 실패");
  }
  return uploadedImageUrl;
}

async function convertAndUploadBase64Image(base64String) {
  var maxWidth = 1920;
  var maxHeight = 1024;

  var img = new Image();
  img.src = "data:image/png;base64," + base64String;

  var width = img.width;
  var height = img.height;

  if (width > maxWidth || height > maxHeight) {
    var ratio = Math.min(maxWidth / width, maxHeight / height);

    var newWidth = Math.floor(width * ratio);
    var newHeight = Math.floor(height * ratio);

    var canvas = document.createElement("canvas");
    canvas.width = newWidth;
    canvas.height = newHeight;
    var context = canvas.getContext("2d");
    context.drawImage(img, 0, 0, newWidth, newHeight);

    var resizedBase64 = canvas.toDataURL("image/png").replace(/^data:image\/png;base64,/, "");
    return await uploadImageToServer(resizedBase64);
  } else {
    return await uploadImageToServer(base64String);
  }
}
