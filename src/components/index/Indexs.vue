<template>
<div class="indexs">
    <img src="../../components/index/images/yun01_h5.png" class="xiao" />
    <div class="index-prompt">
      <div class="prompt-dialog">
        <h3>您好，我是OKAY小云。</h3>
        <h2>请问，您是？</h2>
      </div>
    </div>
    <div class="index-main">
      <router-link to="/list/columns/id/6">
        <div class="item1">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>中小学校长</span>
            </a>
            <small>Headmaster</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/5">
        <div class="item2">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>老师</span>
            </a>
            <small>Teacher</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/1">
        <div class="item3">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>家长</span>
            </a>
            <small>Parent</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/7">
        <div class="item4">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>学生</span>
            </a>
            <small>Student</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/9">
        <div class="item5">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>教育部门领导</span>
            </a>
            <small>Leader</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/10">
        <div class="item6">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>培训机构校长</span>
            </a>
            <small>President</small>
          </div>
        </div>
      </router-link>
      <router-link to="/list/columns/id/8">
        <div class="item7">
          <div class="item-cell">
            <a href="#" class="main-item">
              <span>合作伙伴</span>
            </a>
            <small>Partner</small>
          </div>
        </div>
      </router-link>
    </div>
    <div class="ft">
      <div class="tel400">
        <span>咨询电话：</span>
        <span>400-996-0175</span>
      </div>

      <div class="footer">
        <p>©2014-2017 <span>北京点石经纬科技有限公司&nbsp;&nbsp;| </span></p>
        <p>AllRights Reserved | 京ICP备14011885号-10</p>
      </div>
    </div>
</div>
</template>

<script>
export default {
  name: 'indexs',
  methods: {

  }
}
</script>

<style scoped>

.index-prompt{
  letter-spacing: .01rem;
  margin-top: 0.65rem;
  padding: 0 .2rem;
}

.index-prompt .prompt-dialog{
  margin-top: 0.65rem;
  color: #fff;
  padding: .2rem 0 .2rem .3rem;
  border: .04rem solid #87d9ff;
  border-radius: .1rem;
  background: rgba(0, 0, 0, .2);
  position: relative;
  opacity: 0;
  animation: dialog .9s forwards;
  -webkit-animation: dialog .9s forwards;
}
@keyframes dialog
{
  0% {
    transform: translateX(2rem);
    opacity: 0;
  }
  55% {
    transform: translateX(2rem);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@-moz-keyframes dialog
{
  0% {
    transform: translateX(2rem);
    opacity: 0;
  }
  55% {
    transform: translateX(2rem);
    opacity: 0;
  }
  100% {
    transform: translateX(0);
    opacity: 1;
  }
}

@-webkit-keyframes dialog
{
  0% {
    margin-left: 2rem;
    opacity: 0;
  }
  55% {
    margin-left: 2rem;
    opacity: 0;
  }
  100% {
    margin-left: 0;
    opacity: 1;
  }
}

@-o-keyframes dialog
{
  0% {
    margin-left: 2rem;
    opacity: 0;
  }
  55% {
    margin-left: 2rem;
    opacity: 0;
  }
  100% {
    margin-left: 0;
    opacity: 1;
  }
}
.index-prompt .prompt-dialog h3{
  height: .48rem;
  font-size: .27rem;
  line-height: .48rem;
  font-weight: normal;
}
.index-prompt .prompt-dialog h2{
  height: .68rem;
  font-size: .42rem;
  line-height: .68rem;
}
.xiao{
  position: absolute;
  width: 2.4rem;
  height: 2.4rem;;
  top: 3.04rem;
  right: .35rem;
  opacity: 0;
  z-index: 9;
  animation: xiao .5s forwards;
  -webkit-animation: xiao .5s forwards;
}

.yes .prompt-dialog{
  margin-left: 0;
}
.index-main{
  width: 7rem;
  height: 8.47rem;
  margin: 0 auto;
  position: relative;
}
.index-main .item-cell{
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.index-main a > div{
  position: absolute;
  display: table;
  opacity: 0;
  width: 2.8rem;
  height: 2.5rem;
  background: url(../../components/index/images/panel_h5.png) no-repeat;
  background-size: 100%;
}
.index-main .main-item{
  width: .9rem;
  margin: 0 auto;
  line-height: .36rem;
  display: block;
}
.index-main .main-item span{
  opacity: .8;
  font-size: .3rem;
  font-weight: 600;
}
.index-main small{
  color: #fff;
  font-size: .14rem;
  opacity: .5;
  margin-top: .1rem;
  display: block;
}
.index-main .item1{
  left: 50%;
  top: .57rem;
  margin-left: -1.4rem;
  animation: item1 1.2s forwards;
  -webkit-animation: item1 1.2s forwards;
}
.index-main .item2{
  left: 0;
  top: 1.8rem;
  animation: item2 1.4s forwards;
  -webkit-animation: item2 1.4s forwards;
}
.index-main .item3{
  right: 0;
  top: 1.8rem;
  animation: item2 1.4s forwards;
  -webkit-animation: item2 1.4s forwards;
}
.index-main .item4{
  left: 50%;
  top: 3.05rem;
  margin-left: -1.4rem;
  animation: item4 1.8s forwards;
  -webkit-animation: item4 1.8s forwards;
}
.index-main .item5{
  left: 0;
  top: 4.3rem;
  animation: item5 2.1s forwards;
  -webkit-animation: item5 2.1s forwards;
}
.index-main .item6{
  right: 0;
  top: 4.3rem;
  animation: item5 2.1s forwards;
  -webkit-animation: item5 2.1s forwards;
}
.index-main .item7{
  left: 50%;
  top: 5.54rem;
  margin-left: -1.4rem;
  animation: item7 2.4s forwards;
  -webkit-animation: item7 2.4s forwards;
}
@keyframes xiao
{
  0% {
    opacity: 0;
    transform: translateY(0);
  }
  100% {
    opacity: 1;
    transform: translateY(-2rem);
  }
}

@-webkit-keyframes xiao
{
  0% {
    opacity: 0;
    transform: translateY(0);
  }
  100% {
    opacity: 1;
    transform: translateY(-2rem);
  }
}
@keyframes item1
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

@-webkit-keyframes item1
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
@keyframes item2
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

@-webkit-keyframes item2
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
@keyframes item4
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

@-webkit-keyframes item4
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
@keyframes item5
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

@-webkit-keyframes item5
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
@keyframes item7
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

@-webkit-keyframes item7
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
