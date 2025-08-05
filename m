Return-Path: <ksummit+bounces-2057-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B740B1B9B8
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B2967A1EF4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FEA2957CD;
	Tue,  5 Aug 2025 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FnWNGHtp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AlbrSzV1"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5782AD00
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416743; cv=fail; b=GSbS8kKMlYv2GpIwAEIlffhM4iJYCl6uiw/WZGae4B42OK++m84xxFwPCKUSSDAXQTvd4ri6fam5wC5owNC+B/TzRsKTQA963BEPoubXh7dYvXQCA/CWAl+2ZYpZPfH2pNp61lqZULjIPK9zQhr62izSXoG4lSlN+htN/X7kscE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416743; c=relaxed/simple;
	bh=2uXKvaK4aU3YEbUZ7uE5I0mhHNJTwUDt8xYFYAyydf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iwCVWzx81FysgAQXWFWeALbO4sO6QeTGSMqlGXBndp/pT681nl/TB1A7YtYH1jzEHKO04e7e3xquuduTvwucsuwdJZfaROm1ZUOCkHk4vXSaxSg2wgXg87wYPnfLCIXMykA27ask4vAaJcRiDAel051dj/2tDLpnhCVgC7Zzm9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FnWNGHtp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AlbrSzV1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575Hu8C0025598;
	Tue, 5 Aug 2025 17:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2uXKvaK4aU3YEbUZ7u
	E5I0mhHNJTwUDt8xYFYAyydf8=; b=FnWNGHtpw/AU8euqbq46hXHo05Qx1bB/y5
	03WiENun2LIRVnlHO2tsFVGsSRIJl4akBIAdSgock1DL2r6ihjN2HNUi3n/6ikgz
	2d0iSwHJ+xREHLeZZ3C1OkBI3NwLf4s5C82uQIi1dUGRQq3URKSIysEQiLh1V3Pd
	VDC7l2rC7gFNhswS+adFcR2jr++0p6u5vbTyo+h/JMTJ4fF6RS3N/2kwTmdMtnyG
	tnmyBm2xtcDCOjUwW01FgGPySfknI7rDO7sbqqlYgdeIL/bBQFQRYnznFPIRIwH2
	vUy8yf++zm7Pbls6zVp8bf2eFBaM6f6KOA4Y1XiorGiVjO/xIdiA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4899kfddyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 17:58:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575GOWhg011637;
	Tue, 5 Aug 2025 17:58:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48a7q29qq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 17:58:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tskKlZN1vE2xo1kVNdKtBqEQfhTLgrfKDqdIqsopP8p/JTK22SLX8zpUBg/3pJIiatgaVpi0eOCnIpbGoQh6m9i2qvBRtFhbelnaE3vwIFQQtXBqHoiiW2NSbATKrTpYqatTFRMBgwuxwnmEu85eJfXcgCBPllgKPIDzc4+DGI8RA2I4wez9VNomDh2vyAc5rBZ9ZJChJkvyTHWSiGpcaVSE+OwequmIB7hOofqDYCrTB1+VzFFNTBSje4+eh9fjo8khGtWJ9uimpU3/ez40V2INbO1cAhDTJnYHvQceedfNkEKiSZxn90hC5yhnjirVV5+9DOaKbVo9hIKnnNdsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uXKvaK4aU3YEbUZ7uE5I0mhHNJTwUDt8xYFYAyydf8=;
 b=syftbjGRy1s1YMsWip1RjywcLS/izM3tNP0WKetKZnZuy2S8SbLeGmia3EbXmryTBbQMgkGWt10iTT5JQ8G/mR8QLf9ReYqDHd4pZHD+OLVy4O4Cm2WXjMCIEnQ2KysX2SUPUeAXCeZZ5xWd6Ydo4HYNdrCC8g5AsDyddZS4EGZxftjGc0eK90riSgVgyFK6jFtsT5BmHKwAx3fQPvQ5mLJ32lN9Gb4ikcJyCkQFBmAJM8yFZws7lzEie7tTGtvXvhWMNzWGWoGSQYH6kuqTEPdngghGV1OaQ8Qn6NzPOceoMY0MiPIgFV6Z7bLOn9Pz+8ydK4yn3VcFP5XvNJOJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uXKvaK4aU3YEbUZ7uE5I0mhHNJTwUDt8xYFYAyydf8=;
 b=AlbrSzV1QTSWV9M88pQmRiFjNodKP04lrL7CrUhUyHS1urb3tvGt7Ft8X9OhnNX4y+ySZQRZDpapeWHJVS0X7LQiZ5odDKr/HHgZiRzmZclmXrwILoyqnb+qtxwLupMIjnmfsGj0cNgKjg0Kke0mmMUgn2ncBGrgwO8RqTtk3Ls=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8019.namprd10.prod.outlook.com (2603:10b6:208:513::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 17:58:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:58:54 +0000
Date: Tue, 5 Aug 2025 18:58:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <6c03e431-dd4b-49bc-8f00-e5f722cc2b4e@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
 <e9902e53cd5c8ad444d6c62942e790b7ba5d756a.camel@HansenPartnership.com>
 <aJJCpFPuhIy_BKFa@lappy>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJJCpFPuhIy_BKFa@lappy>
X-ClientProxiedBy: AM0PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::35) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca65152-b559-40d9-daf9-08ddd449be24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dvptziQh0CxvmewNwXprsDDaVUqyYcmrNy171H6MYMY6XnY+yAfdk4WzfCvi?=
 =?us-ascii?Q?12tr+4A48B7vRZtbBNvRrLirzmbJZRQAvJ/Kt26qpexb7Lif4URehnRmCvUE?=
 =?us-ascii?Q?F6TIQmZlT2qnQ4BAljojtvb6chjYcMPFK+/4ABA5EVvRVsXoNu9sOm6gYKFK?=
 =?us-ascii?Q?EaL3hCqViNTq1cmHZ8U5UOOYyr7tmkU/mlZidhr6aUtXyf7I0FsC3JU4iky4?=
 =?us-ascii?Q?2GlDkKHobiyt/+y8I9OP3Gmh7MhhaGQCOze/97QhiNw4Es54vRwfSMuKlir9?=
 =?us-ascii?Q?8gTEmXFUwlLgt07P/3v9tHMNsvY0wN6nmpxk5AE2iPqNtXmywjRVaMBAi1M7?=
 =?us-ascii?Q?XncOophx1a0fIkSENaHCqBnSXzIqTGu00a5ppSESQ83S8ypuh3JeLS6axc7K?=
 =?us-ascii?Q?qRILUtoqbXlGSu7SikIQYFyFIx35D31F6x0mG4KlvmGae65f2j0FNU8xiSk7?=
 =?us-ascii?Q?+oJBB4nOqSa17Mv7WPRops9paLplg8yZbyI14VbbJ0DC3V9C9k3tplGkNcJf?=
 =?us-ascii?Q?hNGmgqeQsqIwb1n5gg0kTGvbdCoo6Ic/G6ZALE/RprFS9ytWt1XPji1tbpN5?=
 =?us-ascii?Q?wTxa/w18ff6kxErG5+wLs2Fb4jYv2Lip+OIJnBRwMDGSIKVXtYEBL5srtZfx?=
 =?us-ascii?Q?o2O8s3vpK3MEPk3NTNzKrRVpggz4bIwoktCaDC4z5IU5upkPYCsURCJfK8iY?=
 =?us-ascii?Q?e/ajqW7uzfHf+BQJadr3lIAVCTM0hMuIGLqlSzkM5kX1jZYOeHRoKErEzev1?=
 =?us-ascii?Q?03DAZNbGIwy8I88nhgzKoQ7XV2Rg+9aoJHxEkbxpRnstwNEA5DZMrO3HfdjB?=
 =?us-ascii?Q?yqPs8B7cedh2QB8n49f3uC7Ul2nRQeCOUENH4M5VZL3+KriKk2SH3NjZ8W1S?=
 =?us-ascii?Q?npnejlDd2ntRHhqSTWX5bh7rSstbHH5V220mOU5ZD1yjFWNW733P9qMXuz3q?=
 =?us-ascii?Q?czgrj/Fb3bGzYyQvcgiPZsAvNhinD9KjEb/JFgoV+etpOFBso3DaOdHYFEtI?=
 =?us-ascii?Q?vc/1tKLdnDPxl2z/E/DytvEu/6vVvB0Xcvwjj9z1+vpsbEDvnQCcRCNtsPF6?=
 =?us-ascii?Q?wqYJc3bQ3PG65WpM400U58RAqzOfIlqnMGmgQy9slSeKdJ8lvVAwjFqIaWLq?=
 =?us-ascii?Q?lXjnloBa0k4C4WYApPvp/S0fxBWl2O1EyGtMISpO4jcU5xu7xkXQuRmbZ7gV?=
 =?us-ascii?Q?jeLQjP8nnsFTc2XbldX2XOUHA0ZYENjt+ESaEh+WM2rkDoZMQ/RDrYKoXaSp?=
 =?us-ascii?Q?Caw2r6zTkzekai5nyLSwHptXKFZHF06CvbrTEqITcw3IeNrG9ovrgkEe5dw1?=
 =?us-ascii?Q?KlXyL6jzcIQXNi/C7T219MYbzC7lw2bpTkX1d5S58J8nnseo1vu9yjcjxAaQ?=
 =?us-ascii?Q?Z5xbacnD1vLmFGI5uZpEvaQEMbMS0duOQabNr/LYW9+MGztndxOMPVHghyx5?=
 =?us-ascii?Q?m04/hWKJJmE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pfUBQxNognvzGRcYGS3RSIqiWEGRkQPo1NWpgzlrVd769M3f9C0q2f7zuSZh?=
 =?us-ascii?Q?/mBaLM6BXtciDFvg0243lFFwtpS2MyRU0jl8uz0vOxhMutM/ysf7m2nPVjEj?=
 =?us-ascii?Q?b7EgXV+Y65F9zXUjQHfTn6Sjx7fvNyQYTvP0Wb1J29esQjx1WCXp270wyQj4?=
 =?us-ascii?Q?+MZCyAYLGYo4LipOV0oRWHPcP0tHYBQRsD75zZRS9BWs28Mo/MXnbaxKpn5K?=
 =?us-ascii?Q?z/5ErVcUYORnK0GayEsSLCex6LxJPUsuj34uY74Q+435rtOrRt/9c+KZZGg5?=
 =?us-ascii?Q?hoBh1PSeMd6VbsP4/ULvwDv3jRCNsZ0Hcw147CsZ7mXp/lb05qH9sYYoRYSd?=
 =?us-ascii?Q?FX51jSfdF800tJ84gx0DbksCDFZBis+04qniNHSpvwb69SVebv2rWgS2kyOM?=
 =?us-ascii?Q?t2WkQvQ4l3XbWv9p21mt1MRPtO2CKjL3L7uFtVbddiDnOkp38e0ZHLiEJK7/?=
 =?us-ascii?Q?bjFF0K8fmtb3newvvBmvs2V1C1Nzx3xtk5AAy8hEvwbL5TrUchQKOxPRArrf?=
 =?us-ascii?Q?2f5T+7zuZhYUcvzaXO/Rp2vY3hk2J9lSnCtzvU1CCdOcK4P4fEGKT1qx70og?=
 =?us-ascii?Q?1iznCFg0M3eGkmd04wc65mnYRD6ctkgvrQaS18I2C2MbENVbxX/3ad0vohDs?=
 =?us-ascii?Q?fpF3oqcJqbrfk3Zvk2ACYO5uOAK5XHfmmEouYgR3lcyQeodszazPkdvp4sKg?=
 =?us-ascii?Q?S9Im0XRIloJ+a4scxr26Pos1s+dc9PmdxeV92aXr7Osbz0UsklrCLx5HCXL0?=
 =?us-ascii?Q?HAj28m/AeiPpCEfuL0r3R3vGqTnVj/iOejY/u/b5gOpjLHfw7lKlvOnXL/E0?=
 =?us-ascii?Q?01Yx+IzMc2IBA92pqpdnhY7w6MSNpBVsQprCqdxOFPpD00xeQfpvzGIa69c6?=
 =?us-ascii?Q?NmhUPAUXXCXZbSw+DqIZs9H89j1S5HUbaPQaoeDuDuvNYF7R0Dnc6zLmH/3o?=
 =?us-ascii?Q?fTNzjFsQJDS7xG+7ZgHiGHabOenF0s4hMht/Gdc+dmfYiH7f3RJdst54gifI?=
 =?us-ascii?Q?3h1IocBmpVTOQX4+fhAGlsUmyWzYne6ftG1RYf7dX1PZczwjLjuEip+Qwmeh?=
 =?us-ascii?Q?5bj96cxkSbMkjeo1UqFtda0U0BEfOUDWJ5Rf7Hh8MXQ52FiN/wj8yzfsqkyy?=
 =?us-ascii?Q?07VXPHVz9uWF4dUsv3D8bg+9hdSYQkey3Zn1/llWE1fj7hKRlfz1kw7ZIu8/?=
 =?us-ascii?Q?WXmYI8ibFprD0x9VsWNe2HWuIOnSFmPLGtrJjYcf7p+Y8qwWP6KyMwbBda+t?=
 =?us-ascii?Q?aW2XZYs8nzsVdggjSuMUyZb5aK421ehJJR8SH/+k77WmsUE+/MZ1msPmEN6W?=
 =?us-ascii?Q?Iyoojr9SkjExim+l6uvwvEjGzARD+G2791TZ2cAsacSzgoV3R/MX7XaYwsyI?=
 =?us-ascii?Q?QFg0qEHPdj6l3zARqtY5TJGkexfKA3XN2lDwcQV8FkQYeQ5Fo5jRNinosoAN?=
 =?us-ascii?Q?CwtZf3cIKpRZ8A27gZyJIeNK5LD01g1kes1FdEjyd7d95eYc7Ab7ME8z3Qey?=
 =?us-ascii?Q?m+ff9lzayD5C7g+CRI2Mh8yVWrM+pU57k5h0+t8WqnodtNpXCdgh07vD9yDg?=
 =?us-ascii?Q?V9WkW2X1+7Wm9DEovfKmgYz8D7MPvUc0IQcmaT4jmQlAS6I2i8i7O7DfYxdf?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RTLCpohaE4u2Y5AU4Airkeg10uj+9osIlqzPkkn1qR4LVgGextre2B9V2ZqlV7YZNpDxJJoTq+33wr7rfGaxCmGBVOZcPxpUqNk0QnWVzLPg1ScYpUlOSlhzSQBXzlCEV4m+8u2ZFghos7Li1PFtjuzREcMeqb0zJ6vZfYpMTFY+G5TTXvDp3XkAZbPLDXMRJfjkpJcYujmI2GjSxeO9kInZFA3ksTSm5uYZ0YyR1kAOpLM07PC6o1u4NRYFRYH+UBzCG1bgioD5Li9gyhrOnO7lkeIqksqGHC2lFOR4nZDp1MAlYXqWGpd6Nzd50Zw27tWO1RHHm/JUBTszABdFlBvObvD2+1UD/dc5xq/KMd0Jfhv1IJWCTHvr/833/kle0H1SPSQ361bCZ0SLhkBK5zyFkLydyAVxVAISB8HkMPOdWR75GRuz5wsZsC29h4AI86NRICv+zzw+tRNLjxx8nJ2hk9upz1LVkDa3j8csXnb97tBqvVo8APKGSDF7wIGdvgqrqHJKtLxQZOwmGRzwkAPgq+kAXjPzY/HxDUwNL3F7VQFSJAMcD2GGIC0gzKDucRJHGCL2qdkqlWSKqced8u6u6qrJFfDq0PCa62wZR8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca65152-b559-40d9-daf9-08ddd449be24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:58:54.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/H5F2M17jmZUl77dsIyXymxaA0m95t4L1uq6/lLr7XuA/D/QokOwpOS2jblznAmRRWY2IV0klJoPT59EAs2ZfU3raGs5N8I4fpWrmDsAGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508050126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyNiBTYWx0ZWRfX+jtYDMJ/3Wh1
 m7w+QcpUc86E4KVPmbW5m7Mnt/0CHk+JGsHl4zwM4a/sFmlLEkS65tJy+BQ+vFTI9DttsRgDgb2
 oVDNH28t9vPOM/Cd77+5J41ZxctabXSNR2QN3HZfvfBxTTAqrfB0CRPoB7YCQqcFj6yR2cTyxsY
 k0NgS62vzH3ckPKwdmZVo/gX6WWG8lQF22D/1Ywdh41gxvDk72bHZuY76IB7w3GjUAf1neIPF1p
 U5QwE+tw5B02OIhWU6HTHOv4cQ5GqiiZ1i1TYeowWKj6Lz60p1UdOFhhDPe2uuCSWR+c9dS3Rvv
 uVP68ni+vvY8YHAT6rN/kUF7fiP2hjaQrDTPE58uxm0YzIo8kdxsar2F3fajqDs5Qq1JLbdT7vs
 FYFgWaBVMD//EOdUsABGAeQ6No4rRuOks+fgOztPgB6nxijj6yRexogDHCl849iajc3ArsmR
