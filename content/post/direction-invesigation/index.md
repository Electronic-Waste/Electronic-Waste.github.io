+++
author = "Electronic-Waste"
title = "小论文方向调研"
date = "2024-05-16"
description = "送走本科毕设，硕士小论文对我说“嗨👋”"
categories = [
    "Research",
    "Tech"
]
tags = [
   
]
+++

## 前言

今年一月份写完毕设论文后，硕士小论文便在老师的催促中提上了日程。原本我是打算无缝衔接，写完本科毕设就写硕士小论文的，但是这世间总是有无穷无尽的诱惑，就像好看的衣服和包包之于年轻女性，单是看到就让人走不动道。而我显然也不是什么经得起考验的人，用时髦的话来讲就是：“学术立场不坚定，对科研不忠厚老实，在量化高薪实习offer的围猎下丧失了学术理想和科研信念，被💰腐蚀，且在开学之后仍不收手和不知止，是典型的‘两面人’‘墙头草‘的代表”。于是我就带着一丝丝的愧疚感投入💰的怀抱了。

因此兜兜转转四月底回来之后，我才开始仔细考虑硕士小论文的事情，但随后我又度过了一个在学术意义上没那么充实的五一假期（且由于没什么必须要去的课，假期在时长上有所膨胀），于是就拖到了现在才算真正开始着手准备硕士小论文的事。“还来不来得及”，显然，对于现在的我来说是一个超纲的问题，而且细想下去还容易内耗。那么就接受现状，从现在开始好好努力吧:)

综合自己的兴趣、职业发展目标和实验室客观条件约束等各方面因素考虑，目前我希望在集群调度、网络、分布式计算/训练这三个方向上进行调研，并选择其中的一个或者多个的结合作为硕士小论文的方向。目前我已经有了一些大概的思路，也有了一些纸质的记录，但后面我发现纸质笔记过于零散，不便于整理。几经思忖下，我将这部分的笔记迁移到博客中了，不仅仅是为了记录，也是为了给后来者一些参考和启发。

## 集群调度方向

### Overview

主要的关注点是Kubernetes的**Scheduler**，并对其进行适当的扩展

> Scheduler: A key orchestrator task that assigns physical resouces to containers

调度方法基于不同的QoS参数去设计，提供limited response time, efficient energy consumption, better resource utilizaiton, and other things.

--- ACM Computing Survey, *Kubernetes Scheduling: Taxonomy, Ongoing Issues and Challenges*

### 需要调研的东西

#### 综述论文

看综述论文[*Kubernetes Scheduling: Taxonomy, Ongoing Issues and Challenges*](https://dl.acm.org/doi/abs/10.1145/3539606)

对现在集群调度领域有个**基本的了解**（方向&已有解决方案&问题），然后对感兴趣的方向DFS

#### K8s出现之前的调度框架

- [**Apache Mesos**](https://github.com/apache/mesos): Two-level architecture

- [**Hadoop YARN**](https://github.com/yarnpkg/yarn): Orchestrate Hadoop(/Spark/Storm) tasks.（一切批处理调度的源头）

- [**Borg**](https://dl.acm.org/doi/pdf/10.1145/2741948.2741964): Kubernetes的前身(first unified container-management system)，单体调度器

- [**Omega**](https://dl.acm.org/doi/abs/10.1145/2465351.2465386): Google改进后的shared-state scheduler，提升了scalability

#### K8s原生调度器

看Kubernetes原生的[Scheduler](https://github.com/kubernetes/kubernetes)，以及它提供的[Scheduler Plugins框架](https://github.com/kubernetes-sigs/scheduler-plugins)

#### 批处理调度开源项目

- [kueue](https://github.com/kubernetes-sigs/kueue): A set of APIs and controller for job queueing.

- [volcano](https://github.com/volcano-sh/volcano): A batch system built on Kubernetes(batch & elastic workloads).

- [YuniKorn-core](https://github.com/apache/yunikorn-core): Brings a unified, cross-platform, scheduling experience for mixed workloads that consist of stateless batch workloads and stateful services.

#### 其它应用场景的开源项目

- [Karmada](https://github.com/karmada-io/karmada): Open, Multi-Cloud, Multi-Cluster Kubernetes Orchestration.

- [kubewharf/katalyst-core](https://github.com/kubewharf/katalyst-core): 混部场景下的调度问题（字节）

- [koordinator](https://github.com/koordinator-sh/koordinator): 混部场景下的调度问题（阿里云）

以及字节最近发在SoCC上的Godel调度器

## 网络方向

### Overview

### 需要调研的东西

## 分布式计算/训练方向

### Overview

### 需要调研的东西

## 相关会议

#WIP