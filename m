Return-Path: <ksummit+bounces-2108-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EAB1D874
	for <lists@lfdr.de>; Thu,  7 Aug 2025 15:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5C2723A94
	for <lists@lfdr.de>; Thu,  7 Aug 2025 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE092594B9;
	Thu,  7 Aug 2025 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fSR4bVlh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W3AxvURW"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688892571A1
	for <ksummit@lists.linux.dev>; Thu,  7 Aug 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571675; cv=fail; b=SKLxJTgqY1Hr+ivZ2btuKjzgx9rbUyGncFG5tXixultmWFWSIPfUC7C7OXN+BPxTlkGqv9vaivXiuJDf4LxjZOAE8ncS7egqFsO1RYgsT0F58FeTUXZTEigOkz1ofatAp7f/hM/tkKcDyNwBVjYTf0jRVEurdP8LsvUyrW2LxzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571675; c=relaxed/simple;
	bh=r6tRXI9718rr1f2PdhMeyEB0+lBGEGiIWji1wgXy70s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=idOrawVgOpTUwix/Eq2Oedhcno/lTye0M2sccE+9ph6M4HUQsqC4fN4gvw3Ha5jVZwl49dhl7ZO4pC49Ag3izXf2wUNaoegPuxkSUXXxoFS2Ee1IGipq/NvufQUtUermdOUykrI5xUXbFRLdH7Arp9GyK0DR5ltfVltAxgTuFWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fSR4bVlh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W3AxvURW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5777NFh6009203;
	Thu, 7 Aug 2025 13:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3bEcE9eoA4VW3TOe8E
	MypErHmGmXDxDB9xr+V/2qO60=; b=fSR4bVlhLQEpJ3F/auBnlGwQERyUfjKLSr
	fa2SIIVre1DN9x0FP5R+DeL9E4rO++dGeOl9m2+kI2Y0zaWwnNyHo90tGSn46rkc
	Le2E+xyw46uii8gV/TPFaE307V8Z1uT04+OAO8ot2R7NurcLoa57BtW1Hw1nZjAK
	1bseljw+FyT1H3tw9bSStG14CbQSVCcc5pqx5CeDTQUMZtyqZpk0vjIHprOZCvNE
	BpfESAusGWpiYw+CF/Tao09A/sdQa33lf4F+owUvDWZho2hBphS7/Gmz2gG5teAL
	5OK1M/15ExdU/RFNJD3RLLJVsIuVsrIR6u+Jp3ZpN95Xt9uz8ldg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf40r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Aug 2025 13:01:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 577Bns1m028154;
	Thu, 7 Aug 2025 13:01:06 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwnmqpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Aug 2025 13:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTOBesWBDjLIqnfNkHm3y0EBYPjTxmQ/iWqeeC2tfWiLOdbNSHA0eBB0qUFZIBBr6G3rjFITeApr1lbozdyg4l2Hb1K2E3BtEkwUBRYUMNRcoE1p0zNzXtIGhGGZ+OBQq6OMkapHEzF6WiYILUbBbAeMborZCcT8DmJ3+cpCJnxT7fml2ZXoLJk8NNDPJ6xHZoISOEsSJ3IupzoqVnXuc6SrfUXJqU9ZZrBByHHuKmXx5US4bYSRdu8IY8aw00UGTP1+HhFwb02YAT+gBBUzJ51q4SacRvqXRjYEwY5cufrF+6C1zq4ulazACkYsP+vHDcxxRhK5DVhneqDTuxS2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bEcE9eoA4VW3TOe8EMypErHmGmXDxDB9xr+V/2qO60=;
 b=GHAKjMSJReEIeHr0EyPqXnxejGN9r7RlK5BxIkbaaeT71LD9lTysViiRBO4yob92hAi/KIsdtnVsIdbp2X7L3DGYKsl6NVMWTEKBUkuOw0eA+lZ9qkow+1e+gVXAtxYipHDt+ei65YeVwWEldKyMjJEHLg+fsvRXiOYTVx73i4ARWtrc8f7BTVX7guNEpzZ1IMK1XhXMK8DPAFDfRqbdzqSr+CaDMuuC3ncjRXsXN+UHUDRFsTM1lw2mc0aX9IIyq4PYks9nKmF9JBi/u/H5INI4H3HNrcrSBapl+q3mgSdPSmzZTRd2LqVPuIKCq9BJ58loxlk8tKbd0yoGk+O2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bEcE9eoA4VW3TOe8EMypErHmGmXDxDB9xr+V/2qO60=;
 b=W3AxvURWtDiLKUIeYcqdzBJk1STvpN5GEkxOrR1fQ/iSgzgY5mVkuxupKiU0aDN22fOwPEmZzCXZw0DQx0pHPM+7LxJq1EVB1P0S1bqtL39zvxCm7hSCrwrFZqm9TQMmTPXEZ05LIdbAkWTLR6Icanuzc0nzktT2zALe5HWtss0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFC802EB2B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 13:01:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 13:01:01 +0000
