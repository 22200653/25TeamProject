<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>ClubList</title>
    <style>
        :root {
            --bg: #f5f6f7;
            --text: #111;
            --muted: #777;
            --line: #e9ecef;
            --card: #fff;
            --primary: #2da8ff; /* 캠퍼스픽 느낌 파란색 */
            --primary-soft: #e8f6ff; /* 파란색 배경 */
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, "Apple SD Gothic Neo", "Noto Sans KR", sans-serif;
            background: var(--bg);
            color: var(--text);
        }

        a { color: inherit; text-decoration: none; }

        /* ====== 상단(로고/로그인) ====== */
        .header { background: #fff; border-bottom: 1px solid var(--line); }

        .header-inner {
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 800;
            font-size: 20px;
        }

        .brand .logo {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: radial-gradient(circle at 30% 30%, #9be1ff, #2da8ff);
        }

        .brand .sub {
            font-weight: 700;
            font-size: 13px;
            color: #3b3b3b;
            margin-top: 2px;
        }

        .brand-text {
            display: flex;
            flex-direction: column;
            line-height: 1.1;
        }

        .auth {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #333;
            font-weight: 600;
        }

        .auth a {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 10px;
            border-radius: 8px;
        }

        .auth a:hover { background: #f3f4f6; }

        .auth .icon {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 2px solid #111;
            display: inline-block;
            position: relative;
        }

        .auth .icon:after {
            content: "";
            position: absolute;
            left: 50%;
            top: 55%;
            transform: translate(-50%, -50%);
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #111;
        }

        /* ====== 상단 메뉴 바 ====== */
        .gnb { background: #fff; border-bottom: 1px solid var(--line); }

        .gnb-inner {
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            display: flex;
            align-items: center;
            gap: 28px;
            padding: 12px 0 0;
        }

        .menu {
            display: flex;
            align-items: center;
            gap: 26px;
            font-weight: 700;
            color: #111;
        }

        .menu a {
            display: inline-block;
            padding: 12px 2px 14px;
            color: #111;
            opacity: .9;
        }

        .menu a:hover { opacity: 1; }

        .menu a.active {
            color: var(--primary);
            position: relative;
        }

        .menu a.active:after {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            bottom: 6px;
            height: 3px;
            border-radius: 3px;
            background: var(--primary);
        }

        /* ====== 검색 바 ====== */
        .search-wrap { background: #fff; }

        .search-inner {
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            padding: 18px 0 8px;
            display: flex;
            justify-content: center;
        }

        .search {
            width: 620px;
            max-width: 100%;
            position: relative;
        }

        .search input {
            width: 100%;
            border: 1px solid var(--line);
            background: #f6f7f9;
            border-radius: 999px;
            padding: 14px 52px 14px 18px;
            outline: none;
            font-size: 14px;
        }

        .search button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            border: 0;
            width: 36px;
            height: 36px;
            border-radius: 999px;
            background: #e9f6ff;
            color: var(--primary);
            cursor: pointer;
            font-weight: 900;
        }

        .search button:hover { background: #d9f0ff; }

        /* ====== 카테고리 탭(전체/문화/봉사...) ====== */
        .catbar { background: #fff; border-bottom: 1px solid var(--line); }

        .catbar-inner {
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 0 auto;
            display: flex;
            gap: 18px;
            padding: 10px 0 0;
            justify-content: center;
            flex-wrap: wrap;
        }

        .tab {
            padding: 10px 6px 14px;
            color: #222;
            font-weight: 700;
            font-size: 14px;
            opacity: .9;
            position: relative;
        }

        .tab:hover { opacity: 1; }

        .tab.active { color: var(--primary); }

        .tab.active:after {
            content: "";
            position: absolute;
            left: 0;
            right: 0;
            bottom: 6px;
            height: 3px;
            border-radius: 3px;
            background: var(--primary);
        }

        /* ====== 메인 컨테이너 ====== */
        .wrap {
            width: 1020px;
            max-width: calc(100% - 32px);
            margin: 18px auto 60px;
        }

        .section {
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 12px;
            padding: 22px 22px;
        }

        .section + .section { margin-top: 16px; }

        .section-title {
            font-size: 20px;
            font-weight: 900;
            margin: 0 0 16px;
        }

        /* ====== 인기 모집 공고(가로 리스트) ====== */
        .popular-row {
            display: flex;
            gap: 18px;
            overflow-x: auto;
            padding-bottom: 6px;
        }

        .popular-row::-webkit-scrollbar { height: 8px; }
        .popular-row::-webkit-scrollbar-thumb { background: #e5e7eb; border-radius: 999px; }

        .p-card { min-width: 180px; width: 180px; }

        .poster {
            width: 100%;
            height: 230px;
            border-radius: 10px;
            border: 1px solid var(--line);
            background: linear-gradient(135deg, #f2f8ff, #ffffff);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        .poster .poster-text {
            font-weight: 900;
            font-size: 26px;
            letter-spacing: -0.5px;
            color: #111;
            opacity: .85;
        }

        .p-title {
            margin-top: 10px;
            font-weight: 800;
            font-size: 14px;
            line-height: 1.35;
            height: 38px;
            overflow: hidden;
        }

        .p-meta {
            margin-top: 8px;
            color: var(--muted);
            font-size: 12px;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .p-meta .d { color: var(--primary); font-weight: 900; }

        .dot {
            width: 4px;
            height: 4px;
            background: #cfd6dd;
            border-radius: 50%;
            display: inline-block;
        }

        /* ====== 광고 배너 ====== */
        .ad {
            border-radius: 12px;
            background: #1f2433;
            color: #fff;
            padding: 18px 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            border: 1px solid rgba(255, 255, 255, .08);
        }

        .ad .left {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .ad .big {
            font-size: 28px;
            font-weight: 900;
            letter-spacing: -0.8px;
        }

        .ad .small { opacity: .85; font-weight: 700; }

        .ad .badge {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: radial-gradient(circle at 30% 30%, #ffd5a1, #ff7a59);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 900;
        }

        /* ====== 동아리 랭킹 ====== */
        .rank-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .more {
            color: #9aa3ad;
            font-weight: 800;
            font-size: 13px;
        }

        .rank-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .rank-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 6px;
        }

        .rank-left {
            display: flex;
            gap: 14px;
            align-items: flex-start;
        }

        .rank-no {
            width: 28px;
            font-weight: 900;
            color: var(--primary);
            font-size: 20px;
            line-height: 1;
            margin-top: 2px;
        }

        .rank-info .name {
            font-weight: 900;
            margin-bottom: 4px;
        }

        .rank-info .desc {
            color: #8a8f98;
            font-weight: 700;
            font-size: 13px;
            max-width: 700px;
            line-height: 1.35;
        }

        .rank-logo {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            border: 1px solid var(--line);
            background: linear-gradient(135deg, #ffffff, #f3f7ff);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 900;
            color: #3a3a3a;
        }

        .placeholder {
            color: #7a8088;
            font-weight: 700;
            line-height: 1.6;
        }

        .p-card:hover .poster {
            border-color: #d6e9ff;
            box-shadow: 0 8px 18px rgba(0, 0, 0, .06);
        }

        .rank-item:hover {
            background: #fafbfc;
            border-radius: 10px;
        }

        @media (max-width: 760px) {
            .rank-info .desc { max-width: 420px; }
        }
    </style>
</head>
<body>

<%-- ✅ 현재 선택된 category (HomeController에서 model에 category 넣어준 값 사용) --%>
<c:set var="currentCategory" value="${empty category ? '전체' : category}" />

<!-- ====== 헤더(로고/로그인) ====== -->
<c:set var="loginUser" value="${sessionScope.loginUser}" />

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


<!-- ====== 메뉴(동아리 활성 표시) ====== -->
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

<!-- ====== 동아리 검색 ====== -->
<div class="search-wrap">
    <div class="search-inner">
        <%-- 실제 검색 기능은 아직 미구현이어도, action은 home으로 두고 category 유지 --%>
        <form class="search" method="get" action="${pageContext.request.contextPath}/home">
            <input type="text" name="q" placeholder="찾으시는 동아리가 있나요?"/>
            <input type="hidden" name="category" value="${currentCategory}"/>
            <button type="submit">⌕</button>
        </form>
    </div>
</div>

<!-- ====== 동아리 카테고리 탭 ====== -->
<div class="catbar">
    <div class="catbar-inner">
        <a class="tab ${currentCategory eq '전체' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=전체">전체</a>

        <a class="tab ${currentCategory eq '공연' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=공연">공연</a>

        <a class="tab ${currentCategory eq '전산전자' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=전산전자">전산전자</a>

        <a class="tab ${currentCategory eq '체육' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=체육">체육</a>

        <a class="tab ${currentCategory eq '신앙' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=신앙">신앙</a>

        <a class="tab ${currentCategory eq '봉사' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=봉사">봉사</a>

        <a class="tab ${currentCategory eq '콘디' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=콘디">콘디</a>

        <a class="tab ${currentCategory eq '컴케' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=컴케">컴케</a>

        <a class="tab ${currentCategory eq '국제어문' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/home?category=국제어문">국제어문</a>
    </div>
</div>


<div class="wrap">

    <!-- ====== 인기 모집 공고(가로 리스트) ====== -->
    <div class="section">
        <h2 class="section-title">인기 모집 공고</h2>

        <div class="popular-row">
            <c:forEach var="r" items="${recruits}" varStatus="st">
                <c:if test="${st.index < 5}">
                    <a class="p-card" href="${pageContext.request.contextPath}/recruit/detail?id=${r.id}">
                        <div class="poster">
                            <div class="poster-text">
                                <c:out value="${fn:length(r.title) >= 2 ? fn:substring(r.title,0,2) : r.title}"/>
                            </div>
                        </div>
                        <div class="p-title">
                            <c:out value="${r.title}"/>
                        </div>
                        <div class="p-meta">
                            <c:choose>
                                <c:when test="${r.deadline == null}">
                                    <span class="d">상시모집</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="d">모집중</span>
                                </c:otherwise>
                            </c:choose>
                            <span class="dot"></span>
                            <span><c:out value="${r.category}"/></span>
                        </div>
                    </a>
                </c:if>
            </c:forEach>

            <c:if test="${empty recruits}">
                <div style="padding:14px 4px; color:#7a8088; font-weight:800;">
                    해당 카테고리에 모집글이 없어요.
                </div>
            </c:if>
        </div>
    </div>

    <!-- ====== 광고바(학교 광고 재미로) ====== -->
    <div class="section" style="padding:0; border:0; background:transparent;">
        <div class="ad">
            <div class="left">
                <div class="big">HANDONG CAMPUS</div>
                <div class="small">동아리 지원하고, 캠퍼스 생활을 더 넓게 만들어보세요</div>
            </div>
            <div class="badge">AD</div>
        </div>
    </div>
    <!-- ====== 동아리 랭킹(1~3위) : 좋아요 Top3 ====== -->
    <div class="section">
        <div class="rank-head">
            <h2 class="section-title" style="margin:0;">동아리 랭킹</h2>
            <a class="more" href="#">더보기</a>
        </div>

        <div class="rank-list">
            <c:forEach var="r" items="${top3}" varStatus="st">
                <div class="rank-item">
                    <div class="rank-left">
                        <div class="rank-no"><c:out value="${st.index + 1}"/></div>

                        <div class="rank-info">
                            <div class="name">
                                <c:out value="${r.title}"/>
                                <span style="font-size:12px; color:#9aa3ad; font-weight:800; margin-left:8px;">
                                <c:out value="${r.category}"/>
                            </span>

                                <!-- ✅ 좋아요 수 표시 -->
                                <span style="margin-left:10px; font-size:12px; color:#ff5a73; font-weight:900;">
                                ♥ <c:out value="${r.likeCount}"/>
                            </span>
                            </div>

                            <div class="desc">
                                <c:out value="${r.description}"/>
                            </div>
                        </div>
                    </div>

                    <div class="rank-logo">
                        <c:out value="${st.index == 0 ? '1st' : (st.index == 1 ? '2nd' : '3rd')}"/>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty top3}">
                <div style="padding:10px 6px; color:#7a8088; font-weight:800;">
                    랭킹을 표시할 모집글이 없어요.
                </div>
            </c:if>
        </div>
    </div>


    <!-- ====== 동아리 모집글 리스트 ====== -->
    <div class="section">
        <h2 class="section-title">동아리 모집글 리스트</h2>

        <div style="display:flex; flex-direction:column; gap:10px;">
            <c:forEach var="r" items="${recruits}">
                <a href="${pageContext.request.contextPath}/recruit/detail?id=${r.id}"
                   style="background:#fff; border:1px solid var(--line); border-radius:12px; padding:14px 16px;">
                    <div style="display:flex; align-items:center; justify-content:space-between; gap:12px;">
                        <div style="font-weight:900;"><c:out value="${r.title}"/></div>
                        <div style="font-size:12px; font-weight:900; color:var(--primary); white-space:nowrap;">
                            <c:out value="${r.category}"/>
                        </div>
                    </div>
                    <div style="color:#7a8088; margin-top:6px; font-weight:700;">
                        <c:out value="${r.description}"/>
                    </div>
                </a>
            </c:forEach>

            <c:if test="${empty recruits}">
                <div style="padding:18px; color:#7a8088; font-weight:800;">
                    해당 카테고리에 모집글이 아직 없어요.
                </div>
            </c:if>
        </div>
    </div>

</div>
</body>
</html>
