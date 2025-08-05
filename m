Return-Path: <ksummit+bounces-2074-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE4B1BAD3
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C1F3A5D11
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2081C861A;
	Tue,  5 Aug 2025 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YyK3YYiL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gZPjBdIg"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23F1F541E
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421513; cv=fail; b=VzeNrwaiC8W0nyvfy8FIFy5lp5lny8OjosgIii0NyMtHihAsHX0OMoeaeGBwOJPdAuXWGaSdB2zHHJVRYpyvC3HCktbH3jD+3ZsPuMtswYrVpO1K9elbebwMo+SU5+QmOTDCA09wpIPxw2sSxKTQvinFVFA38imyxIKL8mLnxOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421513; c=relaxed/simple;
	bh=PbLWYdf9/NbNHaaenxhaYxiQ1g99tuTslJYIhqIP9Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sgfg1AQglocRbb0VcCCjA2rKkQzZofF10aeuJnwn/0sjsQjvmdyXpVuVzUggevglbQ1JrI6is7vnMhZgp8xmxN9AYwFZiA+Jb3bP87zrC1qiNaxQyrMVmzRDCEp/hX+8ihG2nBr0Nl+nRrIUQuCcZXPh+AIH0VEM0PtyK0SW6pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YyK3YYiL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gZPjBdIg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IuA5d020801;
	Tue, 5 Aug 2025 19:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sZwMC1v0mqSJ2xbSbZ
	x+Pxi5RiMCHkF1Io0oZaiFC+s=; b=YyK3YYiLJt/+4lKS2ss6tcFXKi1ZxmUK/b
	x7ayvGYZ32dDBRcF13dgppxLrnVUpmz6GkRAIG35eE3674ogxoglCxu2qC9YBzj3
	6xEe1KesbdGyduxFWcl6i6W28Xi1TpOHU+BHLCpEnRexPjo0y/aMk/3CHFk6MwOo
	aoBSz0y2CGcJwQsZ6/jTITD2QNNLebiZX1cP8sQn/BYw2153Sq0LZgtlTAxwAZm/
	4Yu5FlUYBZpSNwQ8B6ZobpAWanGiY6DdanLzjPi7NjuKOa8yrh/2bv2PHPrVq8r2
	BjwUvZNnN1zbnqkhuMaH5SsQFEbJ3TArADmh1FbbOZUlphAOntXw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh04x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 19:18:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4cs3007867;
	Tue, 5 Aug 2025 19:18:26 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpww2rs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 19:18:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgTFeqxRk9gmfeVl6BlOPGFopkDElcSstXYRfFurSDAy7oFbrFlSRdqdWEDa/x5IyeA2vq3to4zlGwoEqifNXvLm9vW75MOdZrzesYsdfvYpWCodQwzlHp+8cPNfXjQaZlDBSUfNRfMug5VwRL/wbYbTq4jCz9gaSePl/jyoJJV8mDYA71wMAixtf0wr8RXM+PCJVxStyfuoqzLUL9fdVBeMPe2mSwcDtwTstHCuLvLw9PHlKgGvfSuzf3I59qEkh90wWPHVP0Mi155nHGEgxjLS9P5PaXHYWmKEIbfgTJ8L3iGjjdyXBVvYcKlZMCbjvO9jcWKQnJ5mm79lKqInMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZwMC1v0mqSJ2xbSbZx+Pxi5RiMCHkF1Io0oZaiFC+s=;
 b=P/W0YNVIurS+hBqS2TkwqPl1yUfNgnxxZMgCrB2ug1MQat9gfwbz+Pnq18bmnfrPCewP18IkVx+5sZTlkY72kwohU1GZuxWGkkYVxy7B0kOPzPA8UvtFrURRq5uokC7UVVfYiBFEophVhgkS7Bc2mhNQEWZcasQhwVasgsncU2UyT1KwDtFl+kGfLOItOZ5YEXRUyrBe43Niuej5I01xLMvTWI6AWA3kLWwjTegs7ljzDL1Ww97st+qR9YAjZWPoxdvf3uYCS6AAA3RcDQrlGjr9HElF8kE6iMU029OhOKK8XCFrSAFBcQYCvqFGkoT1pJ1xHu/tkp3ac69kpiQteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZwMC1v0mqSJ2xbSbZx+Pxi5RiMCHkF1Io0oZaiFC+s=;
 b=gZPjBdIgfuDef7y6RyTW5Z0VJrW1VonjCbUfKDYSrKHKkeoAhoXw+kH6wNpn09kYmPnHAX3AOfoSmTuRnnPU334R7VvdWY2Mf2s2i7RIz1Lyrj8hV/aQ1EoTCC/AtxsNL1MhfurjJZ2u5eWOZAs7Jsto+RnwBiq3lDZT1fR+9+Y=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4841.namprd10.prod.outlook.com (2603:10b6:610:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 19:18:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 19:18:03 +0000
Date: Tue, 5 Aug 2025 20:18:00 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <97453cf2-b33c-4a82-b86a-3a934c135ca8@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <ad8ea0a6-ca53-47f8-92ec-17e970184019@sirena.org.uk>
 <1840b821-800e-48cb-a372-012359cf4ae1@lucifer.local>
 <e2356599-d855-4de7-a52c-7db6a3538fc6@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2356599-d855-4de7-a52c-7db6a3538fc6@sirena.org.uk>
X-ClientProxiedBy: AS4P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5d145a-749f-4352-9772-08ddd454cc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9VT2ZR+2vfUqAiyaZD2x0VtBm8F+A679i0IGX0Sv8s3vpDii/nqrZKYImT/z?=
 =?us-ascii?Q?tQmH0czJq7NWLWA+2+jGDaGkv7uC8LTps+RK9hhKKVGMB7Ys9faYEFa258lJ?=
 =?us-ascii?Q?Rb7vyCQXlGB4y5lKuKzIpWRul2h52XSRtNpuovvPj4VuTgutdDwad0DP2IsQ?=
 =?us-ascii?Q?f7F5nCknhAvIjT4tF7UpSOt/2wagY1Gsp9B+QT/43yJ3kfbf5zAZNPK2cC2C?=
 =?us-ascii?Q?mryrhqi7nS2ZGQLLPv8tt8968DekzDiabfb+JqYueoadAJZ1L9NqSDQHJteo?=
 =?us-ascii?Q?659OGkdDMpMsoQ0T8ngKzdnhkOe6U8dlAsy8g2vkJGUHiLM+CXj4lqSytLUl?=
 =?us-ascii?Q?jtaN5PDwzdcsy7wYp9+c/Qh1Q9Z/ZfdWvJpClUAXe6D23ohN4hoyGu7K53bb?=
 =?us-ascii?Q?6irgIwtF7XUQVnC7KE3pvwFsU39a3hpAVfU07okPSt+E/nmp99VhK7xm1xaW?=
 =?us-ascii?Q?9der3fF77mFmeWwITJ0mo5aOKEzR+rTZ1AqqcdXToJ371k+p0KYxBpvptovm?=
 =?us-ascii?Q?WZZs//JuxquZg87GIvk3SLNUuD5pb72+uCRSMqCwCgonPb48BpFN+ufdy+YH?=
 =?us-ascii?Q?PlbgiNoOhcpCblq5cUxA11AOGZ6+f6cfqvAKMXoTPdZFNI/d3uKwjrM94XII?=
 =?us-ascii?Q?PQHrUzxrikNuGSlIHQHR6geHFY6cJiQdtrbI89Fig4wIMIb/4d1qUozGhkxK?=
 =?us-ascii?Q?RTDDODPFpW7ZFWtuWSlti2WLiKpz8GMBKj3wAGMIAU7DhGbLgS01eD6jMA4u?=
 =?us-ascii?Q?oP9O6sLUG76BHZTQwALmHrUOD8W49cw4Ra6B7PGrVfzK2qSrePhQSeAZDBw2?=
 =?us-ascii?Q?gPVK88s0Xw3PGylxiNVSFjPhcexmNr64HihWVm2cwFutFeRkwQjzfC8+K4De?=
 =?us-ascii?Q?PtbATQj7Uaj8/94MZ5Dm+2JfWfuqyd0kmW4Lj1zlpBO6qkH5ucaodkUdAX4v?=
 =?us-ascii?Q?gNkTYJBGL8HsfOOuR4yIfIO8ZzUKTmD97f04KVFajBVVpSxXDBNpz8OCyLaH?=
 =?us-ascii?Q?cpHLQkwaoZSUPHVot/H4CecVdfy4+OWuDEjr4URwK6DJNKpYGHrKcWdukiNZ?=
 =?us-ascii?Q?5IhHD/aGmI3vsVEQmBYm8cdeNJHY0ATjwmse6hJBlwEz60HIAJIxaH3vlTBF?=
 =?us-ascii?Q?srYelZa/rF5/Hx3nilKOfwhVshig671OTbvXf2oKj8dhgbYdG2TgsOczBggK?=
 =?us-ascii?Q?mWymRKG3nqT3vQxI6s9CVCZxM/cFPKkEBXsVbm/SKDctM+13iVu0hTuMd2H9?=
 =?us-ascii?Q?roVmapsn0UsLBw5D/j9fLNtnykMcgol+RHQhP8LpWD012BCbqks3kwDyjARN?=
 =?us-ascii?Q?KE4+nhJigntJtlGNCOrroXOTDuK115rlxCBwg5uo+FLO+n3Q0g8iFe6rnpY4?=
 =?us-ascii?Q?5Sqm4s1EfYOc5WGYPioxbvwozmjNjHpyXs5n88UTURlPDwJVtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6+1x8PCHZL79DI+qEGb3DJ4wZFgpFIsj1BpGc0sNSEjd+0KGbd2Sfdz9W3AT?=
 =?us-ascii?Q?/UjUqQWX8zrSWa6gbZm/MPJ9SxDtdUVrqDDDsYQyliIPWavZpkMAwXRXxbJm?=
 =?us-ascii?Q?dns1l7yRwWbNo57/xN2XjnrnkBVVVcCV9Vx4KdsUPFGg8Q2XMX0qsLZ8NE8F?=
 =?us-ascii?Q?qDVlU5fpvHm3AzB2DYHwcFsfHR4JW2VGBiG8Vlxe7atYVCzlL8fqShcuTY2x?=
 =?us-ascii?Q?9yOmlY+MKzbloonm1ISztziFHdsd3MeRH/yVYezXh0gb5xQJWCcfBxV0Vm+w?=
 =?us-ascii?Q?G2+H6HA5388Mlw6PMZq43sy3ftwGt5sTvW81zejaZiRnVUeQrkfwR+GXHYUk?=
 =?us-ascii?Q?/YLF3esk5g73BAkQI26pghfSKBqSFbpjdMKMuH0Pe/Z134E1Fn+yiw0k/c3N?=
 =?us-ascii?Q?j3HNQQ19ZaE+wddVkujd1k3g/TUxJ7TIu5k03gN9atZPv6+7CRvoRKp3/iK8?=
 =?us-ascii?Q?KueRwTvOMR9Fn6iM/gfAUA5stXvav3oIHFeqNagIgmVSjG1Lc6ibGUb7EPzO?=
 =?us-ascii?Q?CiYssswL1xH99KJ14kkVM3K0+1U44NNkct1t080k3od5X/Dfq6b81PVwElNY?=
 =?us-ascii?Q?k8YI4vPe7GegAvYYS6MFbN1mnFT0kPowjeUp04YnpvkejRv5vCucl1V9lgES?=
 =?us-ascii?Q?5OYbsgAtSTHz/EsyTcxrOsjiVhVGQLY1/2UvAnizYvMLXBM390tJuxS3hVzY?=
 =?us-ascii?Q?08TZ0m34zcBIt17XI5Djn6DAUralQdyTAWDkjexolorV5XX6sQpINyTbsL3z?=
 =?us-ascii?Q?IWmcjR7CPE4usr4dNms2XxWS+9b4Yej/kcDdw5CRrD940RpBDuD0V8s9oxct?=
 =?us-ascii?Q?e22hkiWrbs+zOH6eAfOAxdv8mq75ziVs5dhW6O3qjzDTOfxDbMJmNke1BSii?=
 =?us-ascii?Q?tMA8/6F8EzLBs9t0pctnhvGKNnUboIr0yBVC1GopRc8LIIRlBOcqF30tD2RY?=
 =?us-ascii?Q?etvxETmeBdRavPBBTvCqLR/Q9M0ZRwz9FO8uojJLPgHIjg7iAiTF1rMjFf4M?=
 =?us-ascii?Q?a5kgbO0mFu8XvGYioDCLGsD6i7yrs5wpJKPqTZcbJZL9uv6pdU2e/Rk+aduK?=
 =?us-ascii?Q?ZJOqi1PVC0RnQf0VZs3TEcw2hFfZ1zSPKp0rDmLTNMAgzkaOvmxOR/IxiAB2?=
 =?us-ascii?Q?3EENuHToOe0X5lDIFRx0rBOzq/sINLGbTLiYSd54Ht9Rn5hM0fpZBThvvJ8P?=
 =?us-ascii?Q?5gDgqc9BLc7heR75OJsilQkNuWAXup9G/127GeGzOVwvnWKuvezhCkK3Y9rJ?=
 =?us-ascii?Q?JdN3W2ruBuAXbPI4veo7aeejeH5njQ2/T5iZ2h0raSogSSzrt7oIZ9xPoboR?=
 =?us-ascii?Q?5B96liAAXPHiHaeKYHuj15sbrVYVihElL7s6SFhH+yGXaAlMjVD+JI/l3UQP?=
 =?us-ascii?Q?MQkJaOFxELCW8M6nsB+iXTXcxeBJj+BlOe3H+rBzRkvHSm8oPqEYHqeFl6z6?=
 =?us-ascii?Q?3yqh8womx5cWL+G+wj4PvxizdwXo5nLk32GgNN99qrygqiyEkjMVvbQ4uf4S?=
 =?us-ascii?Q?U7tGbP7Q14ug+reGfcSHmG3QeyMfGqF3+ld9Xwav2ABTOlJfac0rVYzO5DLJ?=
 =?us-ascii?Q?wVnoDGViMskhbcXGLhJXEDLwc/YbZen5f1iAqve8aFacQ/r4IhouV9IIQKT9?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EnQQ0b1XXpgd5IvX8AAIS2FTwN3e1a8vB347DhUgspdYGGeyHX2XrFQr3qm73rLjs6YzBG4vhphY3xhvPjgaR7L+RQ3Et4x7cTYKzWUxguCVYOOQxG8yMNAWjQuNWRhHFcLaCgdzA4XINGHfbGtIXqI0BpcnNYwholqZV1VfCT0zItY9h7Azn+NWnYriXCNT+MvsNmohNKaHOkdj8W2TdZ7Nbx0Sjxb8uzu08ylmpN9UALTP7+XlI/mQlrjBiqBMlKrzIxQE5r6lkV+azoLiuY6yErv/1x+puqw1DYEO3pXQB7bDiy6Jm56hvD1ox6sunPmLSCUF1dOXU+O+fVP5yW+i77U+vZA1Vxl6xR2ra1NsoerDtgJpYMQyuJ8Ag/8B/2qJWvJgbX+dA52c12NDEtflaRZNQqa+o2aK2krnTu6IMgbgO0k5LGSv9t6zOQ92shcMD2U3g0iOOsVSPcp9tUL2c940JbcDjIMlGWIFCTekaBgNpQnPZ0sE14vptAbCaVfDlGYgvIrKSLdGkLP8kiW5jMtIrqMN5gKQG4u1wkfn20lj6EGEEPG5xQqNkao2W1DNbHteT6BpeiH/lh7iAdSJrwGiNcRv63ud+P+dak4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5d145a-749f-4352-9772-08ddd454cc75
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:18:02.9678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3R9OhuZ4iTxO4EWnXHImWw8sx5cNc1vjcmkFHi0/G5AOBl5WST1qrivTG+1QbZBjJMRMaGy7fIu0kVdZOBaNk34eOInh+YQM0Mb6sLR1oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=856 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzNSBTYWx0ZWRfX9T9d/r11MpzC
 2e1QcuWQvu9J8Lw79XdH1lE9tUOo2gFp/j8ATkve4ux6xpwuFFxPH9Om71LVv0o81az6v3H4dbK
 9vrmuCIypH/CYjkgGFyG+bQ4z1tGYBh9nEFFZw8ju8fXcby+ZvL/93gTwGoi/WSPbl2wzaBwNFb
 gVj2IY+nf4AiBsDxjTqw4ATimvWekGNP64qE2tPAKhKliAXGPxYVMCfeF5Hqsl997fccf8Zv/M8
 V+1AXKNrsgKUvseye8S6Uhzmz4P3j5ETlnHOUekiY9B4WSmob58+w6+b6sSV4fcQY2idqGWu1y+
 rIwJJH+MYPROebKJa2pQ2HeugjlYFsE3wJgvUw7KQpfWPJa9+nMhYpnjlt7SrRJ/wWuAwqpfM/E
 qVgtGnUAcWfSCEwOeKLcZIticqZuHEezVDXw05AEGx98RCOzN7Gi2UzAFbXco1gGVUViAFfW
X-Proofpoint-ORIG-GUID: HYtyZghS84o9wnbLCvJOyl9v7KMcWhNi
X-Proofpoint-GUID: HYtyZghS84o9wnbLCvJOyl9v7KMcWhNi
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=68925904 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=wdQVIdp__vq3R4o65DgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12065

On Tue, Aug 05, 2025 at 07:46:24PM +0100, Mark Brown wrote:
> On Tue, Aug 05, 2025 at 07:01:01PM +0100, Lorenzo Stoakes wrote:
>
> > However the point is that we can:
>
> > - Generate scenarios relatively quickly that way.
> > - Resulatant mistakes are at least _less_ impactful. And you'd hope, would come
> >   out in the wash more easily.
>
> > However, I wonder whether it might be better simply to restrict LLMs to test
> > data generation or the like.
>
> Yeah, test data seems much safer than test code since it's much more
> constrained.  I'm definitely not 100% against trying things with code,
> I'm more worried about people throwing something out there without
> really looking at it properly since it's just test code.  With the
> scenario generation for example the question is always if we'd be
> happier with the test program being a scenario generator - sometimes the
> answer is no (eg, because it's too expensive to run and you really need
> to pick scenarios), sometimes the answer is yes even though the
> resulting test program is more involved.

And equally, those reviewing test code such as yourself are a finite
resource, and a sudden onset of patches that might result is a
consideration also.

>
> > These are again all exactly the kinds of things that make this an important
> > topic to discuss I believe :)
>
> Indeed, and I'm going to guess that it's going to be as much about
> establishing taste as firm rules.

Absolutely agree :)

Cheers, Lorenzo

