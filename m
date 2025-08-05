Return-Path: <ksummit+bounces-2067-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC323B1BA1F
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708A518A690D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DA129899A;
	Tue,  5 Aug 2025 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GyUh25RL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PoLxbuzb"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894ED2989BF
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418766; cv=fail; b=qLThOb1MCIg8TvyysniDxIG8Yg+HUuTT+gMah1KQ743bSSslAIBKlB+3u8xjPDFKT4G5CXObUE5rheXbYrA1pro9GaH6M68kGuWy/2CWNVEX3WCSLu0+QfCsIUKGlYpUDaIYoOjTPNT2ahFdCL6vIeCORp0MNFPcIpUAH+APcAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418766; c=relaxed/simple;
	bh=VV6skyjk6xYYzVKfdfj9I/Zn1NMjLPjY3krTho5F4Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=esQiVZ6Zls0Dfh2w0/sKhExvxOufAUzjbyPWYkxjBlOKa8cVc0+fs4/nlxkvk31hX2lLyKihXbOi/rpwaNZTzd7HbEYCEZ+L8EZXIlSgybCbRp1EfyxFesRk5Me3rk3IIHDcAYeQevZ7PPOnEodSENzRWNC03laHvt7zjhrWf2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GyUh25RL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PoLxbuzb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575ISMm6011435;
	Tue, 5 Aug 2025 18:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VV6skyjk6xYYzVKfdf
	j9I/Zn1NMjLPjY3krTho5F4Qk=; b=GyUh25RLfJYv/pRSs95/5abLZH9REZ2ehS
	kYTfOog55ZKCuKBXvpdt4N18SvoJYO+HFK9sznWi7ok+i1+MKRMJGqgYfgHRYmXD
	P9ac59385qZmjp/6OAHx7QMLZ4X9E/yJHUe7L08wYN/bi8ytVk6hBnggp3b7rrYr
	zo0xDJOGIH4ETdxCCm+nqS/MkfOFKpNaN51e5xBX/SvBt+qd5EhNJyU/EDbbpZ0M
	fapaUycHaVEgeSWwLg5zsLjXN27PQ9/XnRllEWI+QS9IsTHCkN6kp4TLG9l5Ex3J
	CJj6UKMmORNVLymBMg9ByJobMtdQc25xjfEJ5Jv4Pd8dmZIJUYlw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd01sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:32:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4AhE029138;
	Tue, 5 Aug 2025 18:32:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk0yvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kir4dTndD4cqbAo95bXioPJDCo9JPki2N054GwnSa15AWw5GMT9e1rrZlP+b7kdzXpHws9zmT1BmtHK4hv22EMlnA7shVZihvGaE5/tiAiiQKzugSs1HbG29ITO7HUVBjvQ97BMclIz28i9dRNJT2xzs2RDk6Ya0dLkVssuaLRa8FaeqHOdwRrxHtGZ070G2J8S8RZkwph95YHefCaT0I5c3fz5kNewryVFaSyePvxSD8XPDGBozxodSgObJV2HFD0kTwN+HHeeO6qwIyCn28aaL28cP/oyqGYnHZVsktRFSq4cW7ag9J8xvVKrdKgGJuYZswZLlrL4857BVZICCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV6skyjk6xYYzVKfdfj9I/Zn1NMjLPjY3krTho5F4Qk=;
 b=m+CCxlpN/uPf0vnYQGtVXv4Dc0tO3LNj5ZqBImOMbIzwJCpUOym9zfwDXNKzIJiLdBvYsDjd6Mf+5prqSFe2J355ScHnaXFYlkVQQOidLVTFEv4AfAhASkZT95vWiHpJKkDFXKjWnB3W0Ydo1qcO3b5eRhuCOPQpHfxRA5bTTcvVoaUbtwlbS1RnEK9xik0+jYiHZD1igbAbYLkEVBp2UWKez1pZZQKsQ5GqcUyrrmEIvDwMDaJRl9ku2jIDoh3Wyi+hkhR8mGD94dfNhJjr5RYNjUjzjhdttQhI45UrLKaqAVaw6LsiSMa8KOUs+d+E6PwJ1VL8QZhhF/XO7BW5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV6skyjk6xYYzVKfdfj9I/Zn1NMjLPjY3krTho5F4Qk=;
 b=PoLxbuzbK1UyWFLxHr6Ev+JWDG7qbGZBaRJu+xCXlRzCUY9ECfUMYPq9eV+YPGEvJCD6ZnP5K2uWDT5351X9gT/+ZPPt0dRvPaXeu62NKThjZ1owPeli6wqSoA9/HzkWeVj/BRuSrWpEmWuDeKs43S7HgLwV7GX1E2Qciu8pvF4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6564.namprd10.prod.outlook.com (2603:10b6:930:58::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 18:32:34 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:32:33 +0000
Date: Tue, 5 Aug 2025 19:32:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <9b1a3d2e-5928-42d3-96c9-f120820a951c@lucifer.local>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJJEgVFXg4PRODEA@lappy>
X-ClientProxiedBy: AM8P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 61526362-ccc1-4910-32ba-08ddd44e71bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WqvhAMKm0Eq142xNp3+eyUDZvNy9R35YkyE2bjzXLExXcEEPADc5cMN77YHA?=
 =?us-ascii?Q?nFco5zK8Ar6e0kPpqqWbPTGe+/3/5EQzG2olnuSBvl1gtmCbfbehONpgom+M?=
 =?us-ascii?Q?uVpCKt28QQ1tZwc9ddzMZygC73Nd5KvoziSR1L1tUy+6zoUkX04wDCHcLvrG?=
 =?us-ascii?Q?RwXWk9cvBtFtHEdr86VRKS+a3ovAI6x31JzKbsaOSnUJfSAqL2xkcGL9qeoP?=
 =?us-ascii?Q?No8tqyHswoZQOAoF/28kTy2G+UiG9l+geMdxkorDOZEz5lDMkh5BojjJ5Y2J?=
 =?us-ascii?Q?0z2WIOyjVtQyEzX5DabKs/AOx5HPMdYQMUoO5J27o3gCaA14XFB5H+7BQPZv?=
 =?us-ascii?Q?fCdKv9fO3t3VayVLACLt+ySsUwlbwWnClW+vPvf8kWv0mwfDWglgh0q7DPxb?=
 =?us-ascii?Q?BnSeuBvRYVrTQQlHvSv+FGKUCWNRO9zyha9S0uzJ0Jo2QJhzA87sE785I063?=
 =?us-ascii?Q?ZKCx7XH5IOcX8Gf6wB0vi4NpYUfTjN+I1HoY9rkH+Ufqv/g1jiUs07UQgJnJ?=
 =?us-ascii?Q?bWx0qBSFlnor4ZhJNGadAEakA/bjpjdUN2NQ5F7YVR2zXoD0ykuv1e7X52QA?=
 =?us-ascii?Q?4atFvcOGnUaGZCCzlrtzkObWzmSokgh0GB2VR7k19bVIdNoOXI7BxFB9KDDm?=
 =?us-ascii?Q?fjKKb4Bjt60plaxqaIB7D3/9C/nK2fxqEEG9FnXMgJPcHMczjPfmGNnU5SZj?=
 =?us-ascii?Q?zDhuGQMVr0JBTrMQmxDnKnlMhLsuOnYfuWYRvdAIsKO58d2mu35+f1TMtFfg?=
 =?us-ascii?Q?wEeFCSm9sNTUcu/9HYdmToRZSKAicR07UeBrv1uPsWRbNVAjbrt2Lx3CJr6/?=
 =?us-ascii?Q?h6LHxgxTqb8fk3MHZPt9Zl78bcRBmsUROVvgNjtp/uIcyoGQ8UT1XGimEIYM?=
 =?us-ascii?Q?HGObcemWV+eyOX5w8cw/BcIkSccAY3yKVx8X39iX1wJnoZslex2rkI37fRO2?=
 =?us-ascii?Q?woeG48ZY9Gkxq19p38oaqSCHc8wXno8a3hYAVTWeZvedJcJs6oYNW6oRdqqn?=
 =?us-ascii?Q?m2BRJVs9b7StGTFLOrqg7B3P+DEBwYdlaM+5OAFCZjjegSHUAVzzUFrGSDKZ?=
 =?us-ascii?Q?POT/eoWBpkMF2NFu2k+i38NGiznHthLWrr3qsNOAEryWlzMPpEn2Ue7YolSE?=
 =?us-ascii?Q?oE2BkAjMcBvgot8UOXIyrwfeRPa3CyJNAQ2F0w7fzOoLS5w78BBB07DZcTm1?=
 =?us-ascii?Q?+AeAkAF2ePYB6gki+r424obRT1T+cDGqEhBI98RJlIE1hsCgngXslQxBXtaT?=
 =?us-ascii?Q?Bk6Qq34To/wNXoYwK8NcMO33lJDzo12JtaspBek/JbNEOkbLHd4JEvEMEpeA?=
 =?us-ascii?Q?fjuXqH+3Ow2VEkFO66x7sEzsJtFFsuw0E+5EY1GIlTXDYeiwqXTK914OJXN/?=
 =?us-ascii?Q?R/1GbC4fWrVWyx0QvAJn8i4CCaFB4KVdH0QF7TVeAYDb82m9xzpb31+Etbw6?=
 =?us-ascii?Q?DQcll1Agch8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vgI6DH3McW2Cf3zZrQnIXVNiCkpM9XgTrb32TfNRc9gbC7bf4Cjef/jaYXcn?=
 =?us-ascii?Q?yR/TVbzhCQ9k8IbjqOL7exvC2KLiNMPRMYKGZSCCpY6bZzoHTOih6SNFt/d4?=
 =?us-ascii?Q?Of+HSe/2Ai1Jvt4MaWHnGi6/JSZwzZPtZMPAgeNgzXG57fwY2c2JKZKqqtHN?=
 =?us-ascii?Q?GDp/jjM2bd3RvdlqunKImwWvUvm8F8mLLy6qX3+7Og8E9/6nEJODI5HieXA7?=
 =?us-ascii?Q?NPR2DA/Q0cFnyrMyjX55YsZE2hgRTdeo4acHgAZOZx1Z74738wr3g+SgrZxi?=
 =?us-ascii?Q?YqhdrK33KFtWiP/+uWwlUmVYYPH4TIMfQl2dbNWSJoKx+g+peVnraTEGuYTN?=
 =?us-ascii?Q?5HaY2T5+21gdtcmqzRX1ZqvGRujQfd/2uId6D05WeDxAA6W/7sNGVUqdXImE?=
 =?us-ascii?Q?1hRIJVKz5KHmpkacx+HAZrikIc/qdrJPwLuVa66+8/sXbK3ob53ZvSfXagAt?=
 =?us-ascii?Q?vsrW6cLK92Tx4ozLUuxPbUGOyRSs1QCb0CUy3niBVKnKTrhvGZEqtT9VVZAH?=
 =?us-ascii?Q?XlRkmSjcVDyyRtipDGIWQy0bNRrfgKiY2gGa80hfiCTcUKd9QWPznQGdFBcZ?=
 =?us-ascii?Q?Jx/Ma7VNSkLcFTG4SRt7OH9eqfMVzzrNx9F9wScONEEL/QSCxmi06kq1oA1a?=
 =?us-ascii?Q?J1oE+PyzxOQfts5tDGaTUd8p0wNomzOdimaYfBT2PMegk2TRudzQCv1KWgtB?=
 =?us-ascii?Q?+ra80kg94mquXf4Mhht4gQrGgvhRw+4GTZWmC0xdQG/q2xHxRc9RQBz2Ztgo?=
 =?us-ascii?Q?yTxlLbHLO8XEak6P9MpZovZZh5BFPJU8h01OVXNhknPY48HKVZxajcmImlIe?=
 =?us-ascii?Q?j1dBIJMclwZfit9JGjoMcOJNCl3i4xAr260Fbkmc9X0wPsX6Ef+qynpfxUtH?=
 =?us-ascii?Q?XoZtTmc6CPDj3SR0Y298uhg5kfU3kAO3T3mjnWMHnO8b6AEdohiYIk/VlfZL?=
 =?us-ascii?Q?mOxLTubKX4DR5l9RnYCmY+MiZFriP1h86ziSjd5deRec4GcEpvoWnJuoaLBc?=
 =?us-ascii?Q?1cgdir0F31UTvtDiODpi3M8KTZWZh5yBjOWtdL2Okh7DiAfplqRD2lMxwnnC?=
 =?us-ascii?Q?7zygZ1bxcwOSVOEUe9gp2YeWA9AIxDXC5u7L+byJQmK+xycuI8Dc6AhePJbU?=
 =?us-ascii?Q?N8gMyiVorV/FqJ0ssX93gp4QVXxNDH09MetcGe+qI2s/0eYIx2R9WxW+BQ6G?=
 =?us-ascii?Q?r3HtMqfm9RZsGEbpuhXOJgKoPicpok8icQJ+NF1WdrcfdPfRfTwu5WBarytt?=
 =?us-ascii?Q?oTq+CVKxtYTi31IHkdeHdB+NjrE5ytVcCwAIvGf4Pfk/h7cao8Rh/cJj+16F?=
 =?us-ascii?Q?/Plqg+aJNVnzKny2Xj3pHJFm7dWl1UDoZZ1FcafKU5dy3ekCkKTftcBb66c1?=
 =?us-ascii?Q?yIvOpjMUtedTH2T39Nmo6a2U3oMo7NgZRSeWsHsglgOqIglxbmb1kxf2ywzG?=
 =?us-ascii?Q?HWV8q124NzcDpI8K8pjM5q4myowAoppvTl6Z0Qb2RPHsUhFMWmAd35P0NJLT?=
 =?us-ascii?Q?1GpkOEHeEq1A6XNYnTavsCMa7xM4lF+BHhAN4anF+NCVNIRc3miY5wGfRdbw?=
 =?us-ascii?Q?xtNwyxMj/lLoCgr3f2IVP4p3t60pBZKZkgAjXP8jf+bx1QY2Aj2Fqg17M0OP?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zMQntmjd/+KX6pU4J04jPbpFPB+ymP3ssW1n83rOMUnPTzEmaFWJx3CaIkn1oj8f1ip4LmMzHi03qIZykkc/vBB24WRivJ5LMA8Bq2IMpqg5icbumuiVWvMcfGOmSVeiBt3pVlHjUsDIJdwx2ifo+o8YUer70sq0jP02BHrHR/heW7KyLu6hlgDVgsVNGLR0e0SNBVeFlF1Qykcwm3LW8rL3gCMJUiU7858MGp9fqjPOd+1qJGNAaxLNh9Oc4xEVdDkzPIkDHbKjFLQ4QLVtjTBGSrRaJpQj3OZ4r1WZC1H0ob9wvPWArszC0+YtzqezrK7B8osL52q/Ogn0VSJtY5Jq1pe5IhbD1jJjBFW8S8oZc8hfxmSCsRy1wS5a6ZdfHxIfnbK2F3jMh0zextuOPfgKePQ1JApHhAqxf/xD01IJlkQZmkeGpwBl1/WrPNd1UuGkJpgWX1oCdp/XJ4CaYAJp1ZrIYhrJz/7zgriGslBV8IFePXzF5YvR1LGEn7L2CTll4vo5xUbIsqY1wR4w44pqrg+lqXSHcDPktfCY3t9XPzWeur1NGNEw4yPIN7tUG95BU9kKmDIvnhz0+aNUV43rXe3VU37ojPardYGpJ+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61526362-ccc1-4910-32ba-08ddd44e71bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:32:33.9065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9eKSopxqcu/Kve4OJLAEeATnZ16+fpH4SetK0UcLFuNmJiJuJTBFemI7IpEoJq1KejROrdsBUBaZjv0FmpU+rNdneAfG8sE60elbpQKUoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050130
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=68924e49 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=jEAmuYqU8eJj74bKMjkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: nOa9NIrSHQrFSFau1bgmcGkGdqhJF2OK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMCBTYWx0ZWRfX5qwcsS9fbVQD
 CaJkT2cEZwunWRA5pruijlqSnMUT8J9JfnZgOjeZ+oCRY9h+lFNYXqj0maqTCUFwItNIjL2MvpY
 D/EFeiN7XMZsZTLB3Zbx9WUbS3kPLlzYhmag8POSUSwiHtdnyFlwf0Ni1dthLkpapRQAYu/gjJn
 ck2MWqpW/kWigfzTntHcN4IICYAE18BDSE1TVS9Ykp3doTuaXfK4xWFXg9UvY4cjnmShIFbnsSr
 AfMEafsLPyOOpgLbvXPkVreyX4PwhbpwnCIdlktKaQiwzQGY62OyDQxdALo7sXxDVlfx5tHkiGt
 GKYpZjd2mECPew2lOhILYbdimIumX9N2fDZqPNhudnqdekL3CgtLDrBr+SLdZymfy0z25xf/+CO
 eABXQf+M4outbz2XNrQgkhvrRzQtvzu8n43i7f9V46BIDa/pGulOWgHRn48ntzmgpWJEw9eN
X-Proofpoint-GUID: nOa9NIrSHQrFSFau1bgmcGkGdqhJF2OK

On Tue, Aug 05, 2025 at 01:50:57PM -0400, Sasha Levin wrote:
> On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> > This proposal is pretty much followup/spinoff of the discussion currently
> > happening on LKML in one of the sub-threads of [1].
> >
> > This is not really about legal aspects of AI-generated code and patches, I
> > believe that'd be handled well handled well by LF, DCO, etc.
> >
> > My concern here is more "human to human", as in "if I need to talk to a
> > human that actually does understand the patch deeply enough, in context,
> > etc .. who is that?"
> >
> > I believe we need to at least settle on (and document) the way how to
> > express in patch (meta)data:
> >
> > - this patch has been assisted by LLM $X
> > - the human understanding the generated code is $Y
> >
> > We might just implicitly assume this to be the first person in the S-O-B
> > chain (which I personally don't think works for all scenarios, you can
> > have multiple people working on it, etc), but even in such case I believe
> > this needs to be clearly documented.
>
> The above isn't really an AI problem though.
>
> We already have folks sending "checkpatch fixes" which only make code
> less readable or "syzbot fixes" that shut up the warnings but are
> completely bogus otherwise.
>
> Sure, folks sending "AI fixes" could (will?) be a growing problem, but
> tackling just the AI side of it is addressing one of the symptoms, not
> the underlying issue.

I agree, I think Jiri's proposal is broader than AI - rather it is about
attribution and (in my view CoC-specific) consequences of incorrect
attribution.

However, I think a product of a broader discussion on AI is the production
of a general kernel AI policy which would cover off how attribution would
look _in that case_.

Perhaps a separate document that speaks to attribution as a whole would
also be appropriate?

For the CoC enforcement stuff, I think that is a seperate but possibly
related topic in itself.

Cheers, Lorenzo

