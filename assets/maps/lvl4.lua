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
      name = "Sprite Sheet Terrain 64x64 squared",
      firstgid = 1,
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
      name = "64px-Background-Pastel02",
      firstgid = 17,
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
      name = "Iglo",
      firstgid = 57,
      tilewidth = 200,
      tileheight = 150,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/_Spreadsheets/Iglo.png",
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
      firstgid = 58,
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
      firstgid = 60,
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
      name = "64px-Background-Underground",
      firstgid = 62,
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
      name = "Background",
      x = 0,
      y = 0,
      width = 23,
      height = 13,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
        111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 102, 103, 104, 105, 102, 103, 104, 105, 106, 107, 108, 109,
        102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 103, 104, 102, 102, 103, 104, 105, 106, 107, 108,
        102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 102, 103, 104, 105, 106, 107, 102, 102, 103, 104, 105, 106, 107,
        112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 112, 113, 114, 115, 116, 117, 118, 102, 103, 104, 112, 113, 114,
        122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122, 123, 124,
        132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132, 133, 62,
        62, 63, 64, 65, 66, 67, 68, 69, 62, 63, 64, 65, 66, 67, 68, 69, 62, 63, 64, 65, 66, 67, 70,
        70, 71, 72, 73, 74, 75, 76, 77, 70, 71, 72, 73, 74, 75, 76, 77, 70, 71, 72, 73, 74, 75, 78,
        78, 79, 80, 81, 82, 83, 84, 85, 78, 79, 80, 81, 82, 83, 84, 85, 78, 79, 80, 81, 82, 83, 86,
        86, 87, 88, 89, 90, 91, 92, 93, 86, 87, 88, 89, 90, 91, 92, 93, 86, 87, 88, 89, 90, 91, 62,
        94, 95, 96, 97, 98, 99, 100, 101, 94, 95, 96, 97, 98, 99, 100, 101, 94, 95, 96, 97, 98, 99, 70,
        62, 63, 64, 65, 66, 67, 68, 69, 62, 63, 64, 65, 66, 67, 68, 69, 62, 63, 64, 65, 66, 67, 78
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 10, 7, 7, 5, 0, 0, 10, 7, 5, 0, 0, 0, 10, 7, 7, 7, 7,
        7, 7, 7, 7, 7, 5, 8, 8, 8, 8, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "Iglo",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "iglo",
          type = "iglo",
          shape = "rectangle",
          x = 1254.67,
          y = 575.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 57,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Points",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 80,
          y = 621.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 144,
          y = 621.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 209.333,
          y = 618.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 272,
          y = 620,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 328,
          y = 548,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 406.667,
          y = 545.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 468,
          y = 545.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 528,
          y = 548,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 592,
          y = 548,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 648.333,
          y = 559.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 711,
          y = 561,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 967,
          y = 558.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 1032.33,
          y = 558.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 1095,
          y = 562.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 840.333,
          y = 506.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 788,
          y = 552,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 853.333,
          y = 550.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 917.333,
          y = 552,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 131,
          y = 562.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
