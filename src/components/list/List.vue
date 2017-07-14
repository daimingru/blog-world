<template>
<div class="list" v-bind:class="{ yes: IsReady }">
    <img src="../../components/list/images/yun02_h5.png" class="xiao" />
    <div class="index-prompt">
      <div class="prompt-dialog">
        <h3>{{Item.result.mainName}}，您想了解什么？</h3>
        <h2>{{Item.result.pTitle}}关注的热门主题如下：</h2>
      </div>
    </div>
    <div id="ar-list" class="article-list">
      <ul>
        <template v-for="(item, index) in Data">
        <li v-bind:class=" 'list-item' + ++index ">
          <a :href="item.href">
            <div class="list-label">
              <div>
                <p class="chance" v-if=" index < 6 ">{{ item.percent }}<span class="symbol">%</span></p>
              </div>
              <div class="js">
                <span class="student" v-if=" index < 6 ">的{{Item.result.themeName}}关注</span>
                <span class="symbol" v-if=" index >= 6 ">其它热门关注</span>
              </div>
            </div>
            <div class="list-title">
              {{ item.theme }}
            </div>
          </a>
        </li>
        <div v-if="index == length" class="ft ftlist" v-bind:class=" 'list-item' + ++index ">
          <div class="tel400">
            <span>咨询电话：</span>
            <span>400-996-0175</span>
          </div>

          <div class="footer">
            <p>©2014-2017 <span>北京点石经纬科技有限公司&nbsp;&nbsp;| </span></p>
            <p>AllRights Reserved | 京ICP备14011885号-10</p>
          </div>
        </div>

        </template>
      </ul>
    </div>
</div>
</template>

<script>

export default {
  name: 'list',
  data () {
    return {
      IsReady: false,
      Data: [],
      length:'',
      Item: {
        result: {
          mainName: '',
          theme: [],
          top5: []
        }
      }
    }
  },
  mounted () {

    //请求地址
    //var _url = "https://www.okzhihui.cn/";
    //var _url = "http://stress.cms.xk12.cn/";
    var _url = "http://www.okayzhihui.com/";

    this.$http.get(_url + 'mApi/columns/id/' + this.$route.params.id)
    .then((response) => {
      this.Item = response.body
      this.Data = this.Item.result.top5.concat(this.Item.result.theme)
      this.length = this.Data.length
    }, response => {
    })

  }
}
</script>

<style scoped>
#live{
  display: none;
}
.list .index-prompt{
  margin-top: 0.65rem;
  padding: 0 .2rem;
  letter-spacing: .01rem;
  margin-bottom: .4rem;
}
.list .index-prompt .prompt-dialog{
  margin-top: 0.65rem;
  color: #fff;
  padding: .2rem 0 .2rem 2.53rem;
  border: .04rem solid #87d9ff;
  border-radius: .1rem;
  background: rgba(0, 0, 0, .2);
  animation: dialog1 .9s forwards;
  -webkit-animation: dialog1 .9s forwards;
  position: relative;
}
.list .index-prompt .prompt-dialog h3{
  height: .48rem;
  font-size: .27rem;
  line-height: .48rem;
  font-weight: normal;
}
.list .index-prompt .prompt-dialog h2{
  font-size: .42rem;
  line-height: .68rem;
}

.xiao{
  position: absolute;
  width: 2.4rem;
  height: 2.4rem;
  top: 1.04rem;
  left: 2.2rem;
  z-index: 9;
  opacity: 0;
  animation: xiao1 .5s forwards;
  -webkit-animation: xiao1 .5s forwards;
}
.article-list{
  padding: 0 .25rem;
}
.article-list ul{
  margin-bottom: .4rem;
}
.article-list li{
  position: relative;
  opacity: 0;
  transform: translateY(2rem);
  border: .02rem solid #87d9ff;
  border-radius: .1rem;
  height: 1rem;
  line-height: 1rem;
  margin-bottom: .1rem;
  background: url(../../components/list/images/panel_list.png) repeat-x;
  background-size: auto 100%;
}
.article-list li > a{
  display: block;
}
.article-list .list-label{
  float: left;
  width: 2.7rem;
  padding-left:.5rem;
  color: #69feff;
  height: 1rem;
  word-spacing: -.06rem;
  overflow: hidden;
}
.article-list .list-title{
  float: left;
  color: #fff;
  width: 3.7rem;
  overflow:hidden;
  white-space:nowrap;
  text-overflow:ellipsis;
  font-size: .3rem;
  height: 1rem;
  line-height: 1rem;
}
.ftlist{
  margin-top:.6rem;
}
.article-list .list-label .chance{
  font-size: .62rem;
}
.article-list .list-label .student{
  width: 1.2rem;
  line-height: .28rem;
  vertical-align: initial;
  padding-left: .1rem;
  padding-top: .25rem;
  font-size:.2rem;
}
.article-list .list-label .symbol{
  font-size:.2rem;
}
.article-list .list-label span{
  font-size: .18rem;
  display: inline-block;
}
.article-list .list-label > div{
  float: left;
  height: 100%;
}
.article-list .list-label .js span{
  display: block;
}
.list-item1{
  animation: listitem1 1.3s forwards;
  -webkit-animation: listitem1 1.3s forwards;
}
.list-item2{
  animation: listitem2 1.5s forwards;
  -webkit-animation: listitem2 1.5s forwards;
}
.list-item3{
  animation: listitem3 1.7s forwards;
  -webkit-animation: listitem3 1.7s forwards;
}
.list-item4{
  animation: listitem4 1.9s forwards;
  -webkit-animation: listitem4 1.9s forwards;
}
.list-item5{
  animation: listitem5 2.1s forwards;
  -webkit-animation: listitem5 2.1s forwards;
}
.list-item6{
  animation: listitem6 2.3s forwards;
  -webkit-animation: listitem6 2.3s forwards;
}
.list-item7{
  animation: listitem7 2.5s forwards;
  -webkit-animation: listitem7 2.5s forwards;
}
.list-item8{
  animation: listitem8 2.7s forwards;
  -webkit-animation: listitem8 2.7s forwards;
}
.list-item9{
  animation: listitem9 2.9s forwards;
  -webkit-animation: listitem9 2.9s forwards;
}
.list-item10{
  animation: listitem10 3.1s forwards;
  -webkit-animation: listitem10 3.1s forwards;
}
.list-item11{
  animation: listitem10 3.3s forwards;
  -webkit-animation: listitem10 3.3s forwards;
}
@keyframes xiao1
{
  0% {
    opacity: 0;
    left: 2.2rem;
  }
  100% {
    opacity: 1;
    left: .2rem;
  }
}

@-webkit-keyframes xiao1
{
  0% {
    opacity: 0;
    left: 2.2rem;
  }
  100% {
    opacity: 1;
    left: .2rem;
  }
}
@keyframes dialog1
{
  0% {
    transform: translateX(-2rem);
    opacity: 0;
  }
  55% {
    transform: translateX(-2rem);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@-moz-keyframes dialog1
{
  0% {
    transform: translateX(-2rem);
    opacity: 0;
  }
  55% {
    transform: translateX(-2rem);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@keyframes listitem1
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem1
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem2
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem2
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem3
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem3
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem4
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem4
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem5
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem5
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem6
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem6
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem7
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem7
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem8
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem8
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem9
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem9
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem10
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@-webkit-keyframes listitem10
{
  0% {
    transform: translateY(2rem);
    opacity: 0;
  }
  60% {
    transform: translateY(2rem);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}
@keyframes listitem11
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

@-webkit-keyframes listitem11
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
