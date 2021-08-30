Return-Path: <ksummit+bounces-491-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5A3FBDDE
	for <lists@lfdr.de>; Mon, 30 Aug 2021 23:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C232D1C07A7
	for <lists@lfdr.de>; Mon, 30 Aug 2021 21:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2493FD0;
	Mon, 30 Aug 2021 21:05:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3528E3FC1
	for <ksummit@lists.linux.dev>; Mon, 30 Aug 2021 21:05:36 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17UKu7Eq005156;
	Mon, 30 Aug 2021 21:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=bsfOtgB8ULE9NlUbGGkflJeu25iGkdj4AiZehLR3xHU=;
 b=omRdpZmeTCGn1brBkzyyhVBmeI05hdV6si3UHwb0Lk/1p4lR5WnCJVd8czMKbW0sF8c4
 fbU/jdYNm3p2riSaj0bBtsME1+PEASzxXOiwMVVt9k0H9Yx9GPN4Q/hx9xpCBxR7ayyr
 H7gmc/fRU48AhekwgcbrC6qjDbt4BhXDMo+IvaBR5FVL52OyQ8EUeHsWM6UXs/c3rJLo
 LQcF5b3vOUODRMtx746V1AS6IKioJ878J7FZhA6Z4cp18iUZVoV+rhrdXUfxQhfybfh3
 +Rw9guK3FuORP+xEk3vH+8lAvm48Ps8OXmle0jt9eI/yLSy9WPfMGsJjvp+f1IY/3GTk lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=bsfOtgB8ULE9NlUbGGkflJeu25iGkdj4AiZehLR3xHU=;
 b=V7+DGa2yO23kFWlUls6nQawOtO1ViH+kj3x5EuxSKk8iaKnCnT4t//lrNYshkTe0WPZJ
 7tz9xj/sOCxoPNSWw1CYa4EaY1coWBaJwM1iy/llr1t9qOn2kmkAsqs3v1fp7wMbpogH
 0GbLaII3GWTKr48gbrUFnqHKhiuh+clZrMni6yVJMmJuwCmcOi5JQEeFjO5iUcuE9g8N
 vBVbaCq+OqS9lfsan9xHaZD/2Md429O6yrFv8omXIEMA00ETqfYRMbmplRNkZPFVBsYN
 +dqoaBZMB4ebechf6Ss4z4dpu11k+YHJkyxDHvmkjNzKoAvPHRa5rUABkb1Nqq1fApo3 eQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3arbymjjr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Aug 2021 21:05:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17UKk9tK012102;
	Mon, 30 Aug 2021 21:05:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by userp3030.oracle.com with ESMTP id 3arpf318fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Aug 2021 21:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTQXkH7ugfPxe7JU1ykyCMr4ZsTrp3eannUjqQsVqBzYNVw2OUdHiDGj9Y/5Chq1L+U5Ct3z4QnNizRT3KeCQFoYJhGrdEUAH6VIAqWbXOf39STbdZUrMhjjK9bCDBcD4Z3mxKnuRFD8Neytc97xGXUCiCg1O0IqtGH9J7EZqrTnymPQXETPZShm2LlRyE2y7JZNrn+FqnZ5zdp1dA5y27FpMk8RZhVx9LO5kwJCj9zlTEJO9sP2NUyHVIY8Ie3JWtnqt4lLPJLeskjR6k27r21DPnOaGwYLfpJsst+3N3Yxy2UneJziAMjLrnBq0zPb73wPQC8868YoLHPOwxSLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsfOtgB8ULE9NlUbGGkflJeu25iGkdj4AiZehLR3xHU=;
 b=DzIjDe0CBxrc58oYbllfQbZCw41lscLwQ5PdoE5S4xPJAg9970JbdjPGP13sRWViS7yiRyPw61BsOm/Gs/4Ob83zvZ0uxdgoOaxGwIb/YYQ9JcPlAx5k+nDvtXOFDUrw+Zzj1s4VdRuz+0zkEoWvVBFaIxHzMdRt/IRsM94FikRn+eK4i/fW6Egp9IkYZF3ABP4ucR4nwLicIHhTHeXO5UglzfpjyK18iTBqTTmOckoNQLgyd7pnvLPtwnvF1A4dgmRYuF4+HhdpGUc7WZe9KTmdUmrEIfjK5irxuctB7PQeegIPalt3YC+qt7QwAviElgRYLg7JqSuKy+s1oBIXDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsfOtgB8ULE9NlUbGGkflJeu25iGkdj4AiZehLR3xHU=;
 b=oXFIY4D+mjOx4tyWN8lYUu9k6JhI0D500w6+9kJcZjmmQqAGPeZnCSXHeiSp9Vvheot+sR3zQEjnPOi1t34Gsx5vCk0g3lA968Aj7FVIfHT3Lyl5zA6Q3CotWQxyVBFGQt0b7trUIiE+5d95u/7PYz3LXDRKprfv5bDZBHKQCcg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2966.namprd10.prod.outlook.com (2603:10b6:a03:8c::27)
 by BYAPR10MB3110.namprd10.prod.outlook.com (2603:10b6:a03:152::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 21:05:26 +0000
Received: from BYAPR10MB2966.namprd10.prod.outlook.com
 ([fe80::a01b:c218:566a:d810]) by BYAPR10MB2966.namprd10.prod.outlook.com
 ([fe80::a01b:c218:566a:d810%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 21:05:26 +0000
Date: Mon, 30 Aug 2021 17:05:21 -0400
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Davidlohr Bueso <dave.bueso@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Pavel Tatashin <pasha.tatashin@soleen.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev,
        Jesse Barnes <jsbarnes@google.com>, Alex Levin <levinale@google.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
Message-ID: <20210830210521.wy5tmivpgy36oxm6@oracle.com>
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
 <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
 <YS0yiVVa01xbVu7t@mit.edu>
 <CAMJEoco4eHw6A04nBBtnCMOMW7HsE16uKMsNy02hRP1vt1C-AA@mail.gmail.com>
 <CAMJEocrBjR2gBCWnpB4rK=4URdjxodDDC50+yxop2MOmpKqO-g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMJEocrBjR2gBCWnpB4rK=4URdjxodDDC50+yxop2MOmpKqO-g@mail.gmail.com>
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To BYAPR10MB2966.namprd10.prod.outlook.com
 (2603:10b6:a03:8c::27)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (98.229.125.203) by MN2PR20CA0048.namprd20.prod.outlook.com (2603:10b6:208:235::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 21:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad79bf6b-d161-4a5e-48bb-08d96bf9e389
X-MS-TrafficTypeDiagnostic: BYAPR10MB3110:
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3110193D3650F54B10483E5BD9CB9@BYAPR10MB3110.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eaOE2hbvLw2jdYDQosOh+pHowEvRcq68mvmdVV0FhkL2+3NQyG7xIXx0n/4Eh1ct8Yefcb86i7+NkbkjiDEt8qO7Tct/DqJ3iESyHY5OXbUAV/uLrq0D5ySaPpfFconGumPJSETSnOD3FZsgGaYFBjPxLJcqeUS2HOVQShoMrOQwaFHTHpwbeaNEaKCdj0orAmQF7mqD1OB1JduGcprgVmtbVn7kFsYRKaVZ9MiaukPoetiEKV0Sg7S29GVcqOpH5uJDV4zuHx8BcZWgD3hDg28FXK/iPFP6Vpdvqqw51IkMflfqR6i/l6QFe1mWCB4u0ByIwd9Be2mxsxgh0yhJhXeyle/Yb0d8uenm2J4vuMaZCGREGvi+A/i8hu+XFoYV9AB2p9WEFiHfhrbQPON/inT/hgxw8iPL+uEh+tT9O6d+6iqLkLutshjflSbZ+vNuBN6FY4k+qaCctZA/YEy1WiJV21iKACWE+WHlVTN08MLCXTo86T4n51Y7BM9jHLGXAdvDY8P+F3adVQKsp2SZDogNHHYH4TuL4pDlqc0bZmRQjt9XH8BdcDnmUOerH4B5OXuSZvHj6nlIG8j08qJl8wF81VzaHctne8QLmHdnuPgE5tOXbryCC/CTMkBariLB5CwT2jIR6+/CDN4+/nzLSUoZXoz+ifKVYRqIed9yh3nY3ukcD04TgApIXMbFOKkybuDNcB9VbCEny7Dm0nZ3hQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2966.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(2906002)(8886007)(8936002)(66476007)(38100700002)(4326008)(54906003)(5660300002)(8676002)(558084003)(316002)(52116002)(7696005)(36756003)(478600001)(2616005)(1076003)(55016002)(26005)(186003)(38350700002)(6916009)(6666004)(956004)(66946007)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aBaFoQGjmKvukmQXd/9tgWZpqXba4UPvFOmTfS8h3/NX31KHwonstLRE3F39?=
 =?us-ascii?Q?v4MW1HXOu9jwcuLp0fBY7UZENc0uViHJnZKgJVTpwwwOIWiC8Ha8Dc4BLf9o?=
 =?us-ascii?Q?Zw3WTARZKKnz8G+37gEGERJBL27w25eujACAo0d4BSs1uhOSg3NWZPQ4M6rr?=
 =?us-ascii?Q?LrFxs+oBEIwQouNp8PeGL7mBUMATPFEWOXlPEt0erpxtGm2rKYb8ucs3nTcR?=
 =?us-ascii?Q?1eTYm6IKhWSVD3CvTY7NYfYZxGvjw+RA5XOVw5gz0cgK2Jl650jyEoQ7lYKb?=
 =?us-ascii?Q?y7JlvPpR9awqrSeOXKPf/H2F2drXe6zUAlBUu4mPzpaJt/RYmW5meGngYXT8?=
 =?us-ascii?Q?oXfLCE4qBFz0lK11pCHoHidgZwZpulT0ygRZTN2A/TlaKB2zcrLg6+GC3eu7?=
 =?us-ascii?Q?oqdkD9fSEs1oQQm1L8sE7XnPXFLRwoqdjbhECxMgGRoMye156zD9ocl2Vr8b?=
 =?us-ascii?Q?kVrLb5RuL4bZvhUcQ4ZAwtJqs3lfm769ZhaFX2AQN2b9S1NYtgplf10dmNy9?=
 =?us-ascii?Q?lunyF4JUG0XKDhrUu0zEKAiLcgVI1dKXBjuaxjzX+e/xFWMFgbWUexFRtrKo?=
 =?us-ascii?Q?eAi6zoM2kX5dsD6w+Dfwy/1RfvBuNY8uibM4Epx9lhJKXpkHl3nmBiOBH+el?=
 =?us-ascii?Q?rToYz4ylnW6lR/JskUoYCpVJvTeQ9wCIgZs5GoMR1/s9fFlXceltESQoPA76?=
 =?us-ascii?Q?2ByedN13FEVBeHvraP/cYPQ8qBQw4nG1s//IZTsF/iYTLxsfXPu1ezYdtTsE?=
 =?us-ascii?Q?fIVq6N5RSa7cucGyj+i7ANVgiUw1Ui/dWgyNH5rLNp8vGSsraO8qF51h/Uhq?=
 =?us-ascii?Q?7bxkxW49b2RtbJYdJZ2Vkw1ho/RP6lCA44tG0Eeff9EtT/qwPWzRujw09050?=
 =?us-ascii?Q?+BMvEJz8vmQeknapbBb89qnWKdRKOXul1lInKu8m5cBAREKLufT5nffHqHaW?=
 =?us-ascii?Q?/8rKwEyxD/cqNn9+fUKVmcf+1o73cglpZcKAE7O8QudQfmC99tYWvSpDEV9e?=
 =?us-ascii?Q?VKP/VuVtxnAYWZ3rQA9FMyHnmoTmdR3ShfS5vzUoqBQdUrng1Z4Dhcp9BvGm?=
 =?us-ascii?Q?47FB6RtwN/88aSqmm/Pgd69z+J1nn9Yh3+8SDeQ1E3Te5bVNJsYVwqEALGB3?=
 =?us-ascii?Q?YZlAm8hup27Xz6kosFKMhkKOVVAaFxipbOmHj4ewXBeymsApO0xmGg0FdL/f?=
 =?us-ascii?Q?otTsDzU0N7psV48HZAIhSlncY0P9EpX9LNC1BiRPATEhKRH7oD7zpcSYgJle?=
 =?us-ascii?Q?IpDoKYPJpMio5MlH/5tD9pzBeOhJhJ/tpx/65FVzqKO6OWNbwkHL7x8qMkLz?=
 =?us-ascii?Q?hh4HT7EWALndD6+d9+i+MXAn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad79bf6b-d161-4a5e-48bb-08d96bf9e389
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2966.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 21:05:25.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/KQhjVKh7qwDFZGVPbUpoK1tboQ5t+7W9lhaCXSmAZm6dvAUzmoMT371K3FepuniPG6yDsZLSoURfjeHX69ys/IvQ4HXPBkz3bKWHl8wN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3110
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10092 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=725 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300132
X-Proofpoint-ORIG-GUID: RSA7X3W5wgf_Zv5EPDlm1ZRCy8LoVfNQ
X-Proofpoint-GUID: RSA7X3W5wgf_Zv5EPDlm1ZRCy8LoVfNQ

On Mon, Aug 30, 2021 at 01:49:43PM -0700, Davidlohr Bueso wrote:
> This is fine by me, and we had noted that this proposal was not about
> performance in the conventional way, so being in ksummit track makes
> sense.

Agreed, fine by me too.

