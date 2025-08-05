Return-Path: <ksummit+bounces-2073-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24811B1BAC8
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43E4216543D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695FC1CEACB;
	Tue,  5 Aug 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G6O/oBwi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SBzewTE6"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD11C861A
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421323; cv=fail; b=MuAikoOMMWh8aCRwOg1R3ScBtwKH7H/q0HKhSrGiv1LTjXtOadzXckWx6my7fMcqo/d4dvILQvAy9XLDlJ2quuZtCxz8FqzdMCaB3JfxrOVea2t7O2BFrSgVXCNZGIIinMGtdsZzIxxlj7W0n7fjgX+zBRRSCXin90tf4JzP5Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421323; c=relaxed/simple;
	bh=45fYYztte8cNPul4ohXSULJE/JDcnUyt5oNljXLvapE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GHJw4cLaZoOQneMwyU5uIKP9hz38x56r36iFVqH2cClqoOTY5yU2QPjfW9Bnpl4SBXvQ7iGTiI8RAUY4cXjQqwiuULEBEN28MBGmCmPlO+sypZ8Q/GvpmzsXFwEc74CIn+CwwtKIRj07UwAIPelTO9JDFoRQzxhitZdPO3FU0Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G6O/oBwi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SBzewTE6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575Iu8wV021948;
	Tue, 5 Aug 2025 19:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9vvIc2PFxvQOJ+WdJJ
	1m2HnC4Rpvp0+qUdbwEg6cicE=; b=G6O/oBwiO6N/z3QWgVchRi4S3Vrwi4XB4L
	YO05lDLBI+50oIULNskkkIzk+dybWiAa9S+lwlPVXV8Uh4omcQciKVF/eiA/aKGd
	PwIMvcpZqhMq9A7RhzIMi4qsjeimb/DEESkyBJCu3QR9gAlsnKmC0Lo3bgEyyqzh
	e09Ryh3HgoKU/iCr/mpJwB8vytZtQbhel3Y2YMh390V0UOlqIIq3leXKYKzvGdb4
	R3G61LRZV/x2UgUsxMVXC3IxZFPXPsOazVOvvPRyQAbaFMdFJ7UGbFMd45wLbRtZ
	ShH36kniTojYOFXsIe4kBHlMz1jqW9+Ijw5VTsfK2SjqlmvRGPpg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd04cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 19:15:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4H5n033787;
	Tue, 5 Aug 2025 19:15:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwpjqbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 19:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ8xz5KKxNY5zNB2dpd/DfqBMLBwgCOyGocSdk/L9qkAj90arL6EqOGV0sU46IJ7hCTPp58fKn1dbFfhJrPw1CZ1iswFYnlbNdO1G35a4fGMUC0777z2PvBsE+fizBHPAx7lm+AX5cMIJeQrym62az1aX2FuGqbAwM5yIS0Tf0Zb0rrYL/VSEk4usEXE7s5iq6oFoTZ8ZW8Sk7crHknxwLRXfu/9YUYv2CIYbIGABA9t7bKV35sQDhM7vOO5sSXZ7am2vtQuBZ4du2j7XetwtNf+louZvyAnNjQ41H760DuHYuPCCfV++ICmLlBWp98hj0ldV1qElh3ohE+guBLPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vvIc2PFxvQOJ+WdJJ1m2HnC4Rpvp0+qUdbwEg6cicE=;
 b=TZ8AlublpRbY95j9IbhW4R8LQdpkS30Z7mYgoUiv1Qd8flp1wekG7iH0p+kU9MUCRLXpLkIVhUJTElChCPpaqkIJbyeyOXDmLDi7xZ2YKS3/r35RDFkI9An7D8GnfT3k/eAdIo0UsaVWTyhQa//vNchgu/7zSfCXth3tDFYbiBy1aFR1fVoqLrkIRXu1md00XmCsSfN8VlLqo/ZA/998+AWSNzo98tpkJCt31azDYRrCjZvmgBb/IqC5JbSXJVAysVFwLqkdgKY6rbdd7APV0Yt+t5t//2lPvkwMhCtpYGYsJfFjV7EOU+ylzjX/4Nqsp4JBqv05TpOEuLqkZ4WLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vvIc2PFxvQOJ+WdJJ1m2HnC4Rpvp0+qUdbwEg6cicE=;
 b=SBzewTE6VcOtUrQZYmcwmwiepAKpTKGAk43EKGI7Mooja+EkirbyAl/yMKb1Y212/uluzOlearHTMRN1Tw4+H0mEml5oBNKVI06kZ8IW3m8xnhWhpp3hci1qCAu/m7gJjYzEbDRj7BuZdNo8jvtfJeHuzwVE0QH5fxFl7PMXDME=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6320.namprd10.prod.outlook.com (2603:10b6:806:253::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 19:15:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 19:15:14 +0000
Date: Tue, 5 Aug 2025 20:15:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJJP2BM658FYJdJv@lappy>
X-ClientProxiedBy: AM0PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::43) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9639cc-4e20-4172-958d-08ddd4546830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+F44WsFAF7ywtdlJO2o9A1UTccTllYIw/Z3COTSSAZjbUVai/MYcpp4yaZv?=
 =?us-ascii?Q?+KVqAxaynsAkeiKla22bYwGIC1LyxQxVa2dulz3STBZEGHes8zf/fzYk7cGq?=
 =?us-ascii?Q?8BfagwDzhqxe64at6jzLcciDR6uMgbfdbK68IABFyZhizQ+PyjJMJ9SsI+U/?=
 =?us-ascii?Q?5o8Or1FKpe7mPX60xqwnZwH/2YRYG5PbdWAUfYsHl9fIb+rEW9zNuQcHRc9r?=
 =?us-ascii?Q?3vH7C7pPxh4zuQpudLELpRMScCH5xQXhcKzJ9h40ej5AFOahdKbCdvJp1EOG?=
 =?us-ascii?Q?Dft0rft5DPPxA3V9aulGSMGOAxUyHK26jRPkf3MW40SfD6qVWelc2hAwhtt/?=
 =?us-ascii?Q?ft1GT32KZ+MPkVNsglvNXLeAxdnU8p+DYh251H7DUXWf89OFpq2AewFeYWSl?=
 =?us-ascii?Q?r+MjGOGdAazSEjfYDXE0x7CN6wJyYwrD65Ea6LqjE9Y41g7stCyomi3u3rl6?=
 =?us-ascii?Q?XXJXPmuXGQnvY6X6J/wDT54JJOz8UdlSYaW0NZHgKYtETq4+rvFfC9ew0pK8?=
 =?us-ascii?Q?z3Ibf1w1L3l66NBrbPxS6uyIH56v4Wa7G2J0fqdPmVmSufvWUATzCOAiDb/6?=
 =?us-ascii?Q?WEJl/D3cp19mzIp+otPekeV2opvzaqrGqe0IrFi14xqa/dK2xbzjgrUH5xXm?=
 =?us-ascii?Q?9HUq3ZJrj3U1YhyMPEYOqrjQujvQi+o4zFIdeJunIju0hBPYqiR+d9voAqdy?=
 =?us-ascii?Q?HqJEbXB/nMAtltnlktS+FYq+iFh13mPttTeJD06SI/G0ZJL3987gTqZul6X0?=
 =?us-ascii?Q?U2qPvh6sQ4gfQKWYrczY1Sjany2innX+dH2im1ADxkInufceELuOJDNPpq4y?=
 =?us-ascii?Q?IcxesJ4dl9b9S39p9DcdeLrKe3h7mk0bWWTn3IQN2EnEhwZIzeYiJ0Hyzmra?=
 =?us-ascii?Q?IyhLAa3XfsZXwgcv2/h/VfiMAGymKFjhrwptyNtrczBdPYnW7GsH/WK6Cl2x?=
 =?us-ascii?Q?VsP4/tcagnmgvY3qULq4buho7vwyo6pBY9PUWMgTa7of4eICCbcHEV769ICX?=
 =?us-ascii?Q?P1rUVqwzfOO7dcsgn3gJZkMfB/jJUqRbmZkAm6gzuJ2ZEwTcXJPzF3M/ey+7?=
 =?us-ascii?Q?QGYDVCPDXXUYzgbbnthS1tMB+y6Dbm5j7iF9XXdEIESWuDToBSwexbtOK7Na?=
 =?us-ascii?Q?Wq7jFeQIaXqT6f8VEoyM1lcdD5eX9V+DFPO4+AQD/oxEOY1+Ans1QAPe1foI?=
 =?us-ascii?Q?OsZvNYfMlH5oZiodOY1KFa5+R5MSxrCL3nd3ZExoZRSO0DzVlD/w2iPkjfwL?=
 =?us-ascii?Q?cdNmW7ZU/b5Ki2eArskQexPhohY+9oRfoxNHpq0706pPJHJ5DAAUn/rsKVtq?=
 =?us-ascii?Q?ck1Sx8LzObq5S4vyKj+H/kpriq+lCgnuN3IcIlLOSEQ2WTbYX5GMyylkFa7q?=
 =?us-ascii?Q?7EI2aHk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+47p95JTD/yAjO8NcUkc+OyTGMtnR+ftyc0ZlEkXqT9ZqiJD0dOlXODRSSbS?=
 =?us-ascii?Q?yQqCrjBahuoc1D9k2Ymw4w16zudhPjq7ba56fdZPfZi+7Di/0uRUzZgcDKyt?=
 =?us-ascii?Q?t9n1/o6Pk+BnnoS+Nksx4V55+agLkOoLWlo0i3qWiuKpjLykJjmXoq0TsrKn?=
 =?us-ascii?Q?pTmeHNv4ptM1f7t/doL0W3TU/WJB4cJh8LhfGzXxz9KD4y32IvpTiZ+k6y2V?=
 =?us-ascii?Q?WgxO8YlYiR+O9eZomiNylxV3sXzuJUqijUyxXvgvJCE71fqWnyilGJIwM+OV?=
 =?us-ascii?Q?WBlm7Y6ds3SD8Lyqq55KvsQpOD/E2Zi1lSIbqf6K7GEP0VcWDpNyCA7/ncrT?=
 =?us-ascii?Q?mHRwtQM4c6iZ27/eLNAnkGx1cNzlNEl38A+DqQMtpjT3D+MZqqJ51+YAsU1B?=
 =?us-ascii?Q?I3ofw7J9/5cY8euexI3aB2RDYhWdsd0OmpChOhOBIoiPYgh7NPJNpJMbTbPQ?=
 =?us-ascii?Q?iTCjOTMqqrQR7ECNi7aHmtNdwtsX6LaFNmi3B6H1DLD84NTaPWQQbvagD/3r?=
 =?us-ascii?Q?XZ/0P3ZojRkXtSi57IWpuiydgQZsOHf73wB6b7fVJ29eY2dPRgIhb8aLxylV?=
 =?us-ascii?Q?BQcQXDqmmyWhsBAJylYnbdHuxnS9lr0foCl3bZCBedUzEGw2+B0zJtytAlKz?=
 =?us-ascii?Q?z78uKY1GEWrbjAoaj+ncR/bX3I6k4vIgaFyn1zvW4vpxJ5i426O8hBUlLNW9?=
 =?us-ascii?Q?LJZOsfT4FONWzT4CqMJ+XvJKSbnCFC9KAEsGnG8cmo7S5V/XjvqK2WWPcqJZ?=
 =?us-ascii?Q?nJUCawVW09OZFLuHJur4IKpuTx1pjzDm6FgPngLRcxwro0+9j7faX9n+cGBS?=
 =?us-ascii?Q?y+yVuiO/6ZrQ67DwFuD0xHP2XJpPDPZr26Y6MUqOEyOWgc/QASiygBcaSa+t?=
 =?us-ascii?Q?/2kHZHRbN8peXL+k5HNZmDWXpwqtpZcdClsIKspSyj/24nEKEypCy1lxtnLv?=
 =?us-ascii?Q?OAe91useu7LHgZhjmdbK/0FoTgdufEQPSlWEHxdVcj+8QLIzChmV1hxY/Wyi?=
 =?us-ascii?Q?24SqFroWrdcL8d/LZ4la7XY4bBGvVz5dDdoRmumM7jFNSVGNrre/laxPOUB7?=
 =?us-ascii?Q?P496ttoQbEMMXiGDFOHACSSNXMCJQFC905WsavkPee1m/WwDaKodgdiBL0fH?=
 =?us-ascii?Q?1hkW5pyN3bXoG0aJeItJFXLkyXpuieYFV3zsfsAzV0s2LloVrTkqvLgSFxCd?=
 =?us-ascii?Q?EesAB7vyELF2DLQYHmdxBPHs5v7k71fiapIO2E3OzLEjNBv55qn2WynnHFlI?=
 =?us-ascii?Q?c8oXre9BpyGlJ+aXFcL7QM81AHe2SWJwY8/8S9bXWZBdklcdwlTRgKQM2LqP?=
 =?us-ascii?Q?r2iNa4VGNhLxztoqNpdQGo0RUshxJddLEwyeiypc+u/WmWgR8UAAZqQ5/ciO?=
 =?us-ascii?Q?UumPjkZaQxdecLkE7VIgs0g8oHAwP7035S7g5qJ/W3InoU12NVVTaGesJ+Kl?=
 =?us-ascii?Q?G9QRt/JzrPQ446u0RbeV+gSbFaelbtdckKetLtHaCQcP2Fzk3F8QByfaLghS?=
 =?us-ascii?Q?QFv85QLoPDt2EjYR2jS8PRo1T0nS9MhG9vob5J5fz/vHV3Gjy5s0ylwc15KW?=
 =?us-ascii?Q?TpFJdyC2eeucP0LHEv5Vh1x8Kdxx46/2Aj5Ny+D7fBDbKNtQm+VvOazzElN/?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BmGqVrfoK5noGxbex8XJKQPwJ49PCI7EnxkqUKLPJecqre4Pl6aM9hqut1WVQoNRygMRzGrYOM5s6Ts1QUS+NTypSbjfCzjfx6ogixWT3X5nZ8Q8RzQKnrjJuJwjQd0h6Ou6Ymf3ZPukqKwaUh9UAs9yhYnxUIcxkn02hwFwOgOl/ygjQRjVf97BFsK8+67kNYi5yNMyyMb6DM4P/4ogQMDivJQvVD0HZqxDzH0hx+ZECYOf5r9PffR9S2d8LwZdXZ8saXonT3j+PUTC2PD22OsYfYgzZQwXW3x6qEjX2R4qYhjl/JLFD47ZoeeQUOSvcceCEKPS5SNXkinOdFP89l49w22CnOgrhxckvHMTtqPEs0WVeJ7hbcLLWvu9PMU4ub4WrFRgdhBjOm8zeHPRebycwYeO4lpPsVinh2WcAohsnaDkQMVBzwTH7KLSiKeudcoweZkZxf7/RL2Pe7xHvWjik21GasONuuaoMlxYibhu+qDvcWHIFFIowIxNmRXUMJOU0DS0wACciEU3mVg0OGCjpCJLnoTDVpU8WYlvlEF4mNpEviVPzcbML0DLtM20ePLALty9AtjkDMU2cdGGbS9lSnr921ML4nAJc2/kRKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9639cc-4e20-4172-958d-08ddd4546830
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:15:14.8364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71yX9d/J53qCqw+LI97d6QL6iWEWaARWOUrrhS4qNVxqJyRPMAR7A27cNxdCDMyk7ddOtB/ZCwmwQP+2aYoqelbNRJ8bQRRCpzZK70OzoYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6320
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050135
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=68925845 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=dQENeJEMAAAA:8
 a=JpD5qQkXxE1Wv_hHpXsA:9 a=CjuIK1q_8ugA:10 a=zosCLfkllANJ8uAOTg2h:22 cc=ntf
 awl=host:13596
