Return-Path: <ksummit+bounces-2065-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C313B1B9ED
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66B417329A
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82456241682;
	Tue,  5 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ptpxvofg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FISIqeC3"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E254F81
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417991; cv=fail; b=pQH0qcdouUwoRYKJ7Izg0g+b7Wyboz2qG8uUqbnm96LAY2bqYU5daCijudcgxj0gmM6rFMNVGqxFmdbWHQBN2EqkivMUVpc/vS+r+uwCAAeFcbZwaaGJof4oL22WnJAtxA4kNNVgrmh0QEEfCeYFlsq0Fpa7nJ7d8Qvwpq2sRSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417991; c=relaxed/simple;
	bh=oGvXZYudZxpM0n8FnH8Zu/igusWNnesnidK3tZE61Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ECHgoshMQVGXat/2z/dCUEOPYCGwUtOFFiFxg5y48LdA63X4KJtDExfFElo3MYkWf8vdUIRK1rwAN/TW2BMXE+65t+L1KY82zR6aAtnA19EgJdsYfOtZJdWktog4vPHU4tiziYAULO+csTWMxhExE12ZlFWKhmKUn5Y3g7m8QMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ptpxvofg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FISIqeC3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2Bed002730;
	Tue, 5 Aug 2025 18:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7vtDju+C9ZXI1yMJwA
	iVH/RI4PHvB2E79xI2L5TWZVs=; b=ptpxvofgsAoxqmHmCCAbSIYdDTrq+T4FHj
	NmsEaZbRGeluAA3e3QUivY0Wmtn0wIdeppBafPnySD7pdo3MS2EOZCdixSZaPzDb
	0bbQgoP8NBngIdx6wq/mklb+n1q+8RxNY+JG/3Bz4xgfKtGbR9XpHJ69PO8A4mGH
	zxRhX12gwp2YpWr46/kNsRhoKf2KYuiy1/sHhZO3Igh1sgFBjfp97w7/RQ38k8q3
	9d7EBJSnjuBeitty9+ofLImoqPST8nUkhP3xRRP3g7W2j5M43o2edc1h7aygFDvP
	77YMKf+S3TIj2IIDnQQwv/IXUnPRjCs1uo7v8MCDxxqLy0mi2STw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgr17s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:19:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4ESM019910;
	Tue, 5 Aug 2025 18:19:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwq0hd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:19:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoZH6D6ZfhTTn4r1URlKI3h6A+mEBn7yz/nF2ZNegpKpeA7ZMl+B+qFfYp9ME65bVCKhttxY8IrZa6DfOQ4Ap7diF7Y79TIyLmUojCKUvRhsj3hKnJtRtT/62XZi0sf+vphLYNNKHj/ooOcBoMvtd0YkOQbqfEFoXGOu0tqVoUwoJyWDpAzEUoINSsvrfmr6NW6nASe4QyUxjHvU0+bSnUclosRbzF8CbmORfO+I7H2U5y36b0MqD8QvNBXbDxu1nTGiUtYlD22YtEqnQY5QZcBnBwO42nQKZ/0qBAg4dpkw9Cpq1qPoQH2JFj1wL99Rjitim1lfbj9sSrjzQC+mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vtDju+C9ZXI1yMJwAiVH/RI4PHvB2E79xI2L5TWZVs=;
 b=dQE4nlcq1lHTyBEOSm2C4voQtsgkIE1MnFZmeCYI98GPQMiuxyuKd1Fsay8orXgNUTlW9LH25pX1KACdCKpRJO5zyE5iFgT7XH/wg8RUTjxgLpOmEgzKwFVHtPcSRXb6VjpUlrnjBIGciF8sk3U8i2Jmtw95VTVebxwfo9Dg6FHClYHA+nYxwBSkwwFfTJJK1kZyXmQyFTMqJfxG/a1VE/L+ivKCcNdWu2ukSHKhzgccJXuOrmkgyblRjfUqLq+TtBuVGxFUSpheDXfpK5TFYLOUeuRwCKxfbKIqyEUxgJvjAu7ovtQD4nHsgc9D9Di6AvLc4ctengN/D8N4MsSIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vtDju+C9ZXI1yMJwAiVH/RI4PHvB2E79xI2L5TWZVs=;
 b=FISIqeC3fHUiRYQijCUAoxIC2Qm64chG40xJ8G1bMu8cNunIFWDnyP6Ez6a+/F8bWa56IzjDE69GB5nK4d8sCxv8pZt3b24umQQ8edz4Wpormi0va2LoqK5zMGuQP2W2w4yr/VcXIzKFnb+08jcsoGzeVbxD1p9jhscST/+oaUQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7416.namprd10.prod.outlook.com (2603:10b6:610:156::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:19:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:19:44 +0000
Date: Tue, 5 Aug 2025 19:19:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <e6b26d21-8bb4-4c60-8eb7-025d32b6ab5e@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
X-ClientProxiedBy: AM0PR07CA0029.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::42) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 6505cc4f-9255-4434-a9f8-08ddd44ca6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CtVYcxGzDiwbYGsvnnXSeIsTlSbIFdfvME7VCrbG5GZ8eNEDEXZqaY8PP8mC?=
 =?us-ascii?Q?Mx5yRItse8gV31U21Ou5xc2E1BNLKZvi4kTQ3pPhSghET8fe4nC6HVlQaN3a?=
 =?us-ascii?Q?DP05Uxyo9iRzPkBVfx6C4RksHflQq1jOKS3Fdpsl1FQBO/BYKrGlrQIk+Pkj?=
 =?us-ascii?Q?fwyNegZUT+bd32RY8EkF/DRzxr8BaH3AZMc/Tv6O0pRErmArIkXNU3Wfqmb/?=
 =?us-ascii?Q?3Ze2tGW+lCbXqvpDhifplLwEcmMbY+tewj4tm16LvxjhHpgNt197Rw7rbC2t?=
 =?us-ascii?Q?y7hAKbgPWNwoGcpD4bYvtDYAmNW+n1vhqxAvrYPmXdqOncwlbjiOnQu4Iqwk?=
 =?us-ascii?Q?huIJcNulJAMN+7KzVE3VuhyLz+LMOqoUSL9hOSlKd/8yy7aa94CN1O99naYt?=
 =?us-ascii?Q?FiVBZiFsh6OLyIVG6FfbFl4ndrkwflpa6CuSMsvSfzeK5RxiqQ700U/shMOZ?=
 =?us-ascii?Q?6DbPrgvMwjx7IerDv8zNPrMnGwaTRj0YGeIK4w0sUEqULm2NmP2yVCFVWlRC?=
 =?us-ascii?Q?V0ZaEnlYRNB3MCDhmPBZdkwQ5OxASDPXDtuMOeqjhLH5l4cWzjX0OPxNWnsn?=
 =?us-ascii?Q?p/Y/oG7vV7hBR1bKxhtd83bp8ABq4KpDQfC1HWYCiny0foDwTXKBkHJGvFpz?=
 =?us-ascii?Q?1bivwuVHBz8RKwfb15V8pUwSDYDEkilOWs55THq1ZYZIP+r8jyx+AVRVnWC8?=
 =?us-ascii?Q?y44NYHPPlwy95J073qXlg4u8Nm7cCLQW0ws3IMJEY1AecoA0vWD1i8EfrAjp?=
 =?us-ascii?Q?SQtbIARULcSN7rV2euhkQBX+Bds7c7Fq5CKHU0+hMFvCGTI91/gF1nSPTdBh?=
 =?us-ascii?Q?kTMl10flJlXUeqctW7ffB9o5TyKAE+qvFaUS5+Jpy/H9jY+eSQ5Vvam/Zwcq?=
 =?us-ascii?Q?7WPhPL+YpYySu8CR/duoM9m8+njC0e9iO/BRQtq9/8VcRfIh6uTuvLtcB3dG?=
 =?us-ascii?Q?2jQGwAp/6+MxZyvZJ1qufpyZ60IBs8JTzTWIOkSv49jwaOLyU5psHEyLxToH?=
 =?us-ascii?Q?ES3Hhua9rWeZdn0vEA8AedqBb5OHDMJtAC9gaPYOnFJA2NdoIPTIB9sHvkAT?=
 =?us-ascii?Q?Y4sBGDdgZA8XW3WbOxSNUPpC/g9i1HcsXk1SFg1I4BOc1p/GVqGvTaJUJU3x?=
 =?us-ascii?Q?AjoIQY0ajA2v+K4Uxw+aaCE6vZ5jHmgrF5LQx058O7Q+qmuu6eEW3gxxGsuW?=
 =?us-ascii?Q?NOXNz6WV9zYzqyslVxLhu63u6DB4ZqAqxwvJQ36LyLMWMmDNvGWUI3G4h4j/?=
 =?us-ascii?Q?rlLGIhmmGNV/Etr2i/UA9kur6W4+kVxadm8sMMqIq99dvqzxnjjhdhxhnuZQ?=
 =?us-ascii?Q?wIEjRY0mHjlWHkxeU3GJ3ZpvK/MX0zu9h9ngyQ+pRSDAsGxMji5HOHUnyFgV?=
 =?us-ascii?Q?+rcWzRjyS+SBxEWyFILIxZxuKE6sAIvU3379mdxx9iGGUqcsJBzsuOfwHcii?=
 =?us-ascii?Q?ToB1rQqxrb8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hn0pQ7XSP9q0DDjqZ2jLy6+lGdHpMueheeJT3srQs1E0SKUPbMUoaGhauk/B?=
 =?us-ascii?Q?yUF3ROfUph2sOEx4zuvb0wH6iEowgKDy+04X9ld6sRNS/K4z/oAZ6lTjScPX?=
 =?us-ascii?Q?La10SG8Lxg5XRereUCuDwkldy5YyKcR1U3utgTKYy30/wnrPOczDH4fQYO4r?=
 =?us-ascii?Q?bwo/RTFYdzEVKgIKwX/9Dbw/+A8BIERWvsYgGoBT4+TsvfXLoaOsAf2l0oNi?=
 =?us-ascii?Q?vRz+FETMdiPIQ3myCCOEoLN6E8t5h5qJSq3WZkJ0KcVqWSZlBc0QD2/dBoeZ?=
 =?us-ascii?Q?T4DrEApFXRfpZZqyyk+Q3mlExP4vA4FeUuhnjtk6KBeEaU3k0zDDl4+riA8B?=
 =?us-ascii?Q?xfvKcEVFr0KO9aDmk/7P6bDJXhG9QCmmqp5GNmotXqyv1N+HGWbSNjLaiLc8?=
 =?us-ascii?Q?EGJ8tRo14bfRKonZSxK9YfelaiHr3ZldYjwSxM6O1VPNqUdIX5Gvfb29I80N?=
 =?us-ascii?Q?E9NrotcnruVoOpkG/YpBUbVXBNQ/XZEFjOWDKGbH2jBKaErZwf6feISN8rKe?=
 =?us-ascii?Q?PK6lcFt6hPFPvPLV+kAFKkZe8ScySPHKapMmt6G860G4GZ12cD4trfpGt2p5?=
 =?us-ascii?Q?wKpglKicOutBnG6WuKwrjQpc8viyjiyz1ny/09KrGMyqkz3wLvPBy6dHFnda?=
 =?us-ascii?Q?crzYYsLUdZrvWd/3Bs8/fKxJmmqzEmrTFwM/KeW85aedOy3WkMFJSvpvRLmJ?=
 =?us-ascii?Q?L0k/RdBqROvqYEGK2EoXuBrHOIgMC+5TS4Dv20DJwcghW14y5zodPWAxzJbz?=
 =?us-ascii?Q?dtMjn1O/0DP/2qv4z9gqNE7xXnElA0HRSqx2PY2WHQKuIsl/znc2D1h70ww4?=
 =?us-ascii?Q?c2jFxzWiVUo7/wLbjk8YvPAO3HMZz0GKm9teJJawZYMgl2jYJKYaTRjpZ2Vp?=
 =?us-ascii?Q?tuVXQLutW108chMKFowFYl0jHLbYpXIRzatVDS5npQsKS4SugtaFXG1O92xm?=
 =?us-ascii?Q?h7ARrOwUP4naVmCsr+iHq6Uckl5ye6DsjQ6qRdvP6izfLmVbu4KgaT1g3Sej?=
 =?us-ascii?Q?ZB05/roZjl7t0pBP6k/+LZ1/BSe6QwDET68LJf4VG5fSHkyRFWOcZJXq7Wkd?=
 =?us-ascii?Q?hNHQU9Be3VNIdJ6A5AoOWFmUUAPCz8sr4YfbFJupos09LHZtRiVt891cQEJk?=
 =?us-ascii?Q?hewW8WufH55m1huqQ6nQ/KivAEZ3vCTsC9FhnrxCt8MBTlmLe08LPutLXOZP?=
 =?us-ascii?Q?wzHI8DyJLlddCC2c9XFrDZ42C48QFQmr5Eb67SLneP0xbIL8lE0qxqqVOB4U?=
 =?us-ascii?Q?VG0alm8LKhppEaYYM8E72aG2AKLzD3Fv17eU5szl322r7ZFj9A+Ul3gzWFL8?=
 =?us-ascii?Q?AWY03jDuZd01vR7Jq7ugVmnE1KpNtXmlJxSfqlXKEnE6GkxnI2dsODrp/zJN?=
 =?us-ascii?Q?D0Cn4GNiPZg+4o4QyaokJC3nVE5mmlRMSsExARwE5wl3sC4BfEqMw37+rqED?=
 =?us-ascii?Q?TY5ouQSNb6cLPC90Px2i8binqQiI1bA/30alKujmQuOxmorwlgZUchivso+b?=
 =?us-ascii?Q?QsA7ewXYThwh9AoEREb+7MycykfnW/gfgGeU2jiMrLCB1twR71sbJvIj4PdH?=
 =?us-ascii?Q?NQ2nyynqyudiQCl54ffDZULl/SqTW6zwjwkhr+FcanwLAk7YQG1AyEqYm2yX?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rk2rRdsYGf7vSaM7uaASfSq6eeuNGbk3GFAJPkRHA3XyFuXG2685iQ8vUtpjtC+lJbfvSjODRfJWZ2h8ddUwkZ4WBCAwCVXsMXgqWJ5E9v5ZSRfPXXi6PNPcM39YV254+x6D+x5SyZFbhfzGf16V6P/BG1UIun59V6CQpfE4XMd5jRenuSOXKaEtFnxF3zYftr3Ily3191gN5EBWScJK946hK6F0OLPUNbT6Jw3FTaJtKtqRXZAzwe5Rb3jzYYqnSCF4M4qrYXwrNjMore4tMvJ/0kTStp+dK0l0zC/aTsVdyl/qeefYA9CEECvYvTfa63TB5P1NfI4je9hkv9Y6555/NO5ctIS/1BQPBXceMYzvJT2G7uuXhbJOm/ddVeuTyyeZiqiCNzJVFq0MW0XoCmiVMmG1LfpJjxq3zdlN7+AqPa7765tq2cFiKxv9HP2I0hniAx3zj5bIqYxwbLv1i1zDJ+O1nMqPOCIGlqUeHYtC14Hg4j2eD5JAyyypLYCdfO9u6gUlrFRj5Nz9CzUZ9MUTsqN2m5/YtpSzXBbZfHf7inr2HZGiQUMlanRQQEkcQdnBRkSmZlUCJUJQC0loRTNRVw9lCu0LvDlfeoUhHB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6505cc4f-9255-4434-a9f8-08ddd44ca6e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:19:43.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DwwHJCjK/AfPdfVEZcsJPjhTnFlp2Gi1hGXrUn2SsAqCUXOi6Y+Y9k5hl7fI6exOZpVgXafLjZvgrBiOQ4mD4JN7ETY2tC82Hh00G/6R5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7416
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=928 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050129
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=68924b44 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=Bbq5CNuTg3aNqUEIGlYA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12066
X-Proofpoint-GUID: GIMEqu_nRMGK0hlGAe7R-vWS2gXtmIG3
X-Proofpoint-ORIG-GUID: GIMEqu_nRMGK0hlGAe7R-vWS2gXtmIG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOSBTYWx0ZWRfXxgMW8/Ssrx10
 LP9GFGZta69QSafF+N3KJ+H4OW64EJuJ2ThqpHbL7CtDBpPJPW1pVjUoZProu9KHW/EB8BeGEoZ
 pwFQudZCPTu/jcUSBrMgg8Q5WaFlcMdmI3xV+FpKPLBnJS63VW09yf/0nGnYQRSulM6Bd3edHsJ
 GEI+DoFlvdIPZCRXMuNmN5Bvi3L8ym42f0GZrXg2wKt8d/yfRkqRFhGDf7jGpLsb0DodrbnaSzS
 uMZA5a0ZYmGbEBVnf6lhpkgLPMDzSoCsoQtfEONzWZ2eSP5j/eTwDEIK3DzNHrclqD/c3nVtptm
 IZ5dJOSFmUc7p6w2nLfjuoXikrx9AM0FlgixeUhBsUrCVWUf0BeGn5yly9ujMhv3boQZLVckdn8
 rwAUBihzjvfegiGuP7KWN9W4PwpBmLQJq2veCnqW7Z/Z2zpYp9X40LFdGTRJIJkc//VVkHIj

On Tue, Aug 05, 2025 at 11:10:51AM -0700, H. Peter Anvin wrote:

>
> It would seem to me to be far more useful  to get AI to help find hard-to-see but perhaps common problems, or tidying up code (like Coccinelle on steroids.)
>
> Things that are easy to see post hoc are correct, but can be hard or laborious to do.

Right, as long as we get the RoI right on the efforts to check the results,
that's a great suggestion.

>
> Another genuinely good usage for AI is for especially non-English speakers to tidy up their patch comments and other documentation.

Yes, I have a lot of empathy for this and I gather non-native speakers find
it extraordinarily useful for this task in general.

This is a very good point as to why we have to be careful not to have a
broad-brush approach like 'no AI', as there are uses that do not cause
issues of concern but are of great use to people using them.

It would be rather egregious to demand that non-native speakers using LLMs
for this purpose disclose the fact that would label the patch in the same
fashion as, say, a very broken LLM kernel patch let's say.

There really has to be a fine-grained approach to this - the devil truly is
in the details here.

Cheers, Lorenzo

