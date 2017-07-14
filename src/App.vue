<template>
  <div id="app">
    <div id="live">
      <div id="st1" v-bind:class="{ hide: liveStatus }">
        <h2>第七届世界智慧教育高峰论坛</h2>
        <p>2017.07.16 13:30直播</p>
        <a class="status2" href="javascript:void(0);">敬请期待</a>
        <a href="http://parent-app.webview.okjiaoyu.cn/downApp.html">或下载OKAY+看直播</a>
      </div>
      <div id="st2" v-bind:class="{ hide: liveStatus }">
        <h2>第七届世界智慧教育高峰论坛</h2>
        <p>直播进行中</p>
        <a class="status3" href="http://edu.tv.sohu.com/8clock/33652">马上观看</a>
        <a href="http://parent-app.webview.okjiaoyu.cn/downApp.html">或下载OKAY+看直播</a>
      </div>
      <div id="st3" v-bind:class="{ hide: liveStatus }">
        <h2>第七届世界智慧教育高峰论坛</h2>
        <p>变革 · 学习者主权</p>
        <a class="status3" href="http://edu.tv.sohu.com/8clock/33652">马上观看</a>
        <a href="http://parent-app.webview.okjiaoyu.cn/downApp.html">或下载OKAY+看直播</a>
      </div>
    </div>
    <div id="index" v-bind:class="{ clearT: IsTouch }">
      <div class="share-icon">
        <img src="./components/index/images/icon-for-share.png" width="400" height="400" id="share-img" alt="分享图片" title="分享图片" />
      </div>
      <div class="index-menu">
        <a href="/" class="logo">
          <img src="./components/index/images/logo.png" />
        </a>
        <a href="javascript:void(0);" class="share">
          <img src="./components/index/images/share_icon_h5.png" v-on:click="share()" />
        </a>
      </div>

      <router-view></router-view>

      <div class="share-box" v-bind:class="{ show: IsShow }">
        <div class="close">
          <img src="./components/index/images/close.png" v-on:click="share()" />
        </div>
        <h2>分享精彩</h2>
        <div class="item-list">
          <img src="./components/index/images/UC.png" class="browser" />
          <span>点击右下方的</span>
          <img src="./components/index/images/uc01.png" class="icon" />
          <span>点击</span>
          <img src="./components/index/images/uc02.png" class="icon" />
        </div>
        <div class="item-list">
          <img src="./components/index/images/safari.png" class="browser" />
          <span>点击右下方的</span>
          <img src="./components/index/images/safari01.png" class="icon" />
        </div>
        <div class="item-list">
          <img src="./components/index/images/QQ.png" class="browser" />
          <span>点击右下方的</span>
          <img src="./components/index/images/uc01.png" class="icon" />
          <span>点击</span>
          <img src="./components/index/images/qq01.png" class="icon" />
        </div>
      </div>
      <a href="https://kefu.easemob.com/webim/im.html?tenantId=2782&emgroup=OKAY%E5%AE%98%E7%BD%91" class="hx-link">
        <img src="./components/index/images/hx-link.png" />
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data() {
    return {
      IsShow: false,
      IsTouch: false,
      someData: {},
      liveStatus: false
    }
  },
  created(){
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?44092cdd9af7556bb1d4b691dec8e776";
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(hm, s);
    })();
    document.querySelector('body').addEventListener('touchmove',this.func)
    this.getLiveStatus()

  },
  methods: {
    share () {
      this.IsShow = !this.IsShow;
      this.IsTouch = !this.IsTouch;
    },
    init () {
      this.IsShow = false;
      this.getLiveStatus()
    },
    func (ev) {
      if(this.IsTouch){
        ev.preventDefault()
      }else{

      }
    },
    getLiveStatus () {
      var hash = window.location.hash;
      this.liveStatus = false;
      if( !( hash.indexOf('list') > -1 ) ){
        //var _url = 'http://stress.cms.xk12.cn/';
        //var _url = 'http://172.16.22.104:9080/';
        var _url = "http://www.okayzhihui.com/";
        this.$http.get(_url + 'mApi/presentation')
        .then((response) => {
          this.liveStatus = response.body.status;
            var _dom = document.getElementById('live');
                _dom.style.display = 'block';
            var _dom = document.getElementById('st' + this.liveStatus);
                _dom.style.display = 'block';
        }, response => {
        })
      }else{
          setTimeout(function(){
            var _dom = document.getElementById('live');
                _dom.style.display = 'none';
          },50);
      }
    }
  },
  watch: {
      "$route": "init"
  }
}
</script>

