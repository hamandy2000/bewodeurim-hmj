/* 배달기사 희망 지역 연결 테이블 */
CREATE TABLE TBL_LIKED_AREA (
    ID NUMBER CONSTRAINT PK_LIKED_AREA PRIMARY KEY,       /* 연결의 고유 ID */
    DRIVER_ID NUMBER NOT NULL,                  /* 배달기사 ID */
    REGION_ID NUMBER NOT NULL,                  /* 지역(구) ID */
--     CREATED_DATE DATE DEFAULT SYSDATE,
--     UPDATED_DATE DATE DEFAULT SYSDATE,
    CONSTRAINT FK_LIKED_AREA_DRIVER FOREIGN KEY (DRIVER_ID)  /* 배달기사 테이블의 ID를 참조 */
        REFERENCES TBL_DRIVER(ID) ON DELETE CASCADE,      /* 배달기사 삭제 시 연결된 희망 지역도 삭제 */
    CONSTRAINT FK_LIKED_AREA_REGION FOREIGN KEY (REGION_ID)  /* 지역 테이블의 ID를 참조 */
        REFERENCES TBL_REGION(ID) ON DELETE CASCADE
);

DROP TABLE TBL_LIKED_AREA;
CREATE SEQUENCE SEQ_LIKED_AREA;

SELECT * FROM TBL_LIKED_AREA;

SELECT LA.ID, LA.DRIVER_ID, LA.REGION_ID,JT1.CITY_NAME,JT1.REGION_NAME
FROM TBL_LIKED_AREA LA
JOIN(
    SELECT CITY_NAME, REGION_NAME ,R.ID
    FROM TBL_REGION R JOIN TBL_CITY C
                           ON R.CITY_ID = C.ID
    WHERE REGION_NAME = '강남구'
) JT1 ON LA.REGION_ID = JT1.ID;