Return-Path: <ksummit+bounces-114-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 44520368596
	for <lists@lfdr.de>; Thu, 22 Apr 2021 19:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 20BD23E65ED
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06472FA0;
	Thu, 22 Apr 2021 17:08:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97F71
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 17:08:56 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MH6cES122577;
	Thu, 22 Apr 2021 17:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UCQChiDyA9XA7jde4P5UvtFTJUVc2GWXAq8+6GYj4UQ=;
 b=vYpkbBhntRkGjE9O6QOy40xf4b296dfq01AzWGnlDbRo/WZFDJ8/+zY+jXw3cvuig4QZ
 v6XT7S7vk5hAPbgA6lzrzS779W4O44X9izm8qFMA248dpOIeKfHL1+rnx+kSTJdSBJbz
 iVE3TAZ3FW349Sim44tKSN4zyRGWiNkyDJiM2sTv0mhKCXd/EwHgjEDhsmFaAWhZfSh3
 wPllM0GlhAcf1W/XjHXntLeFmgIoonp75j7c2cZCXqb1TAxQQ7mUhI2h1AsJU4BE6USV
 VIs54Zf2aYXQrBDCfsb6HOSX/6RF+FpiLUx7TKP+69zGjFkghkM+y8CPD+xYiGJoECpn zA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 37yveanrsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 17:08:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MH61g2166148;
	Thu, 22 Apr 2021 17:08:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by userp3020.oracle.com with ESMTP id 383cg9ae19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 17:08:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwIE2ywW/HmTPusruOwEA2DYCewR9LGLIv43ax7THKC+hdl/wyTcC9GveEjT67hVULHldBcG1VUGuzys5Y3Jl3fTgFnRPlmB0uc5vqXhr92Ti6VQh9qb/PfBOEVJps+57pYOtxTN0pS086rfxir6RX7sA9iSzPHWe2XyMcc44+L4iRZYNJ9L8KMIEPyK61nRbgpb30NEr+I1EwGvLXzTKrOKBUfbk1W8FfQOdZhBBetN9Ivczu2PepT6D8n8I7KFX7YRUIEj5n9QV68vV57zP64XtLRlxcr1Feus1y8x3PxJznv6H54Sa15bcDoU6a+uWPG8o3LzHK//KRkcdk99HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCQChiDyA9XA7jde4P5UvtFTJUVc2GWXAq8+6GYj4UQ=;
 b=UGfA9oe1dMJl5e2qMh739KuUB2U6PxDVP40mearGGrODvqU2vI4JORql/tu3cnh+As+qRKgtjGKjMDzR606/yMUGeuhFhEE6COvLKUfLbfyRiDzOItA/6S1CktSNT2PDBkzjDkZlg/e4XF+SUW3BJEhM1M9y/RtB1DqQCiACNfDMUTlwvAw5QQz9RsWHhZ5mHlOR1qCffU3rn8XTEUwYJVWjmHsmIguIJv13ZFR2R2CrdDdtlRxYHIlpxfCN8pKlFFddo7kVAQX6Kk4rEv7cnXPcW3WqPGdM/4+i3zgALquyNodn0uJlIB39KZ6Hclmr42DBHeZ5L8t9ZB8muahvnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCQChiDyA9XA7jde4P5UvtFTJUVc2GWXAq8+6GYj4UQ=;
 b=ti69sLsi81Wv1KFDky1V7bwyngcWvNEqM9YCGhtS6GE9CHiKz0el7Uj9tk4X7im1J2lZd2VXseEiAC2dTiAplK7BeecENV6ORL5tguhOWmJXoPSM49IBeuDD12qfW/aaB+V85QfQjLkRvq8CVDswTx3y1qSY0Tupo+nxhDtdy90=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4519.namprd10.prod.outlook.com (2603:10b6:510:37::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 22 Apr
 2021 17:08:14 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 17:08:14 +0000
To: Jan Kara <jack@suse.cz>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley
 <James.Bottomley@hansenpartnership.com>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq135vis349.fsf@ca-mkp.ca.oracle.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
	<a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
	<dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
	<20210422115235.0526dabd@gandalf.local.home>
	<20210422161340.GB8755@quack2.suse.cz>
Date: Thu, 22 Apr 2021 13:08:09 -0400
In-Reply-To: <20210422161340.GB8755@quack2.suse.cz> (Jan Kara's message of
	"Thu, 22 Apr 2021 18:13:40 +0200")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SA0PR11CA0135.namprd11.prod.outlook.com
 (2603:10b6:806:131::20) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SA0PR11CA0135.namprd11.prod.outlook.com (2603:10b6:806:131::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 17:08:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4737f602-d769-4cf2-08a5-08d905b136f0
X-MS-TrafficTypeDiagnostic: PH0PR10MB4519:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PH0PR10MB451932CCA7ED1529989263FD8E469@PH0PR10MB4519.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P14bjbnAGjsrxDzsoXFgGqDyGv2Mti4S9BXBOqKkfT4p9LYGxYp2pQM4LWgGfRcxRLc/qtZ7lfzOHONWevqHAKU7P75dthhk20mNZVGxNyRNHARYCdvgbumbR+oCr+oH2TB817LeDCIAM2u5aLZ8SoB2JC+GZJjMpF/BcdRugJZRCQ8KG7yMjJAZishNyWbcBVPK1ALGFUGulKFVMo8ISel6ntkREL6x32iBhE4xlIpMwjM6jCEL7LQN3bpDWviQG6eCCoRWBhcNdZVmS8LiaAXRdFXuTf8tGQZFccZWlM1a7NMOrHp9PmmM0SUBY2ZrAUq9X19He5myuct/F4GneiVmqUqQ2fTPa+NWhMUqdDrMiyDtu2t4vYrIqZlZ60gM7PhI703JhzWxqRc0vxYHuc8fPT35XGa4wq2BcSsOxrMFyO8ARB6dCm/1l0Zk3dTDw/3K3uRjGc66iUrsnJaezBGkpu45pjZyC/X0X6MY9/dOELd/aHZoj9t3eQbgthSMRrVG8zjZVfrNggG6Un8IAKbD4i0eHELaXT8W6ccDcFYVYEQcR6ztB6/kzPOyvOJftF5kWxCzAyevciOVHuxNWNh5sDzdr5wyu2QinWWHfn0FH3Vp51Xj9cNysayi8FxhPp4/E6ES/u19zJzBjclF2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(136003)(376002)(366004)(54906003)(478600001)(16526019)(55016002)(6916009)(38100700002)(316002)(4326008)(38350700002)(66476007)(956004)(83380400001)(66556008)(186003)(26005)(6666004)(8676002)(2906002)(8936002)(36916002)(52116002)(7696005)(86362001)(5660300002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uF0HnY1cytE4etfCaxgIulGbTqUVnbd1+MSP7cU9/hTsmMVFdw6DqjDGGFmz?=
 =?us-ascii?Q?uPMP4a6Puy/KCO9ztHrM/twNXl+MAR9f1DNvdWoPxDgpznr7pGFOB872DW6i?=
 =?us-ascii?Q?iFc6VCI5m69+ZewyxkeUHwx14N2/YE6azrPaMsadKPUFnd8PuTom8qAKZQIA?=
 =?us-ascii?Q?70KD/aTmiFcGhZks/IGh+E+DKdl3Lj3lpP1kHWoNr+yiTz+M939yHxOS2pBh?=
 =?us-ascii?Q?V2o58BDHg9iTX0FZYhb/nSz393mva9D5ZQbq4gGO1evEWRYU3f6GgHywaZF2?=
 =?us-ascii?Q?kRLOHRjc9fXdHuEETZvgwKNiWXUtQH/8SnJv/gBsrFJ5tmGkqJxynQ4E0NhM?=
 =?us-ascii?Q?MmFogyxqkcGDZ2tJ/yRLYpxQ8cebJjxiZXgl2n3pEra7vifpMaJRzNTTINC+?=
 =?us-ascii?Q?as56t2cYutDgyzvUECTSGsuDujp6z6T9aZ71ct91kc8GTbivlP5HCqyLpzho?=
 =?us-ascii?Q?erpRh35+nDAps3nHJV93t2MtorgZu/aX57PbGZTACcxGKuTj/4Obsr7yxcg6?=
 =?us-ascii?Q?efdF/1INpBd/a4moaXoK4KA77eh0/zR55XtyAr3AKwcBtTNVEi3LHG60httL?=
 =?us-ascii?Q?TVnB3Pq4Us9rp746L9LVzB7Q8HfXIXuizG7bkIZD1pIglkJiDS2hspF3z9xA?=
 =?us-ascii?Q?ZzyXXW3kpT5qV4aweE7S3u1Q6BF/UNZukVhUsushD458w7tM4POA3BM8MomO?=
 =?us-ascii?Q?T4aOvEAMfCQQJjMwUIUBBak6oFT+iAsXkTKr6sOCj0Un/8XiMxIiKq7Lg+Rb?=
 =?us-ascii?Q?nCj0SmU/fHBVD+C1Io/PhcOrtmKHApyaKdlgK6+DvUKb11Z0Qzw7JxcpT4Zi?=
 =?us-ascii?Q?RvTQNKxYUe8+2Ae/brWT1uBDm+3G33nPZ8/LsiFkN8XoxUnc9mV6EYdw/L8O?=
 =?us-ascii?Q?tG9c9Un9ds9xD492StIilMu210Ec+0L5vsA6ROOJlvbOnr429SKqka1qgcJg?=
 =?us-ascii?Q?DWCvFM6/6Nfe5MjkYH9y34PWEW92QlmGwCSdLwcfEUbkeBtU4gPaIQcLqOEs?=
 =?us-ascii?Q?RW6Q+AqDd9NZjkGwTOSww10zV2+McmAqd97uk6Ge8ZJ3UhqX8L2lO/1pRCSj?=
 =?us-ascii?Q?grQlB3b38hECiNuERgnLGF7bhL5TksaDSPhUQScYZ5vvLbWDZMnr3AtwPqKa?=
 =?us-ascii?Q?3mXbCHoLRVV2AKlpgpjoFGFmwdvsDb7ONerVUQKG6YW3kvh83JjxIAWj+MjQ?=
 =?us-ascii?Q?IdAaD8a2WkP+apFw3zY90Pu9taIGJ6eSDt8h2gZZMgP9GmMdGb5j5sWcH5MU?=
 =?us-ascii?Q?qx9kn7HGr4ZWo2A08qMpFUkGW4vrhyqlnajea60iwI0NHLywFykekrJIkWa3?=
 =?us-ascii?Q?hSE+EGxNZaceyHFXJUQvYJJ2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4737f602-d769-4cf2-08a5-08d905b136f0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 17:08:14.0199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdBczP/IXKF6XxnU7TlX3AT8oivH59GPA7z7DjDrIYvJ6sJDcupHrOfOFHlgUUq4K1XN4ka1N4JUctHWk9ZAZeX/YhpdJgHktEE++5U/+As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4519
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220128
X-Proofpoint-GUID: eqdy8j_6YUJoQm-Uyu9NdUExjw8Qup7-
X-Proofpoint-ORIG-GUID: eqdy8j_6YUJoQm-Uyu9NdUExjw8Qup7-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220127


Jan,

> Is it that hard to improve quilt?

Now that we have tighter integration between the various components of
our infrastructure, I wonder if we should reconsider the patch
submission process?

Instead of putting the burden on the submitter to pick the right 20
mailing lists to CC: and accommodate 100 developers and maintainers with
individual delivery preferences, why not let the k.org infrastructure
automate that aspect?

Have a patch ingress email address that runs get_maintainer.pl to figure
out who to reach out to. And then everybody with a kernel.org account
can twiddle their preferences wrt. whether to receive the whole series,
only patches that touch files they are responsible for, opt not to
receive individual mails but only the relevant mailing list copy,
whether to receive stable backport notifications, etc.

That would substantially lower the barrier of entry for patch
submitters. More work for Konstantin, obviously. And potentially some
transitional grievances for most of the rest of us based on our
individual workflows and preferences.

Just an idea, I know it's a bit controversial. However, there seems to
be no shortage of problems originating in the patch mail preparation and
sending department. Seems like a bigger barrier for some than developing
the actual patch.

We could even consider supporting receiving and disseminating git
bundles on the ingress. That would help overcome the many problems with
corporate email servers vs. git send-email. A ton of problems are
introduced as developers copy and paste things from their corporate
email to GMail, etc. Seems like our backend tooling could help alleviate
some of those pains without completely wrecking the mail-based flow we
maintainers are comfortable with...

-- 
Martin K. Petersen	Oracle Linux Engineering

