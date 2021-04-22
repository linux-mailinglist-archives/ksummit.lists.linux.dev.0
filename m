Return-Path: <ksummit+bounces-27-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE7367720
	for <lists@lfdr.de>; Thu, 22 Apr 2021 04:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4EA043E2E86
	for <lists@lfdr.de>; Thu, 22 Apr 2021 02:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295672FA1;
	Thu, 22 Apr 2021 02:05:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5771
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 02:05:29 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13M1n08T005273;
	Thu, 22 Apr 2021 02:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MTrQ5qFib/KLDWgi+vZRDfP3XsJAGtDvEjuH7PCXLL4=;
 b=Bd8VGA6R0+5sTa8BRvDmQBjKEQRvDGS2ahjKHz+xHFcB++fhA/RCo0XQxiu8gcOHOqlL
 O3nYerNVXhDQjv3TWIIFWpIFSvzXaXKF7a/TTds9bGh4b+RauupQgrVvDG2IVzD9ASIq
 9HUx+LXXdyWSDfzS9M2CaOlk19XBuQCcwx6jj8ginX735ZEey3XYsYu60yw35DcSqmtQ
 7Ei0q1Bmy237ZhRveNv8QqBwjCZGXqVVPYutXsKmlWT6kOuJbg6+6iA1byDC0mskXgHr
 4+5xFWjoPj72jlOVFwLBVjnscvEjZy9por9vLi5BqpvgNe/lgGYtvbU+QQGr29bw1V+z xA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 38022y3b61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 02:05:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13M20Fdr185295;
	Thu, 22 Apr 2021 02:05:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by aserp3020.oracle.com with ESMTP id 3809k2r90x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 02:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIkwV2D8ySB2Oo+IuXFaxBDjiV2XMigTPSXwN15dExcC3ovla1HivDyzb3PAgCw3OuE0kI4qY/kmAwBUIaD8on8MxVTFsavS5oyGmwbU1iFIuOQR8/yYkaxQRfF2bjYGZTqwyR1UIlbz/JrCcGNwNg2PkizBWGHvioelqX2PrSO3gAmxOF0je/04QYHIBHoN5V/u1RW55MluhL0Ttfb3dn34ttY86gHygOEgZTt/w8fYk5PGvtMG6Xo74j+q4WxBdwsvUrNdl0tiAb6AWXtRzf8yZr9KcL//02jJr/iEmFABc0x67JW9LWk8ivq6p3pMc/KRJ2kIC+c7lf8tVwkyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTrQ5qFib/KLDWgi+vZRDfP3XsJAGtDvEjuH7PCXLL4=;
 b=DHOkGOZ9ANzyoRMNfEXzmwlBhu3pCrt8gBlxZl2eOh/AAjKaZN8zjzpP7K2SeHbrNc6xL9M2K9lpBHGvWLPic8jUlIktW9I/xCFtlrCYs3OFbb3a5RTMgUo7G288yBzgqKkB/4W1hTlUqKkNS+nVHEdIKHK1tG6L3Tsvm6N5BvrByBBEhnySbLhuLL0Yt8hZcAJCooZp63frix4qiDS34v2ig/NG4rtbLhNqH1fftkoPVPtxEwXFFWO42le5u4qBjog0I4JENHMXxkr9HOlDGzCBtJy6pE2GJGfJwXtT1m8P7d4L6/JpIlUIP4+uuRlddN6TUt0hnY6eB4LnASJ0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTrQ5qFib/KLDWgi+vZRDfP3XsJAGtDvEjuH7PCXLL4=;
 b=qA/qZjgA2qtXjx1DbEZ/OCmc28raZMkUy9t/bqVqNiKu64fGkGmUxpXXRK/qnSe8IVBXB2tApQlH6ChBH549flwOH8e5+K3UHDnB+SBQw84FsseAAyp0bONklBzyEKLLSVxfd4LqY7aQ0TzXGKHfBGbOzHaTeh6Hri+DPuVJmNg=
