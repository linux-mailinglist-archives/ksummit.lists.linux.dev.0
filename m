Return-Path: <ksummit+bounces-2101-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BBB1CC81
	for <lists@lfdr.de>; Wed,  6 Aug 2025 21:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17133A723B
	for <lists@lfdr.de>; Wed,  6 Aug 2025 19:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30952BD5B7;
	Wed,  6 Aug 2025 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YWwspDv6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oa+Zy6hm"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3112BD598
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508415; cv=fail; b=BrrVl/lLO0e8iISf6gopBRX3hFqzcO0i9ZX/YOU1p0QPmPCB1KREHj2VMQD+CM+k5i0hxabwxBjmZhFYvClvO/aw34SH8hADHcv/dqM1wK6tk//YAZ0xkz3OpnNn4kA2V81yCiQU+PKujhr+nrv3xvPGUFvBC3fxfsgqjnKuZpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508415; c=relaxed/simple;
	bh=EjL8ZMk4d9haCfG6yRUqbnqAEjWhEeGYW21WKud8DS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dxcNHdpayOlieFigDmbFYQnu+xCTKlhpdZuhw+5nkfpNXYHGvnUcd+NtVE9OuDlvHkESYA1czF4n/IEKXNmydOhEXVDCr8LmpwVTPPL2appMPslYTj9IDOxP8735OBnLBOW2dP3FXGpGZZV29NklssM8CBQOSWfDlC1BefPn118=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YWwspDv6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oa+Zy6hm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRMDs001588;
	Wed, 6 Aug 2025 19:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Z1hZdNgBjGu4ToIh78
	yT07YQvLzdi+fKNkII+8q1Ozo=; b=YWwspDv6vTffHK2zPmth9L9xAKwcxSg/3P
	yrTRxIKf5ejXcS4nIt97DmYQHSy5CXci/eHDvIiQHXIgOgU5A4Gf6G3aTzRT4uOC
	KmdpD+YKcj3NZwGIIIwHesBnzEVPC5lJUvCkqy1GF6hfufiPnt8C+nZfbl6FB9M1
	v2vF0Kz2qJYft6J6ImYGVBGZNwvtjuNZiEluOS6w0BCklAPKq4Zujsl8FcRuz86h
	mn/tJcCS6YjyhYvqa3lyeHJB9WmW62r4gmwIcCjYUZnEzWjvP8lF1Bn7HtbVDqI5
	1B0uUoJVd4T/SiGstdeNI4YEm9N9bjmRkXsc+cQn3DWKnYMNgUXA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd2jdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:26:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576IPuSr027065;
	Wed, 6 Aug 2025 19:26:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwneqk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPFjDVsys1M9DaXzpvSTAJiaxQsI66ZACPw3R2kkrI7K32wrIjMGPmaBFfz/jpNaEIYvE/umMhmRbGgnpB1IaoSywTxMGCvedFK2bBLw04AZzc1gYasJfhtwlKu6vEEMIY8xc0x6y6F+B2zrcr+f/FU6BaekFtZOPBY40hWRhJz3zKbKxvXnQOeV9PwxvfinJ+rmq7I1bhx0miKCrbFT3eF82dheGeGj9GM2TVfQaqkWIlDWpTBLeTdFpFurrVrCHFLnx0rzeLcnA1jIsIGV4cIOXhjE2YJKr+OCys7KRqpDjJ/O6YAyoivWC6RdDKaISqOSngjmQkeqKCyGF1DNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1hZdNgBjGu4ToIh78yT07YQvLzdi+fKNkII+8q1Ozo=;
 b=jnlsRTAOyHWTLECOWV1ZqShCOXAh68BWwMXG2JsMLuk1jjGviRarFhzBPtGoS+pvcFo2ePaQTR8Hz6fYbLjBfJ7Yst3HVDWD0R+G0PQpfcLjNlOeF7pmZXgHt4yvJX8FJgkLaix6jZFNO2fg8udeEvTkAAmkstqD5ejuYlhsDNFliwPsqEC4JdH2cGN26yhbHL1I1Bk1cWIwYQUXUSzdMReGzpLyqMLhVJ1Di1WaD+e/bS221aONZncYSctbn+FBtg0g19oLxMOXt67Gae1V53fFTwvgoz4/46mOz6R3spzd3noCg94O1ijMklNiASJAzj8Yqyqup/23N5yYfk1IlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1hZdNgBjGu4ToIh78yT07YQvLzdi+fKNkII+8q1Ozo=;
 b=oa+Zy6hmEx09GSuQ2NLyVyGHbChyLMfxqI6B7AiLUtoP4NmgeX/c5pIjFKqVXUvHrXp5ZQzoL7gjnkbsC4p8GyrqNMwLyU6fyNXIZ5eEyuQT79JSmNLd59ZO76Syn+FyDcvFdN3d7XRIaTj5YBz9PdNaM+tQ2DzMYUYmiVsXxmk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 19:26:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 19:26:46 +0000
