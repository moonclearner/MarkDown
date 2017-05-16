# Anaconda

## create conda env
- conda env list
	list all env
- source activate envname(linux) activate envname(windows)
	activate env
	enter virenv (envname)
	$whereis python(windows)
- conda list
	list all packages
- conda install packagename
	install packeage
	if tips packege not found
		your can search on Anaconda.org
- annconda search -t conda packagename
	It will list all package about packagename
- conda install -c https://conda.anaconda.org/authorname packagename
	such as If you found package list conda-forge xmltodict
		conda-forge is authorname
	or conda install -c conda-forge xmltodict
- deacativate
	leave env
- conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
添加 Anaconda 的 TUNA 镜像
- conda config --set show_channel_urls yes
设置搜索时显示通道地址
