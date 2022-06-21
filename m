Return-Path: <ksummit+bounces-678-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E6E553593
	for <lists@lfdr.de>; Tue, 21 Jun 2022 17:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F7A280BEB
	for <lists@lfdr.de>; Tue, 21 Jun 2022 15:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B7C10E4;
	Tue, 21 Jun 2022 15:12:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688DEDD
	for <ksummit@lists.linux.dev>; Tue, 21 Jun 2022 15:12:35 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LEHp86012569;
	Tue, 21 Jun 2022 15:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=MIn0pQK4ZS0vRa1Xbejk6e1tL16wu/l8/ygiwAKObZA=;
 b=eLOfB+kfKfYdQE4FPkQxT384aF5gU8f2rLu9aPIbrDthihklMoAK1vX/lAHr/BlyDyqZ
 H9/wH2PkUIJXzl0/g4LxfCnySM4ZWYY9THQZOw+L9rsjxgjQ4SJ+/9q6euagI4g7pMgQ
 aj3hP9l3s7LRHy4FAeDR8So3fCGBLUPFupqZZEYQ3yeFq9C52ko1zcvPmOpJmhikUPau
 kbZsJjuQEd01YwgMkz54+guOCnWA07hgH0a76zoe99u7tOxeRYU8A5pICJBl0Qyo7ELU
 KUGE+E3ULSDeTZfnH4IkYFKutqStAtJMXp9SBubFjJ1Hoc704z9aUuksEIdTqnGiTQDM hQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6aswvq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 15:11:46 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LF5vdx020428;
	Tue, 21 Jun 2022 15:11:45 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtkfukarc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 15:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv69ri+h+KRecd4kE7opbrDhqOSV5lDL+dgIEereghy4iSK1MuT87nqbccjgnbcqDXU1q75s5mfwS6Sg/0nVm6xMXJLxdiKF54SvbD+yO8VvOYwb5J6oga7aPkPUAK3n5dZf069VeONM0sx36cybIyDP5kh068MyI5JCy03YqTXm2beMij2sLvOKVTV5zf4sQwdNVLsmz7iTVrDEznApxJmy+sdxOCmGjBTe+d5vUkXEBrIxtHIWxbMBGseUs2gQkBBr2nunflb6Y8HcXQL3klWAjsouz1wmnWkv6FqNvvAiREh0PBe519mgIbHPa5oh8FKYYDQzr5bKAlmN8/j0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIn0pQK4ZS0vRa1Xbejk6e1tL16wu/l8/ygiwAKObZA=;
 b=AIesg7qOdHpnvgB+9Wyen2bRLdM0byp0zGVT8Qug5ZXthxeHOrxWeDUPhzi3S5nkeKBsDUQpHHBg/WGgp9Gtaopq6aSc2feC0FJIeOTVsNB5Hkb7L9HqWbs3wQz5zKUEK8wVYuGW0VB3jHJOXhjOfiy5kDtSNsVtzmPokd5fqEOO/CwpGyh82pvxA9A4Nx+MuSGfb/KQsoit9asDrhmbNFOBX4+8R141ZVlfghtxUfJoZDjX1oeggDNE8yq7sE6jeVpco0UVpxbGeRWSypMFl0p5Rvl9MpSR7QLoX5+ifrViRtEtIEfaqY1N53tYZJ1tgOqLQo7SYeb7UjmyTBKJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIn0pQK4ZS0vRa1Xbejk6e1tL16wu/l8/ygiwAKObZA=;
 b=qU4L0onfM4ulX0st8GdPeRtONAlK/PrcAL83KrINrO0YpjfibzQjva5nmBmsYNy6Msno0VIpgTC69bGE9Uy9cb5Uh6CR3YYTHshfrm9dIhB0T0cc+IS7hkUATgnsPl5PbsfJ2WygNT0tSQr5qYVCS12YCnmglm9enjpnpw70gJM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4506.namprd10.prod.outlook.com
 (2603:10b6:806:111::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 15:11:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 21 Jun 2022
 15:11:43 +0000
Date: Tue, 21 Jun 2022 18:11:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust
Message-ID: <20220621151122.GL16517@kadam>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0044.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::32)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3757acb8-28e3-49ec-0bfa-08da53985972
X-MS-TrafficTypeDiagnostic: SA2PR10MB4506:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB45061FC64828E70B9657032A8EB39@SA2PR10MB4506.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7QJjyp23BeYiismr9/zUsYHuq9Cr6TGAVqvxjx/YG5jLvHO4GPio92jMfEDD4csWSqNuG8NFaa8RaGs3TXMjKQ9WYcxBThv6k0HkWy/wnGGcy5hh5ydsIRBWenHfJFoDEdcTENVSE+2bMpN8d/UbzhPR2AMxFryrw7YJs2ydW+D9ZKJl3pxwaluTNq7JjmVe6W6Ip6cQttwdl2jUvqS5HvDSzUbpqm3dJf5BiqZVeJrbhMKbJZg+BPN2YysmjDffiq1rpguf1qMExaZCs+s2bHMwdqFx/e2fUH7tSoGPmkfjYB8oT3cLC7zhQa8T7FWzYBIvChQ76+DG8QYvUkjueRCzkLqmWs2rfAi8k+peKidxPO1m42udCCadIyvuiC7YsgBVOvWO2lN7xgiVWfyNfnJOcqvr7qjXuqXcqSsETpzY+3A7nZ34nIy5gfgEWcUTPAqKX3FpP067gEALXvny4FR5l9Thx73BkgbUS4b+KbE3ovGJWnEozaj8iua2Yw/Cm3uw5lDPbIeYEa9tXUXYjS3jXsM4IY8D6rnUqt4hFG4WDPR+zVnbRBrW+8Oiy5f1G/Xct6LBU/cwqHgSNHniAfbjrbkXConUvHx+ULGOCVS1OZLakgpl2NZpJslrhH22nPoEO/xM9PtcV+nsl3B9ng7l7nlmr8WmXaPsXjnNK+iC9+wqNNKQ5EnYKw/5o372S8XP3pDW8LinSsy18v2NxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(366004)(376002)(396003)(136003)(346002)(8676002)(66946007)(6666004)(186003)(4326008)(66556008)(41300700001)(33716001)(6506007)(9686003)(66476007)(38100700002)(2906002)(86362001)(26005)(38350700002)(6512007)(83380400001)(316002)(52116002)(6486002)(54906003)(5660300002)(8936002)(478600001)(1076003)(6916009)(44832011)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zHRiZPhzYeRJSuXoBbFeBmjtuKyrDwuxiANkPdY/Zg3RkkvvWel87XBaf851?=
 =?us-ascii?Q?qqvJpZnlBN4PFoRQBcRHb3lkpPcdQ4iKQVZ/mgmH50nFUZJUaRWd80TZAcCh?=
 =?us-ascii?Q?U3tjKq7DqUgO/PCjW346awt8iqwAq4V8TzYMwN6IyCEAV1tvrTSvcF369Eiq?=
 =?us-ascii?Q?LG6oTYkcXKEcCqB9aZtvYMuC1uZ24PCObWkmw1GPXu1cZxtH3h48xtZNim9Z?=
 =?us-ascii?Q?Ks6JkfYm4PqJEjPlDaHoFa/umMXMTVpwcyzgry0KpKP+uNnLOsH9nH65QO5t?=
 =?us-ascii?Q?V0mZ8YLcS5JtuZsmHXxZQPSaUt2i2PfoujQwD1EN1Sdiso5t7DKH44QWsTKV?=
 =?us-ascii?Q?P5QI2+DNKhgSDSPRjwRNuivreoXcDYCfiMecbsPUGSQdeTgDuIju5nHVB2kz?=
 =?us-ascii?Q?UGaKIHW/CM+VRuN2SZoKX7VX0ZnzxD3VK0hfFRcVCrMVtaWDz1shErkdw7wp?=
 =?us-ascii?Q?ObUPMABPtUPZwfFmykydZ9x94ArkzmjsmB5Fc/YnBMerQmf5jPiFguEsSv06?=
 =?us-ascii?Q?kOjYvaWdWfBEb3Aw0z1IyLPZEU46uHloziiJSeE2bkyNv2ussdMuWEtBkzhE?=
 =?us-ascii?Q?8RU0yz5dmAfxnHqRzt6RkPMmh0BQslYBFozta2SyAe4RoBgAU8V/hEMR/oGt?=
 =?us-ascii?Q?5Vjb+D60bTxvEraWJNsa78nr/ul2VSh8LYrYV2WazmjyY7Sp5XSuXZf+kotc?=
 =?us-ascii?Q?MeWltTZ5ivsWTF7sQbtpBTfiCpCFBS/2YmfmpGJV8kvcZrZnCovxtu33VPfs?=
 =?us-ascii?Q?WLr07Clwo1wmkqUAdSXXjNvBggfMlNJUvtRTqcQQdf8qsVHDEDzbk8vtFADv?=
 =?us-ascii?Q?pAwJeRHORLh1mSOv+hga6HSfegvoh/v5/EzguZVI7iGdV/2M+PkHSR/Uev4/?=
 =?us-ascii?Q?D/87LoI0Fa+QYlAWhcYEUelefJU1B7M7d1atnKMJihrjwxJchkFElaU/dbjw?=
 =?us-ascii?Q?obcTUxo/S7s7clWd6GwWXwhCFX+1Z0+nO+6tea0tI4xyJhRJ0vsG243+lpJu?=
 =?us-ascii?Q?LfXOShbt/YhoBr37Hy2gZGMD0C/zqROSG/vSDtO8fQD2/n5/7D+ctoyzU75h?=
 =?us-ascii?Q?bIR9+jZNiWpgGw0FqM+0tx4OFQ8tJOfvZpEF4gkKERQoSN85mzYf1DLBraAH?=
 =?us-ascii?Q?0BySMvr54dUQG+3/C1YnWRx55x764nduud3/5k/zi4HzA2H3/LKacMLuYapO?=
 =?us-ascii?Q?4c8m1W5ZdvAwyagPhI+5R2PCD5BeKDEP2+ZDi9dQrvKgXj9Q/QOVgboO34Vm?=
 =?us-ascii?Q?5lvNereOQkYLcl67yerm1SpVdP2XfC5BtR7cTWx/ioXP0drxhmUnkoYRqao7?=
 =?us-ascii?Q?iILTusnT6Pwh3c2op+iiWlpyZBBYSivxa9COXT0x3PH4HSGk3kQxyghzjN0i?=
 =?us-ascii?Q?tmtTOmsONvw3Lw119W16X0FC7atizJaIA8EA8tr3Pu6I34Y+KpOLn/Zg2l3k?=
 =?us-ascii?Q?q04T0Aq7V7NH6iWeaIAuwqJdIMzkOUgVUT55fESFKVVYNMRkBMTmFBpSXaAq?=
 =?us-ascii?Q?4WEllVroqvXvS/8AF79bW/MXpz5CgEaviNBdZH2PChjv6NyMgO6BfGGOFlpv?=
 =?us-ascii?Q?jkMANOzR8PIro5mIGAuPCAgC9w2/mI7/w0gJS20xrDPS0gExv6mrJTGYnJDf?=
 =?us-ascii?Q?iF+8fZPL6lFKk5TEpJ9yqYyn7PXAxtLHDLpIpRfwjzly//7UswutXUyhWmT4?=
 =?us-ascii?Q?iXih3Aj/olR7oJDkjtZ6yCZWs7GXYDkwaBtu1u/qXSA+7rKGn7IapFpc+o5m?=
 =?us-ascii?Q?a27Ylg4oCI6BEGR9bOcIo/5iYroVsak=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3757acb8-28e3-49ec-0bfa-08da53985972
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 15:11:43.3220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVK4TuA//I5JyObGW/qz1vX6NCPS+0PVif+HJXOsREr6zL3racOkdNB7wzPSi7KjMOPaZankft+om5kSCvRmUe1WkwPvvYAEuAzqqkR5kKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_08:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=483 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210065
X-Proofpoint-ORIG-GUID: 7ZzjBsqBELfQFq8rN9coq6hJcLKNCbQS
X-Proofpoint-GUID: 7ZzjBsqBELfQFq8rN9coq6hJcLKNCbQS

On Sun, Jun 19, 2022 at 04:49:18PM +0300, Laurent Pinchart wrote:
> Writing rust code that compiles (without wrapping everything in unsafe)
> requires understanding of life time management of objects. This is also
> required to write safe C code, but as can be seen through the kernel
> it's more often that not completely ignored, especially in drivers (just
> look at how many drivers that expose a chardev to userspace are happy
> using devm_kzalloc() to allocate their private data structure that is
> accessible through userspace calls). It may be caused by a combination
> of both the compiler an the kernel allowing bad practices (the fact that
> devm_kzalloc() exists without a huge flashing red warning around it
> shows that we either don't understand the problem or don't care),

The answer is that we don't understand the problem.  I've been vaguely
aware that there is a problem related to this but I've never been clear
enough to the point where I could actually tell if code is buggy.

It sounds like something which could probably be detected with static
analysis.  Most of the static analysis devs hang out on kernel-janitors
so if you see a bug and you think it might happen more than once then
send an email to kernel-janitors@vger.kernel.org.

Sometimes if we look at a patch then maybe we can identify several
heuristics to spot the bug.

regards,
dan carpenter


