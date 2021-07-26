Return-Path: <ksummit+bounces-461-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBCE3D5642
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 899821C09FC
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E532FB2;
	Mon, 26 Jul 2021 09:14:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B072
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:14:25 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q9BRrj007126;
	Mon, 26 Jul 2021 09:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=KKR17CSGlSXFpReZ7OzQOPyUGwbog+JM271AF6655wc=;
 b=xyqH2Lm5mi09fXyoI30zpsTkIcNDonaNkgZt1bF86k0Fo6E7taV+gDutcQLOJjJmTRL8
 iYkJqmNTq1NYTUyPA7B7Ee/PZwY/BwFdAmBJ8sxBVxITVrFOSqiCIXmynQyv25qN+VvJ
 Ky60w5VJqXRRtqtxolfdOtMBGuggEnB4wCF/dHsHgoJMbM/mW88Lws+/qMYB1XzGjD7Z
 t/9t/JH92KUkHd+Z7R7YZ6bOo9jM0cMebn5vcyIF0m+WZPkqBatDgNum8SSB91lB5IkJ
 hNWth4w7154FfJdWWk4peuAgl6rcmUSaKVcGmTzxMtMOoqNairC8G0zVigSLSMDa6nqT kA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=KKR17CSGlSXFpReZ7OzQOPyUGwbog+JM271AF6655wc=;
 b=f5MuH6VJ+rHVcaVaRMp3d+HlXoJeOhuwMF9LhjPjtLI55aMhCrWAgx8ljtby5EQRYadP
 ePK0sy/pHiIregqUoNnwjCR2OU+MN7W6d/2EjXKuMT+mg7fNTKQRKNWRs6pAE07PscYF
 rh2Is+f8USRQyyHc+SI2I9+INgSSAqhc8o+Dcmyyssg8U6ama7apDNjcjWgy8Ei9tBmr
 mW8eqbTjQpm1srCa44k63LPCXNv1zznP+Eo2UZtcQ6iILC/pfIXB/WprR350xHKtKqA0
 EZvxh518heahYQPU4Ko5lEaiAvBHEMqjstGwZm/qFY38nBGUobp1qpUwulXlS7hZbouz Ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a0afrtjf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 09:14:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q95cCh066291;
	Mon, 26 Jul 2021 09:14:14 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
	by aserp3030.oracle.com with ESMTP id 3a08we5ksw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 09:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1oT0hNVcO74Cc0D8VEZY66HWzp4et0pQip1yYMLOAvsukro+8k+BGlUStb7hU8dG26dBUK42Qtj+RDVbbmv/KKV4u4h9joyDm5kf2DslBB3Ku3CT2m2DlbQVCi7LPae9oZMGPpe4CacDRg+bAe+JOyeHZT+avjujxBundPrH2y0aKdgnqZD5ACdT4PL+XAaFQZHwsMws3QUq7/SM1Wc5qY7CuiqR/Q16IgsoE0hufIIxofTifCBjIgsYXr4lKkuobK33yQ0BBbPPjwqRZXMuFP621S9GQ5weJwOgAGI8EZD4x7eivvTF3UBkQuV8SJqr3R26uNkC3ox1eiZx5mc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKR17CSGlSXFpReZ7OzQOPyUGwbog+JM271AF6655wc=;
 b=WabVK+i4vwix5ySahn5x/hFh9d1FTIyy1IiYZSJaMW6NCDHGXkdZbw0PFOj3X/EQ6YDJz50j8zFIceS2vET/8ROVnaWKdWwuOJJNSQnIBDxEWXC9+oAYAP43plK1VVPW7Gy69II4zI6qfRG6VjO47F7RHYCvVj8Xg7kzAeXb/OMfWKlmMDLKDwkhj3/g8XYvavWFJvzUW90JXi46mV+BNj5KEk5nVaRHUgSM7/yMZRW9FD19/qd5IT4yEJg4JYUTH6PoHEVuOQFI0nluVPduJ3zSoOds9wpnbiLDoFpGQY61Mxitej3q6lLCIcerdXd5E+iVtCs21GFKT/ljkS1GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKR17CSGlSXFpReZ7OzQOPyUGwbog+JM271AF6655wc=;
 b=cHxuUqY/D/zOhqIcdpV5ATEN3cPZOflP6qd8tl2WRD6mJfaCuU0Mf2r1GtYmd+W/Nkwo4dW87QaVZ7/j0/5y33GEmqP5TiF2aFPU68FcKiLYw+Bm8LIUNV8OyKiK1BR63PJXewGnz7U/xZeiTgNUNB4Wi+eb1fEBnJex3Fem8xY=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5570.namprd10.prod.outlook.com
 (2603:10b6:303:145::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 09:14:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:14:11 +0000
Date: Mon, 26 Jul 2021 12:13:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <20210726091346.GH1931@kadam>
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0065.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::7)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0065.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Mon, 26 Jul 2021 09:14:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3588dc2e-37ff-4c63-6f8f-08d95015bb1e
X-MS-TrafficTypeDiagnostic: CO6PR10MB5570:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR10MB55701CDCA9F531BDCA3B069B8EE89@CO6PR10MB5570.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PnBMm7SltkhBh6x6zBl33YzLk33Kq/z5g8pwUAxvw+9tBown+LBfYQDaI4WmF/K1SMNP27mA5/1cBOVuQU85UhPGVYmiJQLRlkcEv+OLE6/lDwIL9MlLJdpw9zRr5ZM89GVc/5QC6IlzhgI0YWiZbpZMgCmMJjJLNzkw1g/iP8fD6hpi6EjFfVr7mPjA/nZNloFXIGGWzQ9bGtT4Ov9A4o/5kMAyly9rem6MepUNKziGLEQcRmqVmQy8Vk87rn+OhlBXT3ZBXv4CHwiWsx2LQd2kbpQ7Feb/qdQSt6+UeRmL/xpJt36PDeZneiAK3R3H7OnjaeeBw+UTo2OjY1OzV7uBTdXkM3TmlufdTefjSfpjAR8A4XgcdFZQbWideCaR3UB45OZHxj92PdE01ppYmh8J0FAqBye4BPK8lsmPW6NwCQg/jVqL8bar7WR4Q6auFRTsgaN43GF3tLbJmEOGUa2WbXESuJygB2Ce+VtE19wMAAJUiseS7C+7+/xRNlI1gj43GkN2gsjRG6Gf7Xa6l+wuj5TvW1CE1O1OC4nibpuG9s+uoD5XgMyLUEmGMQHAEwSntcM9h1PqSDnM3j3WMqseCyQMgxbzrSPkCcT0yHBeT5bLdP7dgF8NpATMxd2CyTgf4f4EZ9e5OA008PWJcv+Y4+DpYUf2CEbsoDIwRbSqFa0pWKVZIcAvz7Q0FSWveu5FYDOeYbqtpXKWpy/fhxkZS4xaxwSOru6fHl5zbaRzJfPaimHfR54fU5IiiCybZmaXdaia12kavYH5ICS3FEfqLIIfuIIYRzvwjm49G3g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(366004)(376002)(136003)(6666004)(38350700002)(966005)(9686003)(478600001)(186003)(26005)(66556008)(55016002)(33716001)(66476007)(66946007)(33656002)(44832011)(4326008)(5660300002)(6916009)(8936002)(38100700002)(6496006)(9576002)(316002)(8676002)(54906003)(956004)(2906002)(3480700007)(83380400001)(86362001)(1076003)(53546011)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AO3oHJYWOGQX9LGChxsl2XbE5Ns8VG8znKVWoveLWFVakDEUB1lLcAJX/Ydq?=
 =?us-ascii?Q?KSB6t6Sn/+xvboqVVmc/rOzfEHBwXiy6du6edj/xQW6Q5uwpueXX6h7+zIFS?=
 =?us-ascii?Q?dlLjaXP746VkvDdhrHZZL4ZhlsePfPZMPpIn+DmQA7y8608kndIjsHNUbHjC?=
 =?us-ascii?Q?RMC57Tkik+GYU3nXmb1+COVYRPTv50xuS4eTmFG77tJqrdWlUQGNfrK6I7ms?=
 =?us-ascii?Q?Trz65Ou+TMTSlAUdtc5VSOS8oUfoe7B2UVPBQxkKhLxBspLwcgNkt8xaXers?=
 =?us-ascii?Q?GCS3NyCZDUWzHsY9NVs69UksHu99P9clSqgkADEtM92Gh4iag5/nijAis9F0?=
 =?us-ascii?Q?qbVz/SVL+lpBSqX1AKUdcq6nKkHtUfbrihi0IulFjDvBd8U4fC9S3eShFwAf?=
 =?us-ascii?Q?WEpXVd31GQ/DEAbMctSN7RaYiZKHI+yT7hGVIYu2f1v1/Zm7nZjPVHXg3Blb?=
 =?us-ascii?Q?2EDNvOWYUKzp7qZEckicglWJo2IVc+j4h8WQAbe2KyryIglWHmEzFO0zg+88?=
 =?us-ascii?Q?neekVDNQB+oxpDUsdooT+WWvuGT2fyy50aux8cgnG9PCDycz+3NdV5/FQK8V?=
 =?us-ascii?Q?3y5psh5wAZVOS1jn3sTMGGOM7E7pfgEbhcJ7LkYlvBtWuqBIxjW+cDJDfJAP?=
 =?us-ascii?Q?Eqgxz9HWEy6+w6MhlUFVnDbGGpOI2tiI6f4jCphGmYSbFzpGCtJ8Z6iW5F+q?=
 =?us-ascii?Q?Y49+n9cZ0FvBz/3Y2KGIyeWDWinIDOSMqcF/16+3Xr9FF0euwBg1Dmdte9wg?=
 =?us-ascii?Q?b/jq5MnUHANRj6WbrxBIW4rx+W7CqM0Sdeq1mDnAS85H014dojU7o7dZhAig?=
 =?us-ascii?Q?H6BUekJxyAeGVsgoASdQ/YQdVE60mIQK5DFP03+zVkMBQBGJLyrGAnwzMWsM?=
 =?us-ascii?Q?8C4KRZ02UQLByP0UVdtv3pu2pFyoQKC/QCfOfg69ImxDJYy+8FYS2iW84IBy?=
 =?us-ascii?Q?ZQxJB0Cmc7+ujIQdnze5Jq11O0jYEHdOgM+1KNteOdc8y1P1UYJfmvC3q4S1?=
 =?us-ascii?Q?AbkUtOfs/S9gMJs+uH4ydi6NCskxFTOyD3cYSpPaE222e7tFOXgbWA/muTvc?=
 =?us-ascii?Q?lOyKYJDfCl569jHh7yJX/IjFmg4uC3k080FosuK7yb/QV+LCsvnNJD3VKJqK?=
 =?us-ascii?Q?zoLcmTXBQhII2eudZIkW3jiDW+IAktMUn6ISyaRdrF3/vuMhdcPo/fmCGjPt?=
 =?us-ascii?Q?br1+PRwl8Xe8W3nHKnaumP7Tq0fgeEl1/6K3H3TnbZESspL416H1Du2bxAHk?=
 =?us-ascii?Q?Qqthdy94KJMYrdIS/HFz9l2Xb6NI1XVzXoZtB4S/U5RGTYTxCm6qQVr3GS/U?=
 =?us-ascii?Q?0EadG462+cdXF1n2Qq3flU3U?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3588dc2e-37ff-4c63-6f8f-08d95015bb1e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:14:11.8132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JQEU/O2ZIMlWDoIo1BZbF8DIsoQwhYUANjmBOy5Gezwih3f3LqwTS1WupzrMUJ6uVtuphoIUEef7Af7xPSBjYYMpg6d18oY7uIpOCTRFiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260052
