<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>지원서 상세</title>
    <style>
        :root{
            --bg:#f5f6f7; --text:#111; --muted:#777; --line:#e9ecef; --card:#fff;
            --primary:#2da8ff; --primary-soft:#e8f6ff;
        }
        *{ box-sizing:border-box; }
        body{
            margin:0;
            font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,"Apple SD Gothic Neo","Noto Sans KR",sans-serif;
            background:var(--bg); color:var(--text);
        }
        a{ color:inherit; text-decoration:none; }

        .header{ background:#fff; border-bottom:1px solid var(--line); }
        .header-inner{
            width:1020px; max-width:calc(100% - 32px);
            margin:0 auto; display:flex; align-items:center; justify-content:space-between;
            padding:18px 0;
        }
        .brand{ display:flex; align-items:center; gap:12px; font-weight:800; font-size:20px; cursor:pointer; }
        .brand .logo{ width:34px; height:34px; border-radius:50%; background: radial-gradient(circle at 30% 30%, #9be1ff, #2da8ff); }
        .brand-text{ display:flex; flex-direction:column; line-height:1.1; }
        .brand .sub{ font-weight:700; font-size:13px; color:#3b3b3b; margin-top:2px; }

        .auth{ display:flex; align-items:center; gap:10px; color:#333; font-weight:600; }
        .auth a{ display:flex; align-items:center; gap:6px; padding:8px 10px; border-radius:8px; }
        .auth a:hover{ background:#f3f4f6; }
        .auth .icon{ width:18px; height:18px; border-radius:50%; border:2px solid #111; display:inline-block; position:relative; }
        .auth .icon:after{ content:""; position:absolute; left:50%; top:55%; transform:translate(-50%,-50%); width:8px; height:8px; border-radius:50%; background:#111; }

        .gnb{ background:#fff; border-bottom:1px solid var(--line); }
        .gnb-inner{
            width:1020px; max-width:calc(100% - 32px);
            margin:0 auto; display:flex; align-items:center; gap:28px;
            padding:12px 0 0;
        }
        .menu{ display:flex; align-items:center; gap:26px; font-weight:700; color:#111; }
        .menu a{ display:inline-block; padding:12px 2px 14px; opacity:.9; }
        .menu a:hover{ opacity:1; }
        .menu a.active{ color:var(--primary); position:relative; opacity:1; }
        .menu a.active:after{ content:""; position:absolute; left:0; right:0; bottom:6px; height:3px; border-radius:3px; background:var(--primary); }

        .wrap{ width:1020px; max-width:calc(100% - 32px); margin:18px auto 60px; }
        .section{ background:var(--card); border:1px solid var(--line); border-radius:12px; padding:22px; }
        .title-row{ display:flex; align-items:center; justify-content:space-between; gap:10px; margin-bottom:14px; }
        .title{ margin:0; font-size:22px; font-weight:900; letter-spacing:-0.4px; }
        .subtitle{ margin-top:6px; color:#7a8088; font-weight:700; font-size:13px; }

        .kv{
            display:grid;
            grid-template-columns: 120px 1fr;
            gap:10px 14px;
            padding:16px;
            border:1px solid var(--line);
            border-radius:12px;
            background:#fff;
        }
        .k{ color:#7a8088; font-weight:900; }
        .v{ color:#111; font-weight:800; }
        .message{
            margin-top:14px;
            padding:16px;
            border:1px solid var(--line);
            border-radius:12px;
            background:#fff;
        }
        .message .label{ font-weight:900; margin-bottom:10px; }
        .message pre{
            margin:0;
            white-space:pre-wrap;
            word-break:break-word;
            line-height:1.7;
            color:#50555c;
            font-weight:700;
        }

        .btn-row{
            display:flex;
            justify-content:flex-end;
            gap:10px;
            margin-top:16px;
        }
        .btn{
            padding:10px 12px;
            border:1px solid var(--line);
            border-radius:10px;
            background:#fff;
            cursor:pointer;
            font-weight:900;
        }
        .btn:hover{ background:#fafbfc; }
        .btn.primary{ border-color:#cfeaff; background:#e9f6ff; color:var(--primary); }
    </style>
</head>
<body>

<div class="header">
    <div class="header-inner">
        <div class="brand" onclick="location.href='${pageContext.request.contextPath}/home'">
            <div class="logo"></div>
            <div class="brand-text">
                <div>ClubList</div>
                <div class="sub">캠퍼스 동아리 모집</div>
            </div>
        </div>
        <div class="auth">
            <a href="#" title="로그인"><span class="icon"></span>로그인</a>
        </div>
    </div>
</div>

<div class="gnb">
    <div class="gnb-inner">
        <nav class="menu">
            <a class="active" href="#">동아리</a>
            <a href="#">대외활동</a>
            <a href="#">공모전</a>
            <a href="#">취업정보</a>
            <a href="#">스터디</a>
            <a href="#">이벤트</a>
            <a href="#">게시요청</a>
            <a href="#">EDU</a>
        </nav>
    </div>
</div>

<div class="wrap">
    <div class="section">
        <div class="title-row">
            <div>
                <h1 class="title">지원서 상세</h1>
                <div class="subtitle">지원서 내용을 확인하세요.</div>
            </div>
            <button class="btn" type="button"
                    onclick="location.href='${pageContext.request.contextPath}/recruit/detail?id=${app.recruitId}'">
                ← 모집글로
            </button>
        </div>

        <div class="kv">
            <div class="k">ID</div><div class="v">${app.id}</div>
            <div class="k">이름</div><div class="v">${app.name}</div>
            <div class="k">학년</div><div class="v">${app.grade}</div>
            <div class="k">전공</div><div class="v">${app.major}</div>
        </div>

        <div class="message">
            <div class="label">내용</div>
            <pre>${app.message}</pre>
        </div>

        <div class="btn-row">
            <button class="btn"
                    onclick="location.href='${pageContext.request.contextPath}/application/edit?id=${app.id}'">
                수정
            </button>
            <button class="btn primary"
                    onclick="location.href='${pageContext.request.contextPath}/recruit/detail?id=${app.recruitId}'">
                목록으로
            </button>
        </div>
    </div>
</div>

</body>
</html>
