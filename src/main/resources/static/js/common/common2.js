/**
 * 카테고리 마우스 오버 이미지
 * 카테고리 서브 메뉴 출력
 */

$(document).ready(function(){

    var methods = {
        aCategory    : [],
        aSubCategory : {},

        get: function()
        {
             $.ajax({
                url : '/exec/front/Product/SubCategory',
                dataType: 'json',
                success: function(aData) {

                    if (aData == null || aData == 'undefined') return;
                    for (var i=0; i<aData.length; i++)
                    {
                        var sParentCateNo = aData[i].parent_cate_no;

                        if (!methods.aSubCategory[sParentCateNo]) {
                            methods.aSubCategory[sParentCateNo] = [];
                        }

                        methods.aSubCategory[sParentCateNo].push( aData[i] );
                    }
                }
            });
        },

        getParam: function(sUrl, sKey) {

            var aUrl         = sUrl.split('?');
            var sQueryString = aUrl[1];
            var aParam       = {};

            if (sQueryString) {
                var aFields = sQueryString.split("&");
                var aField  = [];
                for (var i=0; i<aFields.length; i++) {
                    aField = aFields[i].split('=');
                    aParam[aField[0]] = aField[1];
                }
            }
            return sKey ? aParam[sKey] : aParam;
        },

        getParamSeo: function(sUrl) {
            var aUrl         = sUrl.split('/');
            return aUrl[3] ? aUrl[3] : null;
        },

        show: function(overNode, iCateNo) {

            if (methods.aSubCategory[iCateNo].length == 0) {
                return;
            }

            var aHtml = [];
            aHtml.push('<ul>');
            $(methods.aSubCategory[iCateNo]).each(function() {
                aHtml.push('<li><a href="/'+this.design_page_url+this.param+'">'+this.name+'</a></li>');
            });
            aHtml.push('</ul>');


            var offset = $(overNode).offset();
            $('<div class="sub-category"></div>')
                .appendTo(overNode)
                .html(aHtml.join(''))
                .find('li').mouseover(function(e) {
                    $(this).addClass('over');
                }).mouseout(function(e) {
                    $(this).removeClass('over');
                });
        },

        close: function() {
            $('.sub-category').remove();
        }
    };

    methods.get();


    $('.xans-layout-category li').mouseenter(function(e) {
        var $this = $(this).addClass('on'),
        iCateNo = Number(methods.getParam($this.find('a').attr('href'), 'cate_no'));

        if (!iCateNo) {
            iCateNo = Number(methods.getParamSeo($this.find('a').attr('href')));
        }

        if (!iCateNo) {
           return;
        }

        methods.show($this, iCateNo);
     }).mouseleave(function(e) {
        $(this).removeClass('on');

          methods.close();
     });
});
window.FontAwesomeCdnConfig = {
  autoA11y: {
    enabled: false
  },
  asyncLoading: {
    enabled: false
  },
  reporting: {
    
    enabled: true,
    domains: "localhost, *.dev"
    
  },
  useUrl: "use.fontawesome.com",
  faCdnUrl: "https://cdn.fontawesome.com:443",
  code: "a5aaab3030"
};
!function(){function a(a){var b,c=[],d=document,e=d.documentElement.doScroll,f="DOMContentLoaded",g=(e?/^loaded|^c/:/^loaded|^i|^c/).test(d.readyState);g||d.addEventListener(f,b=function(){for(d.removeEventListener(f,b),g=1;b=c.shift();)b()}),g?setTimeout(a,0):c.push(a)}function b(a,b){var c=!1;return a.split(",").forEach(function(a){var d=new RegExp(a.trim().replace(".","\\.").replace("*","(.*)"));b.match(d)&&(c=!0)}),c}function c(a){"undefined"!=typeof MutationObserver&&new MutationObserver(a).observe(document,{childList:!0,subtree:!0})}function d(a){var b,c,d,e;a=a||"fa",b=document.querySelectorAll("."+a),Array.prototype.forEach.call(b,function(a){c=a.getAttribute("title"),a.setAttribute("aria-hidden","true"),d=a.nextElementSibling?!a.nextElementSibling.classList.contains("sr-only"):!0,c&&d&&(e=document.createElement("span"),e.innerHTML=c,e.classList.add("sr-only"),a.parentNode.insertBefore(e,a.nextSibling))})}!function(){"use strict";function a(a){l.push(a),1==l.length&&k()}function b(){for(;l.length;)l[0](),l.shift()}function c(a){this.a=m,this.b=void 0,this.f=[];var b=this;try{a(function(a){f(b,a)},function(a){g(b,a)})}catch(c){g(b,c)}}function d(a){return new c(function(b,c){c(a)})}function e(a){return new c(function(b){b(a)})}function f(a,b){if(a.a==m){if(b==a)throw new TypeError;var c=!1;try{var d=b&&b.then;if(null!=b&&"object"==typeof b&&"function"==typeof d)return void d.call(b,function(b){c||f(a,b),c=!0},function(b){c||g(a,b),c=!0})}catch(e){return void(c||g(a,e))}a.a=0,a.b=b,h(a)}}function g(a,b){if(a.a==m){if(b==a)throw new TypeError;a.a=1,a.b=b,h(a)}}function h(b){a(function(){if(b.a!=m)for(;b.f.length;){var a=b.f.shift(),c=a[0],d=a[1],e=a[2],a=a[3];try{0==b.a?e("function"==typeof c?c.call(void 0,b.b):b.b):1==b.a&&("function"==typeof d?e(d.call(void 0,b.b)):a(b.b))}catch(f){a(f)}}})}function i(a){return new c(function(b,c){function d(c){return function(d){g[c]=d,f+=1,f==a.length&&b(g)}}var f=0,g=[];0==a.length&&b(g);for(var h=0;h<a.length;h+=1)e(a[h]).c(d(h),c)})}function j(a){return new c(function(b,c){for(var d=0;d<a.length;d+=1)e(a[d]).c(b,c)})}var k,l=[];k=function(){setTimeout(b)};var m=2;c.prototype.g=function(a){return this.c(void 0,a)},c.prototype.c=function(a,b){var d=this;return new c(function(c,e){d.f.push([a,b,c,e]),h(d)})},window.Promise||(window.Promise=c,window.Promise.resolve=e,window.Promise.reject=d,window.Promise.race=j,window.Promise.all=i,window.Promise.prototype.then=c.prototype.c,window.Promise.prototype["catch"]=c.prototype.g)}(),function(){function a(a){this.el=a;for(var b=a.className.replace(/^\s+|\s+$/g,"").split(/\s+/),c=0;c<b.length;c++)d.call(this,b[c])}function b(a,b,c){Object.defineProperty?Object.defineProperty(a,b,{get:c}):a.__defineGetter__(b,c)}if(!("undefined"==typeof window.Element||"classList"in document.documentElement)){var c=Array.prototype,d=c.push,e=c.splice,f=c.join;a.prototype={add:function(a){this.contains(a)||(d.call(this,a),this.el.className=this.toString())},contains:function(a){return-1!=this.el.className.indexOf(a)},item:function(a){return this[a]||null},remove:function(a){if(this.contains(a)){for(var b=0;b<this.length&&this[b]!=a;b++);e.call(this,b,1),this.el.className=this.toString()}},toString:function(){return f.call(this," ")},toggle:function(a){return this.contains(a)?this.remove(a):this.add(a),this.contains(a)}},window.DOMTokenList=a,b(Element.prototype,"classList",function(){return new a(this)})}}();var e=function(a,b,c){function d(a){return g.body?a():void setTimeout(function(){d(a)})}function e(){h.addEventListener&&h.removeEventListener("load",e),h.media=c||"all"}var f,g=window.document,h=g.createElement("link");if(b)f=b;else{var i=(g.body||g.getElementsByTagName("head")[0]).childNodes;f=i[i.length-1]}var j=g.styleSheets;h.rel="stylesheet",h.href=a,h.media="only x",d(function(){f.parentNode.insertBefore(h,b?f:f.nextSibling)});var k=function(a){for(var b=h.href,c=j.length;c--;)if(j[c].href===b)return a();setTimeout(function(){k(a)})};return h.addEventListener&&h.addEventListener("load",e),h.onloadcssdefined=k,k(e),h},f=null;!function(){function a(a,b){document.addEventListener?a.addEventListener("scroll",b,!1):a.attachEvent("scroll",b)}function b(a){document.body?a():document.addEventListener?document.addEventListener("DOMContentLoaded",function b(){document.removeEventListener("DOMContentLoaded",b),a()}):document.attachEvent("onreadystatechange",function c(){"interactive"!=document.readyState&&"complete"!=document.readyState||(document.detachEvent("onreadystatechange",c),a())})}function c(a){this.a=document.createElement("div"),this.a.setAttribute("aria-hidden","true"),this.a.appendChild(document.createTextNode(a)),this.b=document.createElement("span"),this.c=document.createElement("span"),this.h=document.createElement("span"),this.f=document.createElement("span"),this.g=-1,this.b.style.cssText="max-width:none;display:inline-block;position:absolute;height:100%;width:100%;overflow:scroll;font-size:16px;",this.c.style.cssText="max-width:none;display:inline-block;position:absolute;height:100%;width:100%;overflow:scroll;font-size:16px;",this.f.style.cssText="max-width:none;display:inline-block;position:absolute;height:100%;width:100%;overflow:scroll;font-size:16px;",this.h.style.cssText="display:inline-block;width:200%;height:200%;font-size:16px;max-width:none;",this.b.appendChild(this.h),this.c.appendChild(this.f),this.a.appendChild(this.b),this.a.appendChild(this.c)}function d(a,b){a.a.style.cssText="max-width:none;min-width:20px;min-height:20px;display:inline-block;overflow:hidden;position:absolute;width:auto;margin:0;padding:0;top:-999px;left:-999px;white-space:nowrap;font:"+b+";"}function e(a){var b=a.a.offsetWidth,c=b+100;return a.f.style.width=c+"px",a.c.scrollLeft=c,a.b.scrollLeft=a.b.scrollWidth+100,a.g!==b?(a.g=b,!0):!1}function g(b,c){function d(){var a=f;e(a)&&a.a.parentNode&&c(a.g)}var f=b;a(b.b,d),a(b.c,d),e(b)}function h(a,b){var c=b||{};this.family=a,this.style=c.style||"normal",this.weight=c.weight||"normal",this.stretch=c.stretch||"normal"}function i(){if(null===l){var a=document.createElement("div");try{a.style.font="condensed 100px sans-serif"}catch(b){}l=""!==a.style.font}return l}function j(a,b){return[a.style,a.weight,i()?a.stretch:"","100px",b].join(" ")}var k=null,l=null,m=null;h.prototype.load=function(a,e){var f=this,h=a||"BESbswy",i=e||3e3,l=(new Date).getTime();return new Promise(function(a,e){if(null===m&&(m=!!window.FontFace),m){var n=new Promise(function(a,b){function c(){(new Date).getTime()-l>=i?b():document.fonts.load(j(f,f.family),h).then(function(b){1<=b.length?a():setTimeout(c,25)},function(){b()})}c()}),o=new Promise(function(a,b){setTimeout(b,i)});Promise.race([o,n]).then(function(){a(f)},function(){e(f)})}else b(function(){function b(){var b;(b=-1!=q&&-1!=r||-1!=q&&-1!=s||-1!=r&&-1!=s)&&((b=q!=r&&q!=s&&r!=s)||(null===k&&(b=/AppleWebKit\/([0-9]+)(?:\.([0-9]+))/.exec(window.navigator.userAgent),k=!!b&&(536>parseInt(b[1],10)||536===parseInt(b[1],10)&&11>=parseInt(b[2],10))),b=k&&(q==t&&r==t&&s==t||q==u&&r==u&&s==u||q==v&&r==v&&s==v)),b=!b),b&&(w.parentNode&&w.parentNode.removeChild(w),clearTimeout(x),a(f))}function m(){if((new Date).getTime()-l>=i)w.parentNode&&w.parentNode.removeChild(w),e(f);else{var a=document.hidden;!0!==a&&void 0!==a||(q=n.a.offsetWidth,r=o.a.offsetWidth,s=p.a.offsetWidth,b()),x=setTimeout(m,50)}}var n=new c(h),o=new c(h),p=new c(h),q=-1,r=-1,s=-1,t=-1,u=-1,v=-1,w=document.createElement("div"),x=0;w.dir="ltr",d(n,j(f,"sans-serif")),d(o,j(f,"serif")),d(p,j(f,"monospace")),w.appendChild(n.a),w.appendChild(o.a),w.appendChild(p.a),document.body.appendChild(w),t=n.a.offsetWidth,u=o.a.offsetWidth,v=p.a.offsetWidth,m(),g(n,function(a){q=a,b()}),d(n,j(f,'"'+f.family+'",sans-serif')),g(o,function(a){r=a,b()}),d(o,j(f,'"'+f.family+'",serif')),g(p,function(a){s=a,b()}),d(p,j(f,'"'+f.family+'",monospace'))})})},f=h}();var g={observe:function(a,b){for(var c=b.prefix,d=function(a){var b=a.weight?"-"+a.weight:"",d=a.style?"-"+a.style:"",e=a.className?"-"+a.className:"",g=a.className?"-"+a.className+b+d:"",h=document.getElementsByTagName("html")[0].classList,i=function(a){h.add(c+e+"-"+a),h.add(c+g+"-"+a)},j=function(a){h.remove(c+e+"-"+a),h.remove(c+g+"-"+a)};i("loading"),new f(a.familyName).load(a.testString).then(function(){i("ready"),j("loading")},function(){i("failed"),j("loading")})},e=0;e<a.length;e++)d(a[e])}},h={load:function(a){var b=document.createElement("link");b.href=a,b.media="all",b.rel="stylesheet",document.getElementsByTagName("head")[0].appendChild(b)},loadAsync:function(a){e(a)}},i={load:function(a){var b=document.createElement("script"),c=document.scripts[0];b.src=a,c.parentNode.appendChild(b)}};try{if(window.FontAwesomeCdnConfig){var j=window.FontAwesomeCdnConfig,k=j.useUrl,l=j.faCdnUrl,m=j.code,n="FontAwesome",o="fa",p="",q=d.bind(d,"fa"),r=function(){};j.autoA11y.enabled&&(a(q),c(q)),j.reporting.enabled&&b(j.reporting.domains,location.host)&&i.load(l+"/js/stats.js"),cssUrl="https://"+k+"/"+m+".css",new f(n).load(p).then(function(){var a=(window.FontAwesomeHooks||{}).loaded||r;a()},r),j.asyncLoading.enabled?h.loadAsync(cssUrl):h.load(cssUrl),g.observe([{familyName:n,testString:p}],{prefix:o+"-events-icons"})}}catch(s){}}();
/**
 * 움직이는 배너 Jquery Plug-in
 * @author  cafe24
 */

