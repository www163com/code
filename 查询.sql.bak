
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
