return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 23,
  height = 13,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  tilesets = {
    {
      name = "64px-Background-Pastel02",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/64px-Background-Pastel02.png",
      imagewidth = 512,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "64px-Background-Underground",
      firstgid = 41,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/64px-Background-Underground.png",
      imagewidth = 512,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Sprite Sheet Terrain 64x64 squared",
      firstgid = 81,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Sprite Sheet Terrain 64x64 squared.png",
      imagewidth = 256,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Iglo",
      firstgid = 97,
      tilewidth = 200,
      tileheight = 150,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Iglo.png",
      imagewidth = 200,
      imageheight = 150,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Sneeuwvlok-big-spreadsheet",
      firstgid = 98,
      tilewidth = 50,
      tileheight = 50,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/special/Sneeuwvlok-big-spreadsheet.png",
      imagewidth = 100,
      imageheight = 50,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Sneeuwvlok-spreadsheet",
      firstgid = 100,
      tilewidth = 25,
      tileheight = 25,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/special/Sneeuwvlok-spreadsheet.png",
      imagewidth = 50,
      imageheight = 25,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Background01",
      firstgid = 102,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Background01.png",
      imagewidth = 640,
      imageheight = 320,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Achtergrond",
      x = 0,
      y = 0,
      width = 23,
      height = 13,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        108, 109, 110, 111, 105, 106, 107, 108, 109, 110, 111, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 111, 109,
        110, 111, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 102,
        120, 121, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 112,
        130, 131, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122,
        140, 141, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132,
        47, 48, 41, 42, 43, 44, 45, 46, 47, 48, 41, 42, 43, 44, 45, 46, 47, 48, 41, 42, 43, 44, 45,
        55, 56, 49, 50, 51, 52, 53, 54, 55, 56, 49, 50, 51, 52, 53, 54, 55, 56, 49, 50, 51, 52, 53,
        63, 64, 57, 58, 59, 60, 61, 62, 63, 64, 57, 58, 59, 60, 61, 62, 63, 64, 57, 58, 59, 60, 61,
        71, 72, 65, 66, 67, 68, 69, 70, 71, 72, 65, 66, 67, 68, 69, 70, 71, 72, 65, 66, 67, 68, 69,
        79, 80, 73, 74, 75, 76, 77, 78, 79, 80, 73, 74, 75, 76, 77, 78, 79, 80, 73, 74, 75, 76, 77,
        47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 49, 50, 51, 52, 53, 54, 55, 56, 49, 50, 51, 52, 53,
        55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 57, 58, 59, 60, 61, 62, 63, 64, 57, 58, 59, 60, 61,
        63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 65, 66, 67, 68, 69, 70, 71, 72, 65, 66, 67, 68, 69
      }
    },
    {
      type = "tilelayer",
      name = "Terrain",
      x = 0,
      y = 0,
      width = 23,
      height = 13,
      visible = true,
      opacity = 1,
      properties = {
        ["Hard"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 87, 87,
        87, 87, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 87, 87, 85, 88, 88, 88,
        88, 88, 88, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 88, 88, 88, 88, 88, 88, 88,
        88, 88, 88, 88, 89, 0, 0, 0, 0, 0, 0, 0, 0, 90, 87, 85, 88, 88, 88, 88, 88, 88, 88,
        88, 88, 88, 88, 88, 85, 0, 0, 0, 0, 90, 87, 85, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88,
        88, 88, 88, 88, 88, 88, 0, 90, 87, 85, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88,
        88, 88, 88, 88, 88, 88, 0, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88,
        88, 88, 88, 88, 88, 88, 0, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88
      }
    },
    {
      type = "tilelayer",
      name = "Death",
      x = 0,
      y = 0,
      width = 23,
      height = 13,
      visible = true,
      opacity = 1,
      properties = {
        ["death"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "iglo",
      visible = true,
      opacity = 1,
      properties = {
        ["iglo"] = "iglo"
      },
      objects = {
        {
          name = "iglo",
          type = "iglo",
          shape = "rectangle",
          x = 1280,
          y = 319,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 97,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "sneeuwvlokken",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 82.667,
          y = 365.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 12,
          y = 322.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 98,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 328,
          y = 456,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 98,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 710.667,
          y = 512,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 98,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 210.667,
          y = 434.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 273.333,
          y = 498.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 336,
          y = 564,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 464,
          y = 628,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 598.667,
          y = 622.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 530.667,
          y = 573.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 661.333,
          y = 562.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 784,
          y = 566.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 853.333,
          y = 498.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 978.667,
          y = 490.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 973.333,
          y = 369.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1049.33,
          y = 368,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1168,
          y = 365.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1237.33,
          y = 368,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1104,
          y = 368,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 914.667,
          y = 500,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 100,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        }
      }
    }
  }
}
