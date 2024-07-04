[app]

# (str) 应用名称
title = Snake Game

# (str) 应用包名
package.name = snakegame

# (str) 应用版本（必须以x.x.x的格式）
version = 1.0.0

# (str) 应用作者
package.author = Your Name

# (str) 应用描述
package.description = A simple Snake game built with Python and Kivy

# (list) 应用图标文件路径（可以添加多个）
source.include_exts = py,png,jpg,kv,atlas
source.include_patterns = assets/*,*.png,*.jpg,*.atlas
icon.filename = assets/icon.png

# (list) 应用依赖项（需要在Python中使用import导入的库）
requirements = python3,kivy

# (str) 打包后的APK文件名称
package.domain = org.snakegame
package.source_dir = .

# (str) 主文件
source.dir = .

# (str) 应用入口点（Python文件的相对路径）
source.main.filename = main.py

# (bool) 是否压缩Python源代码（默认为True）
source.zipapp = False

# (str) 要排除的文件或目录（相对路径）
#exclude =

# (list) 需要额外复制的文件或目录
#presplash.filename = %(source.dir)s/data/presplash.png
#icon.filename = %(source.dir)s/data/icon.png
#xml.filename = %(source.dir)s/data/*.kv
#include.python=python3

# (bool) 是否将Python打包为Cython扩展（默认为False）
#cython.minify = False

# (list) 需要预安装的APK的其他依赖项
#android.add_libs = libs/foo.so:libfoo

# (list) Android权限
#android.permissions = INTERNET

# (list) 需要链接的库文件
#android.arch = armeabi-v7a

# (list) Android属性
#android.entrypoint = org.myapp.PythonActivity
#android.app_process = org.renpy.android.PythonProxy
#android.ndk_path = /opt/android-ndk

# (bool) 是否为Android安装包添加扩展
#android.add_jars = foo.jar

# (list) 需要排除的Android依赖项
#android.gradle_dependencies = 'com.android.support:support-v4:27.1.0'

# (bool) 是否将Android应用编译为可调试版本
#android.debug = True
