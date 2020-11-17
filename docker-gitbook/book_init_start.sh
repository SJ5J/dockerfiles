#1. 容器生成书籍文件和插件文件所在目录：/root/gitbook，映射到本机目录
#2. 容器编译生成的html目录： /root/gitbook/html
#3. 本机的md文档目录映射到容器的： /root/gitbook/docs
#4. 本机的md文档目录下有一个SUMMARY.md，要放到/root/gitbook中，路径指向/root/gitbook/docs中的md文件

ROOT_PATH=/root/gitbook
cd $ROOT_PATH/

echo $1

if [ "$1" == "init" ];then 
    cp -f /root/book.json $ROOT_PATH/docs/SUMMARY.md $ROOT_PATH/

    # gitbook init [生成SUMMARY.md 的路径]
    gitbook init $ROOT_PATH/

    # 编辑SUMMARY.md指向文档目录 /root/docs
    # 把docs目录放在/root/gitbook目录外面或里面都可以
    # 编辑后再次init
    # gitbook init $ROOT_PATH/

    # gitbook install [book.json 所在路径]
    # book.json 所在路径必须与SUMMARY.md 所在路径相同，否则gitbook serve 时找不到插件
    gitbook install $ROOT_PATH/
fi

echo start gitbook serve

# 修改用户目录的.gitbook\versions\3.2.3\lib\output\website\copyPluginAssets.js文件，把112行的confirm改为false。
sed -i '112 s/true/false/g' ~/.gitbook/versions/3.2.3/lib/output/website/copyPluginAssets.js

# gitbook serve [SUMMARY.md 所在路径]  [生成html的目标路径]
# nohup gitbook serve $ROOT_PATH/ $ROOT_PATH/html/ 2>&1 &
gitbook serve $ROOT_PATH/ $ROOT_PATH/html/ > gitbook.log 2>&1 
