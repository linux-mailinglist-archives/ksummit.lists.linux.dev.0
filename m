Return-Path: <ksummit+bounces-2102-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC36B1CC8E
	for <lists@lfdr.de>; Wed,  6 Aug 2025 21:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B1B6566C51
	for <lists@lfdr.de>; Wed,  6 Aug 2025 19:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC0202983;
	Wed,  6 Aug 2025 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="offuE5uI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O5mM+2+z"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03975219300
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508640; cv=fail; b=mwMv+H+w5Wv0WaW/lG0rErxAe2MJJErTNZ+tQinYp7Hw07rtAdO+Lbv0T07oX5HnnZg3Ki+ANUuWcCqb1iLRQrr8yqBA12Cp3eG/VFhOG+3VDJ/h+PGd/BnJ2DVgQc0kH1rASMrNTjJuyI0SS8XcdLq9Ftf1TCdAnaKH+DfZSGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508640; c=relaxed/simple;
	bh=9BZeUKXj3OH2fsAFJ/9omr2G41VMUeUAQcVEXKgEiPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kZyXEF9sr/6XbGKRZqtLH54fYR6GaduS6Vwb2+t6r/6xuSVTX4kvYOobbfWqSfDcQXwVD1w5oVqRssxQMaUIgNfULoMRWDA3R+HQF0I/Usj9i66yF3JQMHvzOPgRERq5b6RVjDrfv1Ia8thnOi7qIGu22dXgqoxB91Nxj5DQ+DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=offuE5uI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O5mM+2+z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GROIc025022;
	Wed, 6 Aug 2025 19:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=AHQPeUt2nFuAThU84M
	Jx+1iaxbUAMY+ibB/+svB1dmE=; b=offuE5uI7NC9MpBtjRnZMr6NhRj31redHH
	AhWZu0ppYauQHV+eV1R+H1F9POiP/7gY3nv4MnA35KQ58grPQV8zwf3gxl1pK86S
	26NBeiKQqcnUpCE7og00rtraMEUGt70yvszV0vVIcC94Uz4POxYzDVrLJkm97Qs7
	DlspBOnlQkMMXTKNeu4kHdBZcF+II2IZY+mKIDrB3ezAlYkwVkHyBSwmRW9is41s
	7l0S/+uRGWJPgKO8nneVLEIYt4iRKBfGUWqeb+YNyZG4FK3LqyEkOObZE/4B+mtp
	MT8K7HuQqo48I61pNGgVf74jH0v+Ic1I6r6xH9927R5D9kTzF/Pw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpve2j3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:30:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576JCFKR005770;
	Wed, 6 Aug 2025 19:30:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwxfj6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ialMPlh3gAhvpYhYYR3RIB13Z8neUOCqFgJJAJJlyTnuzEiq9hrTysc0uqQdMY3sV/W6TQg6MDKKMPmMjpMAzMfvjyMhMWHQgjBWQohMgl+sBGQDJumDvbh9UM4AHn0TEfbPweb5fm+5Jna5S4Lh06mz1lChas0Ng2arqivmiWHShnxFQfTwgisJgNH82nt0yIoOmuRBLNWQGPb79wvZfnWMzN6McyZmshG7E5AWThfewz7cF7dNPSW3DOnygBgxvaOnr9jLYSCa/7owsHlLzqaUX1079xcZY3h/UR/vjINvweO3TBWy1pmBT6P0a8xv9xt++DK9kZ1nr782PjUOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHQPeUt2nFuAThU84MJx+1iaxbUAMY+ibB/+svB1dmE=;
 b=TCrMLZsqT50kTjxYRU0kTwdSTdTPCrMjk2o7OkP6GIkshl5Q12TXCXKGJyrrWGfv2DMhGTDn7vpAHzSJA98uE+a94p0mXg+88bbA9PrfF9Wgppm11G/S4Kiuii6i8JQhn3Zj4+vA30dzq4w57MQ0cfjgeqw6lGkCHHxEmSlR943drCT5aEiFFT1Hv4jRbjzpB6dTzfUEBprQ6ExfdqJ4brhpDXrrWMzgfCD/KttoNn9Twwy03LdCR0VHJokl6DPLBaJ7TjWJs63DMI2KB59+EmNZB/KT3l4cX1pHuyVNEMiV1g19hhitMAA/z+Fgxjbw1T34DiTiapqpoM+9QlZUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHQPeUt2nFuAThU84MJx+1iaxbUAMY+ibB/+svB1dmE=;
 b=O5mM+2+zkCDFZIRSg0/gPDgBdGPmJaGZV1irvYZVl0pwMas9vKXVOjPWDdcSRJOX4jjSvtdPc0xqDYl9XA+9Hhl1YaPEwPWnQzngtOa3YTUDMNTgVxAHKwaC9QBuFIB4MB8og758vx35v+kzbOvcOt6Nf5A38DHACPFerpBmJnk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB7424.namprd10.prod.outlook.com (2603:10b6:208:473::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 19:30:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 19:30:28 +0000
Date: Wed, 6 Aug 2025 20:30:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, "H. Peter Anvin" <hpa@zytor.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
 <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
X-ClientProxiedBy: GVZP280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: b4514f2d-2934-4116-ff2e-08ddd51fb343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?frwhkSxUeJEw3KOVv+aBt8f86DKjQa/FQKdp0Dm44HFe++T/WKUkiuCnctTk?=
 =?us-ascii?Q?pWMWynurHu8U6ov00FKe91OKHTJ8kz8jVtTxxhZOSr3G4HmFHWqGBCpUkBqw?=
 =?us-ascii?Q?SSVFYYBcvjT5TEqCQG66DeSdk6bejdDKu2gkOsFaZePWeOgdFZPLVsubEAif?=
 =?us-ascii?Q?KKl+UJYCuDVejx0Z07IqRFbTJbwLfoa1Iibj46/688xH/ShS+orKvbHyEdHQ?=
 =?us-ascii?Q?RzRaM75Dp7Qhz7PeIjPz6RXD09iPrtWxspIo8BNFLZXxqG+Kxmliz+dM+JK4?=
 =?us-ascii?Q?JocMczVUOtLOQ65jwxTYXJqYCsgv7bJQMe+AzNTvSPfPP3/YPtapMBmocSkm?=
 =?us-ascii?Q?2CSsI+di3D/w7jF7mXD5xS0yHyrvHTghdUI4TBbDkEwIM2sNmY+D1VaLXwSv?=
 =?us-ascii?Q?9E0+oXxIQOWIh/9omhVFsm0XKoWFHMN2sb9TJ8Syww1K2Q9tFhAmFrHOIVuc?=
 =?us-ascii?Q?iwhZPvLKXeWbe3kmlxFcMsyjT06Y1q1h5CzpHVo5+zL5JQnPlCNA5lTfPgIy?=
 =?us-ascii?Q?ON2Mgmy9TKVWDGIwghABpqqroEs5uTeDnBwrqLzPx+MB/ADPx17eyAg3OujQ?=
 =?us-ascii?Q?OkJtu6Lp40qqfamIO9ZnsSA2jgaiNtTrdjMgatOTEj4wsjwF8OONrB/ddBPR?=
 =?us-ascii?Q?1X1fH6tMLC9Qi8gXlYZwB/SHXVRyWazBWJQXC6v9zHR1rK1vrEgCU9TcTtkZ?=
 =?us-ascii?Q?qjuFIRoZnXs6uE/8m6thcihQ38LZ7jVTNJkpDlOCXibYyWlczGSQNhbaAHyB?=
 =?us-ascii?Q?CjKt9jCA6pPqDdoYDnghtqaGFQ1B7byr36yNF4x45QFVMO4rn/yqEWApt8Fr?=
 =?us-ascii?Q?HkUknW4yk2RCd8mPdF6AmwuULoKP4DVz23Rekfg91+H5H1KAlzs0mWDIqNCj?=
 =?us-ascii?Q?gQpKMcwNE9lCjVuSzXAMKPMxJClXisKe2x9i/LEuGpaxQ9iAtryBVNph1FKb?=
 =?us-ascii?Q?mYvle67Yx2w3tp1GAohNj+sp0ShkCd/qOWBrxRn3iNmIQAC6bxEeeXabU+Th?=
 =?us-ascii?Q?WIvtraCUyQeD8SL+ZJWtrO5t0d+Fnyxia3+JJdxP9ayE/sgN1rBa08PXs/U5?=
 =?us-ascii?Q?l7MNK9vVMWXngBZs7CgNvll2kiOI2LLh1myGnaJPp24BPguIUSFZR4lFjqd4?=
 =?us-ascii?Q?chUnYd0Rz/DkOY+kfc55/w+M2jWsi5rx+nKK6GHQhnZOGRypVI9iRyd4V94Z?=
 =?us-ascii?Q?IlVCcTJXxzoR9SN0ZukmprYdWNipM0r6L9unvxmbRz2h/ypPhEjuwIx1svNz?=
 =?us-ascii?Q?AaBLGnLGclFHlMlmdSGWdyMIRvootDmSq+yzp5238sy/G0YNx308cBHrYg2L?=
 =?us-ascii?Q?YiyDNDqFKFW0QrOVqmGkOgEk6DxeuSoEEfhRyCkoqdAZiL68kTNd8YrByCb1?=
 =?us-ascii?Q?FB4jbKCJhc9Pj5J5LG+Fg8mcQJnSZ6TEMA4LaeCvBdCHFV2i/qO+x6o3iagR?=
 =?us-ascii?Q?KZGZJcqra7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l1brjnt6ijvEuoL2CshbA+K5LC6numf6MKS5rEtxMnw8CfTTAIsstIiYVCaf?=
 =?us-ascii?Q?aX/w29ym20Pr6FCt2hnUWRKVvUBPDHYJHbppLK1sr6SBJXu5zU7umJM7f6Z6?=
 =?us-ascii?Q?GMEwsAN3HR08wpR86DMTjowYjrpj1Od/FkleMKiQ9AUzpsVLs9OpdE9YUEEy?=
 =?us-ascii?Q?X/PyvW6da+Qr/9wgsEzedeHULgefvMvHqep6eRstYEC7lrTJrzU+7wrnfC78?=
 =?us-ascii?Q?a0fBrpp45iScQUZd1A7d6XAZEP4tdFWktBhWYDKwLDPlaKAQfDJEa9gPkxgf?=
 =?us-ascii?Q?1QyxCKj4oXGmv7k4P6rIkYRRKY54dR0W0GLfodZJUjXgjGBvro70Ewj3LF9X?=
 =?us-ascii?Q?EdXdEpZ0Z3hcMoeKPHGENa6EaPWR5UJuSTQMU/NpPmb35/m57EQLEW7hclwu?=
 =?us-ascii?Q?sIZQ0mYaz7m1pWZJjjnCR9QjbZaD7Ru1OwKrtZr5hcX/6cmXQrP0A8MYL2dG?=
 =?us-ascii?Q?oKwx8Hz9Md5XtukfGMpt1FHLEd1K9bR54Cpv5LaXk4JlU6MrW1mdCBY9PI4j?=
 =?us-ascii?Q?1l75ksreyGFF3d6rBrnHaDcx8cuLPgpbeq45XHKGwBKSmVTHDLc32UQ9wLqC?=
 =?us-ascii?Q?5y5zxUovvMB+oer8RpNRjqXR5lQXrtEOfdF9qqKIHVHEOw/Ym18kixazJ40n?=
 =?us-ascii?Q?7p6RBdsGCiI6XadOGy+HBzoxJs/XP5ATKmaU1yP1Ouqh01xHrXbppG60l1PP?=
 =?us-ascii?Q?HBDmnw9aUNYlDEKyqkRHlX2WO+KZqnjKtkMd+c/qmqnWmgWl8KrSnrNBJRx4?=
 =?us-ascii?Q?y8y48y2FiCMs0Xq7fbkLU9uuRgx3OhCfbXCBmfsPGCf7UjFf8vGInVTMajTt?=
 =?us-ascii?Q?r9nqXW0LOChT73ZiKyeCD+xqlFsQgClAmuyZki7SoSsNbYQJqUggOLXO3THn?=
 =?us-ascii?Q?7HzneOHa3MNvRLslXgf7NLWmck5WHLnMkkB/Pk/uA8RwRSktuujPZUBhQi3w?=
 =?us-ascii?Q?krH2BB6ITq4Si9oZRhYCPF5zhB7+ozpXjpcyifIjDeZDckwCJvFzVc9jaXIL?=
 =?us-ascii?Q?3qJYY1c1HqWq7NJicxnhDOSL5ZTFwlgS1+t3HQXtUYEPKIsGe1k+tnfC/zHO?=
 =?us-ascii?Q?Vrp0Qcp0dc52P+jWxPcrbKHox/2aJhkw+xWvsXSfMr+shtFUQk5Y78NwMWPB?=
 =?us-ascii?Q?qg62svnpt7iPNYcr9A130x7k/56oNt2KZy68pm4vsJp+3hL7b3n8UAL/DY9L?=
 =?us-ascii?Q?EkfbGKo9IhkCjyco/MsjbzPGgM21waR/ULgG+qeZI5DJJDXdF5c5laG5mH+4?=
 =?us-ascii?Q?YgNEEzQbIA22wM0Vw9cvdFwj/nrmu+g15VeiZJNVHXv8iLDw2VIlsfU5vz38?=
 =?us-ascii?Q?w5bocUvsxBejafSqlXdQO8NfQoDt2JgJtBQtrutdZ4DlsEVjyLPJqaVIXpbv?=
 =?us-ascii?Q?R5/1Eu3BVjvUFMcH8gQfsQacHbNPWjqJl34xc9chyf9HvLRYHVskSvSU6ex1?=
 =?us-ascii?Q?w4sl3UA2m6trOkOFXbbO0r+GvBnaKBkMR1X32+f9Ag/paiKceGkTqvNKyjA4?=
 =?us-ascii?Q?J0HiIOvlJtQOM9z+iw6/OOmgczYb0DQLw0rukhVwNkF+jDcSQJhamQfguHr6?=
 =?us-ascii?Q?qmZryfL0+UXdmkhy80Uh7p2q1zHHFpAY/NKZW1vBc/H6WIIwNJs5nui2ktNv?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X6QtEbJ5MoJXkROwyfYfaUKIpRJYpJBbQIQJY1AGtdd2mbT03K3/U1uJoAOehFay+VfWz/qbDoJOpfH2A38w3sfksZ05GRNiwwPz8PWw1CleRdJJqsmbwd5myHMJpq+rfxel4ZDdBIMHldpY7hly9Qs4t+hSy3IJVqVEEBW9cxgB6Lr5RHbrDG+TVO+KR1OBzuqFjFgDj2PBEcSwHLBkq+YXxLYAUEZ3ysPRfI+V9XcyQStccxMarME+m2V1s8mPxZMLKg84t3AWPpwO8n+db937nRJM5yEoJ0Gw8dGKq0y0KYzahtyoxHlT8fSF0CEJuXGrKcPqIt1VemAAELcErjp6LzJDqqW+1SkZaZtVH71VdYjFfluFPxbokUuTBusNlk0uGO4ZG2LT4JnjSD/Oh6okpmWyUo9ZRoTeiG0H0S+P3y348SFzCZA3owkCXoW0Egf7JT6lL7+N4z0z4zvY4nElIVO5ofQKpw2n2peTicm09IBz1h6AoyP51QEujFuTMkqqPlKP4ah4SrV8+bqGSqYB5BLP9csukgXWIGTCuftxXYO9WcHJCOzni3xNuB9Ovuq5umd7dmYx/iDVmSLzV9oZwp0mQuMXChbznM9+84A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4514f2d-2934-4116-ff2e-08ddd51fb343
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:30:28.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JE1nlMb6Od5weEHTAHSmxvtvF74rm3Kcw69yLsnXxLhVN9VoqfjUeuDCsgNvV6WEwSxIow9w3k3JScGzddUbsfsdf7obb8urIsviAyJlAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7424
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEzMCBTYWx0ZWRfX2BlOZEUgF/Oz
 bGWvpK2pkSeeUPIS65IITQ0I6Zy7harzLPBLmPIDYXaptMl0uU6iggyPqtICSKRAYildVTGgnuU
 4zgFKU3d+hxgt0mcefG8oAyQvhpVdaLMMGG4fgZj8FRJZYcKQ/2Fi4oMg61h0epQtpE6PiIqCJV
 oz8L1VR27xC7sST5H8Vc5eaA6wdnQ+CffQnXx9+ap6uE6yziucDcAlOG3Alm03LezqnVeXfkE6u
 MTQMoMHFIo73n33pVLD7/EK+V4wVASERy1QT1Q+MKV3gMLWuqyjKWvbNTSilZnngwLquJzEKGBt
 IqcR6UFvoaEj4phxPgfMYfVddARNrzxM1a7q/3ywVo/h6+VQGa4KscPGcgw5IFb7trBQLFipv37
 WXsuHpmvVR5FkuMcZwLCmBrbocUmGa+j+ZXvTlP5dEfWotu3R1agQeH3sb/DTlnQhexqq8Dz
X-Authority-Analysis: v=2.4 cv=ApPu3P9P c=1 sm=1 tr=0 ts=6893ad58 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=zCTlKc1k35HTQteydV0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: 8SWyX7J73ORV8XvjBOkZ3QRcUPM-hvLz
X-Proofpoint-GUID: 8SWyX7J73ORV8XvjBOkZ3QRcUPM-hvLz

On Wed, Aug 06, 2025 at 12:25:59PM +0300, Dan Carpenter wrote:
> On Wed, Aug 06, 2025 at 07:49:24AM +0200, Julia Lawall wrote:
> >
> >
> > On Tue, 5 Aug 2025, H. Peter Anvin wrote:
> > >
> > > Another genuinely good usage for AI is for especially non-English
> > > speakers to tidy up their patch comments and other documentation.
> >
> > There are also some parts of the kernel that are supposed to have
> > comments, such as memory barriers.  AI could help ensure that the comments
> > are actually meaningful, and perhaps suggest to the developer how they
> > could be improved (sort of a 0-day for comment quality).
> >
>
> I feel like I have seen patches where people have generated AI
> documentation for locking.  The problem is that if you ask AI to write
> something it always has a very confident answer but normally it's vague
> and slightly wrong.  It takes no time to generate these patches but it
> takes a while to review them.

The async relationship between effort to generate vs. effort to review is a
very serious aspect of all this.

It's why I think it's aboslutely key to make all this _opt-in_ and to
empower individual maintainers to decide how to handle these kinds of
patches.

>
> regards,
> dan carpenter

Cheers, Lorenzo