X-Proofpoint-ORIG-GUID: flSeLCwMNLuEtgZ5zIdgoqfXYqbrz0rN
X-Proofpoint-GUID: flSeLCwMNLuEtgZ5zIdgoqfXYqbrz0rN

On Mon, Jul 26, 2021 at 10:20:45AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > > To make it work well, you need to know if frob() and/or the current
> > > > > > function return an error code or not.  While you can use some heuristics
> > > > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > > > indicate if a function returns an error code, or an error pointer?
> > > > >
> > > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > > >
> > > > > I think it would be useful, if not for the tools, at least for
> > > > > developers.
> > > >
> > > > Agreed.  I added some code to smatch so that I could annotate pointers to
> > > > say if they are allowed to be NULL.  The implementation isn't perfect,
> > > > but I love having that extra documentation about when I do or don't have
> > > > to check for NULL.
> > >
> > > I can think of four different annotations that limit what a pointer return from
> > > a function can be:
> > >
> > > a) either a valid pointer or NULL, but never an error pointer,
> > > b) either a valid pointer or an error pointer, but not NULL,
> > > c) always a valid pointer, never NULL or an error,
> > > d) always NULL, but callers are expected to check for error pointers.
> >
> > e) either a valid pointer, NULL, or an error pointer
> >
> > The last pattern is seen with the various *get*_optional() functions.
> 
> I would always consider those the exact bug that I meant with "because
> everyone gets those wrong". I think the idea of the "optional" functions is
> that you have two implementations b) and d) and pick one of them
> at compile time. To the caller this means either an error pointer or
> success, but checking for NULL is a bug in the caller, while conditionally
> returning NULL or ERR_PTR() would be a bug in the interface.
> 
>      Arnd

When a function returns both error pointers and NULL then the NULL just
means the feature is diliberately disabled.  So don't print an error,
but NULL returns still have to be handled.  The other mistake I see with
this is when the function returns an error pointer the caller just says
this is optional so let's continue.

	p = get_optional();
	if (IS_ERR(p))
		p = NULL;

It might be helpful if it lets the system boot but generally errors
should be reported to the user.

regards,
dan carpenter

