+++
author = "Electronic-Waste"
title = "Structured Log"
date = "2023-12-26"
description = "Structured Log Overview"
categories = [
    "Tech"
]
tags = [
   
]
+++

## Overview
日志作为一种帮助开发者快速定位问题的工具，在各个开源项目以及实际生产环境中都被广泛使用，其重要性不言而喻。但是，开发者往往是懒惰的，在开发的过程中为了图省事，经常不写log（比如说我），或者写的log极其粗糙（诸如`fmt.Println("OK")`之流...）。一旦程序出现了问题，根据现有的日志往往不能很好地定位到错误所在的地方，得花更多的时间打更多log（更是依托答辩）去找bug。

痛定思痛，我打算来学习Log的Best Practice，让我之后debug不要再那么痛苦，写的日志不要再那么答辩🤡

于是就有了本章**Structured Log**！

## 什么是Structured Log
意思是**结构化的日志**，我觉得主要有以下特性：

- **日志格式**：从基于键-值（像syslog）到非常结构化和详细（像JSON）。数据越结构化——每行日志就越大，尽管更易于查询和包含更丰富的信息。
- **等级日志（或日志等级）**：不同等级对应着不同重要性的日志。可见性可限制单个等级，仅限于某些重要性或等级以上的日志（如：仅记录WARN和更高等级）。通常日志等级在生产环境中是静态的，查找DEBUG等级的日志通常需要重新部署。
- **因果顺序**：保存写入的实际时间
- **日志关联**：能看到与特定请求或特定事件相关的所有日志，帮助我们深入到特定请求的相关信息中

## Logrus
Logrus是一个常用的日志库，有各种丰富的特性

### 支持不同的日志等级

Trace、Debug、Info、Warning、Error、Fatal、Panic

日志等级依次上升，可以通过SetLevel函数设置日志等级，比如：

```go
logrus.SetLevel(log.InfoLevel)
```

这样子只有Info等级及以上的日志会被打印

### 可扩展的Hook机制

允许使用者通过Hook的方式将日志分发到任意地方，如`本地日志文件，logstash，elasticsearch或者mq等，或者通过Hook定义日志内容和格式

### 可选的日志输出格式

内置了两种日志格式JSONFormater和TextFormater，还可以自定义日志格式

### Filed机制

可以通过Field机制进行结构化的日志记录，通常将一些字段始终加入到日志语句中会很有帮助

相比于`log.Fatalf("Failed to send event %s to topic", event, topic)`

使用如下的日志更加合适：

```go
log.WithFields(log.Fields{
    "event": event,
    "topic": topic,
}).Fatal("Failed to send event.")
```

除了`WithField`和`WithFields`添加的字段以外，一些字段会自动添加到所有日记记录中：
1. time：记录日志的时间戳
2. msg：记录的日志信息
3. level：记录的日志级别


### 线程安全机制
默认的logger在并发写的时候是受mutex保护的，也就是说是线程安全的

