show tables;
-- 1번 영화 '퍼스트 맨’의 제작 연도, 영문 제목, 러닝 타임, 플롯을 출력하세요
SELECT M.ReleaseYear AS '제작 연도' ,M.Title AS '영문 제목',M.RunningTime AS '러닝 타임',M.Plot AS '플롯'
FROM movie AS M
WHERE M.KoreanTitle ='퍼스트 맨';

-- 2번 2003년에 개봉한 영화의 한글 제목과 영문 제목을 출력하세요
SELECT M.Title, M.KoreanTitle
FROM movie AS M
WHERE M.ReleaseYear = 2003;

-- 3번 영화 '글래디에이터’의 작곡가(Composer)의 한글 이름을 출력하세요 -> 너무 투박하다!
SELECT *
FROM role AS R
NATURAL JOIN appear AS A
NATURAL JOIN person AS P
Natural JOIN movie AS M
WHERE R.RoleName='Composer' AND M.KoreanTitle='글래디에이터';

-- 4번 영화 '매트릭스' 의 감독이 몇 명인지 출력하세요
SELECT COUNT(*)
FROM role AS R
NATURAL JOIN appear AS A
Natural JOIN movie AS M
WHERE M.KoreanTitle = '매트릭스' AND R.RoleKorName ='감독';

-- 5번 감독이 2명 이상인 영화의 정보를 다음 형식으로 출력하세요(하나의 컬럼) 한글영화제목(영문 영화제목) - 개봉연도
SELECT CONCAT(M.KoreanTitle, ' (', M.Title, ') - ', M.ReleaseYear) AS '영화정보'
FROM role AS R
NATURAL JOIN appear AS A
Natural JOIN movie AS M
WHERE R.RoleKorName = '감독'
GROUP BY M.MovieID
HAVING COUNT(M.MovieID) >= 2;

-- 6번 '한스 짐머’가 참여한 영화 중 아카데미를 수상한 영화의 한글 제목을 출력하세요
SELECT  M.KoreanTitle
FROM awardinvolve AS Award
NATURAL JOIN appear AS A
NATURAL JOIN sector AS S
NATURAL JOIN person AS P
Natural JOIN movie AS M
WHERE P.KoreanName='한스 짐머';

-- 7번 감독이 '제임스 카메론’이고 '아놀드 슈워제네거’가 출연한 영화를 다음 형식으로 출력하세요(하나의 컬럼).
SELECT CONCAT(M.KoreanTitle, ' (', M.Title, ') - ', M.ReleaseYear) AS '영화정보'
FROM movie AS M
WHERE M.movieID IN (
			SELECT movie.movieID
            FROM role AS R
			NATURAL JOIN appear AS A
			NATURAL JOIN person AS P
            NATURAL JOIN movie 
            WHERE R.RoleKorName='감독' AND P.KoreanName='제임스 카메론' 
		) AND M.movieID IN (
			SELECT movie.movieID
            FROM role AS R
			NATURAL JOIN appear AS A
			NATURAL JOIN person AS P
            NATURAL JOIN movie 
            WHERE R.RoleKorName='배우' AND P.KoreanName='아놀드 슈워제네거' 
        )
ORDER BY M.ReleaseYear DESC;

-- 8번 상영시간이 100분 이상인 영화 중 레오나르도 디카프리오가 출연한 한글 제목과 개봉 연도를 출력하세요. 개봉 연도를 기준으로 내림차순 정렬되어야 합니다.
SELECT M.KoreanTitle, M.ReleaseYear
FROM movie AS M
WHERE M.RunningTime >= 100 AND M.MovieID IN (
	SELECT A.MovieID
    FROM appear AS A
    NATURAL JOIN person AS P
    WHERE P.KoreanName='레오나르도 디카프리오'
	)
ORDER BY M.ReleaseYear DESC;