X-Proofpoint-GUID: oCC0gDkJ0FmGebKRRAhFqVBI6bvSo9F4
X-Proofpoint-ORIG-GUID: oCC0gDkJ0FmGebKRRAhFqVBI6bvSo9F4
X-Authority-Analysis: v=2.4 cv=VMvdn8PX c=1 sm=1 tr=0 ts=68924661 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=g6nh1Wa0nyaZdiN0yAgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12066

On Tue, Aug 05, 2025 at 01:43:00PM -0400, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 01:23:18PM -0400, James Bottomley wrote:
> > On Tue, 2025-08-05 at 18:11 +0100, Mark Brown wrote:
> > > On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> > > > On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
> > >
> > > > > * On the other hand, there are use cases which are useful - test
> > > > > data/code generation, summarisation, smart auto-complete - so
> > > > > it'd perhaps be foolish to entirely dismiss AI.
> > >
> > > > Patch backporting is another such nice use.
> > >
> > > Patch backporting sounds pretty scary to me, it's the sort of thing
> > > where extra context that needs to be accounted for is very likely to
> > > come up (eg, assumptions you can make about existing state or
> > > santisation).
> >
> > If you think about it, the git history contains the exact patch path
> > between where the patch was applied and where you want to apply it.
> > That's a finite data set which LLMs can be trained to work nicely with.
>
> Most of the patches that fail to backport and get a "FAILED:" mail as a
> result are really just either a trivial context conflict ar a missing
> dependency.

Yeah I'm not surprised by that!

>
> Resolving those is within the realm of a "junior engineer" which I
> suspect AI would tackle fairly well.

Right.

>
> The other ~10-20% are indeed something more complex due to things like a
> major rewrite/refactor/etc of a subsystem, where I wouldn't trust the
> current state of the art AI to tackle. But mayble a few years from now?

Well, I have my doubts :) I think it's always a trade-off of scrutiny +
class of error vs. time gains.

But this is, of course, a point of debate.

>
> --
> Thanks,
> Sasha

By the way Sasha, I was planning to cc- you as this is obviously entirely
related to your series and I'm more than happy to propose a join discussion
or something like this, - I just followed the rules as per the maintainers
summit email strictly and didn't know whether I _could_ cc :)

I would enjoy having a friendly discussion about it in person regardless :)

Cheers, Lorenzo

