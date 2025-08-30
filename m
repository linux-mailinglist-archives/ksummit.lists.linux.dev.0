Return-Path: <ksummit+bounces-2240-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55931B3CC8B
	for <lists@lfdr.de>; Sat, 30 Aug 2025 18:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2C5167EC5
	for <lists@lfdr.de>; Sat, 30 Aug 2025 16:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22FA2C15AC;
	Sat, 30 Aug 2025 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fpe7ThK0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QQ1Xm3lD"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70381E5718
	for <ksummit@lists.linux.dev>; Sat, 30 Aug 2025 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756569675; cv=fail; b=pFjEDvKWN7wPc8bAY1V3miSg6VBvgDOA72I7dkLbJwuh/NZ/dYJQ6wDe2xreSEwIVPuFroH/xYTF0l7so0D+08kZu6M7mQC7IXgmWYCiUds/B+Jr9Tm9I8pmkhHRz2XO1etZzG39b4XL2TWyBm1fEPpAMueqcwuHL958SF/c/8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756569675; c=relaxed/simple;
	bh=JomKxE8nTeHTrCLSqNsqxBgxEVY/qO6pBkhqRJyHMkU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TPgdZ7Yr2tSo5KaDPMKbPclV///9xsvV/ganS+xjY35hK6CBjCBWECaiAYAHLZMc0bjVFHYjNO9dI+HiTWPLH7F33WdaDrkUKOjBe2Lp5CJl01z6lgZ7FAh+p3HpohHmoud4unAIaehbhTvpyvwH1aVYM7oknlidQXffb7Pp6lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fpe7ThK0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QQ1Xm3lD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57UCh59l021914;
	Sat, 30 Aug 2025 16:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=taNg6/SzC3u8YTK8W3eJZl9KfTWdtwsUEDl3perNl0c=; b=
	Fpe7ThK05szyt75FkFzLK74I6WFtcoIK00KZwAlHBVml/GY/1cSnoyGHVn2SBKWk
	S/eCBRaNw3e3pL0tFcZVPkst5bD3Vc3qT/2qLatgA1XAt/kdEy+WhN2xjeGL3nRY
	WDKQpzHFN2ZGVybPrT7WhCTXE2u3GqPi6+LTr/1PvqXntm48R2usIBWwjAYjH7Yx
	OtNS0v6HSv2CSfIYLHz4bzZpurv5VfZW0ODBGKndpYU6Rz+m2wYzE6OWW8zR157r
	OoWxPpyVlOGAjc09MgImCbJyRXpEkHYertxMMlP+WMhYPsJkPsu9axD7+nBvZ+YI
	/bHtITeJm36YM7binZp/eQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usm9gc46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 16:00:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57UDfIac024881;
	Sat, 30 Aug 2025 16:00:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr6kgm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 30 Aug 2025 16:00:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbXcDhquIeaijcoQeBkaN6IW1MkO+LaUDVCXBKyy0n5IFGcEWNESi8k4C4i9Kaxyt/A1+ID0MK4Z+J0OhrqA6AbKtBasSa70xaA0fpsOhsxzsGOhYuOmRzA5Isj3G4ql1sqw9gUAFiyxZ4DUHZ9sXcvZy0w2bzglNC//MoJEm0Pf5hFxNHxfD0GX/9RhVKPHPNF16g52J74VNL8X72yxwjFZR2dl2WtF6J58XmBscoORJovIajJY6sNTiCEa+Z5p0ReMtURNpikXOTx5L1ji9DLUb0LyH/DxHjXbnrI+9hANaNOXefQV8AORcur8DcfPU+A/6SxVr+ckOpcz4pdIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taNg6/SzC3u8YTK8W3eJZl9KfTWdtwsUEDl3perNl0c=;
 b=bu5wMtPQXq+h9G7LCNdfsDB5hXIvONvOipOC3+hHXef5wTcYFdAR5J1Ur5Impj6DVTekHqeUCgR8yynesVATUtCk87+DR1uuYtC/jipRQFzjaiF1fPcFgvsjzZ8wREfrA/F4nu0+6q/p+Xa2pVY1pHb7T/CJvmjNkrolx5Ja8PGMaRT2l9VYtGRk7EWEx6h7f+PgnRkwVX/asOzsu0XjY5mwkud+xwGLDRPoqH4bkXvA4bQy/2kFPhR5Lr3/RBBSlnshRy9Zaj8vk7D1bkLxvecLyflTmyZgMUfEBtM11GxrRSljfeGckx/vjjX+tmAa5QvkLpDQysp/g+uUKTl3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taNg6/SzC3u8YTK8W3eJZl9KfTWdtwsUEDl3perNl0c=;
 b=QQ1Xm3lDQGH1pXLWdkbzRozWcDLXEoKkddRlbCRSmr/8wgujpd/aogPSzRXvyBV2hD8AXxLJhuSwBsFPTDUeEdT2JGTJzE4GjB1Svi+RKWNW2CBWJiYZbAdJKWfrKiz7DsA0NXx+jstN5UQXoZCqvz/ecunnDvxyN2ThxXbElJY=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DM4PR10MB6695.namprd10.prod.outlook.com (2603:10b6:8:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 16:00:47 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.9052.019; Sat, 30 Aug 2025
 16:00:46 +0000
Message-ID: <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
Date: Sat, 30 Aug 2025 18:00:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
To: Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev, Linux Documentation <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akira Yokosawa
 <akiyks@gmail.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87wm6l0w2y.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DM4PR10MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: c08341b2-5c94-407c-9224-08dde7de6165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkswSVNOa05JZnZMblZ5S3lUTjBhWmlQY1lJNFFTRFFDdWZjSVQ2QldVVDBq?=
 =?utf-8?B?SktZU3VyaXNqUkVMZFI5dThQOVlGd2tXcit3aEc5TjNjb3pkSVBlcy8yUGRO?=
 =?utf-8?B?K1dwN0JTVXJTaXk1Z0RCRUVxSlp0V3RIMkNLMy9UVEhaRmYwQ1lyMzcxbkJn?=
 =?utf-8?B?Q1Q0R2E2b2Zqak9odXF5eEV1eGhobHp1VXNuVWo5aVdtSXRpdEJBbXFuR2hJ?=
 =?utf-8?B?OERUQW1SZ2xCNjNlem9VK2NxODB3UDFVdTRZV1pRaW90Lzd4Z1VYOFJrd08y?=
 =?utf-8?B?MzZUQlNXRzNVVUp1cHowVmVMNDNERkVwd2o4VDBRZDZNRC8zcTBtMm8rY05I?=
 =?utf-8?B?SlpFR3d2M201cVVEMGJzbkdKUGFFZ2NscjNHZ204KzAvY1RMWmJkcFZnN3pG?=
 =?utf-8?B?dDl2bWJKT1BLNHd4QkJKSkFJMU91Y1pHU1lKZDJrVWQrcVcvNHA4MGpjYWFu?=
 =?utf-8?B?VnNjMXRibU8xWXdqVlJMM2ZqNUJhQmpXc2phelBKODZDUnoxK0pSL0FSelNP?=
 =?utf-8?B?MlpSNjd0QWFnVm1YZExxNS9kMEtzSWx2RTdIbEZqTDkzYnlnZUZDcWxzY3VW?=
 =?utf-8?B?enVUVjQwVjVrMlE5OFdsUEU4MHpFQ2xza3Y5SWZHU0poRDZqeGhja0NPOTFk?=
 =?utf-8?B?ZjMwT1BHUTFMdkw2bGdVNVRtQm1TYlN2MnZBOVZ1SW1BWFNuNUYrRE1qZmNh?=
 =?utf-8?B?enJLbGVKZ20rdUtzU3VKMitkU3BCSUhLZEZFYzE0eEV1ZTkrQXR5Z1FqbjBS?=
 =?utf-8?B?NmZmRnlaTFpxTms3UUhmLzZqc0MzTk9ZSG92ZnZ2Q3RqY1d3Rms2V0VjUzJy?=
 =?utf-8?B?OGMzQ0FKUGxUSU5CdVRLYlp3NFhFeklpaW8xd2w1cjBQSnoxZ0Y2cGpMTDMy?=
 =?utf-8?B?R2hFbTkyWlZiYWNhdGRGRWthU3BsWWw1dE8xQi9ISXpiUXhPdDJmamtibTBw?=
 =?utf-8?B?aElzVENlTHhrNDU5NHJYN0tJUmZwcnF0YmI5bjA0aTczbGNXdVVNVUlaOWpj?=
 =?utf-8?B?Nk1FMERmOHkyVUNjeklDWmUxbXhSNUgvWllMRzAzVVVoTFJGN0xybXZKOS9y?=
 =?utf-8?B?Vi9IcGFadHEydVpsUk9LVUZKTG52WFcyU05vYkFYYm9lMVppTHA0ZzZ6TlpY?=
 =?utf-8?B?TktzZmVTby9Lejc4K1lBcFE0ckdGNFdzYm9kQXdiZnJqbWc4L25lSFA0TnRH?=
 =?utf-8?B?bWs4TnhmemxRWWRocGJmc3lmeHJ3bjlxS1lmbVdsRm1uZTVTS3d2dnlVMldu?=
 =?utf-8?B?T2txdUNuNVlOTVZQVVM3VG5EQ0xtbm9ZZVNIZnQ5eTNnckRyTWllQW1yZ0FQ?=
 =?utf-8?B?a0tWZlMwck02Y0ZlWjNncHhVK1kwTlNYd2ZDOFBEcER2SFpZdTNaRVZza0tL?=
 =?utf-8?B?QUVkM1hmbW5PS2dPL3lva2hSUTlodmtBdE1FZzdzdXJIaXRmTzcwc1laU1k3?=
 =?utf-8?B?VlpYQVBMOXRxZ1lmRzdhT0I1YnVUOVRGeTNnT2hGd1hqM1VXMnlORDkrVE5Y?=
 =?utf-8?B?dWFQZEQ1RldTeGx1Y3pteWp3bTY2aXJOYlBJLytTWlNjcFhpSmxFOHZ3OXN3?=
 =?utf-8?B?ekp2eUx1c0lXYzRNaWViazBTcUZLa2tHVzNXc1VXTkpCVGtqVlBzZS96NEdX?=
 =?utf-8?B?NExNd3dLdlRibVlZcW9CQkNRamQyZTZDaUJnRzlVWGRrc0h5WGNsNnJ3Y1lr?=
 =?utf-8?B?NWNiWVBKNHBPUCtYMGpqU3lEVWtJaWVMY1lITUsxcjRiRjNPNXNPeUJUUnMy?=
 =?utf-8?B?dXNobVRGWk5XMjJiOHJCS2dUKzUvYjFUSnlwemRVZnRvUHozM25WZU9hUjI3?=
 =?utf-8?B?TlFNLzJIbWllZXpZeTJSdWdFUXIvSkY1anp6b2dSZk8wTmFKL0F3U2tDT2ly?=
 =?utf-8?B?cW5wWWdPc1pCT1dVOENEakJCaXBJUWNMVVlFUG1QR2ZOWUViS1RyYnYxNGxq?=
 =?utf-8?Q?fYgG/eXzldk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdBUU03UW9DUFhRMDBIdWN3Q2c4TjA2cG1QMEFFK3dLcVFmenMwYXl6T3FS?=
 =?utf-8?B?L2wyZk12cVJiTkx4WldXQU5IM2RNeGpwNFJiUGdpQ1N3TTMzWHlmMWZCV3RD?=
 =?utf-8?B?MmFNVEhZeEhSejFocmtlcHRlaUx6WVdkcnBVSFdkbm9WZVRkNzhkL2VnaHkw?=
 =?utf-8?B?bEtjbllqdHRReS9FUm41dlQ0TDlLZDJxUHVyK0RVNmRKVGZ4OEtkY2NZODF6?=
 =?utf-8?B?VDZGcENNM2swTU1yQkpjYllkbjdMdGRSS280Qzh5blBJU2xlQ2FQVFB2a0Fh?=
 =?utf-8?B?SjZ2eEFTM1grbTZHeGROWG9GTVdtd041a3NReENnNCtwTXJ3c1BCSm00Ky9y?=
 =?utf-8?B?b3RzWVM0dDgvcjk2blZtNG42SFdjZE1RR2tCU1d5RWlrZmZnbXFsR3JnaGtO?=
 =?utf-8?B?ZXQ1K2pWUlNEcmF1b2hOWVlheGJjMHptN0dxd0RDYk1TeXRFSks3Sk9MT09Q?=
 =?utf-8?B?eWg5WGFhblhneHZ1d2orcTFHWE95dUwyV2pkSGEzUzlWVEhXV2gxZUNOZWl1?=
 =?utf-8?B?cUxvcEwwSE94WWpqOTJOb2JQZG9DV2xvMCs3c3ptcUVaNHlaTUlvMWVXQVdL?=
 =?utf-8?B?Yk9iM05xaUdkVzMxS1JhT0NRT09pZ2dPaTlmejU5VjNLVUhQSlVJODk4bnlx?=
 =?utf-8?B?VHJ6Wk9vdFRlQUVoeTNXVTNBK0w4NDlhK1dSNWVXY0tJWUdlNWRkbHk2Z2Vi?=
 =?utf-8?B?cUhLYmZjeGtqYmZqZEZTeHpTYm8yQWp5bEp6a3F2RUxlU2psWEpUU085RG1V?=
 =?utf-8?B?WDM5Vm1aMlB5ZUtWUDFBTTlJblNKeUE0cjhJYUV1K0NFZ3NWUXIrUnNkMmpG?=
 =?utf-8?B?NS9RcWh3RVF2dHQwaUpUY0xLTjNZVnppQm9TeU5IK2ZlZmFtSVpCVXBvS0Nj?=
 =?utf-8?B?VkVBOGRucEp0WU9MZXZTUG1UMGhlM3MxbUFseFZTTkRVa3kyYlo5Mi9kcW9w?=
 =?utf-8?B?SUR3MkdncWNLQmtHc3hGeFN6MFhHUHpXYUxwTXVQUUpjUWhYcTdGNkZHUkdi?=
 =?utf-8?B?MGEzVDJwM0J0L1pJNlN6RTQzUXVkL0RWWDlIdFl2Z0hwZzg3UXZOWFdIR1J4?=
 =?utf-8?B?Y29lUVpqV1QrdHVLT3J6ZWVUcjg4L2ZmOERUQW1HUEhCbE1HQ20rdTlxVVNj?=
 =?utf-8?B?Si9YQkk5akxXSWZIMGp5Yk5FYkh3N1BsenhHY2VudzZaeDhySmQ4c2kyKzhG?=
 =?utf-8?B?eno3eDRkNms5K1dNUG12enpqQ05NeHNodzVmekY5M0pUeEQzV2lqWDhVYlI4?=
 =?utf-8?B?c3ZlalNFdUxXekJxZEFzTEhmT0hzcHF3YVA3akxYcVdraldNZWV1UkRGamNy?=
 =?utf-8?B?bmJPdW1uWXdGZERPMEVveXlJVC8yZXVRVHdKSldLbVhzNU1pU2hKbDVCOEJZ?=
 =?utf-8?B?WFVKbFBBWjk4VTlmVmkzVU43UEtQTTk3ZWFYK0ZVbmVLRWxybVJyT01oSm42?=
 =?utf-8?B?dEc4MjBjV3l4WVZ0bzZ6cXVJS2llYUIwSjVNcG9PZHUxV3hGMXhnRXVoYk9q?=
 =?utf-8?B?WVBEa0F4NE9YZzgzVktNMTI5dk54bnYzdmp4NktoR20zbnVIaW9RY1BOaUdE?=
 =?utf-8?B?MUhSTytuczlpSEVnNGpDWlplcC8wNkswclJkSTJXZ1hnMU1aRnhKMTlGR2M1?=
 =?utf-8?B?VG5DK05WTUZxem5CRGY0Ujc1ZStlbzZUK3ZqNmdVekNCRjlBNmJrcXhKOTgr?=
 =?utf-8?B?dWFyRW1kQUVHQkdGV3dUcFprK09vYVlqOVdmVnJsKzFaRjBEMDlWZnVsM3pS?=
 =?utf-8?B?elAvbzhod2MwUGJXbTN0d0Yxam54cjAvNzlzZVp6dURRa2FGOTBVYys2aVR2?=
 =?utf-8?B?aG4zNmxveXpOckV2OEJ4emIrVXRORWdEN3VxOXYxNlUrN2ROU2hlOXgwZGll?=
 =?utf-8?B?MGpDdXNlUzdwZnZ0YjZDeTRrdWFNU1Y2L3Z4ajNhMkFKVUZvajF3UnpJYVUw?=
 =?utf-8?B?M0dNYkJTYWF5Q2dKYTdsUjdsRUpUZjhZMDRRaVpta0p3NTcreVhpRDM0ZVZO?=
 =?utf-8?B?WFBwRjZVaUpMOXp4Rk5vR3NBTmczaUkrdzl4UHNLWEwxNmpZbjRiN3NERXBU?=
 =?utf-8?B?MUlvM1FUMEZ3YVNGUnVuMXpwUTV2K1U4S0JzSDdNV3ZlRW44NysvMU1xNnVD?=
 =?utf-8?B?QTdVSTRPaWdIaDM0OG5hVEVqS2h1djI4Zmh5RDNkeTJQN2wzYWlOeVpwczg0?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h4Ml/fDeIW1Q9rqsw9PTwQTyTqDGOBoIK98IUvmXjxCzHOUt9AfL6lV9Tha1ERLyrR9fKo4G+Te53CZZOx+rdOKxfou8stU67NkTfwlKsjUhY4VeUP/JR4PdaVOtBcRWc2C9Ui7DSiBbpukYv0zDwU0WKxl8TKscI9f1nnhLeblprbKqgtHb1QSPhiKp7wdi8rsLR/FIIsXuQGnTkHxBhZwVEePBGD4ddaW6nsr60GcqtamQXZ2PUfhBadJ4ycobP/hmfNuaN4/18KUBx4769cpdmMqVtYdmjRMFU1jRYWSHVrUiA40DJqfyqki6ogcWE+2KXaJ9qMwGgSaIOqRDeQzFNi74t4i6F7tIqG4qaQqRBsvkdUY6+dywjr/E0Egfkq7HOqUEUD08iwt64dsRUTX0ur/NMlM43KHUYlzt6sRFrSup0LckWkC6mqiMBsVRhnNDXJ6NFJPEih8jL0y1fE0SWRMPTXgl3Cbo3Ej8HzVdKsENoFw3incMnHCxCEVf+71Yh9pHNo5f6e9IS/kzaPtwxf3+qKJDjkXwjTD5KOzTk+yNVgT5fCwb1vUsgOpeeAQ14sG1D3BijWVLO+a8GOYOaF4nOubeqztGvpRggA0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08341b2-5c94-407c-9224-08dde7de6165
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 16:00:46.2289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWlVRnzltu+6TycH06mJeT+AfG91QDUfDKaWyEASU3hDLD0g8FTPfTloCADrmkwHqMWrSPNYwU/+Vnf2JDICqPz7goTtUZGihrIKSB1lsM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6695
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508300168
X-Proofpoint-GUID: y0YoeHx4SAYioK4z3JkUANUJ4w6jYvGC
X-Authority-Analysis: v=2.4 cv=I7xlRMgg c=1 sm=1 tr=0 ts=68b32035 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=P1BnusSwAAAA:8 a=C_W_QPSIYZLHRb-ZVgoA:9 a=QEXdDO2ut3YA:10 a=64ATBCkVx2cA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX72tBwISkfQ15
 457bn0SE7L4QI202YE96yOgJl+SWMAHjdNQ6aDMVW1e7RVdHclWyCl1SBL8On5HXYzrqWSR0YAT
 K48g1N/VylNz1I4sHFxvVPTnoc3o8tbfjLO83sMKbmWXPFZoA5x6SbNgDxGhekBScRlwNKzJUK+
 75adumjbqsSPP1lsOLUvXQaBopqYepxaKtP653xRpKqz3Q0xyNT4b0+ORQ+OnTIECHOTxdwyjkD
 V032K2A6mjrr/MKEpdu0d7Q01NwTUJn0IIVwysZ7zlReR/iSXOiFa5znKEGvaLKhgT9pN67kn3h
 pfWmXcYFbV/EweBNLXctY2MSFWNKiqrdLw8YnZkGIAlHu9ysgDjPZwxhs7ZyHim48r1tceDd57T
 zoRm6wZv
X-Proofpoint-ORIG-GUID: y0YoeHx4SAYioK4z3JkUANUJ4w6jYvGC


(Added linux-doc and some more people to Cc)

On 30/08/2025 15:37, Jonathan Corbet wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
>> Hi Jon,
>>
>> On Fri, Aug 22, 2025 at 04:55:51PM -0600, Jonathan Corbet wrote:
>>> The last year has seen a massive amount of work in our documentation
>>> build infrastructure and continuous improvement in the docs themselves.
>>> This session will provide a brief update of what has happened recently,
>>> followed by discussion on what we want to do next.  How would we like
>>> our documentation to evolve in the next year or three?
>>
>> One area that I think could be improved is making documentation more
>> accessible, in particular to newcomers. We have a really impressive (and
>> ever increasing) amount of documentation that has mostly grown in an
>> organic fashion. As a consequence, many answers can be found when one
>> knows what they're searching for, but reading documentation is painful
>> for newcomers. It doesn't flow naturally, and lots of concepts are used
>> before being introduced much later (or in entirely different locations).
> 
> Trust me, I get it.  That's why I have pushed so hard to try to organize
> the docs with the intended reader in mind.  I think that has worked out
> well but, so far, the main effect has been to take a massive unorganized
> pile of stuff and arrange it into several pile of stuff, hopefully with
> slightly better organization.

+100 for continuing to organize the docs with the intended reader in mind.

If I may refer to my old email from the corresponding 2023 tech topic
thread, which also discusses the structure somewhat:

https://lore.kernel.org/all/e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com/

"""
On the topic of the overall structure of the documentation: [4]
describes the idea that the kernel documentation is set of "books" --
user and admin guide, core API, drivers API, userspace API. I think this
needs to be emphasized more, as that _is_ the (philosophy of the)
current high-level organization of the documentation and it feels a bit
hidden where it currently is; maybe it should be placed prominently at
the top of that file and called "Organization and philosophy" or
something. At least I was very confused when I came across a passage
that read something like "This book covers ..." and I had no idea why a
kernel document was talking about books.

[4] 
https://docs.kernel.org/doc-guide/contributing.html#documentation-coherency
"""

> Occasionally I make an attempt to attack one of the top-level books and
> create a bit more order there.  But my teaspoon is going to take a while
> to drain that ocean.

I took a very small stab at organizing stuff in the right places last year:

https://lore.kernel.org/all/20240104160946.3450743-1-vegard.nossum@oracle.com/

I probably should have spun a v2 and pushed harder to get things done
but it might be worth taking a step back and try to analyze what
happened in this thread. As a submitter, it's hard to know how long to
wait for comments from others before sending a v2, it's not clear
whether people's comments are meant as improvement suggestions, if they
consider them blockers... should the maintainer be chiming in? Etc.

In general, it might be worth merging docs patches more aggressively and
requesting incremental fixups for non-critical things (it's not like
docs patches will ever result in unbootable kernels or corrupted
filesystems). This way we keep the flow going and don't get contributors
stuck on waiting, rebasing, resolving any conflicts that might appear in
the interim, and resubmitting... for what might be relatively minor issues.

At least I have a tendency to simply drop it and move on if my patches
meet resistance (and perhaps especially if the patches are relatively
inconsequential). I admit that this is largely my own fault, but I'm
guessing I'm not the only one either.

Another example that I don't think ever got merged (even with an ack
from Randy?), though admittedly that was RFC:

