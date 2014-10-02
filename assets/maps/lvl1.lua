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
        12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
        12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
        12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
        12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
        20, 21, 22, 23, 24, 25, 26, 27, 20, 21, 22, 23, 24, 25, 26, 27, 20, 21, 22, 23,
        28, 29, 30, 31, 32, 33, 34, 35, 28, 29, 30, 31, 32, 33, 34, 35, 28, 29, 30, 31,
        36, 37, 38, 39, 40, 41, 42, 43, 36, 37, 38, 39, 40, 41, 42, 43, 36, 37, 38, 39,
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
    }
  }
}
