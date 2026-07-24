# 旅行攻略页面部署说明

## 最省事的分享方式

1. 把当前目录上传到 GitHub 仓库。
2. 打开仓库的 Settings -> Pages。
3. Source 选择 Deploy from a branch。
4. Branch 选 main，Folder 选 /root。
5. 保存后等待几分钟，页面会生成类似下面的地址：
   https://你的用户名.github.io/你的仓库名/

## 本地预览

在当前目录执行：
```bash
python3 -m http.server 8000
```

然后访问：
http://127.0.0.1:8000/