https://lore.kernel.org/all/e398ebb1-1d42-49ff-b355-b4bc3258fc10@oracle.com/#t

Looking at my local branches, I have a bunch of restructuring patches
that never even got sent out because the first parts were stuck in
limbo. Again, probably mostly my fault, but what do I do differently?

>> While some documents are clearly meant to be reference material, other
>> target developers who are not familiar with the topic being described.
>> They would benefit from being written in linear, story-telling way. I
>> don't know how to best achieve that though: developers writing any kind
>> of documentation in the first place is already an achievement, and
>> writing the documentation while putting yourself in the shoes of someone
>> not familiar with the topic is not an easy task.
> 
> It is common to divide technical documentation into four broad
> categories: tutorials (for learning), howtos (getting tasks done),
> explanation (understanding what's going on), and reference.  Each is
> aimed at a different audience.
> 
> Most of what we have is reference.  There's an occasional howto, and
> some explanation in spots.  We don't have much in the way of tutorials.
> 
> It would be nice to (1) recognize those categories in the organization
> of our documentation, and (2) fill them out somewhat.  But, as you note,
> getting people to do that is hard.  Doing it properly requires somebody
> whose job is to create that sort of material...and, as I've harped on
> for years:
> 
> 	Despite the fact that there are large number of people paid to
> 	work on the kernel, there is not a single person whose job is to
> 	work on kernel documentation.
> 
> Last year we tried an experiment with a bit of funding from the LF to
> create a bit of paid documentation; for a number of reasons, that
> experiment did not work out.  But it seems there should be a way to make
> some forward progress on this front.

I don't know if this has been suggested before, we seem to have a number
of people who are interested in documentation in its own right and I was
wondering if we could do more for community building around it: monthly
zoom call (which some other subsystems/interest groups do), IRC/Matrix/
Discord channel, a roadmap for docs (KernelNewbies project?).

(Speaking of which, why isn't linux-doc@ Cc'ed on this thread?)

I would personally be very happy to see a slightly less formal place
off-list to throw out some patches for quick feedback before submitting
them on the list so that I don't spend hours on something that's going
be met with either a wall of silence and zero enthusiasm or what I would
call mildly discouraging comments. Perhaps it sounds a bit hypocritical,
after all I have barely reviewed or acked any docs patches myself, but I
think it actually goes both ways: I was really happy to see the
kerneldoc perl-to-Python conversion (and the subsequent cleanups) but I
didn't have the time to look at it in detail at the time and chiming in
just to say "I like this" felt like I would just be adding noise.

Returning to the topic of getting people to do stuff, I think Jani (or
somebody, I forget who/where/when) suggested using the 'todo' Sphinx
plugin at some point, it basically lets you add todo:: nodes in .rst
(which can be rendered or hidden), which might be a good way to track
stuff that still needs to be done in docs land without having to do it
all at once -- and maybe draw in some contributions from others who come
across them?

Anyway, I don't mean to complain too much. Lots of great progress has
been made. Thanks Jon, Mauro, Randy, Bagas, and others -- good work!


Vegard

