Return-Path: <ksummit+bounces-2103-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FAB1CC8F
	for <lists@lfdr.de>; Wed,  6 Aug 2025 21:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 222867AA545
	for <lists@lfdr.de>; Wed,  6 Aug 2025 19:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C301219300;
	Wed,  6 Aug 2025 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cmciPcBQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Uni+/xRw"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721E10E4
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 19:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508937; cv=fail; b=RjrelojUyTuBiwOkBD/woclXdfK7QOqHYv4hmXPiHrzSvbV1N1EpDAzjLoaMmoQoGri87tgmBjwyqiYcM2TamubiU0kcsv3zJeMs8sILw8OeV1GHZyHM7FiYAR9x9yL5/iD9YC1VY9BUTZkT9XrcULuiDLhZg+BKGUCEbn2mXjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508937; c=relaxed/simple;
	bh=CR/DhXxrGfw/8+U6mRil7razVy9forMMkegMt5fu+W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dk2WzkCrFmNxO4OopRXdxjOVNjvbNR9QszGAB771KvCmK3IDVkaMeygxLqM3sE9BHW1das9N3z3tfIQHMjbepLooXvrToIAUjMdSqCwxdkBXJ2jukiz59Vn1/1wXyRj9FWzflJX4zvZOO3XTkdiy8Pd087c+1N08HoHmIu+iuxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cmciPcBQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Uni+/xRw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRUj6001764;
	Wed, 6 Aug 2025 19:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GPJHpbhr9gSZ87sgDN
	0GNLopUJnyMvZUspttK1O3bhM=; b=cmciPcBQaZsKuJZgn3R5KedHL34nyUmffc
	rBu2+cxZSVvQVJErO2L4embmjC25L53jdhIsfJIYT/263OJCs00k/PB2tRHt+1BM
	d8PatA9FW+eftDTkO0MX/74jfry2TWQRz8FiktMy68ZP5+9PYHCqu77JsDrkZmaE
	5QJV/AXJ9pAKHOzeSebSaBnmOQiwkHBKwLiRsTV4mQjBUeG6VAjPpSYPjSWn10qx
	RP1xoqa3r0ukjCgS5DaIb+AHYnNZf0uSZNjuIBhdTAII8cfSmkVjo4FalbuXrBa7
	jNv4uF45rnHKeeGqGbclbHtN6Z0HFveb1PQNDmBSbcpdZKdMRpQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd2jxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:35:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576ILifb032290;
	Wed, 6 Aug 2025 19:35:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqyux3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 19:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKDkLEaS2PiKsT2pfLlzMOleh6lRSXDv/Rw+oJRDvWQYUnT6dRRd94lx8ZCPD/6WC5BhWPITa4OhvGJcG+vWvnOJ2P35Ge/A8hhT7Hhxbu80W9ssCyMsjkxM+kblW3BYqk9+r/2xPidqgrPg7ukcMhFczM2kKy4/xGa6r6bE6ag1veNOvNvDxwBsoFM9SvW/z1vcn8EKq3VWdp2drK+1D7almoHLUuu2BfXwnsV6EKE0qQYU5w44S8O1v79NYCY79SVrYJUi1Hj4qSYoCFQ1m7Ur/GbNQJRBpnlwbGh2xdPJiJ5ymwVJk647BW0l74SCa8ruQlqrsOYGrQE2sYrJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPJHpbhr9gSZ87sgDN0GNLopUJnyMvZUspttK1O3bhM=;
 b=Q0D6ANVJaGj4cARz94YBLmtkoDe+gqvwtzQBPX6UZKE8fPat3SIlPamKkzxL1U3Z67dR0cAGKoiktj5269Sj+Sq71QvA3yH4KT8IVhZBmSsiSPLorLUawMyZymYyZaXgltNvjfVhdwKi2hH8TouCpU1voJ/bgn8Ws9H5fbDSMNwvo33TD2nkc0uxmxjWSa2SoEpph6q8Kavy47KBOz84VIut5Tp91QtL2gZqH22EMpeAqJRBn2X4CsD86fDHsaySI1xuEwwJ6W87tOkL3Wbw/t6bgDuUsPymch2TCkHtKx0qJgvZKc8jRgE25jtU2XWZVVHkmgSFciYeKopRoCTIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPJHpbhr9gSZ87sgDN0GNLopUJnyMvZUspttK1O3bhM=;
 b=Uni+/xRwqoZJlX0KKDt+/p2GmZPjIr01syu65n7WqgM2/0Mu9Ufb2orUuEbZaBd9sb2UrTpqID26efSfqHXRE9IcP4h1GgSqMnDf66af5kXY0Dg5D9Ogayos4yri+R5qmYhTCnw67rkPQURs+95oZonpb3r9QYkqOx6GMZaw2O4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4359.namprd10.prod.outlook.com (2603:10b6:610:af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 19:35:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 19:35:29 +0000
Date: Wed, 6 Aug 2025 20:35:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <77ccac01-98a1-4b59-9d0d-3ade79b9449c@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16p76q9o-7274-901o-4980-764o681q400o@xreary.bet>
X-ClientProxiedBy: VI1P195CA0090.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::43) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6a60d1-31a4-4d87-06b2-08ddd52066d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5VwEEV9AsI5heC260I0u8slNK7tO4OIvSFh5yPB/x76r2o7KF1NNcOk0GXsZ?=
 =?us-ascii?Q?A1MBXFhhcDxYSeJTKMxoqINC5/qapSGX92dTSMH6vd5cdILGro5k9qfw9dO0?=
 =?us-ascii?Q?wqcaVhb0b39QQA3eosnVMolXOB/iNex23XqpATwlLYmDXygnoGdiGQuVP8M2?=
 =?us-ascii?Q?dx1qYCNfkbsNmM2We7fFVCqrOxU/S+TUlRwueaP8m+M/ZywIOsdCgfScPfgw?=
 =?us-ascii?Q?QIK3/Bw+vHpQYmetzUPLQP6Mw98fW/dR74YZcx/fUmMFHOdbq4d6ri5wZ2u/?=
 =?us-ascii?Q?0TXyCv/mpsq0mlaWq0DvGiz6QiXA3cRx08gJYzPVRmmmQYhejDkxf8dpkkRU?=
 =?us-ascii?Q?tFwv8+WaUdBxdYa+7HGyz7+HDXjx/jGK4U/sFHEiHVCvyGZY26ZqArEFOnLc?=
 =?us-ascii?Q?sEBR+FUVtxtERg9M9VCQXDFO3l2+ggwb6pnd2E6wx2ccE9GqRGZ6mX2kT1Aq?=
 =?us-ascii?Q?ot7cK3QHNrr4DBmljq1rrsDFDgkXdYSpB6XezglpOd2jM3D3vhwhboZygmx8?=
 =?us-ascii?Q?Yq0A7YtZZDrrwEiEPqFJePNBijYRv+cOpHBUd84hTpYSDTtuTg0EWFf4+dhe?=
 =?us-ascii?Q?x1OXJRP90va2fSOJtlEYMiJCjIoNkJCObUk7Bc6+pD7KSLsHWRYBEZD/pC08?=
 =?us-ascii?Q?ZJ0VAJuur2h+Kc7BcfdZCEC6KG+h4bMNdnarPk3abn4PO/E2FK/V7kvhPnYJ?=
 =?us-ascii?Q?xPaMM2l7vFOPxvwZHwmsnR6w5zogytgdWVLm/fi9V5f0FG+I+Z6esM9heKOM?=
 =?us-ascii?Q?h30XRkhbEm75Q73rotRBDKZDp7W3NaqzVVcsvmONYdrQCmy2mwhSWXSFMpC7?=
 =?us-ascii?Q?o7lmX8ltbjeHwu0ekwpmLZuYIhW9puu9XBx/8fo5rQ9ufpc/dQvoIfXAiGEc?=
 =?us-ascii?Q?m9M8kzOHkHyKaJETLIDjNquD/iWZn5tYG07y8+kLPeE880h2CfM7esffkKYf?=
 =?us-ascii?Q?g1c5eGEe7a+dX1JBimuivqXTU5vfBdP1YVHD5o6Tc1jD4q+W3h0pwP6IEUWt?=
 =?us-ascii?Q?9ogA41OoWgliDydOKO8lB2bnMdilhxlSXRzvKU283E2AhTxFi1w3wOWABQfw?=
 =?us-ascii?Q?lCiP1LOn3CkHbk0tTdy3cdLqE6EjkgJskIkxcG2UfANoEyQp2PNjiPV5CRG9?=
 =?us-ascii?Q?kdGlIRbHISj2hjB15ZhD+X6H1+AfIBvNDjaGQwXi2l2CxL+5uK/cV3rHL2iA?=
 =?us-ascii?Q?eX6RovftypxkF1uT+9udP3i1toYvmfnIU6w9DbdasxNSAAnddAnGcLNK3uLK?=
 =?us-ascii?Q?VbBTLCWTYeFc4BrpbDWQ9TEXau6e5vBlyvHIYX33REXdcqvDPJrFk3fta7TK?=
 =?us-ascii?Q?aamaPI38keJwCPNeHjCuVRM9MabkSkmnzbP0+GTOVY/pZQ3wkUH5KQJ6jOKu?=
 =?us-ascii?Q?ByFVgOhUzR/y1+2sgnCY5wl8uJIgL+zkyeDSazgWtr11rW3XeCtwR/SBNpvj?=
 =?us-ascii?Q?C2VtogIBrJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8kZFWFX6IKMe8yHEwSvEWLtBeJ2Rye+hDkqNNBe55e9gQYH9bkZH5QB3+z0M?=
 =?us-ascii?Q?Czspjcgu+Wg5cUbpfqUw//TWyOnOQObeoYbFjsEXrsAOttJbkGBO0t+9FbZS?=
 =?us-ascii?Q?wZe/24EQjQpBKp4I5pszWvsGGel8ThjtWp8PmiowyE6dYyW5HGQg8Fo/mQom?=
 =?us-ascii?Q?0eWCFj4sNxSKf8hN5DwH9cL69dYY7Gx/vEOEtdTlMu8QU7jG9PR5Fb4oV2+w?=
 =?us-ascii?Q?Gma+ub61p3FWGEx/INGBLhq/4YAb/CtdqKoKNxbxzK5n5+vZGFF0p25bBOan?=
 =?us-ascii?Q?qClltzSEAX7aK9E3MyrcZzY3D8dCUn+zYsjoiwiI44KAAMvabYl9Bmj/rLf5?=
 =?us-ascii?Q?KzHYDEUXuGxMa2EFM4Yh4mdpMKLtvq6k0tin8BCc4Aq8OmZfxvA77YBDqShz?=
 =?us-ascii?Q?b7QYSOAahe81qO38W8wMQaHEgcbzX9YSyfzxdYzTxDyWjZXOMcHfrNtYrUoG?=
 =?us-ascii?Q?G/aNusGyEw0+lsiYT4zhhUYFOf6F+PEaa7SSdqz8hXeHeljiZVm1EfSlZWei?=
 =?us-ascii?Q?plYAN1b4H49z0bXQ8C+P2q+y+YsQMPlWr1tefYCqUOUp8MZQKKv7C6QazeHT?=
 =?us-ascii?Q?f/DaSI8RRWd/bMTiYdzZqTs4J6kDOlQxCIFfbopd6Hd7DTLBxv9wD6NLuTkT?=
 =?us-ascii?Q?5E0upQBGSrTHflky/HPCgJ8Ljv5yDASWzo4yVFZvHIoYCPBwwnf9Pgsb0vHx?=
 =?us-ascii?Q?tYPZUOiSfWzQy7FdXyLu7v6bHXwR7qB8cO/UiZqUkHK9PsUiOif+hFD1JyrR?=
 =?us-ascii?Q?zbi8qKM17v/9GuuOWyp/Kt32ZonMYLWuBDM+eB8NjK6DdF/QxkZT8DxPi2PX?=
 =?us-ascii?Q?48r3jLqMHBg1T59dinnQX8hqgQaoaWvf/L3bzKjHBiCi4Soo+3xkq5/77+Me?=
 =?us-ascii?Q?TUpe5y8UlOVqtFC27/LL5+Q4e1k0/Ma73IRWbSc1mc8Ydtorobrhikj1WwRX?=
 =?us-ascii?Q?zK/VJm2NV2ckJXCGRwUGMuw4Ca1smttBqO9f03O4ZoATsyhViRtlLieY8Ej/?=
 =?us-ascii?Q?B01ha9C7+0I3Q94i/jplQmEGVxz27FRBeldsdOtb72tJicQGGY54k5VU5Jii?=
 =?us-ascii?Q?wV/aQGYwIMcMCuNeKDZkIFQOYJtQx5MlsoKLN/wqEWdEmbjNhiOzhJLZrY4Y?=
 =?us-ascii?Q?fFZQMz1gOqlVzQy4p7t9yhCYnMhbtQKb94MfTffLCqM9xO1mAoNEPKVvlbC6?=
 =?us-ascii?Q?22T7YJmbrcZ8IFzf8MCGGaGxYPnrFVya/KRC62Sxz8OIWT3aFZVHRFfvz4cS?=
 =?us-ascii?Q?JjZLp7FdjaytOn9XumykDnrf4sIczQxxS9QUXOHxnvQFyQMYo5tFEHDhSURd?=
 =?us-ascii?Q?vsuo8ZTd6nIB9VpduTN2XDAjeeE12kCaHeFwLsAYU13NBcmIkCuZsq2QGo5b?=
 =?us-ascii?Q?dI2pxzG5EEwNBCZ6rD9hQB+X6X8X55qzbZ5p33amIOXfb3H8lXYsVJ+2Hhw9?=
 =?us-ascii?Q?UYIJ2A4xoTOS1iPJ5lyxEut3PsA5aMUmPufNpOctoA7nHyLnfzxK0isIz49Q?=
 =?us-ascii?Q?p5Mp2x5qEIVl0d7pvh5Bj1eBKuncpm4ZrrXeo0vALW+c8SlNsFfas91G11RI?=
 =?us-ascii?Q?s6BPrrmChiHBCSFW8HQZ4mvRWz8ikGj0ktLgewDpvo6QOwANJB6SC0cJIiCu?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PjCQLoMUlTf8IwTjdWtEZhD6thU+karYW9dtnH+5CU8+wsF1qRPrnf+zVCYB+EO5a98EBHkylS2A96qzG2PcJS+o7MOpQWJZ+qXQTl5had6j21SbNTYzo3qL+Fi7FcqTsAkVg97Lsdpw3BicJVeSCpWZjILRpiw/uZ/MNvyNLEw0sXFr7SWlrRy/IS4QZyoOc1MCQlU8jYRgG4X0TGeEJjvuE5LdjHYAI/HF2NRkGwCBwlRxVdhm7XKTVkgK/xJGo80MB25UzExDPwIwJRFoEReNanBiyAdrqPmHmiOlHfHlDiDLffZsp9WaVKqTiqKgiaw032NghiboAjpmke/m8vEiF7VwDut9cZe6QG3rGeJ2lbtDDhGeQcPCgQ98lkqYIIN/xKVG2odBwfbDUKpAD79/xMdv96TTmlbeFCuIIcsVVSasQk9QAl9UVnLNKOT/tBqCNAfiF/ks3i1m363HhDKdZlKjND+ZFadXEdc3EBjmUClxEeDuW+wy6fihyMzd835NpyUXS7r8oHlvTo0WP/I+MxVG5lDzk9bmhfyE4aFQT4wNtkhEcsW3mIK6gIJTTzCmhLdpUdxHCqLNSBrII8nLP0UiHMaSpNJGEtUHEQY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6a60d1-31a4-4d87-06b2-08ddd52066d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:35:29.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh2wSTELnfpdLXYQfGyCwi5GrCAEZtq3ULdTxbPuPi6m4X0KxSUYnVh0YRBG0J9PjXeAs8J+tmThU80saim+4rdknbRZfK+mA9pjWL0mt8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4359
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060131
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6893ae84 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10
 a=wbPV82kwqEl8iarc7IIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: l47Wz4ZD2ituf_t35S6tpnHkegbnrmTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEzMSBTYWx0ZWRfX3NXU2E7IKFM7
 QZoyOWdt8ml0HT+/1LpgeP08u1JmLk3DZNK34eCZF5310fCWMg8sLz0rCG1D3vr6MhYyr5tyaA4
 ZOsRSd94DiSlKuXJmKUOu8gcv6uOifO/75oD0Hhag1Lk4Xl71+h7um1nVYLV7pM9qrxw3YyU+Dt
 hqY4at9RBBreKYOE9oXCyr4DJO03hjNp2fr4Ix+tz6Z0GxeRirEhmfOOXHxqu/MmvDY1tJqV2Xt
 YWuD3yyly/LLLE/eaG/vvxBii3Qki+788pJ5ycI5fm1UlVpZZrrLl91zwTirgz0oxATEDAmUOmO
 3U3EyFDHkWLppoKlU6V4lxhv05acbeCqBIsioUjZSVeOOgo9XwugNRBB1XUgNt0XoCtHSGZqtXK
 ZfHtEXgMqvHMVQKTnHwQRNjImEbgrqV2v7Prc0xu6MvHj3teNII3DcE2loqoC+ThgcLonkaR
