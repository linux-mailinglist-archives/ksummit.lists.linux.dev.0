Return-Path: <ksummit+bounces-1254-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE390779F
	for <lists@lfdr.de>; Thu, 13 Jun 2024 17:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B1528928D
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF112E1CA;
	Thu, 13 Jun 2024 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H0t2Sbdg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZLtiZ6Na"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156681426F
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718294223; cv=fail; b=Opw7WCmk7J+Xj9ykYdzlYGA/PDo+0GoygDoq97yfpKvpMi8y6lHEMt/YZJX+GBNPU4JNJCj1nGCto9e7NGDQY5CvibCx8K4/4/de1niKTQkiTZAX4t+bn3vQleqH6A/eJK/emmP5Az203h3wIwOkarrqnu5AZrFh77jpfNdHcYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718294223; c=relaxed/simple;
	bh=G/M4pKgmt6PQEy5DsFlnf8kVtivbKe7s2MNGfwpenic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Er9xj4EpTJPVywg7ogYJTv12GgCmvyXQQwvfIzR8KFZtOAtOsLt2/3Od0aEHI4tZITyFrGG49DTE8uYfu1maHpkudIaKhRKyyIejCpOc0+X9894Enbb4GswJbO6fPvpy1gr/tYlG1LxM3N/EfbGEkvtihuvKXwILQ77gdSTadR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H0t2Sbdg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZLtiZ6Na; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DEtRRI004367;
	Thu, 13 Jun 2024 15:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=ztLu9SjiFlIYnbC
	a7+6OcM6HwQ9pM4odDFojsS5j+LM=; b=H0t2Sbdg8jJkTNFV3MADA9sh5moR18I
	lHAz1N8o2qIQhSf9C+hnePSoPik2LcPfVBYX6qbmuBjzxUZM2x6xb5UcrEyLRbZl
	vpsD3Jdy0WDjklm7yUDo/KE5cCAGTkOyMgOMb3+WSSmRzOi5vDhpWc0O6GPeHbYF
	Y8kj+Uy/b2tQSCRyDZlSillfrjkH3y3HMzu42C/1PZWczS2v1drtay9RGN3fhhFp
	7Wa44cwi7LefpDOkJOpKy1P9Ku/ZVbp3j6571GtPX0NPrusbcEgO7xxwTgWdBLe6
	QvqPl5iTcTWtqBmZCbjqDI67Pn3n8p1PJWMa7xNZ68vpUWrvPpttHqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh199uym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2024 15:56:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45DFTiAZ020099;
	Thu, 13 Jun 2024 15:56:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync91bw7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2024 15:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbyRya8G3hM9P7qh606YRT2shwH8GBMBuemuu/m1d2TAKSkNi95jjBe2DQ8z/P/UMV8g5cIefokhay98jn0iywchZg3VcCOu/NPRSL5l8NlvcTbl+ZfRRUZrtkK7Z7jocyCcNvgmtgrGSaWQs3ZzhMBUt/snWIOCmySc5U94mjKaF5buikTLNMP953acdgZpB7hRkvc692yuHiMenNuqGilXzXHt45qA5Hr71ieoR7Y/i6C9CRTjDvBp8OMsBtn30ei7bFbtSqGAe+laCKIqXEy3Bw1pZm/3od1g6KiswSd7zgyKcByCpSOd7EZamkRa0b1wjxI3/Vltl3jNuIcUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztLu9SjiFlIYnbCa7+6OcM6HwQ9pM4odDFojsS5j+LM=;
 b=lhU60tVD2GNI3fiV/9iKqHDamNLw4CLUfvqG8GUpemXLdJbGSIVr+vz/RxCFdHxwPx5Fmx55TsoBT7VfFNX67XQ9XWi7iQgYvRCWETnG5dqg1Cw3u2tu3YLNITSl78Kz/j8nRaEaLK9lwTDzovltOnU7c2iG097p6bON87xBgnH6dvhuZFybbieURvbqml+rkVCyv10E0tjCqxNJSywE4qtPl3/zXbM0VTvYvmmxJGPGq2RO+PDUiL/E4T7xxl6JEW074J7I6O1tCawjrvksiC4uyfPf4qqYrLgWACdkNPqmPNg6GpKxKsYtDSHEygB4crN7akDjxVh0AhD3XD84Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztLu9SjiFlIYnbCa7+6OcM6HwQ9pM4odDFojsS5j+LM=;
 b=ZLtiZ6Nae2MCnT1xseQFcoWsUCdaSJ7wDKAvOVM89TO8PHv8mWDvsvy6PznDCCYnRoTDm9/UOrVCvNf6vDUJoSMZdN94WnLvc5UDiTMezqtTomQZ/5KbR8BDwBwoAzeLDKAE7CB5evId07GQlRywKQ0o2hrCg0QLYx+kFDfH/II=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 15:56:49 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 15:56:49 +0000
