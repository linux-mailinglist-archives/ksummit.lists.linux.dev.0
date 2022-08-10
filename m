Return-Path: <ksummit+bounces-745-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9358E8B6
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7025F280AA2
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC8217D3;
	Wed, 10 Aug 2022 08:27:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7ED5CB1
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:26:59 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A7iwqO006818;
	Wed, 10 Aug 2022 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=AaBnAeT132EVUnCd4hQBUf7RmMM4TlsBaIcEbEFyyLQ=;
 b=eWDhP5bLvgTxqPqNISH4DVnQLoTYeRTB6gvEWKX1ERvCLdrAMJtXajuV1MJNV6Mkw8rB
 Du6yAFyI94pAkQVp1rIclReAnrx71Bs9/o2/fAP27c4YcCrrQIKiZMpIwRG0A+U0Iecz
 Ij6Wmky6xquHQMyWzmUzymyk4zg9yzA2LUnL4d8OrNyDcWdKZexPWko8f5BJRiZ++jCI
 mHkZHhJYwjBeJs2OGF7MbcVJzsgumUwBw1ILgxgUQDlp1UDxJ/WXmiAo5KWoGdbEKgyW
 kQE8zP0fP3T8WCoCbhDp7RqK7sNfWsA0pXils8r27B4wRJjkERxoDrPlfVT1Y7yikN91 /w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqgh5ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 08:26:53 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27A8Qg1V020417;
	Wed, 10 Aug 2022 08:26:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqhen6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 08:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVYIbyFb53AQe8F1NXR/d2CzEJ+EutoQALPznxbgv6xU+/k/aBa2wzPY3xTvhVoS55+xQn0MpmPa+mxrd+iREWCq86HJt3efgB+8cfVhkaxKu8Ai6gB/WsxRYrkb3IZPA8x2jzZt9GBbdCk/VZtB8bT/J5oTaAKaYNYFQdzTLWpqiF3k4VbKMBtN/YkbYU0aSyIeGt9igoS+a/ZOTukC4wnZzBiU1FubAdTntvdOsuo+vLdC847KVpnPLMVVIY7TK+nhGuC2ep1ZPz9eoK+St8rGn1wVEbtK3XQTcLXniaew2Mhp0ogXCvLShbV7WpUCtNBMkgs1+XTnVsJQQa6XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaBnAeT132EVUnCd4hQBUf7RmMM4TlsBaIcEbEFyyLQ=;
 b=DuJjksCR6KskJ+B0L8HGekrCT3qJusJ/U5AwoIwT52ZIiron3CpgET2mFhbHxHCn4AzFrKSfAADP9A/ClDdJrJGjaM0cAoVvmNXwKt4GUZugAyI3FuU8IFZgT5hAtx9ArDc3luZm1twahTIUeZFrdOB1+SQRFgwOBkakcG5RbGCMefxLY5CmKY2wU1Q3/LQiGzML5POTaoIwH1V64vbp404ulICcRPlyys682Thc63paXQ3rs4yCPNoVHVGN6NwMGuGK5jGUsErtQYM3LQdOwdp91fJnLUtCwZy1jC+D7T12/z0JgM8bR8ErTZvD6KIv+s4pa1IrO4eGdyZXosgK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaBnAeT132EVUnCd4hQBUf7RmMM4TlsBaIcEbEFyyLQ=;
 b=SjCoiALo6tjdigYKolD/gDGcWx0K5Hr2A8mWNbljctkB0E82PSPE5U5KWhHe+OkTQ6GJbHDmV3Wf7AHZpCdzV08p/jMsnM2oRVxZr3YcqVscJLHpsQB2imWBeDLNbiI9kb9XTUst1J4Gc0hp4BkD+OxagYluLY3U2+uvbw16cuw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ1PR10MB5955.namprd10.prod.outlook.com
 (2603:10b6:a03:48a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 08:26:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 08:26:49 +0000
Date: Wed, 10 Aug 2022 11:26:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <20220810082640.GK3438@kadam>
References: <20220809171316.1d6ce319@hermes.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809171316.1d6ce319@hermes.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a4f0c43-feed-4e7e-bd86-08da7aaa11e7
X-MS-TrafficTypeDiagnostic: SJ1PR10MB5955:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zAXghDCt+MaWuG9863Bszz6/TjX4eFvsKLVo23EYmCrCqxCSkTp3EILJG/gIJHVUh+JcqCUNaDKuE8gIllRXdy6GfF/NVzipUYHSCOOl57OQ/aSpZyFFVIxyS7Wwi/PD3X80DROdOb4mDxUVf5lKqbHQ03Jv2jTWhuV5Csw3dhbX+N3yzf9I1clQeKGh47VSKz076rSzn4+jC24AzCP6hSIsZHJ7JxPX7+VcBUUznKbdPfSUfoAnmWprlES5qDYPYii/nSwP5RWg0xJ6Hh2HIULqeKjulIH4WWxd/6XHfA+ceG1vGNyTZvmC+0B9s/kl4ny1ZN9ylaVcHJTTtDFm9C8ZNFioripEipOyuPMdY7PXoVPYJ+hJCmIOooi5tcCDCiKClkiVCIIDDD3mL95TCluA/004eQA9RqDZ2NnEvIloRJgQIY494N4Bxnd3fUz0yIdncQSACpkld3ETVFXgSbm+hZUHtlydhndipTI9md5qac1O5uNYG+XIWabQnnLLbIAWtaYB3PcwZKZ1LDwlVi7Kv1NN685vdpQXkYbtXLqW/KjnUFXFESdFiw7HaQeZ5SWmxZrP447ESiUU44AoZqcXmPX7ysJsupB5U82OWtLVLwK7O300y9lNmYE4Ua5LIMGuXo6BucTE0P43wgggXIeaUqiOc0z1oDV2tuwILQwDfu2cpLrSg7gtzoZJlOznbYWZDVkLidwgPsgJklBKm4H++SC80qU5v4vQehhsarChCYsGRGB0WYGKTDP+X4lZxzdNF90gah/bCOlc5GGiddaGvAltxyOuSX0RskncsJY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(186003)(6506007)(86362001)(6916009)(6666004)(33656002)(38100700002)(38350700002)(33716001)(316002)(1076003)(7116003)(52116002)(6486002)(8936002)(5660300002)(4744005)(3480700007)(478600001)(44832011)(2906002)(8676002)(4326008)(66556008)(66476007)(66946007)(26005)(9686003)(6512007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kKLemZujmn4O7/1dV9fyAYroO7b7kd7E717IXYKdxbpS36nGAYyYSvnt1VXQ?=
 =?us-ascii?Q?W8BRMBFlQEZVpsXSNN9zTHQW5mMKrjUhw2/iOyuNdz8p+TpbvZ1QgVfUleaG?=
 =?us-ascii?Q?5qAaDlQ2jtbr0iueRGo71jn7jQ7kcIaa8LoQYLc4NED+iUhFwhPkhx1rA6AL?=
 =?us-ascii?Q?EEYsUupPo5xRU/9C6LkP6bqm6vuvi5MKIBmf5BgYVtQ6XJzkwnTg4CknBXUu?=
 =?us-ascii?Q?AvoxochHAYTcTeImK9g5S7bffHR3denhjltasL8yeT7MCmWuxd4MhF7BXvZd?=
 =?us-ascii?Q?24btoKVupOG4JduMGklhvG+VEnoyxCvpEYyMrAuw1yYUyJXHXaPH9dU7MULv?=
 =?us-ascii?Q?ayxfN5Jnec0tM67By3Hyn2DclRednWGoafSxelrGoJnJcvXWhZ1jzEMhwNqI?=
 =?us-ascii?Q?0vT2HaRxRslJSLie+nHfv8oPCQ9POfvZhg1IS+XbwkNzLZV8QUofTYDbGza3?=
 =?us-ascii?Q?9OYk8rnthy9K2lhdlyeAps6H48g8/esCvg326e1zhEMCQgOdjp5WexNrbmKY?=
 =?us-ascii?Q?IwFJcxl/gQlCng2swvLEgLBQ4yQd2sBH/sT6MsPwfBI/LdUkiCQ+s90xgTuy?=
 =?us-ascii?Q?aG1mRjl2psVRy8raspI8ClJUFYzrxYBJX5TUHhaHLNSvC0OREMcUZLERlrt0?=
 =?us-ascii?Q?1aXlKuFBTDBsYEb8qoqLZuOyi1J0q7SHcd3a7jBhS20qpt6ZKqWmSZFDvTxK?=
 =?us-ascii?Q?gUqnROA2qrlBscr0eVjgKJdhykeccAXDiVuv+FU84n5B33EVF9dU/5dA/5b2?=
 =?us-ascii?Q?oVWWDk1c2iVwXy792H3XFm6aDQWgh3sBJrtyQUZ8av4TLYswd9daNr0dYNh4?=
 =?us-ascii?Q?JHouxl+aT/IcmNiD5Rj8uBO9WVkSonR19s7tO2PPwtGl7Vdv/eeS5sS+10u6?=
 =?us-ascii?Q?uEsJebc9s4drHSf53EuglGeyjd/Y75bI7DsWD1BagyHgwaE8S3v7xNEb1ww8?=
 =?us-ascii?Q?2HaYZagnd7wtkI07q1biR5fMKt2yTPm+IqdkES5oJX5nXq+HvS78yhFa75V2?=
 =?us-ascii?Q?zT3zzW3zSma/NEE134hg8A9n6bKNvr+xRVO/laodcEbdbMLogsKGAGD9zy1N?=
 =?us-ascii?Q?pX/ozeMs00shEKeT3kbdwtiV26kkw16dj05CmJKPPmInW9yXbIDRPy6aHRfr?=
 =?us-ascii?Q?y1V+zxDjDMA0te6ySiNArFsbBpklyz1YMUzyMIQ+fNKpUDvloXA7RGvbqoVk?=
 =?us-ascii?Q?8yT/d1rqIxxFnCnpIxS4Jfd6YFuN2it3YaAQ569Q33w/PbocefHTRXKucdI/?=
 =?us-ascii?Q?8ByiNsnmWr0zZC6m0WU2YDajwL01VB3BoL6kplG2Nmp45hQFwpj2r45nxh+f?=
 =?us-ascii?Q?FSpvY+t1KcFAcAwPu1yInm8FJXbKei2rLrw4qv4BHT3FfviLn36Pln+Vd7K3?=
 =?us-ascii?Q?/nuKlsYgBqIggGGQyYsdNhMUp35+3u32kRm2+YvWfswpdjTqOxRR/NYf5dZQ?=
 =?us-ascii?Q?3kErwjS/seo267Dr2iUs+6f5ecA+5wlg100rz0elB1PQyg/K5TmDLyMWxOX/?=
 =?us-ascii?Q?Ceeql/ljAGo5I5HqZCpb+jjhdtZfEAV1/QiXwjDgGu01Kux1ffL5B8TN1Sa7?=
 =?us-ascii?Q?SoczPSN4WCROv9GHBOLCal6zwrpqTGKMvRStn/97?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4f0c43-feed-4e7e-bd86-08da7aaa11e7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 08:26:49.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccNEHGc9by37POZInT6uVZ/jlFoAStLGGGPACa1ybkIwCto+R+9irv9Rn4LEhph7EcXwjcg5/imMQOO8Lpnd4KluLq2OE19SU4uiWcmX2ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=668 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100024
X-Proofpoint-GUID: sInvUcwjMYORT6cKxqZ12FUxzLLQH2zU
X-Proofpoint-ORIG-GUID: sInvUcwjMYORT6cKxqZ12FUxzLLQH2zU

On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> Several times in the past, when using MAINTAINERS list either automatically
> (or from manual entry) have found the mailing address in the file is no longer valid.
> 
> What about doing an annual probe mail to all maintainers and sending
> a patch to prune out any addresses that auto respond as dead.
> This won't catch ghost entries but would find any dead ones.
> 

Also we could add a RETIRED file or something for when people retire and
don't want get_maintainer.pl hassling them.

regards,
dan carpenter

