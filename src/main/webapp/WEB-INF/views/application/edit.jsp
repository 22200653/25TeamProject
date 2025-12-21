<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>지원서 수정</title>
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
            font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,"Apple SD Gothic Neo","Noto Sans KR",sans-serif;
            background:var(--bg);
            color:var(--text);
        }
        a{ color:inherit; text-decoration:none; }

        .header{ background:#fff; border-bottom:1px solid var(--line); }
        .header-inner{
            width:1020px; max-width:calc(100% - 32px);
            margin:0 auto;
            display:flex; align-items:center; justify-content:space-between;
            padding:18px 0;
        }
        .brand{ display:flex; align-items:center; gap:12px; font-weight:800; font-size:20px; cursor:pointer; }
        .brand .logo{
            width:34px; height:34px; border-radius:50%;
            background: radial-gradient(circle at 30% 30%, #9be1ff, #2da8ff);
        }
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
            margin:0 auto;
            display:flex; align-items:center; gap:28px;
            padding:12px 0 0;
        }
        .menu{ display:flex; align-items:center; gap:26px; font-weight:700; color:#111; }
        .menu a{ display:inline-block; padding:12px 2px 14px; opacity:.9; }
        .menu a:hover{ opacity:1; }
        .menu a.active{ color:var(--primary); position:relative; opacity:1; }
        .menu a.active:after{
            content:""; position:absolute; left:0; right:0; bottom:6px;
            height:3px; border-radius:3px; background:var(--primary);
        }

        .wrap{
            width:1020px; max-width:calc(100% - 32px);
            margin:18px auto 60px;
        }
        .section{
            background:var(--card);
            border:1px solid var(--line);
            border-radius:12px;
            padding:22px;
        }
        .title-row{
            display:flex; align-items:center; justify-content:space-between; gap:10px;
            margin-bottom:14px;
        }
        .title{
            margin:0;
            font-size:22px;
            font-weight:900;
            letter-spacing:-0.4px;
        }
        .subtitle{
            margin-top:6px;
            color:#7a8088;
            font-weight:700;
            font-size:13px;
        }

        .form{
            display:flex;
            flex-direction:column;
            gap:14px;
            margin-top:14px;
        }
        .field label{
            display:block;
            font-weight:900;
            font-size:13px;
            color:#2b2f36;
            margin-bottom:8px;
        }
        .input, .textarea{
            width:100%;
            border:1px solid var(--line);
            border-radius:12px;
            padding:12px 12px;
            font-size:14px;
            background:#fff;
            outline:none;
        }
        .input:focus, .textarea:focus{
            border-color:#cfeaff;
            box-shadow:0 0 0 3px rgba(45,168,255,.12);
        }
        .textarea{
            min-height:140px;
            resize:vertical;
            line-height:1.6;
        }
        .grid{
            display:grid;
            grid-template-columns: 1fr 1fr;
            gap:14px;
        }
        @media (max-width: 760px){
            .grid{ grid-template-columns:1fr; }
        }

        .chip{
            display:inline-flex;
            align-items:center;
            gap:8px;
            padding:10px 12px;
            border:1px dashed #cfeaff;
            border-radius:12px;
            background:#f6fbff;
            color:#2a4d68;
            font-weight:800;
            font-size:13px;
        }
        .chip a{ color:#2da8ff; font-weight:900; }

        .help{
            margin-top:6px;
            color:#7a8088;
            font-weight:700;
            font-size:12px;
        }

        .btn-row{
            display:flex;
            justify-content:flex-end;
            gap:10px;
            margin-top:6px;
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
        .btn.primary{
            border-color:#cfeaff;
            background:#e9f6ff;
            color:var(--primary);
        }
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
            <c:choose>
                <c:when test="${not empty sessionScope.loginUser}">
                    <span style="font-weight:900;">
                        <c:out value="${sessionScope.loginUser.username}"/>님
                    </span>

                    <c:if test="${sessionScope.loginUser.role eq 'ADMIN'}">
                        <a href="${pageContext.request.contextPath}/admin/recruit/list" title="관리자">관리자</a>
                    </c:if>

                    <a href="${pageContext.request.contextPath}/auth/logout" title="로그아웃">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/login" title="로그인">
                        <span class="icon"></span>로그인
                    </a>
                </c:otherwise>
            </c:choose>
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
                <h1 class="title">지원서 수정</h1>
                <div class="subtitle">내용을 수정한 뒤 저장하세요.</div>
            </div>
            <button class="btn" type="button"
                    onclick="location.href='${pageContext.request.contextPath}/application/view?id=${app.id}'">
                ← 상세로
            </button>
        </div>

        <!-- ✅ enctype 필수 -->
        <!-- form 태그만 이걸로 교체 -->
        <form class="form"
              action="${pageContext.request.contextPath}/application/create"
              method="post"
              enctype="multipart/form-data"
              onsubmit="return validateForm();">

            <!-- ✅ 서버 검증 실패 메시지 표시(Controller에서 model.addAttribute("error", "...") 해주면 됨) -->
            <c:if test="${not empty error}">
                <div style="padding:12px 14px; border:1px solid #fecaca; background:#fff1f2; color:#9f1239; border-radius:12px; font-weight:900;">
                        ${error}
                </div>
            </c:if>

            <!-- ✅ 프론트 검증 메시지 -->
            <div id="clientError"
                 style="display:none; padding:12px 14px; border:1px solid #fde68a; background:#fffbeb; color:#92400e; border-radius:12px; font-weight:900;">
            </div>

            <input type="hidden" name="recruitId" value="${recruitId}"/>

            <div class="field">
                <label>이름</label>
                <input class="input" id="name" name="name" required
                       minlength="2" maxlength="20"
                       placeholder="이름을 입력하세요"/>
                <div class="help">2~20자</div>
            </div>

            <div class="grid">
                <div class="field">
                    <label>학년</label>
                    <input class="input" id="grade" name="grade" type="number" min="1" max="6"
                           placeholder="예) 2"/>
                    <div class="help">1~6 (비워도 됨)</div>
                </div>
                <div class="field">
                    <label>전공</label>
                    <input class="input" id="major" name="major" maxlength="30"
                           placeholder="예) 컴퓨터공학"/>
                    <div class="help">최대 30자</div>
                </div>
            </div>

            <div class="field">
                <label>내용</label>
                <textarea class="textarea" id="message" name="message" maxlength="1000"
                          placeholder="지원 동기 / 간단한 소개 등을 작성해 주세요."></textarea>
                <div class="help">최대 1000자</div>
            </div>

            <div class="field">
                <label>파일 첨부 (선택)</label>
                <input class="input" id="file" type="file" name="file" />
                <div class="help">권장: PDF/JPG/PNG, 최대 10MB</div>
            </div>

            <div class="btn-row">
                <button class="btn" type="button" onclick="history.back()">취소</button>
                <button class="btn primary" type="submit">저장</button>
            </div>
        </form>

        <script>
            function showClientError(msg){
                const box = document.getElementById("clientError");
                box.style.display = "block";
                box.textContent = msg;
                box.scrollIntoView({behavior:"smooth", block:"center"});
            }

            function validateForm(){
                const name = document.getElementById("name").value.trim();
                const gradeRaw = document.getElementById("grade").value.trim();
                const major = document.getElementById("major").value.trim();
                const message = document.getElementById("message").value.trim();
                const fileInput = document.getElementById("file");

                // 이름: 2~20자, 한글/영문/공백 허용(원하면 규칙 바꿔도 됨)
                if(name.length < 2 || name.length > 20){
                    showClientError("이름은 2~20자로 입력하세요.");
                    return false;
                }
                const nameRe = /^[가-힣a-zA-Z\s]+$/;
                if(!nameRe.test(name)){
                    showClientError("이름은 한글/영문/공백만 입력할 수 있어요.");
                    return false;
                }

                // 학년: 입력했으면 1~6
                if(gradeRaw !== ""){
                    const grade = Number(gradeRaw);
                    if(!Number.isInteger(grade) || grade < 1 || grade > 6){
                        showClientError("학년은 1~6 사이의 숫자만 입력하세요.");
                        return false;
                    }
                }

                // 전공: 최대 30자
                if(major.length > 30){
                    showClientError("전공은 최대 30자까지 입력할 수 있어요.");
                    return false;
                }

                // 내용: 최대 1000자
                if(message.length > 1000){
                    showClientError("내용은 최대 1000자까지 입력할 수 있어요.");
                    return false;
                }

                // 파일: 확장자 + 용량 (10MB)
                if(fileInput.files && fileInput.files.length === 1){
                    const f = fileInput.files[0];
                    const max = 10 * 1024 * 1024; // 10MB
                    if(f.size > max){
                        showClientError("파일은 최대 10MB까지 업로드할 수 있어요.");
                        return false;
                    }
                    const okExt = ["pdf","png","jpg","jpeg"];
                    const ext = (f.name.split(".").pop() || "").toLowerCase();
                    if(!okExt.includes(ext)){
                        showClientError("파일은 PDF/PNG/JPG만 업로드할 수 있어요.");
                        return false;
                    }
                }

                return true;
            }
        </script>

    </div>
</div>

</body>
</html>
