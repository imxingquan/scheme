#lang scribble/base

@title{MySql 笔记}

介绍MySql相关知识的笔记

@section{一、年度查询}

查询 本年度的数据
SELECT * FROM blog_article WHERE year( FROM_UNIXTIME( BlogCreateTime ) ) = year( curdate( ))

@section{二、查询季度数据}


查询数据附带季度数
SELECT ArticleId, quarter( FROM_UNIXTIME( `BlogCreateTime` ) ) FROM `blog_article`
