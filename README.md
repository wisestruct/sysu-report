# 上海交通大学硕士学位论文 typst-sjtu-thesis-master

上海交通大学硕士学位论文的 Typst 模板，能够简洁、快速、持续生成 PDF 格式的毕业论文，基于研究生院提供的 [word 模板](https://www.gs.sjtu.edu.cn/post/detail/Z3M2MjU=) 进行开发。

## 使用

快速浏览效果: 查看 [main.pdf](https://github.com/tzhTaylor/typst-sjtu-thesis-master/blob/main/main.pdf)，样例论文源码：查看 [main.typ](https://github.com/tzhTaylor/typst-sjtu-thesis-master/blob/main/main.typ)

### VS Code 本地编辑（推荐）

1. 克隆本项目。

```bash
git clone https://github.com/tzhTaylor/typst-sjtu-thesis-master.git
```

2. 在 VS Code 中打开该目录。

3. 在 VS Code 中安装 [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 和 [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) 插件。前者负责语法高亮和错误检查等功能，后者负责预览。

4. 最后打开 `main.typ` 文件，按下 `Ctrl + K V`(Windows) / `Command + K V`(MacOS) 或者是点击右上角的按钮进行实时编辑和预览。

### Web App 在线编辑

因为该模板还未上传至[Typst Universe](https://typst.app/universe)，所以在 Web App 使用还是比较麻烦。这里是我创建的一个[样例](https://typst.app/project/wYnH2Tr13z69dtVI-2Rr-Q)，供大家预览和试编辑，真正使用还是请选择 VS Code 本地编辑。

**注意：Web App 并没有安装本地 Windows 或 MacOS 所拥有的字体，所以字体上存在差异！**

## 现存问题

因为该模板是我心血来潮以学习 Typst 为目的开发的，开发时间较短，存在**排版不够完美**、**样式和内容混杂**、**代码复用性差**、**缺少注释和文档**、**过多暴露实现细节**等问题。之后会参考[modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis)，实现模块化设计、提高代码封装度，达到更易用的程度。

## License

This project is licensed under the MIT License.
