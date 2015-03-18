--oracle数据库
--查询语句
--查询所有列
SELECT * FROM emp;
SELECT * FROM dept;
--改变日期的显示形式
SELECT ename,hiredate FROM emp;
SELECT ename,to_char(hiredate,'YYYY-MM-DD')FROM emp;
--排除所有行
SELECT distinct deptno,job FROM emp;
--使用运算符
SELECT ename,sal,sal*12 year_money FROM emp;
--处理null
SELECT ename,sal,comm,sal+comm money FROM emp;
SELECT ename,sal,comm,sal+nvl(comm,0) money FROM emp;
SELECT ename,sal,comm,NVL2(comm,comm+sal,sal) money FROM emp;
--使用||操作符连接字符串
SELECT ename||''''||'s job is '||job FROM emp;
--使用concat连接字符串
SELECT concat(CONCAT(ename,'''s salary is '),sal)FROM emp;
--使用别名
SELECT ename,sal*12 AS "Annual Salary"  FROM emp; 
--单列升序排序
SELECT ename,sal FROM emp ORDER BY ename ASC;
--使用位置排序
SELECT deptno,dname FROM dept UNION SELECT empno,ename FROM emp ORDER BY 1 DESC;
--使用多列排序
SELECT ename,deptno,sal FROM emp ORDER BY deptno ASC,sal ASC;
--使用round函数
SELECT SUM(sal) 总工资,ROUND(AVG(sal)) 平均工资 FROM emp WHERE deptno = 20;
--trunc函数可以截取数字值到特定位数
SELECT SUM(sal),TRUNC(AVG(sal),1) FROM emp WHERE deptno=20;
--使用mod函数
SELECT ename,sal,MOD(sal,1000) FROM emp WHERE deptno = 10;

--使用相等连接查询
SELECT emp.ename,emp.sal,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;
--在连接查询中使用AND指定其他条件
SELECT emp.ename,emp.sal,dept.deptno,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno AND 
dept.deptno = 10;
--使用不等连接
SELECT a.ename,a.sal,b.grade FROM emp a,salgrade b WHERE a.sal BETWEEN b.losal AND b.hisal;
SELECT grade,losal,hisal FROM salgrade;
--使用自连接
SELECT a.ename||'''s manager is '|| b.ename FROM emp a,emp b WHERE a.mgr = b.empno;
--外连接
SELECT d.dname,e.ename FROM dept d,emp e WHERE d.deptno = e.deptno(+) AND e.deptno(+) = 10;
SELECT d.dname,e.ename FROM dept d,emp e WHERE d.deptno(+) = e.deptno AND d.deptno(+) = 10;
--cross join 连接
SELECT d.dname,e.ename FROM dept d CROSS JOIN emp e;
--natural join 
SELECT e.ename,e.sal,d.dname FROM dept d NATURAL JOIN emp e;
--使用Using子句建立相等连接
SELECT d.dname,e.ename FROM dept d JOIN emp e USING (deptno);