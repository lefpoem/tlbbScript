变量 线程ID
//从这里开始执行
功能 执行()
    //从这里开始你的代码
结束
//启动_热键操作
功能 启动_热键()
    线程ID = 线程开启("执行", "")
结束
//终止热键操作
功能 终止_热键()
    线程关闭(线程ID)
结束
功能 按钮0_点击()
    //激活选项卡0的第2个tab页面
    选项卡激活("任务", 4)
结束
功能 小值_初始化()
    设置托盘("小值", 真)
    //设置托盘气泡("开始运行","小值")
    配置文件路径 = 系统获取进程路径() & "Config.ini"
    读辅助配置()
结束
功能 按钮_保存_点击()
    写辅助配置()
结束
变量 配置文件路径, 游戏账号, 游戏密码, 游戏区服, 游戏路径, 游戏服务器下标, 游戏服务器
功能 写辅助配置()
    配置文件路径 = 系统获取进程路径() & "Config.ini"
    游戏账号 = 编辑框获取文本("编辑框_账号")
    游戏密码 = 编辑框获取文本("编辑框_密码")
    游戏区服 = 编辑框获取文本("编辑框_区服")
    游戏路径 = 浏览框获取文本("浏览框_路径") 
    游戏服务器下标 = 下拉框获取选项("下拉框_服务器")
    调试输出(游戏服务器下标)
    文件写配置("小值", "账号", 游戏账号, 配置文件路径)
    文件写配置("小值", "密码", 游戏密码, 配置文件路径)
    文件写配置("小值", "区服", 游戏区服, 配置文件路径)
    文件写配置("小值", "登陆器路径", 游戏路径, 配置文件路径)
    文件写配置("小值", "服务器", 游戏服务器下标, 配置文件路径)
结束
功能 读辅助配置()
    游戏账号 = 文件读配置("小值", "账号", 配置文件路径)
    编辑框设置文本("编辑框_账号", 游戏账号)
    游戏密码 = 文件读配置("小值", "密码", 配置文件路径)
    编辑框设置文本("编辑框_密码", 游戏密码)
    游戏区服 = 文件读配置("小值", "区服", 配置文件路径)
    编辑框设置文本("编辑框_区服", 游戏区服)
    游戏路径 = 文件读配置("小值", "登陆器路径", 配置文件路径)
    浏览框设置文本("浏览框_路径", 游戏路径)
    游戏服务器下标 = 文件读配置("小值", "服务器", 配置文件路径)
    下拉框设置选项("下拉框_服务器", 游戏服务器下标)
    调试输出(游戏服务器下标)
结束
变量 游戏登录ID, 界面点击ID
功能 按钮_登录_点击()
    界面点击ID = 线程开启("界面点击", "")
结束
变量 游戏关闭, 界面点击, 界面关闭
功能 界面点击()
    界面关闭 = 命令("taskkill /im Launch.bin /f", 真)
    游戏关闭 = 命令("taskkill /im Game.exe /f", 真)
    进程打开(游戏路径, 1)
    变量 初始窗口句柄 = 窗口查找("《新天龙八部》")
    循环(初始窗口句柄 == 0)
        等待(1000)
        初始窗口句柄 = 窗口查找("《新天龙八部》")
    结束
    调试输出(初始窗口句柄)
    如果(初始窗口句柄 > 0)
        窗口设置位置(初始窗口句柄, 0, 0)
        循环(初始窗口句柄 > 0)
            鼠标移动(1349, 610)
            鼠标左键单击(1)
            初始窗口句柄 = 窗口查找("《新天龙八部》")
            调试输出(初始窗口句柄)
        结束
    否则
        等待(2000)
    结束
    变量 版本号 = 文件读配置("Version", "Latest", "E:\\TLBB\\Patch\\patchinfo.txt")
    调试输出(版本号)
    等待(30000)    
    变量 登陆器窗口句柄 = 窗口查找(字符串拼接("《新天龙八部》永恒经典版 ", 版本号))
    循环(登陆器窗口句柄 == 0)
        等待(1000)
        登陆器窗口句柄 = 窗口查找(字符串拼接("《新天龙八部》永恒经典版 ", 版本号))
    结束
    如果(登陆器窗口句柄 > 0)
        变量 ret = 窗口设置位置(登陆器窗口句柄, 0, 0)
        循环(ret == false)
            等待(1000)
            ret = 窗口设置位置(登陆器窗口句柄, 0, 0)
        结束
        等待(1000)
        //窗口鼠标左键双击(登陆器窗口句柄, 478, 615)
        鼠标移动(478, 615)
        鼠标左键双击(1)
        调试输出("双击完成")
        键盘发送字符串(游戏区服)
        调试输出("开始搜索区服")
        鼠标移动(598, 618)
        鼠标左键双击(1)
        等待(2000)
        鼠标移动(482, 126)
        鼠标左键双击(2)
        等待(2000)
        鼠标移动(1000, 664)
        鼠标左键双击(1)
        等待(2000)
        鼠标移动(558, 291)
        鼠标左键双击(1)
        窗口发送字符串(登陆器窗口句柄, 游戏账号)
        窗口提交按键(登陆器窗口句柄, 9)
        窗口发送字符串(登陆器窗口句柄, 游戏密码)
        鼠标移动(642, 578)
        鼠标左键双击(1)
        等待(2000)
        鼠标移动(647, 605)
        鼠标左键双击(1)
    结束
    游戏服务器 = 下拉框获取文本("下拉框_服务器")
    变量 窗口标题 = 字符串拼接("《新天龙八部》永恒经典版 3.68.7101 (", 字符串拼接(游戏服务器, 字符串拼接(":", 字符串拼接(游戏区服, ")"))))
    调试输出(窗口标题)
    等待(5000)
    变量 游戏主界面句柄 = 窗口查找(窗口标题)
    调试输出(游戏主界面句柄)
    等待(2000)
    鼠标移动(1213, 156)
    鼠标左键双击(1)
结束
功能 按钮_退出_点击()
    //这里添加你要执行的代码
    命令("taskkill /im Launch.bin /f", 真)
    命令("taskkill /im Game.exe /f", 真)
    退出()
结束