Date: Thu, 7 Aug 2025 14:00:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <2e90677a-4a0b-40fb-9428-e80eacf034fd@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
 <1ced158f-b433-46ef-a70f-d035ec413a12@lucifer.local>
 <72ee0f61379054e327d502bbe77aae3d76966d17.camel@HansenPartnership.com>
 <a1bcdee4-344b-4717-bde0-fe80bea46d67@lucifer.local>
 <8b7daa48-0f79-4948-b0de-a09a7b456513@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b7daa48-0f79-4948-b0de-a09a7b456513@sirena.org.uk>
X-ClientProxiedBy: AS4P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFC802EB2B9:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f057af-f557-4d35-0a98-08ddd5b2760e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ipf9CuN/BzAWc//4hvtAgmwCLh9VUMWGcaeKEjIMKU2EbsvQ01gOW4LWH6Ep?=
 =?us-ascii?Q?om965ba/dsvsiT/fLHaPcejehptuDOzIL6+y592TX6Ux5iLrPZMhoNbx9Ydo?=
 =?us-ascii?Q?MVRjD87bUocGgqERhGhwi2LqVdq7pxmYiZzwVcp0pnsgq2ozsde1owvfUq4e?=
 =?us-ascii?Q?Is20DNp/xIJsSyTKkf14D3b3+eu3QqjgXM0QQmU8t0VxGmOv0zB5qOPixrl7?=
 =?us-ascii?Q?rei2Tkt00QtMTf+earW4sfJmm7jZ+TIR8kN3HQzRvVXRMtXJAFaphO9bymFI?=
 =?us-ascii?Q?4HYNCMYuQd2RGnI1kEBWMFFfbwpPmnJs60x6SBnRk1KnQqnqgn9g8Jrp1M/f?=
 =?us-ascii?Q?xat+6mIUbzujpaSF16E8ardbnFHrb/RLcbPSU+H554+JNYLosu2JKLavD230?=
 =?us-ascii?Q?SIHaYBjToS+uk0DhQnpERcwr4PAD/NZEtjFJDD3BB+up6S/SZBSY2bb6MN0k?=
 =?us-ascii?Q?3d42jPndH2gROh/e6A9BVPckcdQQrnZ2uCOo4DFCtUjbpWTbHGPVonqXgpOg?=
 =?us-ascii?Q?t4C9bYhk3u1T21/XwdoekipHfS2k2qWIw48+XCdU9X8osEQAANeLf56Til3e?=
 =?us-ascii?Q?ElEOUOJr48n3fFs/OYoZOzbGc5DAyjHKNkFz42KreTkYdj33NKbFLHFq+5/r?=
 =?us-ascii?Q?ckf7k7ix3Jf9LAN0cIImQovRTVhFDjp+D82a8kyAWqYSPGe7QEc0nk3Kk5Me?=
 =?us-ascii?Q?nWq4hTrEQtHqImwr8jpEOmggVSK6Jn0WbbKyv1K3tE7f/9SFD+D5W/JDsKhY?=
 =?us-ascii?Q?DGBEUY8iIKHMH0IN7kx9qtk6/MsF7mwjmlBH7pl2gFqCZDQA6j55t1Sy8X8g?=
 =?us-ascii?Q?alybtSiL23+XxqA3ehHflWXIdI4FjvBHkySwEGjCwkSZQvvyvfk5WNyZ/kuZ?=
 =?us-ascii?Q?f9rGLfLSXikL8PRfR+NZeAJNyDq31DtLRpqHzQaqek4nz1ltPhbCFrlZ3wRl?=
 =?us-ascii?Q?VHakHJU5ctMRL8PPZXdseJBzVqnJVRt7A1E/kAcCyODsjNfVT6VoI7H/XmTO?=
 =?us-ascii?Q?IuL7gIJHjwC/rKgHI47GpJX+huVH4y1nPZHm/GcA5esuWyt/sXJxshopBgwl?=
 =?us-ascii?Q?Lp3+fSc+6Li1KEEkiifVSHuxlQKTr3cPy7Eq52Tygv07pCt7/B6Dpq0ErUBD?=
 =?us-ascii?Q?i44Ofg28jLcQcePSaCFqnWpOBIgFWwJ6G6waxrtVTmePhJY62uqAJo2sgv8i?=
 =?us-ascii?Q?EVfcI5eVHa6OzrXNtvM7tf4z4x+AqB40O83r0Q1actUjEgRB7k+2E+Ho7dkw?=
 =?us-ascii?Q?ET/Gzlpjdjmo4pvcM3eqOgSkl3rYvJd6/hjKC15G6D+uWqBLKMbVwOrSYOqc?=
 =?us-ascii?Q?zAMpFaTTl3cdG0DZ/0YE6aMijA9ozismirTSn9wqbTKqWFHoddiTmxh+9LRx?=
 =?us-ascii?Q?kGNzXPFYkO+CPiRr9623ykhSYecwJJb+yNh/uetWzR6IHsEBVMsZ6H9de+Is?=
 =?us-ascii?Q?p8+S5uMxv7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7nMeV56K1zmLBZ7IIqtDC+lR6JxRedM02hkc+JgeJJmZyu21ku63r2SReSWz?=
 =?us-ascii?Q?u3lzThniIDKSQprcb7wBJqLRIIiCBKPvNwLYm/Su/xw2y+2h9UzmEiy7ccMp?=
 =?us-ascii?Q?0jtbP4j1gsmQzrp6DPK+A5AXtCClmvANLRlkb7aCkHCdxNo0BuXWUlxmsQXD?=
 =?us-ascii?Q?YPg8bJkZjqieJ0EeidD9lxGFOCfS2dRCdKMbD8yMgCqKGY1mFlZ+7YU0OnNd?=
 =?us-ascii?Q?KIGZGw54b80eDQzdZSxS3MOa2a9v/meitilW0uFoxdQIaBeBU5EWGwzjGGpm?=
 =?us-ascii?Q?xWs2puOnKPo7rsoLaT6Ipd8DdVErl4LFKhf/CogP8vroMgIflCCTBD4prUXY?=
 =?us-ascii?Q?XdJYg/mGCAbb+SucAPbN5SsxCpJzuWZ29FCRKc/QkztHkRfZGewt2hfx/AZC?=
 =?us-ascii?Q?gTezSFvEb1Pp7T4xR/d6kIQGnmbWGQQJ5afPVQwQhxr0NaIsZqJFhw/oJwv4?=
 =?us-ascii?Q?mXkwvbsJc5JP6yKxuI2/7I0oq1TwzMIY57XaczvAP07ROLsXOhP3i7VG53Zd?=
 =?us-ascii?Q?r6C7fuG9iQyKOoAy6a57rHyPKrWOmmkiTiPifBpo2sDdVMjSQ61mnbz7wSBx?=
 =?us-ascii?Q?jiGzZ5fylgIIGzSeB+S+KpVFBLWEapMZXI5lTX7rYNaWteqQ4BlBRa4mXxlW?=
 =?us-ascii?Q?64XPuml/8F9kroUcHqw1vNbSYbPuTKvaoyzgM3N9Nqemkd7XA66x5Tv2YZbI?=
 =?us-ascii?Q?h1mVlRrfxpxIpq4jbW00Vwr81pcq8wA6s0dUHUYHkQXNcLzDT3/oVbT/PWIf?=
 =?us-ascii?Q?kzrVlYX6+rtvf1o90wZo/9T0WTdCuu5asJPAG1Lg3xlg5OemfVAJSdZlWMeW?=
 =?us-ascii?Q?9EHG3vOCZOk/2QerWJYdlVHpr9eh5BAVXYEY0/KraaJu5EDfR2j0oRWKhPm/?=
 =?us-ascii?Q?kCKsJuhIIKrMne1w7y7OyLPiSKbJ2xWR//DaaxT+xk3TZabs9LSvlrUVl37l?=
 =?us-ascii?Q?aTna8Ld40L3yZ0BbFsVFx12G0135nMjJsRHhDDolcrqm4uimq2dM89qgMG5i?=
 =?us-ascii?Q?ifUur2bNQjtl5CKAigLvDBJVLaRT3ZZ+QJsWb2z4l5r/Zcd0JThIlZBJD2yt?=
 =?us-ascii?Q?SyNsa9/ZlNND8qi3fgJ07wwqS/CtpAe0zNDVzdJlORklDKialFfNl6H0iw2j?=
 =?us-ascii?Q?iZ1Nd3ktwTgq54+33zIrlAHXdIJHxIsgOh9xu7PkySJtVOl9omjRfD0F2PSU?=
 =?us-ascii?Q?sMKaySDcr2PR3BU7M0qeeOL2K3M8OqNH0vXV1hTiOY5cmZrLWfNwcFXg5y6q?=
 =?us-ascii?Q?H1N5cDub23xBRznTjrgQfOw6IoAJPrm6rs2Qh8jsm8modbyDcrC/Fg2TFehA?=
 =?us-ascii?Q?kblHIx61wMlz1rbzgYJs4zSUCAMmEsVkdTiPjqLVUd7eLo4P0jvfnsTlXQ1c?=
 =?us-ascii?Q?gxYUMxMnUTG7deUtGNDncyikQV67Bza5GdcqLFIpZuEW2ftc9BXJFdAKJC+t?=
 =?us-ascii?Q?30SLJKjBgcdGauOupFmsXkeYx2PNuNNMSiIlvyS6ydDchv8uBSVnTetUC7o7?=
 =?us-ascii?Q?CrvXhCV5IuyXFik0XO5+wkUvR2jii83O+ZRqyZmOelkCnqf98Zb6fAl1T8Bz?=
 =?us-ascii?Q?X+9J+BL5b7ctbh7uoSuKzkkVuYvB+STqQKnLA3rE9jtY7EjvcowLBWh/ilg9?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dpQffPcoYy7erqFLgZ+HimwUmDWADzStz8FovtDlrjrEPQjVcBvorpSGvhOOo6LGh/K59CUl+mkhyR1NO69a9yTJakTu4P9sWXWDsIGwX9cOx0fMwH4hcQu6gcE2NZyMeSeu6a/8BbUzFVsNRTrUGZ3zrD8DDJc8U8FHW1kg3916iMhX+hVP5dam+BlG5VPHVRCLSAL80ryNGJYSgm7a3/5oug5/PCBqXdp903+4mZrCNCJuxf8Pc3oschEA41FmUqXYuNQe77L11bWI9I1hjNwHQI55eUTA43S4Wd5chQ7QsT4+9DSkF95KrXJ6d/HsbcFX0G59YNtmsSDJCWYgEoHJDzhqyCGYu68YB+IuqAHg2jH1YTLDu+eHhgMm3meI8S1qVsXUseDfjnjsbqWCtCiimx9hEqmuuwIXgDufCPE57sxpHUPorBDXHQTDDD6bdF9O68OhliBPksGHfs3EezL3LsPEHkPEnaLUrHe3lAQmLBlkwEs+PDu5x8sOkjZDKYrgYNd+b5Vb4/el4Fg3rtuQCbp1+oTCI79Zsf0KDRbO4XEEY2K9mv1z8vWsix64JKgMXZoP3v0ar5B5JmcRjta2UFkLNMxFD2FX1jTlBW4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f057af-f557-4d35-0a98-08ddd5b2760e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:01:01.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIwxE0BHJXRfAfVv/lRJB3UpRFQWk0F4IbABPc2Hg7KH0mzjapmFnjWcgh/mEKRfM7V+xmulPnzOCBSq5lcwZmXF6Fnw5VTOq24Mn/VqtZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC802EB2B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=861
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508070104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDEwNSBTYWx0ZWRfX4k9Yl9Esivty
 0gRbI/71RNZ6RPUTLJQ0Ot0LW393H088G09C6dtJsvy0Ot5NJPKiciM2xROS2oVi+iYSxrq8LS7
 fXOkaCWefXqfZ4pZ9eNQLDu0f3HNNB+jxS2vUMB4ReMQI//G6BWeGLhxs4nN2vrafr7qWaTXrkV
 QvSyczjXfEidppzgit+15+vSh99ZFOL/EevRPV79psJs82JgHMBsJQeUFu8giotarS0AvxNSSQT
 lp7svPfiFUSnYYDctP731vythoVdls+VsObRqxRH2iH7WWaz4wFA4pOB0M2SfF7uPAAMF7PeJSL
 yedk28RikAj2eLGNAskh4QUS2lp2lQQvF4t9pmMloTWErLwpG1AdC4m7CmIkQ15mXgrIw5KNr7o
 MfZcaeGnAhuTlTJ8FRP/JgYUgbmrju49YmTYpxyC0cPaLBa+9QCsEQ3m5AP8Cy24YXrEvk3L
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=6894a393 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=lDsFUYplfJSyMvvfnmEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -5Yd9C2voVdnhgcJPs1RkwgCwhb7Pt8e
X-Proofpoint-GUID: -5Yd9C2voVdnhgcJPs1RkwgCwhb7Pt8e

On Thu, Aug 07, 2025 at 01:25:23PM +0100, Mark Brown wrote:
> On Wed, Aug 06, 2025 at 08:26:41PM +0100, Lorenzo Stoakes wrote:
>
> > - Was the commit message of this patch generated in large part by an LLM
> >   (excluding non-native speakers using an LLM to simply assist writing it
> >   in english)?
>
> Easiest way to say that is probably to say "written by" and "translated
> by".  I think for all these things we should just talk about tooling
> rather than specifically LLMs, as well as avoiding any rules lawyering
> about how precisely a given tool is implemented it's probably useful to
> know about tools whatever the technology.

That's a great idea!!

And agreed on language/rules lawyering, I think we have to have something
_simple_ and robust at least to begin with.

There are inevitably blurry lines everywhere with this stuff so I think we
have to be pragmatic and as clear as we possibly can. We can always refine
things later as we learn.

Cheers, Lorenzo

