return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 27,
  height = 15,
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
      firstgid = 58,
      tilewidth = 50,
      tileheight = 50,
      spacing = 0,
      margin = 0,
      image = ".assets/sprites/special/Sneeuwvlok-big-spreadsheet.png",
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
    },
    {
      name = "Background02",
      firstgid = 152,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Background02.png",
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
      name = "Full-Background02",
      firstgid = 202,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "assets/sprites/tiles/Full-Background02.png",
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
      width = 27,
      height = 15,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        152, 152, 153, 154, 152, 152, 153, 154, 155, 156, 152, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 152, 153, 154, 155, 156, 157,
        152, 153, 154, 155, 156, 157, 158, 159, 160, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 153, 154, 155, 156, 157,
        152, 153, 154, 155, 156, 157, 152, 152, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 161, 161, 161, 152, 153, 154, 155, 156, 157,
        152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 152, 153, 154, 155, 156, 157, 152, 153, 154, 155, 156, 157,
        152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 152, 152, 153, 154, 155, 156, 157,
        162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 162, 163, 164, 165, 166, 167, 168,
        172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 172, 173, 174, 175, 176, 177, 178,
        182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 182, 183, 184, 185, 186, 187, 188,
        202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 202, 203, 204, 205, 206, 207, 208,
        212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 212, 213, 214, 215, 216, 217, 218,
        222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 222, 223, 224, 225, 226, 227, 228,
        232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 232, 233, 234, 235, 236, 237, 238,
        202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 202, 203, 204, 205, 206, 207, 208,
        212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 212, 213, 214, 215, 216, 217, 218,
        222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 222, 223, 224, 225, 226, 227, 228
      }
    },
    {
      type = "tilelayer",
      name = "Terrain",
      x = 0,
      y = 0,
      width = 27,
      height = 15,
      visible = true,
      opacity = 1,
      properties = {
        ["Hard"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 7, 5, 0, 0, 0, 10, 7, 7, 7,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 5, 8, 0, 0, 0, 0, 10, 5, 8, 8, 8, 8,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5, 8, 8, 8, 8, 8, 8,
        0, 0, 0, 10, 7, 7, 5, 0, 0, 0, 10, 7, 5, 0, 0, 0, 10, 7, 5, 8, 8, 8, 8, 8, 8, 8, 8,
        7, 7, 5, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
        8, 8, 8, 8, 8, 8, 8, 0, 0, 0, 8, 8, 8, 0, 0, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
      }
    },
    {
      type = "tilelayer",
      name = "Death",
      x = 0,
      y = 0,
      width = 27,
      height = 15,
      visible = true,
      opacity = 1,
      properties = {
        ["water"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          name = "iglo",
          type = "iglo",
          shape = "rectangle",
          x = 1505.33,
          y = 512.333,
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
          x = 17.3333,
          y = 748,
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
          x = 453.667,
          y = 697,
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
          x = 513.667,
          y = 697,
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
          x = 581.667,
          y = 695.667,
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
          x = 837.667,
          y = 697,
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
          x = 900.333,
          y = 699.667,
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
          x = 964.333,
          y = 697,
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
          x = 1285.67,
          y = 498.333,
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
          x = 144,
          y = 682.667,
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
          x = 1108,
          y = 690.667,
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
          x = 782.667,
          y = 549.333,
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
          x = 1106.67,
          y = 484,
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
          x = 1488,
          y = 494.667,
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
          x = 903,
          y = 565,
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
          x = 1145.67,
          y = 445,
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
          x = 5.66667,
          y = 637,
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
          x = 272,
          y = 678.667,
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
          x = 340,
          y = 680,
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
          x = 512.333,
          y = 621,
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
