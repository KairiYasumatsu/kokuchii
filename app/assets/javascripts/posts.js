// SNSボタンを追加するエリア
var snsArea = document.getElementById('sns-area');

// シェア時に使用する値


generate_share_button(snsArea, shareUrl, shareText);

// シェアボタンを生成する関数
function generate_share_button(area, url, text) {
    // シェアボタンの作成
    var twBtn = document.createElement('div');
    twBtn.className = 'sns-btn twitter-btn';
    var fbBtn = document.createElement('div');
    fbBtn.className = 'sns-btn facebook-btn';
    var liBtn = document.createElement('div');
    liBtn.className = 'sns-btn line-btn';

    // 各シェアボタンのリンク先
    var twHref = 'https://twitter.com/share?text='+encodeURIComponent(text)+'&url='+encodeURIComponent(url);
    var fbHref = 'http://www.facebook.com/share.php?u='+encodeURIComponent(url);
    var liHref = 'https://line.me/R/msg/text/?'+encodeURIComponent(text)+' '+encodeURIComponent(url);

    // シェアボタンにリンクを追加
    var clickEv = 'onclick="popupWindow(this.href); return false;"';
    var twLink = '<a href="' + twHref + '" ' + clickEv + '>twitter</a>';
    var fbLink = '<a href="' + fbHref + '" ' + clickEv + '>facebook</a>';
    var liLink = '<a href="' + liHref + '" target="_blank">LINE</a>';
    twBtn.innerHTML = twLink;
    fbBtn.innerHTML = fbLink;
    liBtn.innerHTML = liLink;

    // シェアボタンを表示
    area.appendChild(twBtn);
    area.appendChild(fbBtn);
    area.appendChild(liBtn);
}

// クリック時にポップアップで表示させる関数
function popupWindow(url) {
    window.open(url, '', 'width=580,height=400,menubar=no,toolbar=no,scrollbars=yes');
}