X-Proofpoint-ORIG-GUID: kDR8mdW1hWekJ_dFvdNhjanrwgrUsnnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzNSBTYWx0ZWRfXz1zUYPITqUjn
 r/KUIJSIbyBZfckInaNwtE/jgChDhb3IdSShGL36oIOuYe74gZiPH2eTOHizvbyQ/L0A7782HLa
 fi+RJdpfuWSjQqyyekrZd8qSQy7MOYpdjDBX+D5jTzLNfazNjWrsyMSiXMighlT/6E1VDeoYgRL
 DqvExZFkTyPTinIaZosmm/HCJsG+a3WMLcIk0HwEomWI9J4y/jkjXq1aLlTkzjM8LcOU6AqBHgz
 JHQ9XbWDWuxyt47/f5RVZzL4u3LWKdVzjKynJXKow5Dm6BVmiij0tmHDOsPbv+AEiPPOJZb4RPq
 MEr67XO26qv2wKPJuwMjGgQ3Zjkf7m2B/vaDtODqoYHjmVam6M6bCuInE9jijAGvDf6En7SsZLV
 B2aLHueFuYsMrUxxroftjJr1ND1vck8skEHxmormnooSPO4dAZlDBQWV4Sa6748BGRp6hGVp
X-Proofpoint-GUID: kDR8mdW1hWekJ_dFvdNhjanrwgrUsnnU