X-Proofpoint-GUID: l47Wz4ZD2ituf_t35S6tpnHkegbnrmTL

On Tue, Aug 05, 2025 at 11:58:19PM +0200, Jiri Kosina wrote:
> On Tue, 5 Aug 2025, James Bottomley wrote:
>
> > > * Equally, LLM's can introduce very subtle mistakes that humans find
> > > difficult to pick up upon - humans implicitly assume that the classes
> > > of errors they will encounter are the kinds other humans would make -
> > > AI defeats that instinct.
> >
> > Do you have any examples of this?  I've found the opposite to be true:
> > AI is capable of really big stupid mistakes when it hasn't seen enough
> > of the pattern, but I can't recall seeing it make something you'd
> > classify as a subtle mistake (I assume it could copy subtle mistakes
> > from wrong training data, so I'm not saying it can't, just that I
> > haven't seen any).
>
> Few months ago (so state of matters has probably changed a lot since
> then, I have no idea), I've seen a GPIO driver fully written by ChatGPT.
>
> It was functionally correct and worked well. But it was missing error
> handle here-and-there. Is it subtle or big?

Right exactly :)

In any case we can all agree that LLMs hallucinate and create errors.

And therefore being able to categorise the degree to which LLMs
participated in a patch easily empowers maintainers to determine how much
effort they're willing to put in to try to track these down.

So either way we need this I think.

Cheers, Lorenzo