Authentication-Results: HansenPartnership.com; dkim=none (message not signed)
 header.d=none;HansenPartnership.com; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5402.namprd10.prod.outlook.com (2603:10b6:510:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 22 Apr
 2021 02:05:18 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 02:05:18 +0000
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
Date: Wed, 21 Apr 2021 22:05:15 -0400
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	(James Bottomley's message of "Wed, 21 Apr 2021 11:35:36 -0700")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend Transport; Thu, 22 Apr 2021 02:05:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65cb615e-71dc-47ee-7b49-08d9053313e8
X-MS-TrafficTypeDiagnostic: PH0PR10MB5402:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PH0PR10MB5402B52E90AA97FDCBF604918E469@PH0PR10MB5402.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VhavOONpn4jTtbC0jceNBQtOP3UqBdQZWIfSSaeONfnhyvZ17QfSdcd0IC4wsTWKSCDpaB7PXCEHWhJ/D2elfsKwPfopqeWxl2JBrwFoXp4y0DCI7/OoFWnJpD51RQzlXtrgo6J99JVZkv+ZxgFsBURr/IOIN7/I45+RDg9PWzVcxJ0qv3MXia7/q9aLZlXZrelDn0bGIpf3E4SimpRHfNB4KmZDlREzZDE9hrXvC6lT+tAPIkuu02eMMt52g66TCoFWs4+huASpcoq/TvEfhOlhoNaiih0LzhsgavaSaIDE6yZjb/TJSWyzP+HTUQxSCYzzfRJzBGJUPMQ1q8OiXvJFNd7BNdkxbV2vnRlJ02+6XQsuyO5S11zwCOcxoF9PVWSN8HSXTvsVMKCwFdSK8hluYhH61rxLrItbWfziKepyNo6DA+iwdPIrE9cPuhAGZaG6i5iSfvueXx6OJ/omc0mjLevWFbNpHR7AYFkefV6yBeDk8zMQfw6AO8B9hlT1BZ+9sfFrGo3/mnEVqxDE7EF0EP0bxqUp/9E6hF7OO2HtyPHLRq3EETtU7kkUjuX9BAltWSWC8mlMluBASdqPTJpblL0QXYy3wrmyPFOU+a7S+hsNtnUfgNiRapxVa+TdwJf5FrxtYdDEyFIVMhG2HA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(366004)(376002)(136003)(36916002)(38350700002)(16526019)(2906002)(38100700002)(478600001)(83380400001)(316002)(956004)(8936002)(26005)(66946007)(7696005)(86362001)(55016002)(4326008)(5660300002)(66476007)(66556008)(8676002)(186003)(6666004)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ztivjxE0dfELuxt+346fC28RCx7b4/RnbIEbXzy+Qc7LRjD4YU5M91qni51r?=
 =?us-ascii?Q?uOdGG2FhBO2ChP9qnoiuZwYtmVhgkCUHQa74dZuu9lixa67HRAXWmmRR029f?=
 =?us-ascii?Q?GY3k6PO4yblHDKbHA2UG2XkmF0oGi+G3+b1IIS/fdUXa0fpSZnbG7cSzDkVS?=
 =?us-ascii?Q?OXAPwPqWa+muHrvEzqyKReyKtom/kw9p6DOkAXGInNgSD3pWD/vSsf56Fd0b?=
 =?us-ascii?Q?rRa6l/fnwgLLTx6lub3OmLpuz4gNHlOPU/mnpXdEdoNNzyA81/HKnniUQmgc?=
 =?us-ascii?Q?6DEy03X2UE9FI/q9sbkoOe8uvuPBdHzWYDqFrpwDtVLh7Y31014o9UOMwtmn?=
 =?us-ascii?Q?Pd95/JjlWeLwGuVUYbUSKVHARhp/VhS2jPatxxHIpGkLi3vYldML7AKC9HcK?=
 =?us-ascii?Q?js6gwxhmC49m+3VkINbq1Wb/o0SOSx2cVuBFUKw9/L0cTsR/BMTb6bEMPPry?=
 =?us-ascii?Q?9uLmJo0ap350uOTRxqcqQWa56gs/A57XEUDXkX6nkEiprfTigpZVy9Q2Y/Nn?=
 =?us-ascii?Q?F8ge2BqWOwf+BHJ87l+D3Y/xbxdxlMFTW2AK5Lkfevpv31C/XbJOh6p6CHKq?=
 =?us-ascii?Q?dmQ+3sSYVuXJ96K6Dm2yo84JqMftVYJRWyYmQwCqj9NMe0l2b5VsFRGgNnHX?=
 =?us-ascii?Q?Gsq5+ytfwLYULtg7rm1O7OL0DPgPzu5LExIGZos6sfYmBoQT+kySPoI1xy6y?=
 =?us-ascii?Q?rugLWSxEqRx8sK+h4kAR0tMkRNHFktqUyEd71t7hf/PI94NlkKpXloo6ybcJ?=
 =?us-ascii?Q?iF1tuwJOaX4by3isLsmBCmkmH3bD0r4j1Wslums+xb0O8cUsV76k17TozgJc?=
 =?us-ascii?Q?rYObA+/l8CLyG9dm6cwU9eI4OYIr5yuot+MW+o4UUFdYe3vl8hHjp0d2Zf+Z?=
 =?us-ascii?Q?Ucz6DaDf+UnPRcuLozRTD8dikFNOeAu5WP53WDD0oGOr+6jU/26i7tjKLbfR?=
 =?us-ascii?Q?lQtX19ocl2IfLstJhetDMWI/i7/AOWuU9t9u8qyVasINPnCksmJUsy0BoFJD?=
 =?us-ascii?Q?srQU2HrkiI5dbgVPSeKrxdd8J1QIchjd218a0PalSeALoQiwnx3xPBOPan8Z?=
 =?us-ascii?Q?CwbnNizvZjprSe0/ZRu6kIVdUEkd0es1OiDkCl9M0BvmRP/jXnxyA2FN22Wa?=
 =?us-ascii?Q?vhKZIIU8H1TelmZTY5oQ+7XpTU/7aIeZfTX+/tIb4+Acxd0Tigzfk9RTttLS?=
 =?us-ascii?Q?qvMJodMksNnhIjBoZ9K0fmVYiCQnY0gVXSkWFc1Qhjcs7W2aecz5qxxRZcpH?=
 =?us-ascii?Q?1As/Kq12dg/tgRxLaLs0j6dV1eJMjgoWKRAxxsBfz5vS437K+wrI6BN6ngFZ?=
 =?us-ascii?Q?xjoS49xBz2ih3bO2u+J3t7sf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cb615e-71dc-47ee-7b49-08d9053313e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 02:05:18.6394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUss5tiQlWpU/ta+nLN60USZDRwCc33kFdoG++0sgIVkoV4OrOKSgN+UT/AtD2TrbSV7Jly7XFwY/CSBfv0hsvIv87qH5/JpxD9H3z/VD2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5402
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220016
X-Proofpoint-ORIG-GUID: gBDm3O3R5-3W3NDrPHwylBihw6Fss45j
X-Proofpoint-GUID: gBDm3O3R5-3W3NDrPHwylBihw6Fss45j
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220013


James,

> Our policy in SCSI for a long time has been no trivial patches
> accepted to maintained drivers,

I'm afraid that ship sailed years ago. I am merging a ton of trivial
patches in SCSI.

The reality is that not merging trivial patches is a losing battle. The
various static checkers appear to develop defect detection parity and
gcc and LLVM get more picky with every release. Consequently, if I don't
apply a trivial patch, I'll end up having a variant of the same fix show
up in my inbox weekly until the end of time. I have no choice but to
apply.

A compounding problem is that many individual driver developers are
overwhelmed by the constant flurry of trivial patches and therefore
ignore them. So from a practical perspective there is very little
difference between maintained and unmaintained drivers in the trivial
patch department.

Given the ongoing advances in compilers and static analysis I don't
think that simply ignoring these patches is a realistic approach. The
reported defect list will inevitably keep growing. But I do think that
we need a better process and more contributor mentoring. A lot of these
patches are poorly documented, don't apply to my for-next, have been
fixed for weeks, etc.

-- 
Martin K. Petersen	Oracle Linux Engineering

