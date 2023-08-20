/*
DCL -data control language
    DCL�� ���̺� �����͸� ������ �� �ʿ��� ������ �����ϴ� ��ɾ�
    
���� Ű����
    CONNECT : �����ͺ��̽��� �����ϴ� ������ ����
    RESOUCE : ���̺�, ������ ���ν��� ���� ������ �� �ִ� ���� �ο�
    ALTER, DROP : ��ü�� ���� �Ǵ� ���� ���� ����
    DBA :�����ͺ��̽� �����ڷμ� �ý����� ������ ������ �� �ִ� ������ �ο�
*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- ����� �����ϱ�
CREATE USER scott2 IDENTIFIED BY tiger;

-- GRANT ��ɾ�� ���� ���� �ֱ�
GRANT CREATE SESSION TO scott2;
GRANT CONNECT TO scott2;    --���� ���� �ο�

--���� ���� �����ϱ�
REVOKE CREATE SESSION FROM scott2;
REVOKE CONNECT FROM scott2;

-- OBJECT ���� �ֱ�
GRANT CREATE SEQUENCE TO scott2;
GRANT CREATE SYNONYM TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT CREATE PROCEDURE TO scott2;
GRANT CREATE VIEW TO scott2;

-- ��� ���� �ֱ�
GRANT CONNECT, DBA, RESOURCE TO scott2;

--���� �����ϱ�
REVOKE CONNECT, DBA, RESOURCE FROM scott2;


-- ����� ��й�ȣ ����
ALTER USER scott2 IDENTIFIED BY tiger2;


/*
ROLE - ���� �׷�
*/

CREATE ROLE role01;

-- role ���� �Ҵ�
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- ����ڿ��� role �ο�
GRANT role01 TO scott2;
REVOKE role01 FROM scott2;

-- ����� �����ϱ�
DROP USER scott2; --���� ���� ����
DROP USER scott2 CASCADE; --������ ���õ� �� ���� ����