--oracle���ݿ�
--��ѯ���
--��ѯ������
SELECT * FROM emp;
SELECT * FROM dept;
--�ı����ڵ���ʾ��ʽ
SELECT ename,hiredate FROM emp;
SELECT ename,to_char(hiredate,'YYYY-MM-DD')FROM emp;
--�ų�������
SELECT distinct deptno,job FROM emp;
--ʹ�������
SELECT ename,sal,sal*12 year_money FROM emp;
--����null
SELECT ename,sal,comm,sal+comm money FROM emp;
SELECT ename,sal,comm,sal+nvl(comm,0) money FROM emp;
SELECT ename,sal,comm,NVL2(comm,comm+sal,sal) money FROM emp;
--ʹ��||�����������ַ���
SELECT ename||''''||'s job is '||job FROM emp;
--ʹ��concat�����ַ���
SELECT concat(CONCAT(ename,'''s salary is '),sal)FROM emp;
--ʹ�ñ���
SELECT ename,sal*12 AS "Annual Salary"  FROM emp; 
--������������
SELECT ename,sal FROM emp ORDER BY ename ASC;
--ʹ��λ������
SELECT deptno,dname FROM dept UNION SELECT empno,ename FROM emp ORDER BY 1 DESC;
--ʹ�ö�������
SELECT ename,deptno,sal FROM emp ORDER BY deptno ASC,sal ASC;
--ʹ��round����
SELECT SUM(sal) �ܹ���,ROUND(AVG(sal)) ƽ������ FROM emp WHERE deptno = 20;
--trunc�������Խ�ȡ����ֵ���ض�λ��
SELECT SUM(sal),TRUNC(AVG(sal),1) FROM emp WHERE deptno=20;
--ʹ��mod����
SELECT ename,sal,MOD(sal,1000) FROM emp WHERE deptno = 10;

--ʹ��������Ӳ�ѯ
SELECT emp.ename,emp.sal,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;
--�����Ӳ�ѯ��ʹ��ANDָ����������
SELECT emp.ename,emp.sal,dept.deptno,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno AND 
dept.deptno = 10;
--ʹ�ò�������
SELECT a.ename,a.sal,b.grade FROM emp a,salgrade b WHERE a.sal BETWEEN b.losal AND b.hisal;
SELECT grade,losal,hisal FROM salgrade;
--ʹ��������
SELECT a.ename||'''s manager is '|| b.ename FROM emp a,emp b WHERE a.mgr = b.empno;
--������
SELECT d.dname,e.ename FROM dept d,emp e WHERE d.deptno = e.deptno(+) AND e.deptno(+) = 10;
SELECT d.dname,e.ename FROM dept d,emp e WHERE d.deptno(+) = e.deptno AND d.deptno(+) = 10;
--cross join ����
SELECT d.dname,e.ename FROM dept d CROSS JOIN emp e;
--natural join 
SELECT e.ename,e.sal,d.dname FROM dept d NATURAL JOIN emp e;
--ʹ��Using�Ӿ佨���������
SELECT d.dname,e.ename FROM dept d JOIN emp e USING (deptno);