-- 9번 청소년 관람불가 등급의 영화 중 가장 많은 수익을 얻은 영화의 한글 제목, 원제(영어제목), 개봉연도, 세계흥행 금액을 출력하세요
SELECT M.KoreanTitle, M.Title, M.ReleaseYear, M.BoxOfficeWWGross
FROM movie AS M
WHERE M.BoxOfficeWWGross = (
	SELECT MAX(BoxOfficeWWGross)
    FROM movie
    NATURAL JOIN grade AS G
    WHERE G.GradeName = 'NC-17' 
	);


-- 10번 1999년 이전에 제작된 영화의 수익 평균을 고르시오. 출력 형식은 달러 통화 형식이어야 합니다.
SELECT CONCAT('$', FORMAT(AVG(M.BoxOfficeWWGross), 2))
FROM movie AS M
WHERE M.ReleaseYear < 1999;

-- 11번 가장 많은 제작비가 투입된 영화를 다음 형식으로 출력하세요. 한글영화제목(영문 영화제목) - 개봉연도
SELECT CONCAT(M.KoreanTitle, ' (', M.Title, ') - ', M.ReleaseYear) AS '영화정보'
FROM movie AS M
WHERE M.Budget = (
	SELECT MAX(Budget)
	FROM movie
);
        
        
        
-- 12번 감독한 영화의 제작비 총합이 가장 높은 감독을 다음 형식으로 출력하세요. 한글영화제목(영문 영화제목) - 개봉연도
SELECT CONCAT(sub1.KoreanName, '(',sub1.Name,')')
FROM (
	SELECT P.KoreanName,P.Name, SUM(M.Budget) AS totalBudget
	FROM role AS R
	NATURAL JOIN appear AS A
	NATURAL JOIN person AS P
	NATURAL JOIN movie AS M
    WHERE R.RoleKorName = '감독'
    GROUP BY P.KoreanName,P.Name
) AS sub1
WHERE totalBudget = (
	SELECT MAX(totalBudget) 
    FROM (
		SELECT P.KoreanName,P.Name, SUM(M.Budget) AS totalBudget
		FROM role AS R
		NATURAL JOIN appear AS A
		NATURAL JOIN person AS P
		NATURAL JOIN movie AS M
		WHERE R.RoleKorName = '감독'
		GROUP BY P.KoreanName,P.Name
	) AS sub2
); 
 
 -- 13번 출연한 영화의 모든 수익을 합하여, 총 수입이 가장 많은 배우의 이름과 출생 연도를 출력하세요.(두 개의 컬럼)
SELECT Name, BirthDate
FROM (
    SELECT P.Name, P.BirthDate, SUM(M.BoxOfficeWWGross) AS totalEarn, 
           RANK() OVER (ORDER BY SUM(M.BoxOfficeWWGross) DESC) AS ranking
    FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
    NATURAL JOIN movie AS M
    WHERE R.RoleKorName = '배우'
    GROUP BY P.Name, P.BirthDate
) AS ranked
WHERE ranking = 1;

-- 14번 제작비가 가장 적게 투입된 영화의 한글 제목과 수익을 출력하세요. 제작비가 0인 영화는 제외하며,
SELECT M.KoreanTitle, M.Budget
FROM movie AS M
WHERE M.Budget = (
	SELECT MIN(Budget)
    FROM movie
    WHERE Budget <> 0
);

-- 15번 제작비가 5000만 달러 이하인 영화의 미국내 평균 수익을 출력하세요. 출력 형식은 통화 형식이어야 합니다.
SELECT  CONCAT('$',AVG(M.BoxOfficeUSGross))
FROM movie AS M
WHERE M.MovieID IN (
	SELECT MovieID 
    FROM movie
    WHERE 5000 <= BoxOfficeUSGross
);

-- 16번 액션 장르 영화의 평균 수익을 출력하세요. 출력 형식은 통화 형식이어야 합니다.
SELECT  CONCAT('$',AVG(M.BoxOfficeUSGross))
FROM movie AS M
WHERE M.MovieID IN (
	SELECT M.MovieID 
	FROM moviegenre AS MG
    NATURAL JOIN genre AS G 
	NATURAL JOIN movie AS M
    WHERE G.GenreKorName = '액션'
);