(function($){

    $.fn.floatBanner = function(options) {
        options = $.extend({}, $.fn.floatBanner.defaults , options);

        return this.each(function() {
            var aPosition = $(this).position();
            var jbOffset = $(this).offset();
            var node = this;

            $(window).scroll(function() {
                var _top = $(document).scrollTop();
                _top = (aPosition.top < _top) ? _top : aPosition.top;

                setTimeout(function () {
                    var newinit = $(document).scrollTop();

                    if ( newinit > jbOffset.top ) {
                        _top -= jbOffset.top;
                        var container_height = $("#wrap").height();
                        var quick_height = $(node).height();
                        var cul = container_height - quick_height;
                        if(_top > cul){
                            _top = cul;
                        }
                    }else {
                        _top = 0;
                    }

                    $(node).stop().animate({top: _top}, options.animate);
                }, options.delay);
            });
        });
    };

    $.fn.floatBanner.defaults = {
        'animate'  : 500,
        'delay'    : 500
    };

})(jQuery);

/**
 * 문서 구동후 시작
 */
$(document).ready(function(){
    $('#banner:visible, #quick:visible').floatBanner();

    //placeholder
    $(".ePlaceholder input, .ePlaceholder textarea").each(function(i){
        var placeholderName = $(this).parents().attr('title');
        $(this).attr("placeholder", placeholderName);
    });
    /* placeholder ie8, ie9 */
    $.fn.extend({
        placeholder : function() {
            //IE 8 버전에는 hasPlaceholderSupport() 값이 false를 리턴
           if (hasPlaceholderSupport() === true) {
                return this;
            }
            //hasPlaceholderSupport() 값이 false 일 경우 아래 코드를 실행
            return this.each(function(){
                var findThis = $(this);
                var sPlaceholder = findThis.attr('placeholder');
                if ( ! sPlaceholder) {
                   return;
                }
                findThis.wrap('<label class="ePlaceholder" />');
                var sDisplayPlaceHolder = $(this).val() ? ' style="display:none;"' : '';
                findThis.before('<span' + sDisplayPlaceHolder + '>' + sPlaceholder + '</span>');
                this.onpropertychange = function(e){
                    e = event || e;
                    if (e.propertyName == 'value') {
                        $(this).trigger('focusout');
                    }
                };
                //공통 class
                var agent = navigator.userAgent.toLowerCase();
                if (agent.indexOf("msie") != -1) {
                    $(".ePlaceholder").css({"position":"relative"});
                    $(".ePlaceholder span").css({"position":"absolute", "padding":"0 4px", "color":"#878787"});
                    $(".ePlaceholder label").css({"padding":"0"});
                }
            });
        }
    });

    $(':input[placeholder]').placeholder(); //placeholder() 함수를 호출

    //클릭하면 placeholder 숨김
    $('body').delegate('.ePlaceholder span', 'click', function(){
        $(this).hide();
    });

    //input창 포커스 인 일때 placeholder 숨김
    $('body').delegate('.ePlaceholder :input', 'focusin', function(){
        $(this).prev('span').hide();
    });

    //input창 포커스 아웃 일때 value 가 true 이면 숨김, false 이면 보여짐
    $('body').delegate('.ePlaceholder :input', 'focusout', function(){
        if (this.value) {
            $(this).prev('span').hide();
        } else {
            $(this).prev('span').show();
        }
    });

    //input에 placeholder가 지원이 되면 true를 안되면 false를 리턴값으로 던져줌
    function hasPlaceholderSupport() {
        if ('placeholder' in document.createElement('input')) {
            return true;
        } else {
            return false;
        }
    }
});

