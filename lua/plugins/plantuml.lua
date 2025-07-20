return {
  {
    "aklt/plantuml-syntax",
    "weirongxu/plantuml-previewer.vim",
    dependencies = { "tyru/open-browser.vim" },
    ft = { "plantuml" },
    config = function()
      -- 设置 PlantUML jar 路径（请根据实际路径修改）
      vim.g["plantuml_previewer_plantuml_jar_path"] = "/usr/share/plantuml/plantuml.jar"
      -- 设置 Java 命令
      vim.g["plantuml_previewer_plantuml_jar_args"] = "-Dfile.encoding=UTF-8"
      -- 自动打开预览
      vim.g["plantuml_previewer_auto_start"] = 1
      -- 保存时自动刷新
      vim.g["plantuml_previewer_auto_refresh"] = 1
    end,
  },
}
