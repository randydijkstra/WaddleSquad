return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 8,
  tilewidth = 64,
  tileheight = 64,
  properties = {},
  tilesets = {
    {
      name = "Sprite-Sheet-Terrain-64x64",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Sprite-Sheet-Terrain-64x64.png",
      imagewidth = 640,
      imageheight = 64,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      tiles = {}
    },
    {
      name = "Iglo",
      firstgid = 11,
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
      name = "64px-Background-Pastel02",
      firstgid = 12,
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
      name = "Background01",
      firstgid = 52,
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
    },
    {
      name = "Sneeuwvlok-big-spreadsheet",
      firstgid = 102,
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
      firstgid = 104,
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
      tiles = {
        {
          id = 0,
          properties = {
            ["sneeuwvlok"] = "sneeuwvlok"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Achtergrond",
      x = 0,
      y = 0,
      width = 20,
      height = 8,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 53, 54, 55, 56, 57, 58, 59,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61,
        62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,
        72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81,
        82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91,
        92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101,
        44, 45, 46, 47, 48, 49, 50, 51, 44, 45, 46, 47, 48, 49, 50, 51, 44, 45, 46, 47,
        44, 45, 46, 47, 48, 49, 50, 51, 44, 45, 46, 47, 48, 49, 50, 51, 44, 45, 46, 47
      }
    },
    {
      type = "tilelayer",
      name = "Tilelaag 2",
      x = 0,
      y = 0,
      width = 20,
      height = 8,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "HardLayer",
      x = 0,
      y = 0,
      width = 20,
      height = 8,
      visible = true,
      opacity = 1,
      properties = {
        ["Hard"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 5,
        1, 3, 4, 4, 4, 5, 0, 3, 4, 5, 0, 3, 4, 4, 4, 4, 4, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      name = "Objectlaag 1",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "iglo",
          type = "iglo",
          shape = "rectangle",
          x = 1079.52,
          y = 319.369,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 11,
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
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 143,
          y = 314,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 84,
          y = 367,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 15,
          y = 306,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 149,
          y = 366,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 212,
          y = 365,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 275,
          y = 365,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 337,
          y = 363,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 468,
          y = 365,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 532,
          y = 366,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 594,
          y = 364,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 658,
          y = 494,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 403,
          y = 496,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 722,
          y = 367,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 778,
          y = 328,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 914,
          y = 363,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 851,
          y = 365,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1042,
          y = 363,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 523,
          y = 312,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 325,
          y = 313,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {}
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 962,
          y = 312,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
