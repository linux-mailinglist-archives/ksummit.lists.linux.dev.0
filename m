Return-Path: <ksummit+bounces-2069-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3319B1BA23
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAFE917EB44
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898B429899A;
	Tue,  5 Aug 2025 18:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rSjaNF99";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q5BksxNb"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46129827C
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418888; cv=fail; b=E12UruXJkFEKekFnClK0B0HxcTzIcpE3WvJ5dmVSXzSVjA+7Pv+T0nmkUHuaOu2788Zp21rduSUoNsvS8xsX3EbBv01/Xrdn4RWZnQ2CjcEgHOHUyE6Uf07IpTFsK+aqOOvP/nd9Jy4xq3rUFqg6KASlFQ32qBwAur9sIosbvK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418888; c=relaxed/simple;
	bh=Jsq6QypYFNAVlU/BXrsR73P0EKKlefUgpY0OWb5ePPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AuovZBzkxlmUbvynV7SaqrG39AuoCJc7q6sFr8u4zIRL4JM3fJnmm2AIFScf8ifw9D8gOBuuZvJovYY+oPYoCc3dDn5z5ThZcGkRFLPtYDdqtzhoUVlNS7JhNi1lAn461oSvrnr6kIC/oVL8j2IHMqQwVtpqQavG2xnmrxH9I4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rSjaNF99; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q5BksxNb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IYDfr013650;
	Tue, 5 Aug 2025 18:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Jsq6QypYFNAVlU/BXr
	sR73P0EKKlefUgpY0OWb5ePPw=; b=rSjaNF99U0zXsEv789d2UCZayafvVvtZGu
	pKTrzIWPlUkJ9mf1i4c1JfXs9BTgfDSrFU9zDNYgpbRKAIBBx/WUasyBK67efPpL
	r487fWiDQRyNqdaBKHBgDoABkmxLRA30nqcB+TsBqioL4+KDJI29OLn5vRIaHIVX
	VAhlGxpo7EIaALXS3Lmaljgg9zW69E6jevX+iZt5JGapgKGSsUH7GV58ARyjF7kg
	E/RF9hKQWiPyTvp3w9h1HYyJba6E1z1Mi4pWgu6/qFBPme4tO9EaYh5bgsQ+KxS/
	9owfyB4qF8UkBPh2USwTDe3qyf+ph6Erp9kVZGeynOjaB4SzUvOg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf01v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:34:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I3wMD005250;
	Tue, 5 Aug 2025 18:34:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk91v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNVQYRW+aUtc6KVTpdXTAPme4OGdi/GcnqvvAV+Ys/dgfrjIpq0CYW/pSK06LSQ0ZKFjxdI6beQxl9D0FjgCBmOZ8ABAixRs7J+evt+TskMtMTs2SPnyZRMxgDR8quH+djTS1pSURgdqgwP5n8App8gNu1MMIV+bd63TxA3cugf6Bu9/SWHgbuuszpIBPMApNwQxpKAEm10/TUf+U9H+k8Hdau3RQYyGjQ/mf0qsdB0TZt72iNwIHlYCtGkO9p6wCLb3Dj3hFPYcF0FXnjrKxaESaGLNEbcCFA6bFNzVcXie/wceewN3voxMWEgTy3tpxlmqYzPnPH9YcJR04ZWtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jsq6QypYFNAVlU/BXrsR73P0EKKlefUgpY0OWb5ePPw=;
 b=DDP91m7j+f/F8CkD++waBFweD/a9iatxfVIoa+1jNIvdnktzR1/DQaePB/bzPreLI+sQcNGjxuRZLbaUlP8lg1sTO8eN2TDqPMzzNtRLgwtkutIHGibyCNb6q3+ZQNt27jSIB5s4BBoCl3JjF7qOR1ef8L1pJwpMaOciXyoJEg0svp9Iaw0s3ASFLJNy0yoXeYnOjUg8YZPdGGvj1KQpGTFlYmHy8+Bp7NYikqHCP2vfH5EWztymmST1gqxnUzKSQaHYzKERAS1mjxpqQEZFNSiQOhjUm4yo2lrYGkmeTA6SZHHYxRQQWggzIshQm0ZYv5Fkmd9YdRi1D7tjhLdA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jsq6QypYFNAVlU/BXrsR73P0EKKlefUgpY0OWb5ePPw=;
 b=q5BksxNbV/tZr6x0MLpzLh3pDwYNKhEBhFDLrMYD/i16ynknZtQtoSAKXhQt0FeA7gU2rsf8ub6dzwny155JRbP6aJc6TeYGXauJCLm+LoC6LddGRUUpuLuYeGRzQCcRq/Fxpa2gA4Z8qN3OYL+j53nfJwbc3Yla/35J7k7pMcs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6122.namprd10.prod.outlook.com (2603:10b6:208:3aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 18:34:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:34:38 +0000
Date: Tue, 5 Aug 2025 19:34:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <1e0983fb-0bb7-482a-8899-52ce40fe4ab0@lucifer.local>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <20250805180010.GA24856@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805180010.GA24856@pendragon.ideasonboard.com>
X-ClientProxiedBy: AM4PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:205:1::47) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1ad504-92da-4e2f-ae48-08ddd44ebc31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yew9RtdwwygRZ8sxIBxj0VhOwtWQqKvT1mmadWCvByO3iWDxT53FCy8Opq2d?=
 =?us-ascii?Q?Xsdmrjs+sgtixkGL5nydmIlvEOTybLGDx+RtSxx1nwle1EHdOEZI2531ocmk?=
 =?us-ascii?Q?uonF9Xd3WtWd/cRZbmEso2SeRyAsh5Lg5Pmtsh+oeEpkSG+qKj/Mc2UAht6q?=
 =?us-ascii?Q?lt5p5hBzX4GK6kKJ/TkVb06GYmTGJ3iuwkl05odImIU3spsSP0dvNTWE+LpP?=
 =?us-ascii?Q?tF7yFU+srj2uJ640VTAL8kVn/bTGq3NzSeZHPl1L41g/U8Y+3Ap67w8NwqaV?=
 =?us-ascii?Q?EudpFyt/cTlsEQBgJhjYI/nVRpBiwReluZ8vOiOpHr2/7TnYXfwZSqQT/AfE?=
 =?us-ascii?Q?Y9JgAtAiP+n+8zuaT7dxXNS31hU1WmI0684kUw+6AY68ju1bFfciKrcS4pqu?=
 =?us-ascii?Q?eyMwZD8HhpOMzJIBiP3mx/OKZtAzlqFrcLwxzT0eO6XLf89Q4T4xaAh+wZin?=
 =?us-ascii?Q?ZEcp7nCELAperY0xHLGDR4rHgGuZDYcNifxMwRF4oz+2dumCOB315+YSgtVV?=
 =?us-ascii?Q?vYxHWo18DONFu11qt2LqDgNmzH0wTJ8Ouy7smOjVSqto8l99ZkkR0uOZB3Gx?=
 =?us-ascii?Q?GH8aYA6C/Vl3KC0wuQixCTrrzb/OTufTu+Q0rvOBxzJik/uP/h61BM6hr85d?=
 =?us-ascii?Q?W87VCQEat3puMEAgx6qvSyvtYpLVcnSEKwdNSx93kx0YGyNI9gDHUQxbitZ9?=
 =?us-ascii?Q?NDepZyiCNtmLmujmJivOoay0W5S5q2UmUZDunFQSKTg02rQTaQ3ndovYK47L?=
 =?us-ascii?Q?HXQvCm97+NbbZzwdXo9KaLhd1cszwLqdgWfVocQ6V5F7aIolcPiiCqMnycKs?=
 =?us-ascii?Q?ftBLD6RgWaMve0g4k7+idHyP62HQv5PaWYAJfugvxHFS4wXdfiBk3GVtzlh0?=
 =?us-ascii?Q?gWxwJV5CRIdNDyDZ4z2PAEmW6LEYhey6/X2zrgnpWlWNNmx4DPcCgcVs0/Aw?=
 =?us-ascii?Q?l0Vw5b4yiIwhBr1kXDqzdX9ulJelGoftY7MCr7bbJm36cjgwb5f65zLT1Zg9?=
 =?us-ascii?Q?lxVFcPMd1vr/BsCnIpLyQhVs3VgxlcTjURE9CPZYPAUUduPUTbhW2OJs4ega?=
 =?us-ascii?Q?5GCOK26bsFrTM7Fv21TwWIpvpJdLYndxKAwcCu/Npvs86wiwZOtThbcBvBpV?=
 =?us-ascii?Q?RJ8le7L6EjLNj1p5dDHLDxZyePdrU52naEoqg9Trv2WoEhbAqb6fDe8kugad?=
 =?us-ascii?Q?G6TXnzfyQHZ4nsL4F/5X06y+tSaQYpEGaFtvmgSCjRfP3YOFzQoNrV5gxru9?=
 =?us-ascii?Q?/jFaFH5cPv4J/fVcqPAgkGb60dHHRtE+qhWl7eErReK5LtcbRrHzDHw6AMHH?=
 =?us-ascii?Q?534hJlrzlzqRGfBamJ5rko8omQFYAkjZ3D7rp2IEflKVJ2iLSQ1rN9+Jp4rC?=
 =?us-ascii?Q?j7OmFskENch+pT+2oJOIwueBEWlOemoLWKI2IYVS2ntMIfeLQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cPBCmVoRcaKX20YEr2Yjz9sKxn51SUaqGHeOZIE0jVWu/iG6n3QpN/4YKgwD?=
 =?us-ascii?Q?snRg2MG0P8phxMGtNuVMI2MRA2vlwtTmrb2nJX45IeCM2XlyaJ7563ZT7d7R?=
 =?us-ascii?Q?cFuy+V+Pn8H5w9oJcrdrRBQ2K7nGxxPITVwX6Bi9/6P0R7iZe7PxqLyh9QDC?=
 =?us-ascii?Q?Mdzn6L+kH9Mki6uqyMixuSl23WgSdi4tmK7Y0HFfAD7H0S4B9HX8A8jj1l/R?=
 =?us-ascii?Q?cgUSjpuwd9GggvtsFgqxHljtWE/0XZD7v9R4UsqWxp0fu1r4hpGJAgPpzQKL?=
 =?us-ascii?Q?Cia7il6lLmd92HgM9EADi9gMnfntNq1UTpqn8qByVc3rDSqufojgU3E9NOG1?=
 =?us-ascii?Q?HV46jHFtHRrZ9oEddxG9a4mu13Fc2tsuxHvTmZfrCBlS7mMzCg4dt9oPtXwn?=
 =?us-ascii?Q?aBiZEMH0Xh07ylHvH2OtphB1EYo+6v+Ef6veItc++wi3HoSiSqDumW/GXnqo?=
 =?us-ascii?Q?QhyL+m6ct2SKYJyhvHwcw8SkIatkJhBL10/y0J2EdjV15AEjJtaJBKJ6+YMO?=
 =?us-ascii?Q?fZ92jDlaL8rnBzNV5Av3zia0Vo0Td4rzi/JMSZHFzXJlEqERG1syPSaHu7Yl?=
 =?us-ascii?Q?t2KtK49dBi8k1QflYWdIJQmHgLmEEQbTEbq21ZmKyeQRcVkBCmiryB/Tt7vS?=
 =?us-ascii?Q?jyzQIgmJs021SS2mxmaTVn4TKfSdpJEa7Kzmg4E2DXW8OvGdz5hwkAHbgCAO?=
 =?us-ascii?Q?2TWdjMxn4jVYbhlk/ldDEoscVb/P0OcDVeIrbYh1ie1VTYIdeRFKpaZLIjjE?=
 =?us-ascii?Q?sR7AuVTlpD2TlrVynJpBjAg05VEv5O9d2VShD2Sv16vpaSc6j+uYDIg+Ogq6?=
 =?us-ascii?Q?7J/HKVG6I/kD9sOBaOGTME+HYf2meW7gz165rWOn/AjmfKgZhc3DorLVudfo?=
 =?us-ascii?Q?qIcrfhw8aAEInnttyBpl+gy3sZ2NJyG+8PBWr+HKSG/W3kP83/HHf48hsA94?=
 =?us-ascii?Q?a0AqwaxJnyB5UVYf51M1YkmXLiyF3CmLfrMlP3pxr2pebhfV3n/ovo8hCyx6?=
 =?us-ascii?Q?W2UWoKyKI6DRAeAZqsu/4zBAiaVlrmObkUFIqJrVA5iYguCFkN4Oh0cGWIQc?=
 =?us-ascii?Q?bIUdqIY8CGCxoSzfKDD7EtvnkhsAxr4lSDr6BLymA9ttQNkVmVraVJSGqwZa?=
 =?us-ascii?Q?KWhOV47gM4kaDvPbbw4o1bZtGdo0sSquxqrqXER+micgz3RoDmiJMTpw4r96?=
 =?us-ascii?Q?pxRVtpbDPX/zPnp7075yDcw32XS93hzQBIZLq5UodDzlxZXcFEgrHrhWJCOW?=
 =?us-ascii?Q?xaBarYQMVFEjQV1xk+rSsUAIkY+LDCdEWJjzLZ0Rm02s6T6mWcko6vMUAEb8?=
 =?us-ascii?Q?94TbSM5ojlIRu952bjcYyldLJQKrT7ROODI+Fb0RwMG9pBI6EgP5zLvqLaoS?=
 =?us-ascii?Q?1i1bHgKvBxuOn53Fzrv5a8EGtLLeJDVO4cIBwaUxcLrRo9dnTohgBg8GyiOr?=
 =?us-ascii?Q?tzu/OLyz9w7POq1uPbbiQIs7ChfqtgsBvzMBlo+i2L+e6U4LGGxcGGrgnksp?=
 =?us-ascii?Q?z4yzApof9KgtEdd+lD4+nF0EwziB708Ut9dOoJw2mDosvVG7dOy/P5nyLmjX?=
 =?us-ascii?Q?Y0qGg8i2sGnToRvF7ylMXwzcbfUwThuRjuDkYfmDKQdCvMFfKva4GPJ3Lotj?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TWx3oFW1oMw4oqPFdbfBuMVbb1+OQOVUxRCC4EbPFi4auFlmz5oPulF+fKxhXshprTdMZhwtiNQ80Hw7wdOMlhC6UzBUVI2m6/tHfT5oYWaki5CoYuZM7flhCiMVh+1SFx9m/9h6q5LqFXsi5Bofc/ox1hu8CrIDqCx5DthUgZQBv3U+HefirjE/zvUAdt+OPFP9lyBGyn89PupbSkL6jlJ5g3oNLFY7jNeD7g9XfeJS+uQW+Yeyp425oPRf+4KgxgbJ7TyhaRd8F5uHa7Hnj312z8OaMnhsfGdsJk6EpiUj91Kq1ve50ITI/7tfl0ugwbq33H377rAW3b15MdBH9bQ7Ob9c9Ha9ymsqVHFXJKLjMO8KnA2iWS74bvzGJ+AgjLQ+M9V9Uc1/gEtkqJyykwowyILuP5EWG3c4m60e8NQQKVTQmYsWjp7K/aZLWOM80plLViaCwkAucSc323mnME+MZNLP6h9foahaIAYYGjGBWXKYNUL2oIuW9YL1K6BkV6CVOLjYbcvLrDK+9EvauewL/PxT6xzI4nVwCPN0Oy3N1DD725kfk5Pr+QPVi7bnDoDvmNCL+jynqTPT3a0o1xzoXrfE7HmCT+wyX/NTFtQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1ad504-92da-4e2f-ae48-08ddd44ebc31
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:34:38.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXSv4wzpWSI7/xEAyfip+ZkiHhSfOUXP1Xmm5JQeYZx6HjZgQI31diAIV5hCvWY8JrprjfHy7Uwi+xGmHjma/nfAkZnveR/PDlNpN7+jgQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=883
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMCBTYWx0ZWRfX0x412xyotZQG
 CUhBMRqblDTavb8Xc6zoB6FVEMjx94EeTB9gK5id9c/mNOWe/V2UzmbDbg2PXwPGhHWBrMs9JYi
 n5iGTMoly5MXfx2iFS7Q93KAQkNSHL9+mbM+sAyOVx4a10sVdSHKqs6YXsYl1BuTeqVvpXOYh1o
 1wkwNMXsU1LWuL1XKuBgHvUdSq6LTfGSfosN/OKsSKM0xoMbY7pSx66paEnH0cvK4Dkfp5f2kM9
 zbXWdTNuke3sLdHnGGQajcInd9bq2FNx/pl8C1pwePVw5w3YocoF9R3JGiB+O5GWFhy8PnmszYV
 iYfkVB+uScfs6MM+dtNQj+bZDhOY3V3gM0dHarD3GhIja6O6j3H/hqfjjyeszvzoO3wZ2+cFPnK
 bG0ramjZq1lHzcuW+hHifO8V4EeGMvkJzYSsWzhoszN+HQqQov0DDyGgcUKdT8flAAe1NXRu
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68924ec2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=F2fB2enU6ol-_3joHDoA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: cwk2Iuzo-eKV1g1UIK9hVh3SuCIa79Tx
X-Proofpoint-GUID: cwk2Iuzo-eKV1g1UIK9hVh3SuCIa79Tx

On Tue, Aug 05, 2025 at 09:00:10PM +0300, Laurent Pinchart wrote:
> Perfect, let's document a policy and kill two birds with one stone then.

I couldn't agree more that having explicit stated policy is a good thing
(TM) :)

I believe that vagueness on policy is a breeding ground for
misunderstanding and problems arising, and clarity is very important on
these things.

Cheers, Lorenzo