Date: Thu, 13 Jun 2024 11:56:47 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
Message-ID: <nl4ho4muhz7wwikqrnz44snyshveusvsadqbmcawsdayy56aiw@ri6un5ardftu>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613113455.GH6019@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20231103
X-ClientProxiedBy: YT4PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::23) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bb7b46-fc5d-44c4-42f6-08dc8bc16f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZsQJ6qDyFk/pajiT7Z9+jWUS0TDhvEeTA/FnDTpyr6yBB2cT8ptyW9UIwd5J?=
 =?us-ascii?Q?5Rgy2UHLuXnCk818V2BYhgm9W/iim/JkPKNMzD4STik5q0zzxKbG2Cq88XqS?=
 =?us-ascii?Q?74muAMFyl6G/i4ckUpp5+yw147Aa16ks+IouJn7KUbXEgcHiGeR0apP74PFI?=
 =?us-ascii?Q?zf2G2RObRkK4YZOfxa31neXHJKZdqfCg5PSidGTutr+nP+R5aVSrU1oQ1PBw?=
 =?us-ascii?Q?8wm9JM+Ls1pZRwCAPTfB+IXrDDwhjTqtoQt+P9OSccMqIW/E21d6n8aq5W10?=
 =?us-ascii?Q?Mg07K12+2rttUvmYQ6SJFsTQ2LuiCSotKCcktsQ49iZid0IEFYBCWqflAT7x?=
 =?us-ascii?Q?6yzoZUHteo1eLyLZYEugJKL+mEXEEBcUUe6qNs+aYI13M/7aDxRx+zANuVDr?=
 =?us-ascii?Q?RInSJ80O+M4FQWi371oucq8Q1UmhmfjSkbDxl1R2GexJppzo3to5uNk73gqb?=
 =?us-ascii?Q?c0taCjV3CBFDqp4C89N2fJATV4b4yPq9cNAPglCCVX/Qx2rkvN+sL24rY1+r?=
 =?us-ascii?Q?zVJNgDEs9hlzTKsKHjfRvoR4i+usD6FWaKzLOKUCrEJaKbSXmnfuF4xJzB6L?=
 =?us-ascii?Q?aXsMrs9+giqB7V6xxcdlOjUQ2PmCxcf/man6MnvtxAjnCgdUVFc9jCsLrt3m?=
 =?us-ascii?Q?ucuW4QfInL8k9UTPM2Om6TPfdlZms3/3VgMdoiyjs7MNZCtwn++k1/oE4A1X?=
 =?us-ascii?Q?I4IvBRJ2TCHJ5DK0aSxTyrWtsYM2Dk/SC1B/R1E8vNEiKQqKkckKS0VHtzx7?=
 =?us-ascii?Q?1XkMjv9JEDYT+4/fUzHMjKoklYvWbvz/+oyxNcKGdJF0+f4uFAVEIAXItJwI?=
 =?us-ascii?Q?Mu+WKqVOZoGOwNpX9ZkEHVfy39gjsy8rNJ2qOa1xKTfCy6EpwRPUPPipC3n+?=
 =?us-ascii?Q?OzW9lWP6zpU/yHLREv2OVPJOyeTTblJSTS6xskJx2gGSx+fPQXe39QIw5An1?=
 =?us-ascii?Q?w1eYguVNQh8wp7XFdjj/cyqP8uZnittRpTW8A2YQ/hMYvMVlUNZYiNyFm+/Y?=
 =?us-ascii?Q?DMtPccuBG+dqXUcPK/3NTu8R6EQRrNOmFxhWYphCxWFoltEx2jzjsrhhuJzL?=
 =?us-ascii?Q?eJXwPD3kARmV7SbWdGveWr9jbiYuH0Uz0YzAgHn28VPq6AhpU+SOpQNPTMtJ?=
 =?us-ascii?Q?4YvvMEUp+SdQsPSvjqwJTIfU5cfGLfLGKUNqip4pFRrxVE/K3oat53Q1OL4T?=
 =?us-ascii?Q?bGJp8qOQEHfSGKnk5u5YZhc7czT6zqkaN+HL8vhlaPwlna7+1s3BaUxLKC3P?=
 =?us-ascii?Q?PF0eJU5eGRtOgcx6Zaq2HM8rzokG3LKgN5ppI3PTcUkrugYVxE67PLmqneCM?=
 =?us-ascii?Q?7rOGs4eYb7RFZdnb2iV4FgbD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9X3EMwmnAIKXm0Ry3OGy0v190rfErOhri+c6BfJ2NkuJnuzjKlB9Eh4NBJun?=
 =?us-ascii?Q?lA2RF8NVtpdrA+mQPl22mJVBDcnti2RppZ+UZlnZSSEZVaX3ZZeoegrwv2pC?=
 =?us-ascii?Q?b6bF+jfwHLbHAPWR3ySOUbF/vULaxoNFiH4QpJikRFma8tvbtaircs5Wxq+L?=
 =?us-ascii?Q?T0VgbZZrWBg/pf5Cc9CQVgWKLyGgKvqMA6GRG55xpQzjC5ylC8BlWFchxlpI?=
 =?us-ascii?Q?L2Gka2R3fV6fHHJXRJzpeLTuMj7IZgVDzIsBUh3rb9SCI6hy0+5plYPrMg+a?=
 =?us-ascii?Q?VzEzlRS/Eu6hTTTOt06VuBPpztUUuT+EJwWD1kKo54KAJOtfNn8yquzO78Fp?=
 =?us-ascii?Q?xHG8RCU+k6zGISPvTFMCyh9uRooz5HH+tItMHAU5dXRejjhd2X8hM8zCzDg7?=
 =?us-ascii?Q?AZIJpPTUAv+pTaDP2O/WltebgTkHySrGC0bdSH0KWULUpUgCXvWgd9IjDm8r?=
 =?us-ascii?Q?CgJDpsYV2JaZywcs4HiSDuUugBPoIot6h8YuUwQwXjXsHc0Yj72ojsl2TtmW?=
 =?us-ascii?Q?GHoGBdue8k0GB1PLn+309PhFAk/qp0KFdSdiTIVhHIjeE4qqgsaWMHsneNtI?=
 =?us-ascii?Q?HyNfK9NKVzj0Xi1OLtGFtOEIGDZU6CV4lPhVZdh/iJcF7njvsHjaIOh1dmKz?=
 =?us-ascii?Q?7dNkOTtHwEIk81xLpyCqcqafBbrJAlBAuwHTxlotXk3FIt/Mg6WY8pRgGuo+?=
 =?us-ascii?Q?Sw+Tmd/M3kPlVmnzB3qSRG+ynNi17dSev2/J64+QuLS2lIQdkAQm0YWGsBKN?=
 =?us-ascii?Q?Daixt8H8uOZHX3HOJafvAlsNVGIuVBU/7aByNgOAYalUrNE+xIfFB2enoK9n?=
 =?us-ascii?Q?pm5THx+XlBfuSMZYv7p9brDB8YCUmwo0qMePDdjrQQt+B7oYYGymRKR1uvjU?=
 =?us-ascii?Q?kI8Pcm9p8r4gOD0AFyzpTn/Xt1DA9S8Cd1X6BGiAxxpPHt5oEECJTFVCPXDa?=
 =?us-ascii?Q?2wKoSIE3r0rMh8oCTwF4y4972261vRXKT9U7yGjJGR9Z6f9IJpvnytSqapxq?=
 =?us-ascii?Q?cMx8OfXbodux5/m81hYllHGG+YAmoudum/1K80NXdYKdokeB+cjK+Q39rZc8?=
 =?us-ascii?Q?DDRp+1sjTrXMAkiNl/Foc5AeQMtqEzsiD6x5exnRqBkfWhc8y+4bH+OviYqG?=
 =?us-ascii?Q?t2OXH7z3PoBUaHHcCqkLto7+80ut9bcs0MUxGv7o3zPykBZQnnJB5qaPxaip?=
 =?us-ascii?Q?JNFNnfZCicAIiGmnUj53u3drZaJdkbCbHiFhjHldpmZB8Nag4MjRXTkWhvZi?=
 =?us-ascii?Q?on8tqyGxHgrPp44mZZqgZq/C+SyHKaDbttJwMwzSxLoLQsRkpKISEeW3aiMq?=
 =?us-ascii?Q?ziMw8jiMmPpab3oVvPQomSj3QEDoKG3nc9N06VnDE2hnTvKBzFu4D06qHDSl?=
 =?us-ascii?Q?bJupBYhK2At1FgkTfwU4IyBVzOe+zwGdeyb4coRQAxiZfGzZ8Lg0xyWY7t2p?=
 =?us-ascii?Q?EC35BBEU/33Fz3Z+asywuowtdLb4wQiItwMwfvSNuZbfsdtu+K+QZ7CR67hu?=
 =?us-ascii?Q?x71OXhXfI/lrFeBBKcHz5kcJ0TEieGzUYqoJ7C0ltD0oUW2mVXiBwinv9fyJ?=
 =?us-ascii?Q?i5dnZwN3IxR5rXzoDy3aHZz1IRwS66Df0WyIz6or6CUgXG4/qn90Tx52igoC?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	esBxQ7JwJWQAfjpG/8J8wEou6dI7N+0ZKbKn2A0oxTUhXaiJ1DSMt64iDlb4KpJigRg3PyYRH+GhjJVsZx5+IzumaShwgEoqg3ttVV2FR6WSN4kTjm3a9+Lp25pqcJo4Pizt6xfEuYLm6SbPb3qC5YjmDFTmRXMRCd6wbUOHtGxBC4O/2muo94yoPjN2jczF2sELqKwA7SGGZN6p2FlTWUQ4/yI7cKmes51TTtcO7wuKwTox3HGEHBYXQUgMvVjm11r9+w6sOUbyBfvFcVMw6ycD8xIWV/FU7C1cNGpsq20biDcqdQ7c9xu6QAzS/YNJwdLuxs5efo1SXDtYFhFoxXkCRhUvfRx8WQpU+zHdxwOexS+hcMy+yG+wqtaXRVKD5KqbkPPn/fsEmHxCecYr51Rb7m+B4yb6KqI0z8QRnPf7wT7kCdqd7g34Yge3p6lLd6FZeCLXYBBxEjNcGq8K1the/3S1RFqvXTkdp4fvWzz+MN+DLvBwaRlUiPXcZWRbKhqyxB9JQRd0OQotLtxOXUQgEpSHTc3NZ5iiCx53o7OsE9czUNqKKkJlZ6xF3ug2UPr7cTAYA3/9ZCJh4aV3S/uOqWpXRSbs7KC6MhjrQsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bb7b46-fc5d-44c4-42f6-08dc8bc16f4d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 15:56:49.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skfOAAc9HxjReFDwCsyIFYOjCaxBx6xDrtW4wHU2CnKGxz37bJsRpGCnvW2DOXGlORZW16rPP6C1KvFH2CpcMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_09,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406130113
