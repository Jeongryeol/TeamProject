/*
	 비품구매신청 결재하기 (결재권자)
    결재는 3가지 단계를 거쳐야한다.
    1. 기각/승인 단계를 거쳐서 구매신청건 승인여부 결정
    2. 결제승인하여 예산집행 (결제상태를 입력하면 집행테이블에 반영됨) -- 결제요청 뷰가 필요할 것으로 예상됨
    3. 구매한 물품이 회사에 도착하여 입고처리 -- 입고처리를 안드로이드를 통해서 진행하면 좋을 것으로 예상
*/

UPDATE `eq_purc_list`
   SET outcome = 'ibp-5'#{new_num} -- <!-- ibp-2(기각)|3(승인)|4(결제)|5(입고) -->
	  , sign_date = DATE_FORMAT(now(), '%Y-%m-%d') -- <!-- 2011-06-14 -->
 WHERE eq_pno = 3#{eq_no} --  <!-- 결재할 구매요청비품번호 -->
   AND sign_eno = 198#{sign_eno} --  <!-- 결재하는 본인 사원번호 -->
;

-- 승인 테스트
SELECT * FROM `view_purc_eqmk_list`;

-- 결제 테스트
SELECT * FROM `view_bg_ex_list`;

-- 입고 테스트
SELECT * FROM `inb_eq`;