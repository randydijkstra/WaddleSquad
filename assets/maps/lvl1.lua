return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 9,
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
      height = 9,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 53, 54, 55, 56, 57, 58, 59, 60,
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
      height = 9,
      visible = true,
      opacity = 1,
      properties = {
        ["water"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
      height = 9,
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
      properties = {
        ["iglo"] = "iglo"
      },
      objects = {
        {
          name = "iglo",
          type = "iglo",
          shape = "rectangle",
          x = 1079.52,
          y = 383.369,
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
          y = 378,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 83,
          y = 429.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 146.667,
          y = 432,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 208,
          y = 433.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 276,
          y = 429.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 340,
          y = 429.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 472,
          y = 426.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 529.333,
          y = 426.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 592,
          y = 426.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 718.667,
          y = 426.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 781.333,
          y = 378.667,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 854.667,
          y = 432,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 918.667,
          y = 429.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 1038.67,
          y = 429.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 405.333,
          y = 557.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvloksmall",
          type = "sneeuwvloksmall",
          shape = "rectangle",
          x = 658.667,
          y = 557.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 104,
          visible = true,
          properties = {
            ["sneeuwvloksmall"] = "sneeuwvloksmall"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 322.667,
          y = 373.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 518.667,
          y = 376,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        },
        {
          name = "sneeuwvlokbig",
          type = "sneeuwvlokbig",
          shape = "rectangle",
          x = 965.333,
          y = 385.333,
          width = 0,
          height = 0,
          rotation = 0,
          gid = 102,
          visible = true,
          properties = {
            ["sneeuwvlokbig"] = "sneeuwvlokbig"
          }
        }
      }
    }
  }
}
