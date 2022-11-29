# 需求

从Twitter私信里下载影片再分享。
使用场景：收到爆料后验证再转发。
大概思路，Oauth登陆授权，解析私信Json，找出影片最清晰地址，保存。

## 安装

```bash
git clone git@github.com:qinglingzong/twitter.git
cd twitter
bundle
rails s
```

打开浏览器 <http://localhost:3000(http://localhost:3000)>
