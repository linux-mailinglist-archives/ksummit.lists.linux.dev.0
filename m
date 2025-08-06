Return-Path: <ksummit+bounces-2104-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4049B1CC93
	for <lists@lfdr.de>; Wed,  6 Aug 2025 21:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DC904E10C8
	for <lists@lfdr.de>; Wed,  6 Aug 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBAB28ECDF;
	Wed,  6 Aug 2025 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RZlzbrVF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lKTjnzd3"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A71FF1B5
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754509025; cv=fail; b=Og16q4I7uOv3eGcUvJoF0i9kLpoRct02W/6Xubtqid4q0q6NUPztHhRtGE6Dwh+pL4V+K5dRfre27ovlSsezmzAFsEVFxw0PJa8RUFWobgj1y3/Gx7v9Ppl16NChqQX7PH/gNXf3iGeh53XvcHUEFoHJvaJSKD9zmPXxWBG7etA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754509025; c=relaxed/simple;
	bh=LY1QRV+rg1mgUacwG9xy5D0lXRzmBBHwnXp3909l5Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gvL/hBSz4uw1WPr+0XSGSegM06kqr7ENRM/zjV3XiIBwxl7qt2YyezQ53LONbqjTMnXrQJE36ECZ9zyL3jBP47wDm4mlwcwkcmhUej9kqiRJqlIFPfSc22uttWb6VR3J1dzXbw/5PZeNrPyBd54Unj0WEtPWx8jCHcg0WHaXFpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RZlzbrVF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lKTjnzd3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRQgP013523;
	Wed, 6 Aug 2025 19:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LY1QRV+rg1mgUacwG9
	xy5D0lXRzmBBHwnXp3909l5Y4=; b=RZlzbrVFrpuLytZktAZdOeXDdOdx6TqaKa
	oe+YoV2/BU+lsXF3wxhnNvIyKvU6cC1goOc46t01j0840do8ASOndgbCRgrHHbJ4
	Q2MyxPdRMZNZuNGbv0QWYlEJuhVFYxuBwbXFZmSx5kh5+vvg9uRdbN+O5UGaw70m
	OlRELTGFLqR4S5kwo9FfN0P82KpDUfTXuIglHs+QHwydydCPzTsTClVdbr/aX+J0
	NWiEKL77G1/ncIQULIterg2hV+E/SY7uWzVx6p2VQCIeHGcJwXqp4ThWmKDVfcGt
	0qV53kg/r0MFb36p8cdJGswPiqHx6DhiCbHwSDY9uTXABMhBvo3w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvjtfna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:36:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576IwOiI032024;
	Wed, 6 Aug 2025 19:36:58 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqywh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHWZcLGLah0RYxLw9Po6WQ6dRS+N5CDLfrtXhwockRcAF2NW6cW35Ie2mybSMAKbhFaav524hY1gPGw+Yf3oqYjP2N9sP7oQOGqIi7FfAwITLBleqQXuGLwbMHDqTQzQPKbenSZefX4aAbgOkszKAIiRDd+Ui8YsCH5AaXNWPbYHdEdG6HnfsYtmaT2JwaOdLNUa57ndtQgX89cs/cvW2ysdprZ6Y9cr9i+2BHtm4KKXjtkPnRYox4dcv1R+cB3ka4eokD8ulGQGLvK/3N16l7uH/Oh9pfMNcWHxs3N13ais01PtHf5g9xHOGv4eqooN04kzpfYF8XpKXNCPAJ+Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY1QRV+rg1mgUacwG9xy5D0lXRzmBBHwnXp3909l5Y4=;
 b=Tae31/TllDcIvXgeCu/KvkHJbu1G6Hs3jyXVDfoSK+gGl4yZCrMgSEWpiwHXtvQsp6Hp+2hKrLklTLQSV2rpfOKptVPSqOEBMETafWXPAQUJ146jcgL7GnxvqIkBIEwa7TScioHDsN8gKPk8Scmikp8BupTha9eWPKO7fXW9MH+GZ14pKdPTvGaudniBrw+KM8+KO8Mn1KPbRV57dvqjVeFufh5kKaAcR7/KD5gIufQQ8aBUBgYKrOgewPHwcxxCUMzVUzAadKPiXhpeHdNEnGxi7LDFKkr0DP1srYoq58NuKfSZoFI1gfZsQIMoz8jOev7KNFCdMuy+EM9cw4dKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY1QRV+rg1mgUacwG9xy5D0lXRzmBBHwnXp3909l5Y4=;
 b=lKTjnzd3quNUYGkeIJ2Ig5tO1j2ObvYtRfK1fLpuL2Xa0UYv6K1VvS8PtzFr1zK+nAkxiKXAT2IXqJaidvMf2ov13HV31zESFG9iNGLvqDMGHJIMpCHDW8b9RXiZ0tf65rqiNw4LYndcmooSfoMC2YfEnOGiTAvhsnGZsLVQBNM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6180.namprd10.prod.outlook.com (2603:10b6:510:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 19:36:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 19:36:55 +0000
Date: Wed, 6 Aug 2025 20:36:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Hannes Reinecke <hare@suse.com>
Cc: Jiri Kosina <jikos@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <ff872fca-aaba-4e0a-acd3-8eb9c4ccb0cc@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
 <0b58487e-56fe-448c-ba22-80a2e7dab763@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b58487e-56fe-448c-ba22-80a2e7dab763@suse.com>
X-ClientProxiedBy: DU6P191CA0065.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::27) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 83be679e-acdb-4b18-8e66-08ddd5209a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E5ic4CiTybbkbwJg75GyfSgA11zpPOm8WmDCL8+fdFu8uvbvQFylCzb0WWjF?=
 =?us-ascii?Q?5rs73glQR0t+4D59RqW7eakiq0XnRcJzrqwTheHl5h6iB4CrTDxnz7JNcFU/?=
 =?us-ascii?Q?glkX6FDeKfMkeR2fOOwTlU3cilcgXkSwSKIhxq4kU+2wc94m1F6cDw5fagB8?=
 =?us-ascii?Q?CXIpzZbfzqgSZV0LiUL9f06mXlOHJtK8Ezpe4aVUIeAWjDcb5UPjig8474my?=
 =?us-ascii?Q?55Q0B4MptpVoh38V8IrdQ12NBmuuhnM+qrVeGCvmrEiChSdCKGr3OTMpR6nk?=
 =?us-ascii?Q?ZOKdM1uJVIdOTzDzqLpTKkMUReC0RLXC7aZHTrZ21KQdAUoxE4cD1CDrMEb5?=
 =?us-ascii?Q?vXsFwVqh4SjeWXcGaDw+y5dgSUOBCt7JznU8YUeKdm3DrDkXZ4hvPs3sSm97?=
 =?us-ascii?Q?v2z+BOIYk2X5sgSpX4vvNUhYlCDizclUMEqbkHyN37lHokCzh51TJ4ieTz0Q?=
 =?us-ascii?Q?9T3QJ5pnwYZImb/cNAb8xtwAPfFuUv+vTpd5+0qoo9KdoCwM2XVgpSia5IG/?=
 =?us-ascii?Q?u8wbmZG/1Qg5oKP9MrGkXGlI7/YqEl9o3qfLt+sEnU2Zyy3e2PgVDIINwh0c?=
 =?us-ascii?Q?M4zdfSsmDPLF6OCL55SnhhkYHtiOJnOLMov2iy6xLWiE97kQbhhrZhO5xvhJ?=
 =?us-ascii?Q?/eHiGw7g2BRq9J30UJ/wwDgIbdZ/y30xAsCd4w2S3KWuuGQCSruQXU3ZeEpz?=
 =?us-ascii?Q?yW2oa1PakkqTax1t5Qxs84syNtInGFKV+KJliiB9b5gTU7ArYu250NC7DaUS?=
 =?us-ascii?Q?z+z0XB8urkftiaeauef5EywgzGPaoWmDLKWzTllvHfxq8Y+SowkIL3LcH1bY?=
 =?us-ascii?Q?2zPE7MQnQU5/YXUo4i0eCWhFEXD7YeKc5KrWCy74kD4sMYpa4h4rg6x5wGz6?=
 =?us-ascii?Q?a4L5D2bz6mvoQRUk+9KZngTl1I37u3jczmOZ0zkeedn4W3cw1hCQWJTvk9bv?=
 =?us-ascii?Q?AfM5JZ5RKgY52I0lv7Qc3mhW5JJ6X8lb9aXXKONFx2NmND4wBs/j15yebmv0?=
 =?us-ascii?Q?X4wygy+6KmreoGqJxoOTVPt52gaRJ7FItLjSmGzxIkxkpuRdq73IE/gttiYf?=
 =?us-ascii?Q?nMGV52haTnrQdo5yvHV+SNUTuANMApKv3f3Npu7Uj8nq2GCqtq7oKXLVu50u?=
 =?us-ascii?Q?iv8YHuruvXCTL/6mqzK+mf+yBNc0JASJn29Fdmnya8M0j7RWsfvSK59dXMxi?=
 =?us-ascii?Q?2T6TL9APJsDICIT13yrZpUE9zX64qSaCIaQkF+7MJ/TETwOocH5lSNG0vJ26?=
 =?us-ascii?Q?6hn+FPinaMHmfqKBDSZbM6T/T0k+M/UljRo71q9MrKB5eL6qWIsnxJjyjAxH?=
 =?us-ascii?Q?lylLtUPWvt0rRU3mgbP+4Tg0agirSsFn0MEV68bXQhbcBX4Wyk+joPColSCe?=
 =?us-ascii?Q?HZP+VW/z+ml/aMYBN20uUfmkMOuw+2lgHHjjc63aPRgs9cIoxDBS5YFHrpqd?=
 =?us-ascii?Q?UK06Ac9p/vk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S7OxHlXy5PG73q/Mw0l+gOoBcV2C7t3klLIPE189RLM3oiH8Mhvnbv9H0thO?=
 =?us-ascii?Q?EKkIzQLm4b31sK5uB2U+9HZxcVI5QmRHM5ngxqAkquUButD8w+TvYq65QVds?=
 =?us-ascii?Q?eXPbt32C+h/zqN7+E+jWj3KBxWxW8sKb7GoXMhdnZhPShNNj5shmo4DSPJqK?=
 =?us-ascii?Q?fRpvja+VlDU4yyu8fIaB9EqTMAuVHGIpkcLJQDNDeTAyWzas19mS3396D/cm?=
 =?us-ascii?Q?kBRRtUBeMvZF/7ADef6+v30ppNnAz2K5ptHBcR/eyqzJNab7wct7Ae6EarKP?=
 =?us-ascii?Q?Nz5AcOdI0gKRbGWaNoRt7FRjWr0hj5l72YMttLCqKOdhZZfJNfI+ByW1yrnI?=
 =?us-ascii?Q?EJ9D/uoVJCo9j6mtmO1Im21u+XAKcpJzxQEv29a8wg57CCtYb7bkqH+woNZR?=
 =?us-ascii?Q?QswpviVLgiUNv3cHS5d7/rJ0yrRL9T0sXWsnwEMfTfE+8i5HavCae0Xkxutn?=
 =?us-ascii?Q?vLXJZtFs7eSB2IBFA+k9WVOYBlLlh04zGpJ3lCUsPhPLd9hWBNhOeSar+kyn?=
 =?us-ascii?Q?45Bhha4nRw3S+ycFXypIByoVq6fIai9uEn09M0SH2gd7mv1pUBvwpI6Hp8U7?=
 =?us-ascii?Q?RhEC2B4NDwOARJGX6VWMkrIKCF3aDazvM+7ZJ8v/OJd6sCNZTeXD1DuzVCWT?=
 =?us-ascii?Q?tiEJZwxNURmD2WfSnHbJc0O4P2bYsLyf4+9xO4gv/PQWDJnH4lgAIC2v2dVD?=
 =?us-ascii?Q?xvZUdIsoEBNzd0Y1dJvPRSNg9ZGdqKmnHLVg2oHYVtZV2GEwZNnVU0pE77R3?=
 =?us-ascii?Q?dfSjXFgabVb5wAgg0AA+Gj7KTDxxdnkIvYFekqKe2SdskZ/+zJPOysNnUnj9?=
 =?us-ascii?Q?FjCrlsn6ITFPcllUONpB6qUTl5ebc++ty+Lvj8/LYt0p3/Q7a4JOPqfkvHLW?=
 =?us-ascii?Q?tR6uwLi/sxsdBR/UUJqDTT4gwrioosqEAec/JcYE4OkocurFkkbDdHAhaiQs?=
 =?us-ascii?Q?y6PfPsasFQm7KDsee879QFE+2jdwCb4vMbIcrpZmwkhCkJ0ySV8OQZJM06vg?=
 =?us-ascii?Q?V/yHU0eB+WCe8coqoGGDMIPIEQS6jeluuX4cV2a9UcaD8HWb7pY6Rtnjez+e?=
 =?us-ascii?Q?UwFrAjpLQL9wRNHYm5dgNeWiw4ae0fWm6aQSs566ZpAlY9q+4c/nq5UvPhDA?=
 =?us-ascii?Q?aGXMLBQn3TvJWD/u/7TSIZkj2T4eCHnBeJFPZylyhMTMHlspr4pMPZ9eo9SL?=
 =?us-ascii?Q?3IEzCfZskUsCTGUlSwpwo0DHKM1goWfDf78NAQXinRa1Fkj/QOBmgEUL+Xuj?=
 =?us-ascii?Q?e+eR25+YM3t2Wcd2mPlkggvKqoPNDKTB7BBPVs6sRrknS5Vh2PXwlETGFR9t?=
 =?us-ascii?Q?OgN4ATB8btxJHQ0fYXoUZf72Vs6tEiKI/OQzBJygArO03unWjLqOAv6R+0bx?=
 =?us-ascii?Q?Moj1QRlU5gjKr25+oyl4vsyxQTx3gVt9XeWBL7u+pFBJ4v3iZ8HiucQ4LgAB?=
 =?us-ascii?Q?WaFoK3VU1gpNHFgxBBlqVeF0ega+rTMUyMyoh0SNkX3AwA67R1gCujY6H9Z6?=
 =?us-ascii?Q?mvzvVbr+syIqGWnBlpCk/Uue8m813XPA3wq1FJjk7sxLT1mdMb5k5Z+PP7YO?=
 =?us-ascii?Q?bPet3yuao5Z3l6UQ64rI/EfHvOsBjMgs1JxJIndIavTJ+55R2UihEralI3lb?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UqRyk+uWuI2R6fVjKe3HkdUsvWNBY+R5ZB63yijF1er2IcZu9zhzsKu0cd/DX+924ZHKyJhNw0psf40rIeX119AklkvODquzclhfOUPprEUJPYAbZmojKzFhQVAWyEtTSIfzeGgskS7Ahoed89cpdWzc1PWk5dgo4QzKVJsytqRDuO6+iUgq0FQS3uuDPb3Zb6RGFElZsgGrOsc+acnOzfJG/y+hdj1ALinbo/Wb4jmBIb22eutcVAZN5J8OmiISyt2s2uJU9od8SIoTRS7GuKlvGsFMAO8du+aovbyGgZueNr36ZM4weve5IS21gNVIsvDmxB3LXFCAM1RHn8roEBwJSZPsfpHq/+IgPdpN0HIgofKPPsybyq4PjpGf5HYxw6HmeB/XC49XsqifQhu02T26qCgBFoM8QRne0X4nrzTiJxdSe8PLuYeXuUi4t3bto8q2X1pk7UrmjVx07MyHlJ0VMwMxdWxvVUhV4RURaxVGHj2EF6DwlmeTHm90rcj8V+dkkvY2oh383t6QaDx8aOSwVYZ/dPHpdbDEmHVo49cbss50QPeaQdBpEy45Nmfk4OWTDQW8+uXBveQyPyTgwu+M9mBwe8EfSQWbfP4kJEQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83be679e-acdb-4b18-8e66-08ddd5209a27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:36:55.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMyK4gY3xDcpC0+b/Ngpg7s4DMJc9WfdQ+9rqdEGFzsRduCjzwO5CQB8Kb2SILHBXSYrUudNuh3G4QLFBiSZieY0yQZiXIehT0nvX8UUcng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060131