/**
 *  썸네일 이미지 엑박일경우 기본값 설정
 */
$(window).load(function() {
    $("img.thumb,img.ThumbImage,img.BigImage").each(function($i,$item){
        var $img = new Image();
        $img.onerror = function () {
                $item.src="//img.echosting.cafe24.com/thumb/img_product_big.gif";
        }
        $img.src = this.src;
    });
});
//window popup script
function winPop(url) {
    window.open(url, "popup", "width=300,height=300,left=10,top=10,resizable=no,scrollbars=no");
}
/**
 * document.location.href split
 * return array Param
 */
function getQueryString(sKey)
{
    var sQueryString = document.location.search.substring(1);
    var aParam       = {};

    if (sQueryString) {
        var aFields = sQueryString.split("&");
        var aField  = [];
        for (var i=0; i<aFields.length; i++) {
            aField = aFields[i].split('=');
            aParam[aField[0]] = aField[1];
        }
    }

    aParam.page = aParam.page ? aParam.page : 1;
    return sKey ? aParam[sKey] : aParam;
};

$(document).ready(function(){
    // tab
    $.eTab = function(ul){
        $(ul).find('a').click(function(){
            var _li = $(this).parent('li').addClass('selected').siblings().removeClass('selected'),
                _target = $(this).attr('href'),
                _siblings = '.' + $(_target).attr('class');
            $(_target).show().siblings(_siblings).hide();
            return false
        });
    }
    if ( window.call_eTab ) {
        call_eTab();
    };
});
(function($){
$.fn.extend({
    center: function() {
        this.each(function() {
            var
                $this = $(this),
                $w = $(window);
            $this.css({
                position: "absolute",
                top: ~~(($w.height() - $this.outerHeight()) / 2) + $w.scrollTop() + "px",
                left: ~~(($w.width() - $this.outerWidth()) / 2) + $w.scrollLeft() + "px"
            });
        });
        return this;
    }
});
$(function() {
    var $container = function(){/*
<div id="modalContainer">
    <iframe id="modalContent" scroll="0" scrolling="no" frameBorder="0"></iframe>
</div>');
*/}.toString().slice(14,-3);
    $('body')
    .append($('<div id="modalBackpanel"></div>'))
    .append($($container));
    function closeModal () {
        $('#modalContainer').hide();
        $('#modalBackpanel').hide();
    }
    $('#modalBackpanel').click(closeModal);
    zoom = function ($piProductNo, $piCategoryNo, $piDisplayGroup) {
        var $url = '/product/image_zoom.html?product_no=' + $piProductNo + '&cate_no=' + $piCategoryNo + '&display_group=' + $piDisplayGroup;
        $('#modalContent').attr('src', $url);
        $('#modalContent').bind("load",function(){
            $(".header .close",this.contentWindow.document.body).bind("click", closeModal);
        });
        $('#modalBackpanel').css({width:$("body").width(),height:$("body").height(),opacity:.4}).show();
        $('#modalContainer').center().show();
    }
});
})(jQuery);
/* go_top */
function go_top(orix,oriy,desx,desy) {
    var Timer;
    if (document.body.scrollTop == 0) {
        var winHeight = document.documentElement.scrollTop;
    } else {
        var winHeight = document.body.scrollTop;
    }
    if(Timer) clearTimeout(Timer);
    startx = 0;
    starty = winHeight;
    if(!orix || orix < 0) orix = 0;
    if(!oriy || oriy < 0) oriy = 0;
    var speed = 7;
    if(!desx) desx = 0 + startx;
    if(!desy) desy = 0 + starty;
    desx += (orix - startx) / speed;
    if (desx < 0) desx = 0;
    desy += (oriy - starty) / speed;
    if (desy < 0) desy = 0;
    var posX = Math.ceil(desx);
    var posY = Math.ceil(desy);
    window.scrollTo(posX, posY);
    if((Math.floor(Math.abs(startx - orix)) < 1) && (Math.floor(Math.abs(starty - oriy)) < 1)){
        clearTimeout(Timer);
        window.scroll(orix,oriy);
    }else if(posX != orix || posY != oriy){
        Timer = setTimeout("go_top("+orix+","+oriy+","+desx+","+desy+")",10);
    }else{
        clearTimeout(Timer);
    }
}


