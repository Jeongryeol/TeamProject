/*
	 비품(구매가능)내역에서 비품구매신청하기
*/
INSERT INTO `eq_purc_list`
(eq_pno, ask_date, eq_sort, num, subtotal, ask_eno, sign_eno, eq_no)
SELECT
		nextSeqVal('seq_eq_pno')
	 ,	DATE_FORMAT(now(), '%Y-%m-%d') /* 2011-06-14 */
	 , 5 -- ${num} -- 수량
    , cost*5 -- ${num} -- 소계
	 , 12#{ask_eno} --신청하는 본인 사원번호
    ,(SELECT e_no FROM `emp`
       WHERE d_no = 9001 -- 유지보수팀소속
         AND au_no = 36 -- 비품구매결재권한
	    ORDER BY e_rank DESC-- 권한보유 사원 중 최고직급
	    LIMIT 1)
	 , eq_no -- 조회된 비품번호(FK)
  FROM `eq`
 WHERE eq_no = #{eq_no} -- 구매요청비품번호
;

SELECT * FROM `eq_purc_list`;