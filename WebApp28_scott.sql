SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ���̺� ����
CREATE TABLE TBL_MEMBERLIST
( ID        VARCHAR2(30)
, PW        VARCHAR2(20) NOT NULL
, NAME      VARCHAR2(50) NOT NULL
, TEL       VARCHAR2(50) NOT NULL
, EMAIL     VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
, CONSTRAINT MEMBERKIST_TEL_UK UNIQUE(TEL)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� ������ �Է� ������
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('1', 'java006$', '������', '010-1111-1111', 'test@test.com');
-->> ���� ����
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('1', 'java006$', '������', '010-1111-1111', 'test@test.com');

--�� �ο��� Ȯ�� ������
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;
-->> ���ٱ���
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;

--�� ��ü ������ ��ȸ ������
SELECT ID, PW, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
-->> ���ٱ���
SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;

COMMIT;