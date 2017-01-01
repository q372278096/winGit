#!/bin/sh
# 各种Git和GitHub的设置 

# ubuntu/debian下安装git并查看git版本号
#sudo apt-get install git
#git --version

# 每台机器自报家门
#git config --global user.name "Rston"
#git config --global user.email "1181714007@qq.com"

# 创建空目录并初始化本地仓库
#mkdir /home/rston/workspace/Test
#cd /home/rston/workspace/Test 
#git init
#cd -

# 查看文件具体修改的内容
# add本地仓库下所有文件并进行commit
# 查看当前仓库的状态
#git diff
git add .
git commit -m "测试"
git status

# 查看从最近到最远的所有的commit提交日志
# 显示详细信息
#git log
# 显示简略信息
#git log --pretty=oneline

# 回退到过去的上1个版本
#git log
#git reset --hard HEAD~1
#git log

# 查看命令历史并返回未来的某个版本
#git reflog
#git reset --hard 58c3e7d 
#git log

# 查看某个文件在工作区和版本库里面最新版本的区别
#git diff HEAD -- git_settings.sh
#git status

# 使某个文件回到最近一次git commit或git add时的状态
#git checkout -- git_settings.sh
#git status

# 使某个文件从暂存区的修改回退到工作区
#git reset HEAD git_settings.sh
#git status

# 彻底删除某个文件（该文件已经add并commit）
#rm -f git_settings.sh
#git rm git_settings.sh
#git commit -m "remove git_settings.sh"
#git status

# 把误删的某个文件恢复到最新版本（该文件已经add并commit）
#rm -f git_settings.sh
#git checkout -- git_settings.sh
#git status

# 创建SSH Key并查看用户主目录下有没有.ssh目录
# 查看.ssh目录下是否有id_rsa（私钥）和id_rsa.pub（公钥）
# 登陆GitHub->Account settings->SSH Keys->Add SSH Key->粘贴id_rsa.pub文件内容
#ssh-keygen -t rsa -C "1181714007@qq.com"

# 在GitHub上创建远程库Test并与本地库Test关联
# 通过https关联
#git remote add origin https://github.com/q372278096/winGit.git
# 通过ssh关联
#git remote add origin git@github.com:Rston/Test.git

# 删除远程仓库
#git remote rm origin

# 查看远程库的详细信息
#git remote -v

# 克隆远程的某个仓库到本地形成本地库
# 通过https协议clone
#git clone https://github.com/q372278096/winGit.git
# 通过ssh协议clone
#git clone git@github.com:Rston/GitTest.git

# 创建本地local的dev分支+切换到dev分支+查看当前分支
#git checkout -b dev
#git branch

# 在本地创建和远程分支对应的分支+查看当前分支
#git checkout -b dev origin/dev
#git branch

# 切换到master分支+查看当前分支
#git checkout master
#git branch

# 合并dev分支到当前分支+删除dev分支+查看当前分支（Fast forward模式）
#git merge dev
#git branch -d dev
#git branch

#  合并dev分支到重新生成的commit+查看当前分支（强制禁用Fast forward模式）
#git merge --no-ff -m "merge with no-ff" dev
#git branch

# 查看具体的分支合并图
#git log --graph --pretty=oneline --abbrev-commit

# 强行删除一个没有被合并过的分支
#git branch -D dev

# 指定本地master分支与远程origin/master分支的链接+把最新的提交从origin/master抓下来
#git branch --set-upstream master origin/master
#git pull

# 指定本地dev分支与远程origin/dev分支的链接+把最新的提交从origin/dev抓下来
#git branch --set-upstream dev origin/dev
#git pull

# 推送本地master分支(主分支)到远程库+推送本地dev分支（开发分支）到远程库
# bug分支只用于在本地修复bug，就没必要推到远程了。
# feature分支是否推到远程，取决于你是否和你的小伙伴合作在上面开发。
#git push -u origin master
#git push -u origin dev

# 强制推送本地master分支(主分支)到远程库（慎重使用）+强制推送本地dev分支（开发分支）到远程库（慎重使用）
#git push -f -u origin master
#git push -f -u origin dev