X-Proofpoint-GUID: 7MooiTO8FGSDNVVIvkIsNNE4VZZ00dqX
X-Proofpoint-ORIG-GUID: 7MooiTO8FGSDNVVIvkIsNNE4VZZ00dqX

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [240613 07:35]:
> Hi Thorsten,
> 
> On Thu, Jun 13, 2024 at 10:34:17AM +0200, Thorsten Leemhuis wrote:
> > I propose we elevate fixing of mainline regressions that made it to
> > releases deemed for end users by setting a target to ideally mainline a
> > fix (which might be a revert) within two weeks after the culprit was found.
> > 
> > That IMHO would lessen one of the big pain points for users regarding
> > regressions, as quite a few make it into proper release and then take
> > quite a while to resolve (as shown in the scenario in the mail at the
> > start of this thread). So much so that quite a few users afaics doubt
> > that we take our "no regression" rule seriously.
> > 
> > This is why I'd like to see such situations resolved even faster than
> > regression that happen just in development kernels. "Expectations and
> > best practices for fixing regressions" in
> > Documentation/process/handling-regressions.rst (see [1/4] in this
> > thread) kind of covers this already:
> > 
> > """Expedite fixing mainline regressions that recently made it into a
> > proper mainline, stable, or longterm release (either directly or via
> > backport). [...] Aim to mainline a fix by Sunday after the next, if the
> > culprit made it into a recent mainline, stable, or longterm release
> > (either directly or via backport); if the culprit became known early
> > during a week and is simple to resolve, try to mainline the fix within
> > the same week. [...]"""
> > 
> > I'd like to make the language somewhat stronger.
> > 
> > """Handle mainline regressions that recently made it into a proper
> > mainline, stable, or longterm release (either directly or via backport)
> > with an even higher priority and try to fix them as fast as possible.
> > [...] Aim hard to mainline a fix by Sunday after the next, if the
> 
> Are we really telling people, some of them contributing in their spare
> time, that they have to work during weekends ?
> 
> I don't think piling pressure will help. What could help is to reduce
> pressure on already overloaded maintainers, to give them more time to
> handle regressions. There have been multiple discussions about
> co-maintainance models over the past few years, and some subsystems are
> (slowly) moving forward. I would be more interested in participating in
> that effort. It otherwise feels like we would just add pressure on an
> already overloaded system, without caring that the system has no
> reasonable way to absorb that pressure.
> 
> > culprit made it into a recent mainline, stable, or longterm release
> > (either directly or via backport); try to mainline the fix within the
> > same week, if the regression apparently bothers quite a few users or if
> > the problem with the culprit became known on a Monday or Tuesday."""

Yes, this is the worst idea of all the really bad ideas in this set.

They are so bad that it seems like the point is to actively damage the
community.  Either people will leave, won't join, or it will stall
development in fears of retribution and/or punishment.

Regards,
Liam


