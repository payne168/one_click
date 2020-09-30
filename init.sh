#!$PREFIX/bin/bash
#首先是常规升级
echo "--------------------------------------------------------"
echo ""
echo -e "\033[43;30m 欢迎安装water-drop的自动化支付脚本 \033[0m"
echo ""
echo "--------------------------------------------------------"
echo ""
echo -e "\033[33m 第一步我们会开始更新我们的程序 \033[0m"
echo ""
echo "--------------------------------------------------------"
apt update -y
apt upgrade -y
apt-get update -y
#然后是安装需要的软件
echo "--------------------------------------------------------"
echo ""
echo -e "\033[36m 第二步我们会开始安装我们的程序依赖 \033[0m"
echo ""
echo "--------------------------------------------------------"
apt install openssh -y
apt install python -y
apt install git -y
pkg install termux-auth -y
pkg install termux-tools -y
pkg install clang -y
pkg install libxml2 libxslt libiconv -y
#安装python 依赖库
echo "--------------------------------------------------------"
echo ""
echo -e "\033[32m 第三步我们会开始安装python和依赖 \033[0m"
echo ""
echo "--------------------------------------------------------"
pip install wheel
pkg install libjpeg-turbo -y
LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/" pip install Pillow
pip install --default-timeout=1000 humanize retry requests progress\
 humanize adbutils six logzero Cython lxml
#安装adb
# mv /data/data/com.termux/files/home/storage/shared/one_click/adb $PREFIX/bin
# chmod +x $PREFIX/bin
apt install wget -y && wget https://github.com/MasterDevX/Termux-ADB/raw/master/InstallTools.sh && bash InstallTools.sh
pip install --pre -U uiautomator2
pip3 install --pre -U uiautomator2
echo "--------------------------------------------------------"
echo ""
echo -e "\033[36m 恭喜您程序已经安装成功! \033[0m"
echo ""
echo "--------------------------------------------------------"
#下载脚本
echo "--------------------------------------------------------"
echo ""
echo -e "\033[33m 正在下载所需脚本! \033[0m"
echo ""
echo "--------------------------------------------------------"
mkdir -p ~/storage/shared/water_drop_init/
cd ~/storage/shared/water_drop_init/
git clone https://github.com/payne168/termux_control.git
#执行脚本
echo "--------------------------------------------------------"
echo ""
echo -e "\033[32m 开始执行脚本! \033[0m"
echo ""
echo "--------------------------------------------------------"
cd ~/storage/shared/water_drop_init/atx-agent
sleep 5
python3 ~/storage/shared/water_drop_init/termux_control/launch.py