# 删除远程库test.txt文件（慎重使用）
#git pull origin master
#git rm test.txt
#git commit -m "rm test.txt"
git push -u origin master

# 把当前工作现场“储藏”起来，等以后恢复现场后继续工作
#git stash
#git status

# 查看储藏起来的工作现场
#git stash list

# 恢复储藏起来的工作现场+同时删除stash内容 
#git stash pop
#git stash list

# 恢复指定的stash+删除指定的stash 
#git stash apply stash@{0}
#git stash drop stash@{0}
#git stash list

# 找到历史提交的commit id
# 给5c08b5b的commit打上v0.1的标签并加上说明
# 查看所有标签
# 显示标签v0.1的详细信息
#git log --pretty=oneline --abbrev-commit
#git tag -a v0.1 -m "version 0.1 released" 5c08b5b
#git tag -ln
#git show v0.1

# 生成GPG Key+输入相关信息并确认
# 显示公钥信息
# 显示私钥信息
#gpg --gen-key
#gpg --list-keys
#gpg --list-secret-keys

# 创建v0.2标签+使用GPG加密v0.2标签
# 查看tag标签的验证信息
# 参考链接http://airk000.github.io/git/2013/09/30/git-tag-with-gpg-key
#git log --pretty=oneline --abbrev-commit
#git tag -u "Rston" -s v0.2 -m "signed version 0.2 released" b8b5297
#git tag -ln
#git tag -v v0.2
#git show v0.2

# 删除本地库中的某个标签
#git tag -ln
#git tag -d v0.1

# 删除某个远程标签
#git tag -ln
#git tag -d v0.1
#git push origin :refs/tags/v0.1

# 推送某个本地标签到远程库
# 推送全部未推送过的本地标签
#git tag -ln
#git push origin v0.2
#git push origin --tags

# 使Git适当的显示不同的颜色
#git config --global color.ui true

# 从下方链接处clone相应的.gitignore文件+重命名+编辑
# 配置文件链接https://github.com/github/gitignore
#git clone https://github.com/github/gitignore.git
#cp ./gitignore/C.gitignore .
#mv C.gitignore .gitignore
#vim .gitignore

# 检查并显示.gitignore文件中关于test.hex文件的规则设置
#git check-ignore -v test.hex

# 为常用的git命令设置别名
# 显示最近一次的提交
# 丧心病狂的配置lg命令
#git config --global alias.st status
#git config --global alias.co checkout
#git config --global alias.ci commit
#git config --global alias.br branch
#git config --global alias.last 'log -1'
#git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# 删除git命令的别名设置，别名就在[alias]后面，要删除别名，直接把对应的行删掉即可
# 修改每个仓库的Git配置文件
# 修改用户主目录下针对当前用户的Git配置文件
#cat .git/config
#cat .gitconfig

# 搭建Git服务器
# 安装git+创建1个git用户，用来运行git服务
# 切换到git用户+回到/home/git目录
# 在git用户新建.ssh目录+将开发者的SSH公钥添加到git用户的authorized_keys文件中
# 将/home/git/GitServer/project.git目录作为Git仓库+更改目录权限
# 初始化Git仓库即创建1个没有工作区的裸仓库+把owner改为git	
# 禁止git用户使用shell登陆（编辑/etc/passwd将git:x:1001:1001:,,,:/home/git:/bin/bash改为git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell）
# 在ubuntu中安装openssh-server服务+输入ssh密码
# 在别的电脑上克隆远程库
#sudo apt-get install git
#sudo adduser git
#su git
#cd ~
#mkdir .ssh
#sudo cat /home/rston/.ssh/id_rsa.pub >> /home/git/.ssh/authorized_key
#mkdir -p /home/git/GitServer/project.git
#chmod 777 -R GitServer/
#cd /home/git/GitServer
#sudo git init --bare project.git
#sudo chown -R git:git project.git
#sudo vim /etc/passwd
#sudo apt-get install openssh-serve
#ssh localhost
#git clone git@192.168.1.104:/home/git/GitServer/project.git
