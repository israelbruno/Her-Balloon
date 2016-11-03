--calculate the aspect ratio of the device:
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
   content = {
      width = 1080,
      height = 1920,
      scale = "letterbox",
      fps = 60,

      imageSuffix = {
         ["@2x"] = 2.0,
         ["@4x"] = 4.0,
      },
   },
   license = {
      google = {
         key = "reallylonggooglelicensekeyhere",
         policy = "serverManaged", 
      },
   },
}