Date: Wed, 6 Aug 2025 20:26:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
 <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
X-ClientProxiedBy: GVX0EPF00014AE2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::315) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 12233586-3ef0-44cb-5b56-08ddd51f2ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1iPFXLY/nNI3SvCLProBn5Ti4HnfEi6pzYJZFWxL45P9Hzb11HWXPOzlgj8C?=
 =?us-ascii?Q?wsyFDxing+jnqEoxxc/ljyiXvXK4xZYhvfeS6Bk2Hq7uVzzdyCjcWuRS1gQ3?=
 =?us-ascii?Q?dfmU+e9ofKR5xYgDe4ePyLxHeNNZYVBFjkgvFMv1Ea29pl6RiEsQOS6QRROj?=
 =?us-ascii?Q?AAzHwI+2s1DWiDP/GhVUni7z2CuKJCFISZblWDEUTnnqnF70sdAqHRzgRFXX?=
 =?us-ascii?Q?Jsmq/J8hsk4ASSnDsKbr5+wWZ3tm0hbbmURXaLmlAFTNskD6eMvQfCrClexn?=
 =?us-ascii?Q?CSMqXUloaxSkPE372JQaFX5n9vlrEk0ASMDFs+kd590zUK5G8TD/VzXs16Pp?=
 =?us-ascii?Q?90R0U8tSobSx0YC9uvljhnXYJOktHYGwKiuKYB/gmDCj2Rz7zOBZGCUmOyvL?=
 =?us-ascii?Q?sWKjRCsSo7hCLOzT1aTpy09gpGn623aAzqkE7fkZrGHeppd0O8fI6POmG8Cp?=
 =?us-ascii?Q?3JXWlFJpqg0tmqjo5ESp3dwEmgASPMoNW984cClBdn/eL2GJXhAQtilxRRw8?=
 =?us-ascii?Q?NXSng7ADJt0mBX4PhFOqTCYaN0634PQVShmW4JRYP5Fcc7deaJB/dGzfDGnD?=
 =?us-ascii?Q?TTVkm75ka7TrnsRGzbGgE0c0Kq1vGJHXUq54gDEA6ScrjfyBnmgLwad8V70g?=
 =?us-ascii?Q?WodYjjt7fj83XwpZhqmH5A+W5O9bM1nnvOnYoolMiOnAv+ukE43j6LQBFP16?=
 =?us-ascii?Q?hPApNFS+52yozqlWKi/dLxxganEmTBzzgsimbMQesdmZkZ57VW5U+jma6mUP?=
 =?us-ascii?Q?dhYx3mMBYVN7dde1kIz3FhF3SNtRHtnIGuAgxytcVBJbLOC0U3wtE0+WefCp?=
 =?us-ascii?Q?tHAtE6oRskV2Au+VM87HKBazHN+f2CDBLP6f7h3dP1Qcc6PhREEUSNQpwm/l?=
 =?us-ascii?Q?q2fkFMHjPwoBqXaP0mqOVokbS6bqvkR+XVFOMHnHp5/U4XvktvdcwIOlS1hc?=
 =?us-ascii?Q?t0zCJBkSqWUNavOVOCkvughlLLYbtPIvdDXCF4MOD9TzwyvJPLIcVxOPTEKB?=
 =?us-ascii?Q?N2jqYsV8SoT6m2jSPfFUSrujtcEegvDawCfrVhRaDUXXL5PAPCSCDTWgHga5?=
 =?us-ascii?Q?KepIAo5oJBhMfA6q0T4TBMicxpOha1rx5khkchCxLbzTq+7zESza49ExPAHu?=
 =?us-ascii?Q?vNIV1LnjZMWT9DIjB481iiZmkg64mTWOEb7AldD5o9xkZfVmtY9fmtWsdJnG?=
 =?us-ascii?Q?+Ox4u97rCrGkrwRgh6kUEoLiK+J0qxMWCp9bv0APWut5uOpjNJI5T1fcGSZC?=
 =?us-ascii?Q?W4/LWyU4vdDY45Oq1emFx02IJrrJb2YR9UoO/N5IbKMoxp3EWVlJUGMWoWJs?=
 =?us-ascii?Q?A8r8XE6sQYvJRo7twW3RFvFiX83IfO1YnG5cFLiFUOB9zJ/4Kl6005FFow8f?=
 =?us-ascii?Q?hz7ZJ/zr3Iy9VMOT09F/8UGdnO5YqvMZUmkBHeyP2XotVnarsQin7MULq3t/?=
 =?us-ascii?Q?dqiHevqWwLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5O+sNmGqv+oMd8TDAW3/XwFpZjICwNyTsl4tBVboJiZMOe6D5pgpEoPv/X5N?=
 =?us-ascii?Q?v6fd4NtqHtka5nYb97aHrsKAct1lO1TLPfN9pWaXjxdy/5VgxUGSPHheH1+2?=
 =?us-ascii?Q?T/a1ljLkycyqdcOnxr3QaadQZ41mHHfUuATS6IeVKo52LXk9hbn/PYGZCByR?=
 =?us-ascii?Q?9qs5gTxjnT0O+sLSoD9SsV0ZUc5p6Lj99w9VDXstZRl2y42qzM1CowRAqy0J?=
 =?us-ascii?Q?YgWCI5SV+uTpR4CqaTRKEflpD2VL555z3xWFusG4xCWY1/JdnKGqX5BP8E/R?=
 =?us-ascii?Q?OVkJAXcv3qNsN0V0D+966KsJx+TWXSfLjMbmf3zHf2VDOx/izekj7t5ryyU1?=
 =?us-ascii?Q?56uEdLwk4VdxTwwbZav8mN8Tp0bnQu8t0UZ/J8hQzIXIeKFKg05nl+k27Hqa?=
 =?us-ascii?Q?qGYYtNmnOzEpjnkE2SC+qo2PG97Up7Ly/ZGbbEjCkpzLlxkwCU5hxLrL9TSs?=
 =?us-ascii?Q?e3cEnYH0mPOTq2B8Zo2Ur8R1NF2Vyi70ZoTsTulYnSfULyZHGQnv9G4SfXLw?=
 =?us-ascii?Q?Cu8LN+Q/QMT8SACpCmdb3BGYAzx3LwK4sPP6mD2PBUd1SUPuFuIvLuIYShmw?=
 =?us-ascii?Q?Fe6HZX9wQ0YphuRBAaqhk+ryVl6okhX6tQxwI9m9qR3vuY1Kt0Bz2zISojJ8?=
 =?us-ascii?Q?DnFr+rRQRs9YD8dGlLy+gR1jwoe67CuBVqtu7+hceBDAXWNBOiVeOWZ5dLEi?=
 =?us-ascii?Q?H7OCoB1LcqT7d/DWUWdccWRkeqHOEqB4xYlNyBLpnZdBjEWMnjD5r7IQxFt8?=
 =?us-ascii?Q?6+Gv2EfyqY6jV5jD9FVn5D5cQUkpwa83u5/x2G6s88xNC8X3BZoTMnpjYfg/?=
 =?us-ascii?Q?z6l2rH2Pawo9mD7dsvj1nIo21lOxVuxphXexdte+svDkPQMWco3hKEFTILPn?=
 =?us-ascii?Q?/eH04schv360FgjW0qRV1EAK1cxvjZ4OwZqX16kI2MT6NjMgb2GOSYAu6ggc?=
 =?us-ascii?Q?CnXw/AmMfe8TrZ4m4pIZjqfB2d+FXeRF7wepgAWPi4maUHaU2u5UiGt5CAzp?=
 =?us-ascii?Q?AL1LmdKwxN1ehREtUdJtxQUeJzu2yXWHATJuUtLf3zghtZl8Xe1ggGMFF/7j?=
 =?us-ascii?Q?E63mCQS8nI/MqKu7yv71BkxYxaw/mPJMr8lw3uolhD2cRg0xisWAKH5zulXj?=
 =?us-ascii?Q?cnwEfDbW09V37RDt4QciWu/WbV0ydpQLRANvTwCOTv8o3jtZRO57Uab1Wkh4?=
 =?us-ascii?Q?PoKA4If7U66+C3u560wKg+994d1iTwwmGZY6kitrYYKuNoMR3zidC+n6VXlP?=
 =?us-ascii?Q?lDbzHkxtChHstBf/1gy7+o5xVjVBVxrmUNDQMo8mueAOPPPzjCS8fsdSCBKl?=
 =?us-ascii?Q?+Rus9RiscVkjWk0z+KxUtNhLsW1UcavcmBAkndv83I2AFWnsBFUxKOcna49c?=
 =?us-ascii?Q?9NMVWPjurJJsdzeZvqLaet+iciJJK0e8VXJvEsE6q8XYWPczPk6tEbzBPFha?=
 =?us-ascii?Q?7WZaDmXjnBzxpRS4ZW25AtkQzYsjgricXjXxIgQX8dqlH7PkW/rQAr2k4ja/?=
 =?us-ascii?Q?pu9rQqa5kjkhsRripfU2Pzt51cE/qjRpm28CM86uuJwlwg2K+9Sbj5DSh/Uh?=
 =?us-ascii?Q?931gmfsGGPPs9nqgQ5Bmu+MlvzEoGr5Gvfx03SsNIO7di1MBWWq6vWCbbpYG?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V3QrNOYb2qidHqd/YERQtZAuBpqroy7whX9RpWQIRvgB0nZzws1FB57+1KDDFnXfh7+2Q/GaBuUFRCEoVn2ufG2b9B2UWe1E5rrJne2yUqQ7JBTP/R8IUuCIifbqp3VFC96tb0BqDHrpDm0j88bIBN7ly1AF4Z1B4HUA3I75hX6oS7NWAsOkZQWim+qjIKmNSWgw5bfQw9mVHZxtAqC7qUey6Hz2ClvDRrcY8acV7n1unHmeAE24RGbBcEjgrH00EP0cbmwWyH7G2gZ2JWEk3POr7wC51nvxMle+ex86tMVbd4kwzZXoG+lQOibd9ooYJ0Y0W8KLMEaTyzdOkJ7f+Lq6Wc4HHPpmkfhj2pFd2lOiqsVnUfjCg+hO9VkuJlivIndHE58/8+EhEHZ5Ck3zKYcTY0dfuNvCA60xrrxFYgXXMVdsXdjf/CPzpb75Zo053Iu4m5VP0S009PM7PjSw2hYveQ5W3cJd0uu/ujqeYmRoo39Btc+AmqXbE5RUr2j/jbss+7zYAgmtidU/HJQDSdi3FhNasdFtG3i/S8fxUMgW6HKhY+Z1XzimxxQOYVgTKSzcH+0gkxzOwyrk9evgoHYpK2zlSsm+mgj93BcGZF0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12233586-3ef0-44cb-5b56-08ddd51f2ea5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:26:46.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLRxUqdGhm5azFVDYMIAuXG0ztWj+Jk3CGfH/J8hDsn25Nx+vxeGVaz8DnoeYm1D2VJwwi3UAY3+nCulphDcKfhh4tkwfkkXhGvJW7Xk7Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=933 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060130
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6893ac78 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=3nyJuhjyvBhbsV68f4UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: tb4uXz-g66kCAIYrmJnW4cZukBbsRIb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEzMCBTYWx0ZWRfX3GbaB3i6xojj
 ZzSyi97gUs+gBrAeWvQWFMwH3DNtBonqcDnndeALDwQcO5p2rO7rXuVAgvkFZQQAs9bDa/t7Yn9
 9lgezfGbIoW3QkgORNI8qFj2ukHtz7m1u3pTuuIOgeJqNR4IltCiN6avZtO0EiV+ttnSOsM4yF6
 zjGJPHx10xNH94/T6/MpiXIowtwY45VAs3UC11DLcS7iEatgNrXb/6z9e1LG9AjrFYuWSWAxSXx
 HR5e/oM/Ic4QUMGLisWHLXpDFnbklr9LdiDFfiCUJz5Co/C/EktzO/A2hwRXxhBsFwOSwCasNuI
 fV1gk3xkczDxkbcqSuKrt+pDO8U/YB77+sXCgDY5sl3+U9SVdSlIyLJNWkGOQ0iFQc3Z38XnzH0
 eHhb709CXU6C0s4s8yeBh7gaPMerDJa29n95nEUm4p1aTB55GmK/YMFFA/+HTpy7UIT35V2s
