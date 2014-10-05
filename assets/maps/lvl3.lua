return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 22,
  height = 12,
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
      image = "../../../_Spreadsheets/Terrain/Sprite Sheet Terrain 64x64 squared.png",
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
      image = "../../../_Spreadsheets/Backgrounds/64px-Background-Pastel02.png",
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
      image = "../../../_Spreadsheets/Iglo.png",
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
      image = "../../../_Spreadsheets/Items/Sneeuwvlok-big-spreadsheet.png",
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
      image = "../../../_Spreadsheets/Items/Sneeuwvlok-spreadsheet.png",
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
      image = "../../../_Spreadsheets/Backgrounds/64px-Background-Underground.png",
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
      image = "../../../_Spreadsheets/Backgrounds/Background01.png",
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
      width = 22,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111,
        102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
        102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 102, 103,
        112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 112, 113,
        122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 122, 123,
        132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 132, 133,
        62, 63, 64, 65, 66, 67, 68, 69, 62, 63, 64, 65, 66, 67, 68, 69, 148, 62, 63, 64, 65, 66,
        70, 71, 72, 73, 74, 75, 76, 77, 70, 71, 72, 73, 74, 75, 76, 77, 70, 70, 71, 72, 73, 74,
        78, 79, 80, 81, 82, 83, 84, 85, 78, 79, 80, 81, 82, 83, 84, 85, 78, 78, 79, 80, 81, 82,
        86, 87, 88, 89, 90, 91, 92, 93, 86, 87, 88, 89, 90, 91, 92, 93, 86, 86, 87, 88, 89, 90,
        62, 63, 64, 65, 66, 67, 68, 62, 63, 64, 65, 66, 67, 68, 62, 63, 64, 65, 66, 67, 68, 69,
        70, 71, 72, 73, 74, 75, 76, 70, 71, 72, 73, 74, 75, 76, 70, 71, 72, 73, 74, 75, 76, 77
      }
    },
    {
      type = "tilelayer",
      name = "Death",
      x = 0,
      y = 0,
      width = 22,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {
        ["death"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 4, 4, 4, 4, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Terrain",
      x = 0,
      y = 0,
      width = 22,
      height = 12,
      visible = true,
      opacity = 1,
      properties = {
        ["Hard"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 7, 7,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 5, 0, 0, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 5, 8, 8, 8, 0, 0, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 7, 5, 0, 0, 0, 8, 8, 8, 0, 0, 8, 8,
        5, 0, 0, 0, 0, 10, 7, 5, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 8, 8,
        8, 0, 10, 7, 5, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 8, 8,
        8, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 8, 8
      }
    },
    {
      type = "objectgroup",
      name = "Iglo",
      visible = true,
      opacity = 1,
      properties = {
        ["iglo"] = "iglo"
      },
      objects = {
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 1213.33,
          y = 192.333,
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
      properties = {
        ["Sneeuwvlok"] = "points"
      },
      objects = {
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 17.3333,
          y = 164,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 236,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 14.6667,
          y = 310.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 3,
          y = 415.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 478.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 554.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 212,
          y = 620,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 404,
          y = 554.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 592,
          y = 488,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 660,
          y = 486.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 832.333,
          y = 377,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 977.333,
          y = 301.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 1041.33,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 1104,
          y = 241.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 88,
          y = 513.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 60,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 797.667,
          y = 606.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 1176.33,
          y = 602.333,
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
