/*
SQL (Structured Query Language) -������ ���� ���
    ������ ������ ���̽� �ý��ۿ��� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
    
SELECT��
    �����ͺ��̽����� ���� �˻� ��ɾ�
    
*/

--<���� �ּ�. ��� �� ���� *

SELECT *
FROM departments;

-- Ư�� �� ����(��������)
SELECT department_id, location_id
FROM departments;

/*
�����
    ��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�
    
    +���ϱ�
    -����
    *���ϱ�
    /������
    
    */
    
--��� ������ ���
SELECT LAST_NAME, SALARY, SALARY - 300
FROM employees;
--select���� ����: ���� ���� �ٲ��� ����