X-Proofpoint-GUID: tb4uXz-g66kCAIYrmJnW4cZukBbsRIb0

On Tue, Aug 05, 2025 at 04:02:02PM -0400, James Bottomley wrote:
> > >
> > > I don't think we should expect a bar for AI that is higher than the
> > > one we set for humans.
> >
> > I'm not, rather I'm saying let's be aware of the kinds of issues we
> > might encounter from LLMs and take them into account when
> > establishing policy.
>
> Well, if we set a policy, it should be flexible enough to adapt as the
> AI does and not be locked to what would prevent the AI mistakes I can
> find today from happening.  If we're going to codify this rigidly we
> could arguably have a policy not to accept patches from humans who
> might be (and often are) wrong as well.

Sure, I think any policy should be broad and reasonable.

Probably we want something simple and practical to begin with,
e.g. categorising by:

1. Was most or all of this patch generated by an LLM? (>=90%)
2. Was a large part of this patch generated by an LLM? (>30%)
3. Was a small part of this patch generated by an LLM? (<30%)

In addition to:

- Was the commit message of this patch generated in large part by an LLM
  (excluding non-native speakers using an LLM to simply assist writing it
  in english)?

All of which could have tags, and each entry in MAINTAINERS could have an
opt-in entry indicating which will be acceptable.

We could then explicitly indicate that we're fine with and no need to
disclose uses that are simple day-to-day use of LLM tools such as:

- Simple, supervised use of LLM-based 'smart' autocomplete features.
- Research being assisted by an LLM.
- Any use of an LLM for non-upstreamed code used in development of the
  series.

etc.

Then we can leave the decision as to what's acceptable to individual
maintainers.

>
> I think we should stick to indicators of trustworthiness that AI is
> already generating at let that guide maintainer taste without
> necessarily having something more detailed.

Well, it's an interesting data point but I'm not sure asking the LLM to
rate its own trustworthiness is a reliable measure, and at any rate I think
we need to keep things simple to begin with.

>
> Regards,
>
> James
>

A really key thing to consider here too is maintainer resource. We're
already strained on this with human submissions, so perhaps we want to make
very clear in AI policy document that this is emphatically not an
invitation for pointing automated tools at the kernel and generating tonnes
of patches, and trying to do so might result in your patches being ignored.

Cheers, Lorenzo