/* fix */
jQuery(document).ready(function() {
	jQuery(window).scroll(function(){

		if (jQuery(document).scrollTop() > 1) {
			jQuery('#header').addClass('fix');
			jQuery('#quickmenu').fadeIn('fast');
			//
			if($(this).scrollLeft() > 0) {
				$("#header").css("margin-left", -0-$(this).scrollLeft());
			}
			else {
				$("#header").css("margin-left", -0);
			}
			//
		} else {
			jQuery('#header').removeClass('fix');
			jQuery('#quickmenu').fadeOut('fast');
		}

	});
});
$(document).ready(function(){
    if (typeof(EC_SHOP_MULTISHOP_SHIPPING) != "undefined") {
        var sShippingCountryCode4Cookie = 'shippingCountryCode';
        var bShippingCountryProc = false;

        // 배송국가 선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptioncountry').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
            var aShippingCountryCode = document.cookie.match('(^|;) ?'+sShippingCountryCode4Cookie+'=([^;]*)(;|$)');
            if (typeof(aShippingCountryCode) != 'undefined' && aShippingCountryCode != null && aShippingCountryCode.length > 2) {
                var sShippingCountryValue = aShippingCountryCode[2];
            }

            // query string으로 넘어 온 배송국가 값이 있다면, 그 값을 적용함
            var aHrefCountryValue = decodeURIComponent(location.href).split("/?country=");

            if (aHrefCountryValue.length == 2) {
                var sShippingCountryValue = aHrefCountryValue[1];
            }

            // 메인 페이지에서 국가선택을 안한 경우, 그 외의 페이지에서 셋팅된 값이 안 나오는 현상 처리
            if (location.href.split("/").length != 4 && $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val()) {
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));

                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());
                }
            }
            if (typeof(sShippingCountryValue) != "undefined" && sShippingCountryValue != "" && sShippingCountryValue != null) {
                sShippingCountryValue = sShippingCountryValue.split("#")[0];
                var bShippingCountryProc = true;

                $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
                $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
                var expires = new Date();
                expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
                document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();
                if ($("#f_country").length > 0 && location.href.indexOf("orderform.html") > -1) {
                    $("#f_country").val(sShippingCountryValue).change();;
                }
            }
        }
        // 언어선택 설정이 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingLanguageSelection === false) {
            $('.xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist').hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption .xans-layout-multishoplistmultioptionlanguage').hide();
        } else {
            $('.thumb .xans-layout-multishoplistitem').hide();
        }

        // 배송국가 및 언어 설정이 둘 다 사용안함이면 숨김
        if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShipping === false) {
            $(".xans-layout-multishopshipping").hide();
            $('.xans-layout-multishoplist .xans-layout-multishoplistmultioption').hide();
        } else if (bShippingCountryProc === false && location.href.split("/").length == 4) { // 배송국가 값을 처리한 적이 없고, 메인화면일 때만 선택 레이어를 띄움
            var sShippingCountryValue = $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val();
            $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val(sShippingCountryValue);
            $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a .ship span").text(" : "+$(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist option:selected").text().split("SHIPPING TO : ").join(""));
            // 배송국가 선택을 사용해야 레이어를 보이게 함
            if (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === true) {
                $(".xans-layout-multishopshipping").show();
            }
        }

        $(".xans-layout-multishopshipping .close").bind("click", function() {
            $(".xans-layout-multishopshipping").hide();
        });

        $(".xans-layout-multishopshipping .ec-base-button a").bind("click", function() {
            var expires = new Date();
            expires.setTime(expires.getTime() + (30 * 24 * 60 * 60 * 1000)); // 30일간 쿠키 유지
            document.cookie = sShippingCountryCode4Cookie+'=' + $(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val() +';path=/'+ ';expires=' + expires.toUTCString();

            // 도메인 문제로 쿠키로 배송국가 설정이 안 되는 경우를 위해 query string으로 배송국가 값을 넘김
            var sQuerySting = (EC_SHOP_MULTISHOP_SHIPPING.bMultishopShippingCountrySelection === false) ? "" : "/?country="+encodeURIComponent($(".xans-layout-multishopshipping .xans-layout-multishopshippingcountrylist").val());

            location.href = '//'+$(".xans-layout-multishopshipping .xans-layout-multishopshippinglanguagelist").val()+sQuerySting;
        });
        $(".xans-layout-multishoplist .xans-layout-multishoplistmultioption a").bind("click", function() {
            $(".xans-layout-multishopshipping").show();
        });
    }
});
