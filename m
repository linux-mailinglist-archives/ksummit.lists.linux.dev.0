Return-Path: <ksummit+bounces-2061-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7BB1B9D3
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03FA3172389
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9E32949E0;
	Tue,  5 Aug 2025 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EtGnEfDU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E0Wsu709"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3C131E49
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417219; cv=fail; b=tGa+TQWzhXcCcwtcTnFhFLO+A2peqfhzDOmbhzhyBg3ZEzoWRGCPV2sWGkmVFcrFQF2xer2G8KPrC3icPePWJMT/w3hXk+AatahBovE+5SUHouvgCmPbCQ4DZHkuVL1JyUcxFxhZ4tOmfXWGGh8tiwtjIn9e6/r0Uj0jP3p9FY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417219; c=relaxed/simple;
	bh=dEEZvbRX+8bfFrPmxlMIrxzimxPJUdNH8l8tJPV2Wu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jl4jKqypFwF4fWjiZwgz3STjvHTNu/QxPe8XJSfaCSDac75mgNV+Qb5Th8PmYz1a8Ess1tQmq1PBjYvLHESzWKD9PU8Nqy0Ndahz0mj5W7QHqcM39N5afet/NNi/5zmzOwrqTNh/D9ap7t5bewMN5YqNg8bc7aKZu5fc2T2t5Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EtGnEfDU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E0Wsu709; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2BjT002754;
	Tue, 5 Aug 2025 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PxlocmNDpMJLSWDCaP
	thtYENVhLnF5KVC7S2JGuwKZo=; b=EtGnEfDU2la4erT6XXzBdtqmkBc3y1nVv6
	aL68q9qPKglrTlamT5jli5cz3/P/bnHiehl3pcw4g/hRekiJxGKiWdCmEa0LQOog
	wQMZt6lE0HU43V+i/di3/P7D/BnIAqSFrRHaaqTrs634xSM0QVjUNVAgg0IVRqp4
	ihDVEhZu+R4fiYXvf62/t+/5Z9tsFS7J3NjxtfnWTPwnFvZ1F0nLTpo2raAftWiX
	Lu/QAr1rSRDlDhP+qqlDNFD7vwmC5aKCo/oTfImVXp+St7NqqucZA1bjNg/Fxqxa
	f3DmbaBssucji0b0jFjAfRK6nRW4TNqeiMOuW4cYbGdhjAa86v8w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgr074-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:06:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575Hc0N2022517;
	Tue, 5 Aug 2025 18:01:07 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48a7qe8e7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXRGoM8+DyaeUysiilzait14ZstBwwMINGviMr0NkCkZF7gsZ4j9v8rg2qscUGM51DOVucgQ7GF70P2S0n7iisSPw6nZORpAUZftvz4V0DxDiseprQhcC/K2PZg0lUl6fXn8t4wdm6F6CKK3+wg+7QvHJlFbPZ9JNNJizt2RbH559uPydHGBV+yckretCufuXzi95qk1eNWvHGTkCOUIpkvKcaoHTdQnqRlzRergLgplsq/tWh5fUyGwQ5/Ro6sK3KAA5VUszqS4VJ5QrrMQj86s30h00MFzCUIeeMaYsRnoilSH1CMDFGQcNXs9x9sKTFXeuJqkc18c51ar8S5hSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxlocmNDpMJLSWDCaPthtYENVhLnF5KVC7S2JGuwKZo=;
 b=eKoyzRV1ZC7RHl1SzvlAEKG1e+5N3JU0ae0/7SQwcXtFL6HDVCth5jr0AFXHPocGMco/sE2wlVo6XE7FM1VW5q0ueHLH5Vw/t0+I4nFIEhdTwjA/QGHouOeYLGyeKgZD/4nDGwbLIyn+IO0BvnRuWqhKsd466DN+GzMu4inFib8T4x0lhLMS76pOUVYyWiHRQ0duMQKrpdk5bh1LGTJGnbL6VXJmau5arm3Bmb9FKmVUrfqFCaviXlar9KA+6hbwv2lWYlVD7dK532e/7aGIzQw2X0lvD/sJpLADYtzOVExh9pFFA1D7Jqi9PX4FKaXMeQnXFdW4DwY4xsEFOy9PFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxlocmNDpMJLSWDCaPthtYENVhLnF5KVC7S2JGuwKZo=;
 b=E0Wsu709Lmjg5ceH4L1woU/XyIvW7fkYLpOMAtOQeNjvq94Xp7J/yxgfzH/vOjGKJ0tJH/y50Eri2QtvbIkrOgWgVE/QfFTpdLzIqbNDgLMKrY+RipVCoRgLjahpIot/JA1vWF5vozyg/G2O4hMEXlT5rtfa6Q9xPGQ31vfrS/s=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5119.namprd10.prod.outlook.com (2603:10b6:5:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:01:04 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:01:04 +0000
Date: Tue, 5 Aug 2025 19:01:01 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <1840b821-800e-48cb-a372-012359cf4ae1@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
X-ClientProxiedBy: AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::40) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7247b054-d364-4bb9-b716-08ddd44a0b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ecVFKyRKnRVG231y9n3z2pYAye/yt59FlDTS8fw5ERn2CTR11gaM6L0dDQ+?=
 =?us-ascii?Q?1u69Z1At2wQ+ve0bDc1+mu0aA34ZPzvP5sey22s98Msi62x95IpO94ljKKHr?=
 =?us-ascii?Q?6yc+euojzCGcNF6YywJkxu+y+nNBSFzFAwhvIo0elu4fYvYL4VqwXRutAeXW?=
 =?us-ascii?Q?DBjXAdaGtno48YvkFbFqJ88B9MgP8mixm3g5W0TbPQHT3bzvcPt8KDS75q94?=
 =?us-ascii?Q?3uuCJYbOTRUAmA1zj4GP6Xd91+Vw4+PrCdnsDD69YjKqu9j+w87/gO+JSSZn?=
 =?us-ascii?Q?vK0HYjafmgC/14z3b7vKLYG1WuBnKncjdVEgPm4II5jvDDBsjG3ADRUYVQEp?=
 =?us-ascii?Q?FCzgJZ+15fdRPlqQwzo2r2ekL+m23QGpi0M9KkmeuiodcWwRsxhbv2zvP2OX?=
 =?us-ascii?Q?/30OfJXC510g9TRJ1NiMIv48D/yKWQbx0OSY6BLQBK4AVW/0OrOQM7zDUu4H?=
 =?us-ascii?Q?1M2RS2FGOenATYZguz0Vi4Hez3WII42bH2bfKhpXQXF6WC72lEexhLQi06SC?=
 =?us-ascii?Q?/e6vi+m/E6/2XC5vrwZozERfsZaBT9W5F2Xz46tibP0c3/J020G/uThmcnib?=
 =?us-ascii?Q?RbBCMQPOuP2NvL+9WsdKyzi9aZgKePW0Jp+TXrFSK7c62ZEpwpzGg/wSeA1x?=
 =?us-ascii?Q?xJAtY6QmOwY22rIV0GdQ17aOMH/hinhexlTj9MgxZ+b7lTyV0LhuPTV+pinL?=
 =?us-ascii?Q?0LW3Q0zSRhLEXc9pmEaatY0EsJxQj3lDdKKg3FQd+qjFhtEPRYwyhFQguPPj?=
 =?us-ascii?Q?5L/bm6K49QAeEKD3oKHqWaB04Qzu4HzIuWb6YZOnKzTwzxQ8toC0oUlyOQRW?=
 =?us-ascii?Q?uhalKAOuaRPekmnsRV9DPB0snGsCPj/X1cVFPWs21Pgml/sTZXWyHvStLuPU?=
 =?us-ascii?Q?Q2r1BcEoGlbC9JqheEToa5y6xlFwPyc3soDEvaC5Nj68yDHnIomNzUIaMWJi?=
 =?us-ascii?Q?oomb8ZRH6NVW5HuECCTorbbAh1W7Fhb95jBMsY8kGIaCB5vaBjlBmepvZoNm?=
 =?us-ascii?Q?tyqtxF7H/ea7OqshvyzRx7N6lUwoaR1EUizaSpD6gJsdapA8DvwN8zpk6STu?=
 =?us-ascii?Q?c4cmE9aZ0VQ/9iEm/BlmCFYj10FFo+hZY87mg5H6dVXRxJ0IT7j/Dz/G5KjT?=
 =?us-ascii?Q?sevQn8hEuoYmRm8w2pu5xzyOsVNQlBWB3ahZx5Xq9mZccHbsdaaNKfzLl7T0?=
 =?us-ascii?Q?5K8xQhCKfHceEJ0U86IP5nmbSaQFoWtgycRdlXpw8+bDsWm8MNNb3SCegXQk?=
 =?us-ascii?Q?PRIXis+xJXUDHNjLsc5XfY436l3o3wxr+cmrKBWFk0Bh7MrfGdMrNLwFQ3kV?=
 =?us-ascii?Q?JAVlPcqxETJX5dDIHJ5RNVdhCpbuXeX05UdqNobgazDBD4iT39qcOl1ABrxF?=
 =?us-ascii?Q?pb6Zvnkqqy1sESh4UT3Th6vTDjUCgPxi83oxFLtQOuzah/gptA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBCheob5+0Q8/uhdULIxf7m5njrhEQY+311g6FMptBvU7NJ9lUumiCzwiWK1?=
 =?us-ascii?Q?ypDdvpBxLpBpMgCJxVFnGaHwGCTOKCR3LyhECLnlpBw2ePaJkTMuIxwt1A2+?=
 =?us-ascii?Q?q3w5OX3ZWDTJwmHouQBMGpQ4c768Z5PXhtVkVd4cjODKnnKUeyn2V78y7Ku1?=
 =?us-ascii?Q?mom5A2qmnIIiKqGbAIrkbpxhiq9yotdh4i8N2j17Q/q6D9UXNjm858VcVgR/?=
 =?us-ascii?Q?WAfImwLBLWyRLTlIhvVQrRPqlufTNyUXhAVYrTjuzYYs33izwLom5MNn4t4Z?=
 =?us-ascii?Q?j5yUdvRmWETOs4VpEBt1eTthvms2IeqOJ9mEe1vbzevaviDedD3bIGMWah4U?=
 =?us-ascii?Q?N1E7JKkGzgCDQb2fGj/8xF58MpmDDwAThnGipa4g5nxXvgB4OV6DBl6HzY9c?=
 =?us-ascii?Q?PpKjAceVGEoa8QKcvOX3AMHKPG8AuF1tAIKHYMrCxCJsQ3zPleMPp0QHmWmE?=
 =?us-ascii?Q?RGSFGZQTbJsHFxIphweNQeqaqxVPymn6r9B1GLNlAzuBe/xqds8EnPXcqJfp?=
 =?us-ascii?Q?hW4mHSROflyg2uOWJgTKPvmYyYMDPrnWK3JOA5mIMPnIZW03H6bKxxvtNAWJ?=
 =?us-ascii?Q?V6oCQRl3rDTy2uTHFvNAWQ/O3fdfr76mVvbPPR3K5HOViptP5FQ9Tj0B6MJV?=
 =?us-ascii?Q?LsP0RoEpXLFyyor9vpFBxUv79MGseMLZFex9TCq6W2+mR+GMvXQQkC/wz/9H?=
 =?us-ascii?Q?7bFAuul9xpJGnmUEeH6Gl66Tq/ReTBZDYX1GyezpGmce9ChIppv8wWXlQ2lS?=
 =?us-ascii?Q?9HdTHiNmeowEt80L5CG7eirccfungKEnMXd/66MfWeV5Y+KRQ+JInEUE6jHb?=
 =?us-ascii?Q?RnFj0yML/Ilbbn/fLln4z91Z3JGYbAwZwtaUH/ZqOV/LRfPbAHoqLJIrXgQS?=
 =?us-ascii?Q?O1FduFX0rnbxMDLMh0IzDuemO3zUlxePfzH7ZNBanoZJORluyv2IJZpeyto3?=
 =?us-ascii?Q?pX2tW+a0o7bkcsRlyTiRyahEUpUw3AFy9xGtp2ZRWEBOxTvC7spMvBTqXgvX?=
 =?us-ascii?Q?BRllM3NUu8WxtwgFM9zwCPk/Axbsu2p1MIuEr+V1OZKAor1iCYtrqigxVgVz?=
 =?us-ascii?Q?6E2d9/+7w/PYpCnhlQo7u/TQsiC6y2lKZL8eVNGXbyHBD5J1U9ovEowVUCVN?=
 =?us-ascii?Q?4my6ibV85HcyvMYt5/3dKpajHN5/5WwC14PSY/JIGxnrLGZr7eUZ4x8Td/ZC?=
 =?us-ascii?Q?uSlBMfoeZCuhR90S9dRSoMXtqS5B49CmtMrks672B9AL9JQjyflWKZawKGXr?=
 =?us-ascii?Q?wYzF7F+VvMK/L6iTNTgKT4Jr/yGClQ4gZt7rvCo1Ziqtfj/19kLarLkRCDvr?=
 =?us-ascii?Q?neoWOB5vWHfciU1GdyBF0c3sWzp4NdBEVQfCr+bTQC53uloxpPjFfXuA2Ypp?=
 =?us-ascii?Q?hPVYdjzkYfCDe5z4jbp3v9sCGyi8+wDj9Kfe+FCVfeo4v367G6ir/d93xskL?=
 =?us-ascii?Q?T8/xQzVAVNUZU6Lr9BIJqoszt1a2UeZgKSbtJdYyCJoVoQmo2f1Y8dOuLV16?=
 =?us-ascii?Q?3igPFw/cTnJTXGLKWET999a3HOCvP8lj4Vq6gCdw32oZXqTukR0HQl8NpbdC?=
 =?us-ascii?Q?wmZDWagP33JnLwkFTAGLDr7fQWmx/ZX4QNVSv+B3o6sG/ysab6v3oDqayPzO?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qa3Zr3gCO6NkoFzy9scZQNhy14UzY0bFpc1/82lgL3qZKlMv5mA8tZ+rFcxGME6YW40NSq6CohvmEXKmTq1LB/NVuq0nCHnlg7Teeb38teW3wb8XOMjpcesaumtTxybg8jZb31vPCdceXYM42z0NHhSvPWX3AjyKOmNww6IVH1jL2g5pz1w0jaHCVfUrPEr68EUCvZOWYlAwFpbsmi2t/xrdqbH84sCZeRQPieoUzOhv/bHHb34pwol7V5BN5SzBDDmiuD4ESa4IkZCZgSpqSJtU19r1r/mM1vzgbI9zlSuRVsh3/hCJwewAP971dKIGmXf/vcg+IYDDaKbOXvfn9wy1srKqGBj2G3mcg/pN5O4Uyyg3nErRigQ2RMh1eBeEt5P1oLJXkatF/CnKTzWH072Hayhhl3RXE+ptfu0VZNykneTKGN1U0+Rd1cbp34LOttbcxOYTiby7IUb9YRs7jleFI9OJCkVDf+Ru9cZNt9aQHDTEYaAYiEe8r95B0KZLzFUq45dTTv4wtdxEBAH6RxOakwL9mqZkQGZSLNA555uICNNzghyxh7uGcBRcLToDzkVQ22/EXbCwBtjvWZ5goQW0a3wQmNtxUvsE5+DJ0tI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7247b054-d364-4bb9-b716-08ddd44a0b53
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:01:03.9719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C+gnI/JSTF1Wg1uBknlFZ/IX8z8VoK6T3M4Pu3fHJMdcsGlawDl1H8CQrqKthuVprhCQ5H59NTiKmEXR+L5lYIQCP9hivgB/ddoFsCMhd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508050126
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=6892483e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=Ohf8Dw3E3UydpZs5c04A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: MI8U5vDbaL7LPU_CptLhLCSlINjgILoT
X-Proofpoint-ORIG-GUID: MI8U5vDbaL7LPU_CptLhLCSlINjgILoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyNyBTYWx0ZWRfX3fsxV/HBCtqU
 QHunOSvmUdYU+pse10/QYhcPXmRpy1t/vhgyWejv154XzfFVpVnxkRoOxwRbLz7wYJxCy3XSaL/
 QGRXuWFasjdoTCQXDMLnHrXHZM2MZRz/aP5GRnP5j1asLPPAUAgU1Pu6p/oOj4PpV6OhVhXuJeq
 QgFgVun7HqnbiglNMRXYIuC5rMPxUrFjmDK1cTa40tZVb/9RRJ4SXvjjmxSNzv5GDoCAc/623EV
 PZI0pCHrLK5RLNxFibzipk1n4bze19p6as2Dci1KJeFUMRoes6woHE9pEL3LmgdehlyfGlmyPHu
 9Ld3VoqIucnARsMAEzI2OBn0BDn7CJPC16jVYVtPAe2nbJPsmHguSMAiNgEMdxlAO/RQWnuc12c
 mr4/KahU1Ba7O+0l7OEJI2UAFjBgsOrI/FNzSkAt21ipELSgWU5e1nzbzLpZmE9BBv5lZ/Lq

On Tue, Aug 05, 2025 at 06:11:31PM +0100, Mark Brown wrote:
> TBH I'm not thrilled about the general test code is trivial assumption
> either, unstable test code or test code that doesn't cover what people
> think it covers are both problems.  The issues when things go wrong are
> less severe than the kernel itself but things still need to be
> maintained and we already have issues with people being dismissive of
> the selftests.

Yeah I didn't mean to downplay this or suggest it's not important, as you've
(possibly :P) seen I write a lot of it myself and consider it vital.

However the point is that we can:

- Generate scenarios relatively quickly that way.
- Resulatant mistakes are at least _less_ impactful. And you'd hope, would come
  out in the wash more easily.

However, I wonder whether it might be better simply to restrict LLMs to test
data generation or the like.

These are again all exactly the kinds of things that make this an important
topic to discuss I believe :)

Cheers, Lorenzo

