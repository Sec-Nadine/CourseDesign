ttitle left '���ڣ�' _date  center  '�����1181 17 ������ִ��Scott.emp����'  right 'ҳ��' format 999 skip 2 sql.pno

btitle center '�����1181 17 ��������'

set echo off
set verify off
set pagesize 40
set linesize 200
clear columns

column empno heading 'Ա�����' format 9999
column ename heading 'Ա������' format A10
column job heading '������' format A10
column mgr heading '�ϼ����' format 9999
column hiredate heading '��������' justify center
column sal heading 'Ա������' format l999,999.00
column comm heading 'Ա������' format $999,999.00
column deptno heading '���ź�' format 9999999999999

break on deptno
compute count label '��������' of empno on deptno
compute sum label '���Ź����ܺ�' of sal on deptno
select * from emp order by deptno;

clear columns
ttitle off
btitle off