<style>
body{
  background: #21518b;
}
.share-icon{
  display:none;
}
#live{
  display: none;
  width:7.5rem;
  height:3.2rem;
  color:#fff;
  margin: 0 auto;
  text-align: center;
  letter-spacing:.01rem;
  background: url(./components/index/images/bg.jpg) no-repeat;
  background-size: 100%;
}
#live h2{
  font-size:.36rem;
  padding-top:.6rem;
}
#live p{
  font-size: .27rem;
  margin:.4rem auto;
}
#live a{
  display: inline-block;
  font-size: .27rem;
  width: 3rem;
  height: .64rem;
  line-height: .64rem;
  background: #3670d1;
  margin: 0 .1rem;
}
#live .status2{
  text-align: left;
  text-indent: .7rem;
  background: url(./components/index/images/icon_play.png) 2.1rem center no-repeat #3670d1;
  background-size: .3rem;
  opacity: .5;
}
#live .status3{
  text-align: left;
  text-indent: .7rem;
  background: url(./components/index/images/icon_play.png) 2.1rem center no-repeat #3670d1;
  background-size: .3rem;
}
#live .hide{
  display: none;
}
#index {
  width: 7.5rem;
  height: 13.36rem;
  margin: 0 auto;
  background: url(./components/index/images/BG_h5.png) no-repeat;
  background-size: 7.5rem 13.66rem;
  position: relative;
}
.clearT{
  overflow:hidden;
}
.ft{
  opacity: 0;
  animation: itemft 2.7s forwards;
  -webkit-animation: itemft 2.7s forwards;
}
.hx-link{
  display: block;
  position: fixed;
  right: .1rem;
  top: 50%;
  transform: translateZ(0);
  -webkit-transform: translateZ(0);
}
.hx-link img{
  width: .8rem;
  height: 2.28rem;
}
.index-menu{
  padding: .3rem .3rem 0 .3rem;
  overflow: hidden;
}
.index-menu a{
  overflow: hidden;
}
.index-menu .logo img{
  height: .32rem;
  margin-top: .055rem;
  float: left;
}
.index-menu .share img{
  width: .4rem;
  height: .4rem;
  float: right;
}
.tel400{
  text-align: center;
  font-size: .24rem;
  color: #fff;
  line-height: .36rem;
  opacity: .8;
}
.tel400 span{
  margin-right: .05rem;
}
.footer{
  text-align: center;
  padding: .3rem 0;
}
.footer p{
  color: #b2d5ff;
  font-size: .21rem;
  line-height: .36rem;
  opacity: .5;
}
.share-box{
  display: none;
  position: absolute;
  width: 100%;
  height: 100rem;
  top: 0;
  z-index: 10;
  left: 0;
  opacity: 0;
  letter-spacing: .02rem;
  transition: all .5s ease;
  background: rgba(0, 0, 0, .9);
}
.show{
  display: block;
  opacity: 1;
}
.share-box .close{
  text-align: right;
  padding: .3rem .3rem 1.1rem .3rem;
}
.share-box .close img{
  width: .4rem;
  height: .4rem;
  display: inline-block;
}
.share-box h2{
  color: #fff;
  text-align: center;
  font-size: .36rem;
  height: .52rem;
  line-height: .52rem;
  margin-bottom: .6rem;
  font-weight: normal;
}
.share-box .browser{
  width: 1rem;
  height: 1rem;
  margin-right: .25rem;
}
.share-box .icon{
  width: .6rem;
  height: .6rem;
  margin: 0 .2rem;
}
.share-box .item-list{
  font-size: .3rem;
  color: #b3b3b3;
  padding-left: 1rem;
  word-spacing: -.1rem;
  margin-bottom: .62rem;
}
.share-box .item-list img,.share-box .item-list span{
  vertical-align: middle;
}
@keyframes itemft
{
  0% {
    opacity: 0;
    transform: translateY(2rem);
  }
  64% {
    opacity: 0;
    transform: translateY(2rem);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

@-webkit-keyframes itemft
{
  0% {
    opacity: 0;
    transform: translateY(2rem);
  }
  64% {
    opacity: 0;
    transform: translateY(2rem);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
