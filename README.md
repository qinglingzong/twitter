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

## todo

初期实现一个简单版本,利用rails自带的mvc的方式开发。
如果有更多需求，则转向 api + 前端的形式来开发， 可以开发复杂的应用。
