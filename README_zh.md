<div align="center">
  <img id="based_dock_scaffold" width="96" alt="based_dock_scaffold" src="https://raw.githubusercontent.com/Cierra-Runis/based_dock_scaffold/master/.github/icon.svg">
  <p>『 based_dock_scaffold - 来点 Dock 栏！』</p>
  <a href='https://github.com/Cierra-Runis/based_dock_scaffold/blob/master/README.md'>English Readme</a>
</div>

`最后更新于：2023-07-25 23:54:08`

[📚 简介](#-简介)

[📸 示例](#-示例)

[📦 使用方式](#-使用方式)

[⏳ 进度](#-进度)

[📌 注意事项](#-注意事项)

[🧑‍💻 贡献者](#-贡献者)

[🔦 声明](#-声明)

---

# 📚 简介

一个炫酷的有 Dock 栏的 `Scaffold` 组件，可显示类似 iPad 的 Dock 栏

# 📸 示例

![screenshots](.github/screenshot.gif)

# 📦 使用方式

- 将 `based_dock_scaffold` 添加至你的 `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  ...
  based_dock_scaffold: $latest_version
```

- 在 [example](https://github.com/Cierra-Runis/based_dock_scaffold/blob/master/example/lib/main.dart) 查看样例代码

# ⏳ 进度

已完成，按需修改

# 📌 注意事项

- **_不要_** 导入任何在 `src` 文件夹下的文件：

```dart
import 'package:based_dock_scaffold/src/*.dart';
```

- 因为 `BasedDockScaffold` 实际上 **_不是_** 一个 `Scaffold` 组件
  你应该使用 `Scaffold.of(context)` 来获取 `ScaffoldState`
  而不是 `BasedDockScaffold.of(context)`

# 🧑‍💻 贡献者

<a href="https://github.com/Cierra-Runis/based_dock_scaffold/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Cierra-Runis/based_dock_scaffold" />
</a>

# 🔦 声明

[![License](https://img.shields.io/github/license/Cierra-Runis/based_dock_scaffold)](https://github.com/Cierra-Runis/based_dock_scaffold/blob/master/LICENSE)

该项目采用 `MIT` 许可协议，查看 [LICENSE](https://github.com/Cierra-Runis/based_dock_scaffold/blob/master/LICENSE) 以获得更多信息