On Tue, Aug 05, 2025 at 02:39:20PM -0400, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 06:55:29PM +0100, Lorenzo Stoakes wrote:
> > On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> > > I think that's really overlooking the fact that if properly trained (a
> > > somewhat big *if* depending on the model) AI should be very good at
> > > writing safe code in unsafe languages.  However it takes C specific
> >
> > I fundamentally disagree.
> >
> > The consequences of even extremely small mistakes can be very serious in C,
> > as the language does little to nothing for you.
> >
> > No matter how much data it absorbs it cannot span the entire space of all
> > possible programs or even anywhere close.
>
> Neither can a human :)
>
> I think that this is where we see things differently: I don't think that
> AI needs to be perfect, I just want it to be at the same lever (or
> better) than a human.

Not at all, none of my objections are about perfection. I use LLMs myself,
in appropriate circumstances where the expected failings are not
problematic.

My objections are to do with the the kinds of errors one can encounter with
statistical inference like this.

Humans do not confidently hallucinate in the absence of concrete data,
rather we infer and model. This is dynamics vs. statistics (I genuinely
recommend the article I linked to James, it's a fascinating insight - [0]).

It's the _nature_ of these errors that I am concerned about in conjunction
with unsafe development tooling and highly consequential results of even
subtle errors that makes the kernel especially problematic in my view.

>
> Humans aren't great at writing C code. There's a reason we're looking at
> using Rust for the kernel, and there's a reason that LTS trees exist -
> they're living evidence of just how many mistakes humans make.

Humans make human-like errors. and not at industrial scale :)

>
> Look at the contents of LTS trees or the CVEs that get assigned: most of
> them are fairly simple memory safety issues, off-by-one, use-after-free,
> etc...

Absolutely.

>
> I don't think we should expect a bar for AI that is higher than the one
> we set for humans.

I'm not, rather I'm saying let's be aware of the kinds of issues we might
encounter from LLMs and take them into account when establishing policy.

>
> --
> Thanks,
> Sasha

Regardless of where we feel the issues may/may not be, I think we can
certainly agree that we ought to have policy on how we approach
LLM-generated content, and determine broadly what maintainers want to do
with it.

Which I think is the _key_ point of the proposal more than anything! :)

Cheers, Lorenzo

[0]:https://blog.piekniewski.info/2016/11/01/statistics-and-dynamics/

