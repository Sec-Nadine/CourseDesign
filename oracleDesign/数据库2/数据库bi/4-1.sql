set SERVEROUTPUT on;
declare
TYPE  dept_s IS RECORD  (
	dept_no number(2),
	dept_ename varchar2(10),
	dept_eaddr varchar2(20),
	dept_count number(10),
	dept_sal number(10));
onedept dept_s;
begin
onedept.dept_no :=&x;

select dname,loc,count(empno),sum(sal)
into onedept.dept_ename, onedept.dept_eaddr, onedept.dept_count, onedept.dept_sal
from emp,dept where  emp.deptno = dept.deptno and emp.deptno = onedept.dept_no group by dname,loc;

DBMS_OUTPUT.PUT_LINE ('�ò��ŵı��Ϊ��'||onedept.dept_no);
DBMS_OUTPUT.PUT_LINE ('�ò�������Ϊ��'||onedept.dept_ename);
DBMS_OUTPUT.PUT_LINE ('�ò��ŵ�ַΪ��'||onedept.dept_eaddr);
DBMS_OUTPUT.PUT_LINE ('�ò���Ա��������Ϊ��'||onedept.dept_count);
DBMS_OUTPUT.PUT_LINE ('�ò���Ա�����ܹ���Ϊ��'||onedept.dept_sal);
 end;
 /
