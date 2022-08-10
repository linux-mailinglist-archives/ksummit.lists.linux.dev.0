Return-Path: <ksummit+bounces-751-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851958E94E
	for <lists@lfdr.de>; Wed, 10 Aug 2022 11:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5877C2809AE
	for <lists@lfdr.de>; Wed, 10 Aug 2022 09:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834B217D3;
	Wed, 10 Aug 2022 09:10:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCA5CB6
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 09:10:26 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A8hs85031947;
	Wed, 10 Aug 2022 09:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=1joAZzwrnF88MVYmKvk6/dxTkmSeeR1LW7bYvX9Ru80=;
 b=EzaKpCJw7ykeFcevr3OZFRxRiX0cxJhPXX+e5RduyiYf8+AqYbt74zNqX50cQOJbxCTb
 L89XXhakiLJCWr821B0AafR3IccLe66OSNNSjBc8LzH3rxRe7iy64Q4vjfOV4ij2WUox
 W89qE9I/l5beUekbeFLZQsAlZDjfXUjUeCJWxSEDPcjUp1VTycgktGDHn4lzJ0BDpigH
 ANXQqoevCrXNKrADqEUfUexoHtWFCkANGxP7XmmcxTCy1HDXlejQSaV2QdTgAygOrI2i
 fR403sRou3konj3foKOe7opyQ5fbD/wo8hlj1O5ZyG2cFOg7OdxjVuPxrnQLzri4dbPz BQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqdsard-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 09:10:22 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27A99ldn010681;
	Wed, 10 Aug 2022 09:10:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqhyj05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 09:10:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaGwK/bsjisGLdYssxO6SGLHyMVbkGJOY5DiR4LL11oZ/qgw5c37Up1a6Ud9yFyglN1P8Xz76rr4hAfu5UTXhZSJUJD5URhkfEW3lvnKnoNTRxCopMa3a7KMwZzeYrJ/BFVym3MsRx7+Wv3F+DCzeQbOCA3ihzbzk59xhFsmduln7VMYMKibnOYhRWqARGfZ5yLHhrbTZhxypay8HH4znktyc4rHc3RA+mxLsPYX6qHud6G7rbpEMEQMkLWIBHcOFdmu8B/BSjUxW/3Q6fpnQfG7u69pFbQrzEQfqryK3eMlW8YbJiQtRaK6/Mo4gu2D4L8Wob24HG8df7kRDODyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1joAZzwrnF88MVYmKvk6/dxTkmSeeR1LW7bYvX9Ru80=;
 b=PjPOAtaywR0/nD1iKlJxDPsI56NOGR+cMTM492cHxYfYAKf3jgjUhoqc4Fat1xMR7985QGFediWEUe9iazY1fX7ldJUSI4gsGXHoXq8/3wizL63R2w6EiGS0nl57uwTTsjxXE8K4iWsD42YgMp6atmjwZUVBxZ2SL9kq3kY6MWk5cTGZxeHhryeVZ0f+2Yteeia9pLiPtIfOC5qOOnqSb4N42ocd8pYbw2NyoJYCpxK+0Ky1tYr5lXVKPwIMNGLKjdGOf//07zYrix8Y4bl714FfAun3qEOdjVMaEnymq7vwNLELymr5GRNmTTa/ZqauKc6CmWeyySOfdZrTiD/v1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1joAZzwrnF88MVYmKvk6/dxTkmSeeR1LW7bYvX9Ru80=;
 b=gNeliZNyeUkCWdDQ3pgnnb3w+B1WAcgItcoN2CJRPpgMUSoa9ck8Pc6a/nZ+2Clrdeh5XdCBaxng+DNyaEt0AsiKGPEE5QiIbnR+qwbkuznsVkKuEnqFlQGJ3t+XJ/+uWITQelgpXXYJrnMh6vCA1/FqVPT0VdX74z01Eb7q7Cc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5014.namprd10.prod.outlook.com
 (2603:10b6:408:115::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 09:10:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 09:10:19 +0000
Date: Wed, 10 Aug 2022 12:10:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg KH <greg@kroah.com>, Stephen Hemminger <stephen@networkplumber.org>,
        ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <20220810091000.GR3460@kadam>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e729903c-6a1e-4a8c-8dd6-08da7ab025d1
X-MS-TrafficTypeDiagnostic: BN0PR10MB5014:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IwQVFL+KWn9/tMgwus9FeJAkWoF6b/NTAe5pBWVnHFyRi2Srqt3SNXUGiLUIZTUPb7xsDu8M2BFfQsZMVLSFZmGBmpPCdzAwxs7RkLtS5O/I8x77HSd/KkR+j3yNXpfKmJ7NZ3r7dg1c3GGrBqsn6tbVnL/NpyoQMQIb7emNKDRr99RXfzNHcj4wBmOTZ+9MsuLeRydOsH97YZy1CfrwAT6O1EE3v9pCC/vmt8ciAAZRDRiWB51drrJ8xdOa8VpNRJO9WpPKlmD7X1AWgnbtNBbHUK0UQkd6yjT6BMrKvrJZCVOa0dTd8kNs7xdtZn25pB4tWbVfCD5p/EbirhTPhvDQ1y3A2iXiTWwbJZjZzTmy/5CPH9fajLkDZJJ5jKkktiUBpUef2OVGw7logXNjUteh41i8Mg3EPaP9ApkVBef6+PB5UGIvmaHfN1fgF5BOSwlDkdU6rGFcZbEg7VHfCjOGbpXrlyNBB6RqjeeodL/3fTmxat0rRmMQlk6NmiXevfW0l0NNmMrOWvdjgDmKBF8KDoJ1E6PSHkcu7Tv8SnVjCaWNx8WlTV+ks9XhxBwf9F1bzmDxQAB3avri3tFItaxeol1R5phHOEg+7lTL4f9P1ABtfKxClXkrTS4VRnNNvEvHhkLQfkATkdK3xekpLbnPqyhPL8Fjhz/A1OHlyDxQeHp6FxPvoFmXYTs9w3k+LBgt96gZ+vb8HvfOB+DxozY3FR9QetNsfeq8FwURIlZ/6xPnlpcajA5ZfhDe1JOwASOTl7/XPubQRqbL0nUN19W4gZVMS/sdMi4BPn8CZjMLKXxHJtjOjIyGC8URgW1k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(39860400002)(376002)(346002)(396003)(136003)(53546011)(2906002)(52116002)(26005)(6916009)(316002)(6512007)(186003)(6666004)(41300700001)(9686003)(6506007)(86362001)(33656002)(54906003)(6486002)(66946007)(3480700007)(8936002)(66556008)(44832011)(1076003)(66476007)(7116003)(5660300002)(478600001)(33716001)(4326008)(38100700002)(38350700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NI73Qj3++Rjn9FvJ0o2S6I/qoKMj3gSfxoLagFMY9uWJGn4wU/iiqXe/rK5d?=
 =?us-ascii?Q?P1wkod/KY9JxL0D1epNBajDOlrnuYHxR6pHcqH06FzvSMVQOqf82w1TSnFn2?=
 =?us-ascii?Q?87ZCK617LfNat1vUAyhYVdkB7X4TNelNtAL8a2Yq/UlCEjwlvq2011YuAAMU?=
 =?us-ascii?Q?/oDxTgw0AhkmntswImNst7sljYYmR6ekmCffzQiOHZuW40IwJ9QHzOcjkxy0?=
 =?us-ascii?Q?15eSnTlzwZ92OWvEOJByGlJKqZBTIyaHcExvnXqI9YHL4Qz4Gm9vfL3kyvHi?=
 =?us-ascii?Q?n047/98Xup/4YsiaxBytRxgGUHYPrndYmFQOtaEn8akCab0JNlp8EssKZoVZ?=
 =?us-ascii?Q?jiaUET5sv0nLbrHZQ6/Vw1/uh18o4kj3lNuL3UAaA/xb6zL2mHIum2VJjRlU?=
 =?us-ascii?Q?g6mdMyQzcpVqWHwWx1S2/gYcLK4snne58FlSTefyOwLquhOsd/5LCf20C93w?=
 =?us-ascii?Q?T1UpyBmFju7R+OFPwTp4Jhj/GfYtbKDYd6+7I7SLdFklrNdW1i1rZtP4vg5z?=
 =?us-ascii?Q?fdVcOMX5BQJwZ7vPWW5rQnvGVRI22YArNZgGK6ht5kwxleC1zOP/cBf7vXlB?=
 =?us-ascii?Q?V/yF9YS4fo27ciGprnvwi1wItOjKbmzyClG+/0fJ8TBrHM7k8iaCLv6+wxAy?=
 =?us-ascii?Q?E+EuuBjWurRMmXNXBIVGDCavknDXi/VmPU+CjXntcbDqg7gwEZgfX3l1bqZ4?=
 =?us-ascii?Q?0C0p7yA1mNWefi/1S/mdOisijLmiTwxvwZtkZ7YJaD8wDydVttG1Qn9TqIrv?=
 =?us-ascii?Q?dkTqaqe6KDcmQFSVm2ETb7AD68tKqU2ZdKaYYAYAPlLCwkB+3HS911VVPgdp?=
 =?us-ascii?Q?rAx0a39dAesHpkxnSQeIKrVeWWuPl1bt3vYlqUxCq6qYZk+QTE/EAVnN8HdG?=
 =?us-ascii?Q?mUav1AsHDtMkcoqRSnx/n3wG+3oDoW8au+T8L3TSC+/mvXM0dhOdrbgqkurE?=
 =?us-ascii?Q?5oL0GgdG8T3zmMi4xLHtSTr35VVZ2jILIWd46dbofHV5qGbmKNv+18ihREhX?=
 =?us-ascii?Q?1Wo66Ct+CiWE5usj8fSimJV+OILksKz8Z0FjFawd7CiYVpAp7tLAE5iWq/bw?=
 =?us-ascii?Q?0tvO/KkWC3wSYDReKtVpMX19KZJojkimuxU7BWPEhtTITUHBnqsLhFzvL/q0?=
 =?us-ascii?Q?7M7eOkRgtzdWkNxyO1R70+Anwsag/H1VuHMjPyQ6MFBF5WociDmBecfN+k/c?=
 =?us-ascii?Q?/swuU6fajk/7k1EWJEOgL8ghi/oiHbXDTMqJohZgFMQ0GQJznrvTSFxVUQv+?=
 =?us-ascii?Q?tz8b3CTTRQkrJMTlgZwaTayA7D/gNK1P9gpKSXgTu6nr4LFmOvkSlfKVcYEg?=
 =?us-ascii?Q?qapUP2jMB1pyws3Giy4d80q+YXWIdBPV9j6u5Lbs+ZsNu+DgRuEDOaxdcTL2?=
 =?us-ascii?Q?/IKyIc2xejrBx5qVXytO6p559lhjRzrjQUKa00Wu+K5ZNeU+47DDduBMTr9U?=
 =?us-ascii?Q?BmtQzp516Y4/BcPtjMRP5bpGf0if2GqZikJ9BeFUO8VQIawb+awIf2/oKa85?=
 =?us-ascii?Q?EEDJ5nBMYdVSN9YDEj2eGrnliWwxNu0esmpflDkVevxIw1WhgjwQe7itOclY?=
 =?us-ascii?Q?9wV9hz7IzjrnSZOVUhba9oatlaIkDWUjemb/vsBLJc9QU0JataeRYZxtUVn9?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e729903c-6a1e-4a8c-8dd6-08da7ab025d1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 09:10:19.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsRcl6EAXWUaQGz5FbpU2PGDnpRxVLUt75VqaXCE3o5hRXNPBxeD14ezwLvICxOb+jzYzlcTfZ7e/JTwXtCwVv8Mdsw/FNZc784PhtY6/gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5014
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=656 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208100028
X-Proofpoint-GUID: iWiJIi9YXnb-vTF8A0Kgmax4RR2yZMMX
X-Proofpoint-ORIG-GUID: iWiJIi9YXnb-vTF8A0Kgmax4RR2yZMMX

On Wed, Aug 10, 2022 at 10:55:44AM +0200, Lukas Bulwahn wrote:
> On Wed, Aug 10, 2022 at 10:50 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Wed, Aug 10, 2022 at 11:26:40AM +0300, Dan Carpenter wrote:
> > > On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> > > > Several times in the past, when using MAINTAINERS list either automatically
> > > > (or from manual entry) have found the mailing address in the file is no longer valid.
> > > >
> > > > What about doing an annual probe mail to all maintainers and sending
> > > > a patch to prune out any addresses that auto respond as dead.
> > > > This won't catch ghost entries but would find any dead ones.
> > > >
> > >
> > > Also we could add a RETIRED file or something for when people retire and
> > > don't want get_maintainer.pl hassling them.
> >
> > Isn't that what CREDITS is for?
> >
> 
> I agree with Greg here.
> 
> For:
> "a RETIRED file or something for when people retire" -> CREDITS
> "don't want get_maintainer.pl hassling them" -> .get_maintainer.ignore
> 
> Choose what fits for your case.

Perfect!  Thanks.  I had no idea about .get_maintainer.ignore and
started to implement it myself, but it turns out I am lazy and suck at
Perl.

regards,
dan carpenter