-- 17번 장르가 드라마, 전쟁인 영화의 제목을 아래 형식으로 출력하세요. 한글영화제목(영문 영화제목) - 개봉연도
SELECT CONCAT(M.KoreanTitle, ' (', M.Title, ') - ', M.ReleaseYear) AS '영화정보'
FROM movie AS M
WHERE M.MovieID IN (
	SELECT M.MovieID 
	FROM moviegenre AS MG
    NATURAL JOIN genre AS G 
	NATURAL JOIN movie AS M
    WHERE G.GenreKorName = '드라마' OR G.GenreKorName = '전쟁' 
);

-- 18번 톰 행크스가 출연한 영화 중 상영 시간이 가장 긴 영화의 제목, 한글제목, 개봉연도를 출력하세요.(세 개의 컬럼)
SELECT CONCAT(KoreanTitle, ' (', Title, ') - ', ReleaseYear) AS '영화정보'
FROM movie AS M 
WHERE M.RunningTime = (
	SELECT MAX(M.RunningTime)
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
    NATURAL JOIN movie AS M
	WHERE P.KoreanName = '톰 행크스'
);

-- 19번 아카데미 남우주연상을 가장 많이 수상한 배우의 한글 이름과 영문 이름을 출력하세요.(두 개의 컬럼))
SELECT ranked.KoreanName,ranked.Name 
FROM (
	SELECT P.KoreanName, P.Name, Count(Award.InvolveID) AS totalAwards,
		RANk() OVER (ORDER BY Count(Award.InvolveID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
	NATURAL JOIN awardinvolve AS Award
    NATURAL JOIN sector AS S
	WHERE R.RoleKorName='배우' AND S.SectorKorName = '남우주연상'
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;

-- 20번 아카데미상을 가장 많이 수상한 배우의 한글 이름과 영문 이름을 출력하세요.('수상자 없음’이 이름인 영화인은 제외합니다)
SELECT ranked.KoreanName,ranked.Name 
FROM (
	SELECT P.KoreanName, P.Name, Count(Award.InvolveID) AS totalAwards,
		RANk() OVER (ORDER BY Count(Award.InvolveID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
	NATURAL JOIN awardinvolve AS Award
    NATURAL JOIN sector AS S
	WHERE R.RoleKorName='배우' AND P.KoreanName <> '수상자 없음'
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;

-- 21번 아카데미 남우주연상을 2번 이상 수상한 배우의 한글 이름과 영문 이름을 출력하세요.
SELECT P.KoreanName,P.Name
FROM person AS P
 WHERE 2 <= (
	SELECT Count(Award.InvolveID) AS totalAwards
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
	NATURAL JOIN awardinvolve AS Award
    NATURAL JOIN sector AS S
	WHERE R.RoleKorName='배우'
 );

-- 22번 아카데미상을 가장 많이 수상한 사람의 한글 이름과 영문 이름을 출력하세요.
SELECT ranked.KoreanName,ranked.Name 
FROM (
	SELECT P.KoreanName, P.Name, Count(Award.InvolveID) AS totalAwards,
		RANk() OVER (ORDER BY Count(Award.InvolveID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
	NATURAL JOIN awardinvolve AS Award
    NATURAL JOIN sector AS S
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;
 
 -- 23번 아카데미상에 가장 많이 노미네이트 된 영화의 한글 제목, 영문 제목, 개봉 연도를 출력하세요. (세 개의 컬럼)
SELECT ranked.KoreanTitle, ranked.Title, ranked.ReleaseYear 
FROM (
	SELECT M.KoreanTitle, M.Title, M.ReleaseYear, COUNT(W.WinningID) AS totalwinning,
		RANK() OVER(ORDER BY COUNT(W.WinningID) DESC) AS ranking
    FROM movie AS M
	NATURAL JOIN appear AS A
    NATURAL JOIN awardinvolve AS Award
	NATURAL JOIN winning AS W
	WHERE W.WinOrNot = 'Nominated'
    GROUP BY M.KoreanTitle, M.Title, M.ReleaseYear
) AS ranked
 WHERE ranking = 1;

-- 24번 가장 많은 영화에 출연한 여배우의 한글 이름과 영문 이름을 출력하세요.
SELECT ranked.KoreanName, ranked.Name
FROM (
	SELECT P.KoreanName, P.Name , COUNT(M.MovieID) AS totalwinning,
		RANK() OVER(ORDER BY COUNT(M.MovieID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
    NATURAL JOIN movie AS M
    WHERE R.RoleName = 'actress'
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;

-- 25번 아카데미상을 가장 많이 수상한 영화를 아래 형식으로 출력하세요.
SELECT CONCAT('<',ranked.KoreanTitle,'>(<',ranked.Title,'>)-<',ranked.ReleaseYear,'>')
FROM (
	SELECT M.KoreanTitle, M.Title, M.ReleaseYear, COUNT(Award.InvolveID) AS totalAward,
		RANK() OVER(ORDER BY COUNT(Award.InvolveID) DESC) AS ranking
    FROM movie AS M
    NATURAL JOIN appear AS A
	NATURAL JOIN awardinvolve AS Award
    GROUP BY M.KoreanTitle, M.Title, M.ReleaseYear
) AS ranked
WHERE ranking = 1;

-- 26번 수익이 가장 높은 영화 TOP 10을 아래 형식으로 출력하세요. 수익으로 내림차순 정렬되어야 합니다.
SELECT CONCAT('<',ranked.KoreanTitle,'>(<',ranked.Title,'>)-<',ranked.ReleaseYear,'>')
FROM (
	SELECT M.KoreanTitle, M.Title, M.ReleaseYear, M.BoxOfficeWWGross,
		RANK() OVER(ORDER BY M.BoxOfficeWWGross DESC) AS ranking
    FROM movie AS M
) AS ranked
LIMIT 10;

-- 27번 수익이 10억불 이상인 영화중 제작비가 1억불 이하인 영화를 아래 형식으로 출력하세요. 제작비로 오름차순 정렬 되어야 합니다.
SELECT CONCAT('<',M.KoreanTitle,'>(<',M.Title,'>)-<',M.ReleaseYear,'>')
FROM movie AS M
WHERE M.BoxOfficeWWGross>=1000000000 AND M.Budget <= 100000000
ORDER BY M.Budget ASC;

-- 28번 전쟁 영화를 가장 많이 감독한 사람의 한글 이름과 영문 이름을 출력하세요. (두 개의 컬럼)
SELECT ranked.KoreanName, ranked.Name
FROM (
	SELECT P.KoreanName, P.Name , COUNT(M.MovieID) AS totalwinning,
		RANK() OVER(ORDER BY COUNT(M.MovieID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
    NATURAL JOIN movie AS M
    NATURAL JOIN moviegenre AS MG
	NATURAL JOIN genre AS G
    WHERE G.GenreKorName = '전쟁' AND R.RoleKorName='감독'
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;

-- 29번 드라마 장르의 영화에 가장 많이 출연한 사람의 한글 이름과 영문 이름을 출력하세요. (두 개의 컬럼)
SELECT ranked.KoreanName, ranked.Name
FROM (
	SELECT P.KoreanName, P.Name , COUNT(M.MovieID) AS totalwinning,
		RANK() OVER(ORDER BY COUNT(M.MovieID) DESC) AS ranking
	FROM role AS R
    NATURAL JOIN appear AS A
    NATURAL JOIN person AS P
    NATURAL JOIN movie AS M
    NATURAL JOIN moviegenre AS MG
	NATURAL JOIN genre AS G
    WHERE G.GenreKorName = '드라마' AND R.RoleKorName='배우'
    GROUP BY P.KoreanName, P.Name
) AS ranked
 WHERE ranking = 1;

-- 30번 드라마 장르에 출연했지만 호러 영화에 한번도 출연하지 않은 남배우의 한글 이름과 영문 이름을 출력하세요.(두 개의 컬럼)
SELECT DISTINCT P.KoreanName, P.Name
FROM movie AS M
NATURAL JOIN appear AS A
NATURAL JOIN person AS P
NATURAL JOIN role AS R
NATURAL JOIN moviegenre AS MG
NATURAL JOIN genre AS G
WHERE G.GenreKorName='드라마' AND R.RoleName='actor'
AND P.PersonID NOT IN (
    SELECT  P2.PersonID
	FROM movie AS M2
	NATURAL JOIN appear AS A2
	NATURAL JOIN person AS P2
	NATURAL JOIN role AS R2
    NATURAL JOIN moviegenre AS MG2
	NATURAL JOIN genre AS G2
    WHERE G2.GenreKorName='공포' AND R2.RoleName='actor'
);

-- 31번 아카데미 영화제가 가장 많이 열린 장소는 어디인가요?
SELECT AwardInfo.Location
FROM awardyear AS AwardInfo
GROUP BY AwardInfo.Location
HAVING COUNT(AwardInfo.AwardID) = (
    SELECT MAX(totalAwardLocation)
    FROM (
		SELECT AwardInfo2.Location ,COUNT(AwardInfo2.AwardID) AS totalAwardLocation
		FROM awardyear AS AwardInfo2
		GROUP BY AwardInfo2.Location
	) AS subquery
);

-- 32번 첫 번째 아카데미 영화제가 열린지 올해 기준으로 몇년이 지났나요?
SELECT YEAR(CURDATE()) - AwardInfo.Year
FROM awardyear AS AwardInfo
WHERE AwardInfo.Year = (
    SELECT MIN(AwardInfo2.Year)
    FROM awardyear AS AwardInfo2
);

-- 33번 SF 장르의 영화 중 아카데미 영화제 후보에 가장 많이 오른 영화의 한글 제목을 구하세요.
SELECT ranked.KoreanTitle
FROM (
	SELECT M.KoreanTitle, COUNT(W.WinningID) AS totalwinning,
		RANK() OVER(ORDER BY COUNT(W.WinningID) DESC) AS ranking
    FROM movie AS M
	NATURAL JOIN appear AS A
    NATURAL JOIN awardinvolve AS Award
	NATURAL JOIN winning AS W
	NATURAL JOIN moviegenre AS MG
	NATURAL JOIN genre AS G
	WHERE W.WinOrNot = 'Nominated' AND G.GenreKorName ='공상과학'
    GROUP BY M.KoreanTitle
) AS ranked
 WHERE ranking = 1;


-- 34번 드라마 장르의 영화의 아카데미 영화제 작품상 수상 비율을 구하세요.
SELECT (awardDrama / totalDrama)  AS '수상 비율'
FROM (
	SELECT COUNT(M.MovieID) AS awardDrama
    FROM movie AS M
	NATURAL JOIN appear AS A
    NATURAL JOIN awardinvolve AS Award
	NATURAL JOIN winning AS W
    NATURAL JOIN sector AS S
	NATURAL JOIN moviegenre AS MG
	NATURAL JOIN genre AS G
    WHERE G.GenreKorName='드라마' AND S.SectorKorName='작품상' AND W.WinOrNot='Winner'
) AS sub1
, (
	SELECT COUNT(M.MovieID) AS totalDrama
    FROM movie AS M
	NATURAL JOIN moviegenre AS MG
	NATURAL JOIN genre AS G
    WHERE G.GenreKorName='드라마'
) AS sub2;

-- 35번 '휴 잭맨’이 출연한 영화의 제작비 대비 수익율을 출력하세요.
SELECT (sub.totalBudget / sub.totalBoxOfficeWWGross) AS '제작비 대비 수익률'
FROM (
	SELECT SUM(M.BoxOfficeWWGross) AS totalBoxOfficeWWGross, SUM(M.Budget) AS totalBudget
	FROM movie AS M
	NATURAL JOIN appear AS A
	NATURAL JOIN person AS P
	NATURAL JOIN role AS R
    WHERE R.RoleKorName = '배우' AND P.KoreanName = '휴 잭맨'
) AS sub;
