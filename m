Return-Path: <ksummit+bounces-434-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D13D0AFA
	for <lists@lfdr.de>; Wed, 21 Jul 2021 11:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A39193E104A
	for <lists@lfdr.de>; Wed, 21 Jul 2021 09:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20492FB6;
	Wed, 21 Jul 2021 09:09:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D0173
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 09:09:22 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16L92h80030068;
	Wed, 21 Jul 2021 09:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=SCYiwv6bSakHOLRWBxfqMyU+DpGay5FVS0Cp3/sQJ6o=;
 b=lKw/7ZVn0b4JXeKg6sF3QKyS6XEQgkx7hsmsdeT/jhReTgz0ihx8hivm4NEJ79dyTIni
 oInugiM7bekKFGNgs9nKrub3SXFPdKm8HLEuXm/pGmYMOPbX+Y8rwxtomqWDEkcCdpm9
 IHf8QK1rwRt0BwG49uLGPx2ZoW90EPkW6VBmBkccGeWXcXo5rCKFD8hLJkhUhNQcy8fQ
 fU1jhv90z1X2cw5FcKoeDICTmXKH9X0mhiB0hhExFQiJ+7PYBhtBI6hRuPkMSA/U8EOI
 5a2XGeB5u3GfrykiAsUDmqzdbEQuaDjbSYW0xoNzMpD4hN4DguctPsdFPwpb6/s2DjQx TA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=SCYiwv6bSakHOLRWBxfqMyU+DpGay5FVS0Cp3/sQJ6o=;
 b=izOvOXJhYlp8a9sYPjV8lwXia1PsOrstDcR+M5FomrLI7SrrBgQ2xB0MfKozmSQYkbNX
 L/FvInoqqxFBk9xsPXT2p8Vb/mNeO7Fvn1D1wPoN6gNmwIX57AVB5baeDQTGOHxQ7yo9
 GIlsOWEZdr8bT/Y69w/JB1pa5JQ7C1VvHoVTVEezJJw04NmUsJ3gEcTXy5aQ6S+PcGaK
 r/Nw/x+Zk0TN7S/MR6x/rvhasohAhoWEzw+RuJ2UesErPSCAbAG8YpLSbG+eSkkTjHx1
 Vs3S+a0jVPi/MutMSsOyCo8FvbFrNQJomu31FzsAgHphaclVHBn6KhituuLCS+TicqSt bA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 39wwmtt8y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 09:09:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16L90YQn106418;
	Wed, 21 Jul 2021 09:09:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by userp3030.oracle.com with ESMTP id 39umb29wyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 09:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKMVxuVYwWkLIbU9UgzLLKV4XEG41GF/YkJJh5QW0Lw+cdY3sNCrV84oF8Yzbq3xpiJlga8n9yQjnfPC1TpWzF7X5cYmezL37qG8hrSdPY2Rm1V2kCpnhKManQD3Qh/HR4S2eGMh23eomOl37hcmLYp3ZjAinRVXUm8dnul4+6n8w+KXy8EMFQdlOWuL2oWfX2xYj/8a+CJm9w3U6SJgrkdP9G2tO0yuIrfYfz2gbhR94kuj2tEbpql+OWmm2tiquZ+C1RBYPmvDwoJ9H/ycRsX5VIpJ20dGHpSEyMPoEn9r1I9MB2g7Tt2NNPLkIcrUwyjZFePY1rVY1pa+C+Kpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCYiwv6bSakHOLRWBxfqMyU+DpGay5FVS0Cp3/sQJ6o=;
 b=YHihYqQFHrHUsk5kn6B42NntZjHdRmDc6qvEYOcuev/8Eu5MQ7sO0yeQ4Oj4bEFulj+gzK8SK5WDUqEZVeO9l+J7VuZI0ccJ4XR4Da6IxGgMzXCv+qz6jfBRqXcm+iQuErOoF7afcvAubXaYvNaXfVvRxjBQ9F3UD13WEzlM9xh6Ht87pK/du9AdF9pLm4ju1skjoaxy69geI7knwuDq7g0WYR3xu+eYuwRdkyLCQMe8taLqXlG8qaFFPIKeiD88GX4phI8V/95awo2vmXBPBUUVrP9er/dw+NQgT2c3lPyPuXrR2I8egl2sB0o7qO/pxxCnBjBWCM9Ds+ggv4pOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCYiwv6bSakHOLRWBxfqMyU+DpGay5FVS0Cp3/sQJ6o=;
 b=0GD6bQJ3J0bc6ojo5zh/Lf2DCuiiS4/xplxedvVBIxQI3amsKs+IT5ss7kZdobN3fOi8VtmzOBALjVWvfVOSxgkc/BjfnW/ebo2odc/tdTQERdX2M7vtVtw0O5wj9U8V0TjT3neFYIMPRpjrzcKSemoWspFrbfQ7OS+Wzx5zLGs=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1246.namprd10.prod.outlook.com
 (2603:10b6:301:5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 09:09:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 09:09:00 +0000
Date: Wed, 21 Jul 2021 12:08:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg KH <greg@kroah.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Roland Dreier <roland@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit@lists.linux.dev
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
Message-ID: <20210721090841.GW1931@kadam>
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
 <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com>
 <CAKMK7uHgtGc9ncD3LjHzWxF1eOJ5-M+u=45ZG8-vDtgEAHVJ4Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHgtGc9ncD3LjHzWxF1eOJ5-M+u=45ZG8-vDtgEAHVJ4Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0067.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0067.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 09:08:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b97e80e-4c30-4395-382a-08d94c272d72
X-MS-TrafficTypeDiagnostic: MWHPR10MB1246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB12466FD328E65D26225E40F58EE39@MWHPR10MB1246.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eD/6sHSciguaFBgTY0MRq1phR0hfXZYe8nHNZviY4IhC9OLBN1mPssgZxs0mCEqnJMd5yK0X/QLNKVrTdM7W2HAWb/m4m4F6Gqh/nA5tQWf1SkunfrNRsYSOxrIPT8P7u7bYdO2BGTfGMYX2u2BRDOYkJkPvSlF2KRN/f8xvuqBgF/CIiua+oUoJ2/dH/7QLTr2H6C0FZBCrATJLZ0rNJ1RMRzQttJ7XMCGQbaqxMVKr+2mjPnLnS49zkujhQCFMGzY78E18RBpCGgIyXFsRkuwPDxWgVEVkHkU2Vtvtz+yKXl0NL0u5MquAcXhcw5Cev0HcsAte+VUtozi+YPkNy1S6fl7Msw0WaTQAiTyxCCbxXCp9urzLxsFRtyMwsznt4N3JikPc8d1XWjxeBjBZNOLVTsMSs75NW2Feq7Ag253VW4Uu57zfkcyVz97iNdwl1eZmGbriaIa/7OqYG+kGjdOOd7lqQNjVEz0vF4Tb4W7C4ikAP9r+eK050fHD5JOjnCVXBUQIkUjTSqvBxJxKndE2C9DMGU3HWmLXEplEqiVrCnVPjUw4maNzhJZq3SFUQracb9vbpioOsqVjLe/BzQEnSz3Hi6rPCQeX2dcc5If5UJ0BtWA1+rDUjs1HV0Gjoh6bQthUxoLs+WMuBZbSXRQombiWnNDc7V5BNpJG/IWTT3+TKOXHBHUsRcI5EovpgZo8Hpma75wY0EYNo7P61g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(346002)(366004)(44832011)(956004)(86362001)(66476007)(38100700002)(38350700002)(6666004)(8936002)(83380400001)(316002)(66556008)(9686003)(54906003)(6916009)(66946007)(1076003)(9576002)(186003)(33716001)(26005)(4326008)(6496006)(33656002)(52116002)(2906002)(55016002)(8676002)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+XmWPlPnGdH7T91I071O/c3N0NuXNUG3LSE7tSggcr7ruYadoVUvLqPme7jM?=
 =?us-ascii?Q?1jR0xAmG7d9tXr7Fv603DDE53FwY50scqMGc+pSLfRKgjoXhahFyS2u3vah1?=
 =?us-ascii?Q?xIWhYDE/jBFpTtzUnKPB4Fn8qVlCv2V9r3xEpUqoSm06rzXeoRe/9k15Tkkp?=
 =?us-ascii?Q?/VRiux3YDsgdOt/ugzLiNvyL6k4s1S89RX0GtktZQJLdOY/QwQuJEYz4BQza?=
 =?us-ascii?Q?6vFkA4zJkHxJ4crhvLTw64uk8YcJ0N3nNh0NIIjYrIkFD4JgZ0iAhp+2Xdeu?=
 =?us-ascii?Q?xbtOZ+hcGG/ZbarPdes5pCi/tMOi7CfA+QM2YAoi4H/g5XanNaETV/8Jta7W?=
 =?us-ascii?Q?AOX2Qg+tuI9o1Xj5lO6s+CFnrH3MQyk5DnajqnkgcX+fJTOUo45mzXDD4vhS?=
 =?us-ascii?Q?fAX/3A2sSoO76uT9IpSXp9JJtQaik9X7Z35/3/d6tq+dZLqLj1Jfdxifg3Ar?=
 =?us-ascii?Q?cuDAbsdzk+TXqJNlgvMN6R0T3Y09hgNOIqJNmEU/BEZ0ZKpPhTw3H41Q9Ggj?=
 =?us-ascii?Q?1wxkxPXOT09Gx6R+uyXnK6vbMqyLXvPCINaOi6DbdoyDS2sic6/SQeE4bRp5?=
 =?us-ascii?Q?CxGBoug6Ufqk160K9WhOUuYV7NneaO3OnQgMj6AjAjW8J42uO04s8FHeLFa3?=
 =?us-ascii?Q?Pv9/GnhNDt3V8CqOpgkdr/+YFc7on0nlEax15f+QVl91SD11RTSpqpfxfTbX?=
 =?us-ascii?Q?Y9XnauUMf+pkOnLIR9dZDDM64LPpXgvvNwfSliSU63UlXtQdAPNOdek6utpl?=
 =?us-ascii?Q?ulPWgxMiyizoqia7e0dsxKJPINL7z122o/Yas5zloPzang69JyyFAfrqutLe?=
 =?us-ascii?Q?37Rbzdnsq81VsHRNFvzJD787bjvahoHswu+cRC5yvM5B6qWAUrqhpK+T3ni2?=
 =?us-ascii?Q?rKRXnDVQ3yWjB8FpFzJ2Bi3HO6ZPA3n21BVmvmUmtO0UrEtPNThjwvo2k7pY?=
 =?us-ascii?Q?OoppvhlX9q7IDzO59SXqf0Dd6ITx/G5uN6XUGwWFh1u6hjkdW1EcIe8aCri1?=
 =?us-ascii?Q?fBv4xhcWOAXdNJiqKFTTVXwYk1Lh11yeBLorxEDQznRIv7XfbqhTlAapEghd?=
 =?us-ascii?Q?bHCnbj0NEaxjiqa8OQ57mgwWMTFD/rNHPjfcP1N5EUj6evXPm3UVT03Kf7l/?=
 =?us-ascii?Q?qTSd5GpK4uj3PMogr7fPzUVYzX2UqNFNOdSQHnKHxUHDr0SIzWoZJ/YL8heW?=
 =?us-ascii?Q?GNVHxEXFiD+99MiVdoY289XzE2asnQ2e51PJ1t8wZSSBbw9cRcH8i1kF81Ae?=
 =?us-ascii?Q?eqwC6UbXguKzLWgEz09G3p2jodmIaOXDg3XeolCEEPprDJLrO4/LCUdFTf7C?=
 =?us-ascii?Q?O5xSE3BoaaWnF01tWY3dlb9j?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b97e80e-4c30-4395-382a-08d94c272d72
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:09:00.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmRatvziS3yK9FYugWDEifiXdHhmx3JeqbRcArPddexTzBovIF1NPHf4vGzS7NEPAar/vCNfWgtGXEwXdbburYzCtasBBAhuMjmTvpDH+zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1246
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210050
X-Proofpoint-ORIG-GUID: 5IikN4f4ahFmbOYIij4BDyuLXKVtr6NP
X-Proofpoint-GUID: 5IikN4f4ahFmbOYIij4BDyuLXKVtr6NP

On Thu, Jul 15, 2021 at 11:54:22AM +0200, Daniel Vetter wrote:
> Since we're dropping notes, a few of my thoughts:
> 
> - Personally I think an uapi resource cleanup system needs a different
> namespace, so that you don't mix these up. Hence drmm_ vs devres_ for
> drm, and maybe the generic version could be called uapires or ures or
> whatever. It needs to stick out.
> 
> - I'm wondering whether we could enlist checkers (maybe a runtime one)
> to scream anytime we do an unprotected dereference from ures memory to
> devres memory. This would help in subsystem where this problem is
> solved by trying to decouple the uapi side from the device side (like
> gpio and other subsystem with simpler interfaces). We have undefined
> behaviour and data race checkers already, this should be doable. But I
> have no idea how :-)

So you want a warning with code like:

	p->foo = bar;

Where "p" is devres memory and "bar" is ures?  There are a couple
approaches you could take and I would advise to implement both.

The first approach is to just check directly for if p is devres and bar
is ures.  The problem is that sometimes you won't know if p is devres so
some bugs will be missed.

The second approach is to say something like if we find one type "p"
that is devres, then let's assume they all are.  Same for ures.  Then
based on our assumptions about types, print a warning if they don't
match.  Then go through the warnings and make a list of types which lead
to false positives and add it to smatch_data/kernel.ignore_devres_types.
This is a bit hand wavey but that's basically the approach.

A third approach would be to do something with manual annotations.  You
could probably make Sparse work for something like that.

regards,
dan carpenter