X-Proofpoint-ORIG-GUID: 2fqhpJpRfYZdyxm1hXvyqYvV4L9vzAKe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEzMiBTYWx0ZWRfX0m4g4e0I/Kle
 9cICHR+DGwqT4ZDCUgJxNqfIDBpuOsNi04L0dE6o6/C4fI0p5ymGHN/tEc9nQnyf6gwSkOtpQ0A
 +8NNFa0qrm5mLPZ09H74vteaFkPLRAS16N5XYm1CWumOW1jQmgpVsAs1AsMDVn6RldSTV801BDd
 ZtF3/Pa8L69ysJaDoFdq3mYOsIoRcJ1mpAUGKS9H2yjGtWQWRihVHIQvWXhI+Qidp1+nxHu0TMZ
 No8raNbGuqkxpRA7vhqdvvaJTwXxxZ5Z6pyDXcdfBYw8Enj7Dyu2FUeqN4m02qDw7iSFt9y46Hw
 rRBvYLHRtvrdzf4jN2O0XiBKB1hQ6LpBeDw3zDCn05LLD0SD7UoSJTyW+a4BKp7caW8XVfLwrza
 2P7yY8+U7dyh7fPGCSwFlgTuKDhrARWK7UD2CP5ynsjsM7F0j8vD35oYq4Mdcseb1kxHq7a/
X-Authority-Analysis: v=2.4 cv=dobbC0g4 c=1 sm=1 tr=0 ts=6893aedc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=V_Y5rN7a4dlWiztuu5gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: 2fqhpJpRfYZdyxm1hXvyqYvV4L9vzAKe

On Wed, Aug 06, 2025 at 08:58:20AM +0200, Hannes Reinecke wrote:
> But anyway. LLMs are great in producing something where 90% accuracy
> is good enough. But that's not how coding works; so one always will
> have to review any LLM generated code.
> And that at a time where we already have issues finding enough reviewers
> for code written by humans.

Yes, precisely. Maintainer resource is strained as it is (he writes at
8.35pm :), we simply do not have the bandwidth to handle an uncontrolled
influx where there's an async relationship between ability-to-generate and
ability-to-review.

So empowering maintainers to _decide_ what's acceptable per-subsystem is
key I think.

Cheers, Lorenzo

