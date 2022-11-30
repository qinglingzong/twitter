# 需求

从Twitter私信里下载影片再分享。
使用场景：收到爆料后验证再转发。
大概思路，Oauth登陆授权，解析私信Json，找出影片最清晰地址，保存。

## 安装

如果是windows系统，请使用wsl。
然后安装ruby

```bash
apt install ruby
```

安装完成之后, 从源代码安装此程序

```bash
git clone https://github.com/qinglingzong/twitter.git
cd twitter
bundle
```


配置:
```bash
rm config/credentials.yml.enc
rails credentials:edit
```

添加以下配置:

twitter_consumer_key: fvCpDsAQmKDNlhSUBavGQ
twitter_consumer_secret: vS3HsduBAzEdVrsc8UDS7GLwCkwIqhKZ2pZLaFWVEcQ
twitter_access_token:
twitter_access_token_secret:

consumer_key, consumer_secret 可以用自己的，也可以用上面的, 下面两个可以不填写，是我之前没有用oauth的时候测试用的

```bash
rails s
```

打开浏览器 <http://localhost:3000(http://localhost:3000)>

## todo

初期实现一个简单版本,利用rails自带的mvc的方式开发。
如果有更多需求，则转向 api + 前端的形式来开发， 可以开发复杂的应用。
