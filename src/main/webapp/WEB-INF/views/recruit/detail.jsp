<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>모집글 상세</title>
    <style>
        :root{
            --bg:#f5f6f7;
            --text:#111;
            --muted:#777;
            --line:#e9ecef;
            --card:#fff;
            --primary:#2da8ff;
            --primary-soft:#e8f6ff;
        }
        *{ box-sizing:border-box; }
        body{
            margin:0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
            background:var(--bg);
            color:var(--text);
        }
        a{ color:inherit; text-decoration:none; }

        /* ====== 헤더(홈과 동일) ====== */
        .header{ background:#fff; border-bottom:1px solid var(--line); }
        .header-inner{
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            display:flex;
            align-items:center;
            justify-content:space-between;
            padding: 18px 0;
        }
        .brand{
            display:flex; align-items:center; gap:12px;
            font-weight:800; font-size:20px;
        }
        .brand .logo{
            width:34px; height:34px; border-radius:50%;
            background: radial-gradient(circle at 30% 30%, #9be1ff, #2da8ff);
        }
        .brand-text{ display:flex; flex-direction:column; line-height:1.1; }
        .brand .sub{ font-weight:700; font-size:13px; color:#3b3b3b; margin-top:2px; }

        .auth{
            display:flex; align-items:center; gap:10px;
            color:#333; font-weight:600;
        }
        .auth a{
            display:flex; align-items:center; gap:6px;
            padding: 8px 10px; border-radius:8px;
        }
        .auth a:hover{ background:#f3f4f6; }
        .auth .icon{
            width:18px; height:18px; border-radius:50%;
            border:2px solid #111; display:inline-block; position:relative;
        }
        .auth .icon:after{
            content:""; position:absolute; left:50%; top:55%;
            transform:translate(-50%,-50%);
            width:8px; height:8px; border-radius:50%; background:#111;
        }

        .gnb{ background:#fff; border-bottom:1px solid var(--line); }
        .gnb-inner{
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            display:flex;
            align-items:center;
            gap:28px;
            padding: 12px 0 0;
        }
        .menu{
            display:flex; align-items:center; gap:26px;
            font-weight:700; color:#111;
        }
        .menu a{ display:inline-block; padding: 12px 2px 14px; opacity:.9; }
        .menu a:hover{ opacity:1; }
        .menu a.active{
            color:var(--primary);
            position:relative;
        }
        .menu a.active:after{
            content:""; position:absolute; left:0; right:0; bottom:6px;
            height:3px; border-radius:3px; background:var(--primary);
        }

        /* ====== 페이지 ====== */
        .wrap{
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 18px auto 60px;
        }
        .section{
            background:var(--card);
            border:1px solid var(--line);
            border-radius:12px;
            padding: 22px;
        }
        .section + .section{ margin-top:16px; }

        /* ====== 상단 동아리 헤더 ====== */
        .club-head{ display:flex; gap:16px; align-items:center; }
        .club-badge{
            width:70px; height:70px; border-radius:50%;
            border:1px solid var(--line);
            background: linear-gradient(135deg, #ffffff, #f3f7ff);
            display:flex; align-items:center; justify-content:center;
            font-weight:900;
            overflow:hidden;
        }
        .club-badge img{
            width:100%; height:100%; object-fit:cover; display:block;
        }
        .club-title{
            font-size:28px;
            font-weight:900;
            margin:0;
            letter-spacing:-0.6px;
        }
        .club-sub{
            display:flex; align-items:center; gap:10px;
            margin-top:6px;
            color:#9aa3ad;
            font-weight:700;
            font-size:13px;
            flex-wrap:wrap;
        }

        .like-btn{
            border:0;
            background:transparent;
            cursor:pointer;
            padding:0;
        }
        .like{
            display:inline-flex; align-items:center; gap:6px;
            color:#ff5a73;
            font-weight:900;
        }
        .heart{ width:14px; height:14px; display:inline-block; transform: translateY(-1px); }

        /* ====== 탭 ====== */
        .tabs{
            background:#fff;
            border:1px solid var(--line);
            border-radius:12px;
            overflow:hidden;
        }
        .tab-row{
            display:flex;
            align-items:center;
            justify-content:space-around;
            background:#fff;
            border-bottom:1px solid var(--line);
        }
        .tab-btn{
            flex:1;
            text-align:center;
            padding: 18px 10px;
            font-weight:900;
            color:#111;
            opacity:.85;
            position:relative;
            cursor:pointer;
            user-select:none;
        }
        .tab-btn:hover{ opacity:1; }
        .tab-btn.active{ color:var(--primary); opacity:1; }
        .tab-btn.active:after{
            content:"";
            position:absolute;
            left:18%; right:18%;
            bottom:-1px;
            height:3px;
            border-radius:3px;
            background:var(--primary);
        }
        .tab-content{ padding: 18px; }
        .hidden{ display:none; }

        /* ====== 카드 ====== */
        .card{
            margin-top:14px;
            padding: 16px;
            border:1px solid var(--line);
            border-radius:12px;
            background:#fff;
        }
        .card:first-child{ margin-top:0; }
        .card h3{ margin:0 0 10px; font-size:18px; font-weight:900; }
        .p{ color:#50555c; font-weight:700; line-height:1.65; white-space:pre-line; }

        /* ====== 모집기간 ====== */
        .period{
            display:flex; align-items:center; gap:14px;
            padding: 16px;
            border:1px solid var(--line);
            border-radius:12px;
            background:#fff;
            flex-wrap:wrap;
        }
        .dchip{
            background: var(--primary-soft);
            color: var(--primary);
            font-weight:900;
            padding: 6px 10px;
            border-radius:999px;
        }
        .dchip.end {
            background: #f2f2f2;
            color: #999;
        }

        /* ====== 버튼 ====== */
        .btn{
            padding: 10px 12px;
            border:1px solid var(--line);
            border-radius:10px;
            background:#fff;
            cursor:pointer;
            font-weight:900;
        }
        .btn:hover{ background:#fafbfc; }
        .btn.primary{
            border-color:#cfeaff;
            background:#e9f6ff;
            color:var(--primary);
        }

        /* ====== 테이블 ====== */
        table{
            width:100%;
            border-collapse:collapse;
            margin-top:12px;
            background:#fff;
        }
        th, td{
            border-bottom:1px solid var(--line);
            padding: 12px 10px;
            text-align:left;
            font-weight:700;
            color:#333;
        }
        th{ color:#7a8088; font-weight:900; }
        .actions{ display:flex; gap:8px; }
        .actions form{ margin:0; }

        .meta-pill{
            display:inline-flex;
            gap:8px;
            align-items:center;
            color:#7a8088;
            font-weight:800;
        }
    </style>

    <script>
        function activateTab(btn){
            const target = btn.getAttribute("data-target");
            const allBtns = document.querySelectorAll(".tab-btn");
            const allPanels = document.querySelectorAll(".tab-panel");

            allBtns.forEach(b => b.classList.remove("active"));
            allPanels.forEach(p => p.classList.add("hidden"));

            btn.classList.add("active");

            const panel = document.getElementById(target);
            if(panel){
                panel.classList.remove("hidden");
            } else {
                if(allPanels.length > 0) allPanels[0].classList.remove("hidden");
            }
        }

        window.addEventListener("DOMContentLoaded", () => {
            const first = document.querySelector(".tab-btn");
            if(first) activateTab(first);
        });
    </script>
</head>
<body>

<c:set var="loginUser" value="${sessionScope.loginUser}" />

<!-- 헤더 -->
<div class="header">
    <div class="header-inner">
        <div class="brand" style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/home'">
            <div class="logo"></div>
            <div class="brand-text">
                <div>ClubList</div>
                <div class="sub">캠퍼스 동아리 모집</div>
            </div>
        </div>

        <div class="auth">
            <c:choose>
                <c:when test="${not empty sessionScope.loginUser}">
          <span style="font-weight:900;">
            <c:out value="${sessionScope.loginUser.username}"/>님
          </span>

                    <c:if test="${sessionScope.loginUser.role eq 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/recruit/list" title="관리자">
                            관리자
                        </a>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/auth/logout" title="로그아웃">
                        로그아웃
                    </a>
                </c:when>

                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/login" title="로그인">
                        <span class="icon"></span>
                        로그인
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- 메뉴바 -->
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

    <!-- 상단 요약 -->
    <div class="section">
        <div class="club-head">
            <div class="club-badge">
                <c:choose>
                    <c:when test="${not empty recruit.imageUrl}">
                        <img src="${recruit.imageUrl}" alt="club"/>
                    </c:when>
                    <c:otherwise>
                        CL
                    </c:otherwise>
                </c:choose>
            </div>

            <div style="flex:1;">
                <h1 class="club-title"><c:out value="${recruit.title}"/></h1>

                <!-- D-day + 마감일 -->
                <div style="margin-top:6px;">
                    <c:choose>
                        <c:when test="${dday >= 0}">
                            <span class="dchip">D-${dday}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="dchip end">마감</span>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${recruit.deadline != null}">
                        <span class="meta-pill" style="margin-left:10px;">
                            마감일: ${recruit.deadline}
                        </span>
                    </c:if>
                </div>

                <div class="club-sub">
                    <!-- 좋아요 토글 -->
                    <form action="${pageContext.request.contextPath}/recruit/like" method="post" style="margin:0;">
                        <input type="hidden" name="recruitId" value="${recruit.id}"/>
                        <button class="like-btn" type="submit" title="좋아요">
                            <span class="like" style="${liked ? '' : 'opacity:.75;'}">
                                <svg class="heart" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                                    <path d="M12 21s-7.2-4.6-9.6-9C.9 8.8 3 6 6.3 6c1.8 0 3 .9 3.7 1.8C10.7 6.9 12 6 13.7 6 17 6 19.1 8.8 21.6 12c-2.4 4.4-9.6 9-9.6 9z"/>
                                </svg>
                                <span>${recruit.likeCount}</span>
                            </span>
                        </button>
                    </form>

                    <span>·</span>
                    <span style="font-weight:900; color:#9aa3ad;"><c:out value="${recruit.category}"/></span>

                    <span>·</span>
                    <span class="meta-pill">조회수 ${recruit.viewCount}</span>

                    <!-- 관리자 버튼 자리(경로는 추후 네 admin CRUD 만들면서 연결) -->
                    <c:if test="${not empty loginUser && loginUser.role eq 'ADMIN'}">
                        <span>·</span>
                        <span class="meta-pill" style="color:#2da8ff;">관리자 모드</span>
                    </c:if>
                </div>
            </div>

            <button class="btn" onclick="location.href='${pageContext.request.contextPath}/home'">← 메인</button>
        </div>
    </div>

    <!-- 탭 -->
    <div class="tabs">
        <div class="tab-row">
            <div class="tab-btn active" data-target="panel-notice" onclick="activateTab(this)">모집 공고</div>

            <div class="tab-btn" data-target="panel-apply" onclick="activateTab(this)">
                지원서
                <span style="color:#ffb020; font-weight:900; margin-left:6px;">
                    <c:choose>
                        <c:when test="${empty apps}">0</c:when>
                        <c:otherwise>${apps.size()}</c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>

        <!-- 모집 공고 패널 -->
        <div id="panel-notice" class="tab-content tab-panel">
            <div class="period">
                <span style="font-weight:900;">모집 상태</span>

                <c:choose>
                    <c:when test="${recruit.deadline == null}">
                        <span class="dchip">상시모집</span>
                    </c:when>
                    <c:when test="${dday >= 0}">
                        <span class="dchip">D-${dday}</span>
                    </c:when>
                    <c:otherwise>
                        <span class="dchip end">마감</span>
                    </c:otherwise>
                </c:choose>

                <c:if test="${recruit.deadline != null}">
                    <span style="color:#7a8088; font-weight:900;">
                        마감일: ${recruit.deadline}
                    </span>
                </c:if>
            </div>

            <div class="card">
                <h3>모집 공고</h3>
                <div class="p"><c:out value="${recruit.description}"/></div>
            </div>
        </div>

        <!-- 지원서 패널 -->
        <div id="panel-apply" class="tab-content tab-panel hidden">
            <div class="card" style="margin-top:0;">
                <div style="display:flex; justify-content:space-between; align-items:center; gap:10px;">
                    <h3 style="margin:0;">지원서 작성 / 목록</h3>
                    <button class="btn primary"
                            onclick="location.href='${pageContext.request.contextPath}/application/add?recruitId=${recruit.id}'">
                        + 지원서 작성
                    </button>
                </div>

                <table>
                    <thead>
                    <tr>
                        <th style="width:70px;">ID</th>
                        <th>이름</th>
                        <th style="width:90px;">학년</th>
                        <th style="width:180px;">전공</th>
                        <th style="width:200px;">관리</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${apps}">
                        <tr>
                            <td>${a.id}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/application/view?id=${a.id}" style="font-weight:900;">
                                    <c:out value="${a.name}"/>
                                </a>
                            </td>
                            <td>${a.grade}</td>
                            <td><c:out value="${a.major}"/></td>
                            <td>
                                <div class="actions">
                                    <button class="btn"
                                            onclick="location.href='${pageContext.request.contextPath}/application/edit?id=${a.id}'">
                                        수정
                                    </button>

                                    <form action="${pageContext.request.contextPath}/application/delete" method="post">
                                        <input type="hidden" name="id" value="${a.id}"/>
                                        <input type="hidden" name="recruitId" value="${recruit.id}"/>
                                        <button class="btn" type="submit">삭제</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty apps}">
                        <tr>
                            <td colspan="5" style="color:#9aa3ad; font-weight:900; padding:18px;">
                                아직 제출된 지원서가 없습니다.
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

</body>
</html>
