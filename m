Return-Path: <ksummit+bounces-452-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5D3D538D
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AD02C1C062F
	for <lists@lfdr.de>; Mon, 26 Jul 2021 07:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDA32FB2;
	Mon, 26 Jul 2021 07:06:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C570
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 07:06:16 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q6xSjD017520;
	Mon, 26 Jul 2021 07:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+Z8V2v0btI0WIlbxFtQIu/vbV+b9xgeJKfqb3nzsnQg=;
 b=LtFQ/uiSZgyEtqyDemZn7Cl6nUY8yC+eD4bAt4L0MvMdqQzlZO6Oq0wZoIv+0Z7Vh6VF
 miFhGX+BesYeB30jKNUBYWkQaiXCZu7vqA6/Qtewp/f3udht1ZPtqypMfUzBXbIWIaMe
 sENXGkFhM/ULp3hnmUYh1tJWdLAz2Tk68/N8Y5SdkK0nkHB8vbpRjqIbVLd0xV1zwbR9
 xQvkF8bDXLEU+t5tge+v/1Pshw4ArFIhUD7BtM5RNUIhI+7djPYXHjbFWc8LAp8FVZwb
 zpLMRDIwXyy1gtjBtKM1fjgEJfZLuq1TEse8AJCamEyfpsJcE/KcddujdNm8blW7nuQj EA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=+Z8V2v0btI0WIlbxFtQIu/vbV+b9xgeJKfqb3nzsnQg=;
 b=KCait82i90gAwpgEFvS6o9LVE3UWqMx+aQB6Qpd/8karISec2pVZ+JAnLZ92eg02rLHP
 GInjfVCALeMKFTtEyR+2PEVz6aLTNMXMhjPHbDa5tZBduu9NA6PDzfMkSd7oOerdTuyl
 qJDZf23fkaPAL2Exz+OG4K9dDWT473/vBV6xz2OoUqTKPS5yAKg2B1lHoafmDH977jqe
 uacjLk1+emHK7NpD7O2TWFZQ1tzTJ6+Nfu0KLvBdK+OVZlpP1QbqxXnuIrzUVXUc4y00
 zIT8pFfTRY5VDemiMY4GvOuHHolbIygRG6ErSwtDBFBRYnALESxFnm0gY8jHtZKCnQpg WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a0afrt8c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 07:06:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q75PBk121349;
	Mon, 26 Jul 2021 07:06:04 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by aserp3020.oracle.com with ESMTP id 3a0n2fcnd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 07:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8Ky1f/tY/Dom5ziJSmB+D+cJLQv3wJJBKIkwf7OoJQknlh17NP5bQ1knDgK3MuKrpirbN8zaKNeS2lQS7Ytgnsz9+Rc8J27eOYAvYFyx16iZ4ftkKQ+h1R1nzqy1qomZzfeYjros5iiMte3pcOp8ZogFP7G48V04yaQGMILTUZj+5zZUfyGpb0e+MT4uI8gFxvfo4ZLtmMdM7amrr/p+Mlv2sKElxzc7yu3histndvM4Q0HrdL9sd1kpNme6wXFgCYhqeMSpWMTNXGxRy/6WOLvh+nehfhkUszuh/jEC7Tao1ugtyHplIJNbKIMu95uJAoy9EQtvGUz8uyQaqKjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z8V2v0btI0WIlbxFtQIu/vbV+b9xgeJKfqb3nzsnQg=;
 b=I2teR3hM5Pw90StjA7jIeQs+QmUeY488rMVtbtAadZ+cOyC2s6EjjoBKmJAnLgJS35Uu4OeuTG/ZP6nVTMVVPSfJl40UnqxQNr85Ko6jpriW4pcJVx0KM4Tbeh3+rwkIkVa4r7v+9f5sb7NG0ZppnUg/IdRc6dAxaY+TD396ntiTcdv1eeLDr2DGpr689RloU8Acl9pEf44OdvS/0cdsnh/3KWqF8sY7Ok8QIucPmWR4vPUF+8cU+OmP96MvAGzvShaPaKUT9a0I2CLzcwh4ztubD9NPsGuSlukPal1RhnkoOF9GVtA+MXsj0jDeaTQFklpcgNxuiUPxc1YkSWCzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z8V2v0btI0WIlbxFtQIu/vbV+b9xgeJKfqb3nzsnQg=;
 b=XD5Dz3953w9xJ1eQXVmT0ZoH/0GEahCV59TLBqwM/cTzB91pEmqTJNLN6xYF4Z2aP7IfMZVKleYzA7UxEwGeRr43skyr6S6VMXk/O9BTKPxzCFqgNnDjjvregKc+b86lyoN3CMs/k61uFYvMR+ZO7G0SVSBHsy+IynFExCffUjQ=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1614.namprd10.prod.outlook.com
 (2603:10b6:301:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 07:06:02 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:06:02 +0000
Date: Mon, 26 Jul 2021 10:05:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <20210726070544.GH25548@kadam>
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::26)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0038.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Mon, 26 Jul 2021 07:05:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3edcee06-28ab-40e7-858c-08d95003d40d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1614A0890C4B45A5C22A82888EE89@MWHPR10MB1614.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XpCTnximFh92tw5fRTDgwzjQnyfV4xD0Ckay5C5lPyXDGUYvm+YNex3YHTmS6aNokrpWi4rnjf8QqVHLvoG549oKZuJ0b4svAE41dfgKI1BHYtLfCnkJCyvDUQjyAC58yOh03g1/PRbGJ8EzLMwAGT+9LnBiNu8sSA/l/aP2qZ2gpaMpJUWRTR74KP7Gcm4oi/k25vjrKeP72K9fdfR8cxPyVqwU7N4nOOZcdtTtR7wo0AHTOUcWS4T2aTAdx1VLGMnpIpY3vV8tUM/fuVLYHsGl5yfFvga6VnrYd/nLssxyXVRjwRe8pwoaOT3piMZwkMJFk9RymSn2MVqpipvCAO4T05a/trKlQt1RdzGsIlUIIqVJNYl2PJM2CcaTxpYBCVhk8vvhW5abiQtmfTqyY8Q8x8cEWjwkyAEhoZEEFiSjuKpvK6xJ/88AIX+SvX+8ZGOq35RltndM20vVwN42X0SlyFsUve9PZsGX7nP0gp4Z7rC68lZ1mq51tPbVfsY0Nuny0f/WUuN5zYSbS9utqYnVTUw0HSya/2iK1thwB/N3CLujprxN/1YLGcfC/rImDkPGzp9LrUfuTxBftt+twCmbRtJoghhFcFJmKHdoDS1+XuPmHvjlYTs37CO8eC/kc9Oj7WLNobSeJkeTfEYoQI5wKgQUmjkzXlOBNDa4t1dwkGHg8eSaNz1I8pQbjtMbzxx1usCJNW/XRf5n3U4wmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(346002)(39860400002)(316002)(9576002)(1076003)(5660300002)(3480700007)(956004)(86362001)(9686003)(44832011)(52116002)(6496006)(33716001)(55016002)(478600001)(26005)(8936002)(2906002)(8676002)(66946007)(83380400001)(6916009)(66556008)(66476007)(4326008)(186003)(33656002)(38350700002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ov0ukAehABEFbF0IB7rVwpWXx0zr/GoEX4VtocSanXLxCNa4vgNEr6HHq/va?=
 =?us-ascii?Q?/EBfArMBOOIw7iBROdW1HNvAlvuFPBgTg4lO2goTRdsznamq454DCbOugKle?=
 =?us-ascii?Q?/XxIHqG8V40gsDU0aoxfp9eNKKJ26MCCtuYcWt8aZx63pR6EQRJBbiPY2KQl?=
 =?us-ascii?Q?8K/Lb/XPeoh8PuA9EeLxPZs/R2DRBbh6ocrLZcd9MwfHP8QdPY1QRiFWTYDJ?=
 =?us-ascii?Q?jOIq+ChBhD01NCSwTCgXwoqxLCq1Ov/AYODD+6CQFg5nak0H2inXYQYO5f20?=
 =?us-ascii?Q?3YbxN8pvobqfr3ka8Qp/KUfJaA9NyAzmx3GYTCKfVo18NWcw0QWR36UWfnDc?=
 =?us-ascii?Q?3ZVqLMFfBs7Uh8XPwtt7+rbCE4LafnIMzHHy7qImjd7ewd8XN5vybSD5nofs?=
 =?us-ascii?Q?lFoXi2b1PCMQrdpiKewTBiS7QMg09ueYzp5kQBYojCO5Vac3UaxtiY4dI+zT?=
 =?us-ascii?Q?IkRTDzwTGZ8aJY7HXJ84/DaK5/3wIUaokS/rKFAVOs+ev9jq3X4tfJsPzQf5?=
 =?us-ascii?Q?naB6e6zVnrvrOUALoOWG18N1Gh3sEEhrsYnoVOqr5VymNEwBMZJ1GanLYRWg?=
 =?us-ascii?Q?MsDEff71mMj7fv7juDyPVpWNhbFPsqPTHNeYdJsStr0vYBeBA7NvPI27NYUP?=
 =?us-ascii?Q?xvjpl4ksFwrlf+3x4jI6KbLG7uEekHFMNr2X/6DtS/CN7DqKN3wcLwGF47Si?=
 =?us-ascii?Q?+is6QI6JGUfIo6NuL+CgMvWJt/XCuuAJ5vY7ftRzit0OwdNWSdztsxZgHmqs?=
 =?us-ascii?Q?F+RAJ+Z68XpWryJSjeeKwiXxdSOlrcG64FNi4BL1JbWhl0fi++hzIJjCvaIP?=
 =?us-ascii?Q?ayXSIeGRdnrj0DyDn/yl0napxvYEb7mKMuaCTdCaQwJH/T83PAVuKmUCQqHJ?=
 =?us-ascii?Q?uHqbJiu9HaNcx5LhTGAgUaHzaTnm1RoXjjwk9zQyh4J5cjHimNpHgSmQLMHv?=
 =?us-ascii?Q?IHxzr9hyePvAwC5hNjCk0igK02+B+zPfvkIhq+v3Wrn211yTdbbtJOBh9RgO?=
 =?us-ascii?Q?Y4j79pN2eWttGqRhqL42ySu+kHHlpOSub4QRNaDSrWfSJBxpI9gnho4YqpSs?=
 =?us-ascii?Q?/katcNTcXKg4TPNeXaA7ZG+6bHD0igjfgLPSaGs4W4ElaTKhedcDaAOl8IQf?=
 =?us-ascii?Q?E1hza0AP+8LpwIeCHMesTm5KqUwLgF9aFV962i9TfigUDkDjWXoDdhKDD5ua?=
 =?us-ascii?Q?LJ3Uado7Dv2QQynpYTuiE9uINxyr6QFUH+P1QjRng9AEgBQxISraYhvYOG5L?=
 =?us-ascii?Q?zMeuiIoWCLVCjoOJi1Q0TD7F/YibGGCrb6bXnBCKfMDj/XmODhuQPnxojVkX?=
 =?us-ascii?Q?1q8BPv+G7r1PXNhgvCbu4uQV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edcee06-28ab-40e7-858c-08d95003d40d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 07:06:02.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DL+aosJznKCfAgLsrgJfKTpYiRtKbEZi6XMxNbRHwIM289HbjFtFZlb43+J+MZVeAdNsXY+pJq5eet0jpQpabjdPUg5UZr51wTf8ZGRKsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1614
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260042
X-Proofpoint-ORIG-GUID: FzNms9AcLR90t9Y9E2rSRz8tauxuZCWh
X-Proofpoint-GUID: FzNms9AcLR90t9Y9E2rSRz8tauxuZCWh

On Sat, Jul 24, 2021 at 03:33:48PM +0200, Geert Uytterhoeven wrote:
> > Here is another example of something which I have a check for but I
> > haven't pushed.
> >
> >         ret = frob();
> >         if (!ret)
> >                 return ret;
> >
> > This code is normally correct but sometimes it means the if statement is
> > reversed and it should be "if (ret) return ret;".  To me returning a
> > literal is always more clear but but clearly the original author felt
> > "ret" was more clear...  It's only a few bugs per year so it's not a big
> > deal either way.
> 
> To make it work well, you need to know if frob() and/or the current
> function return an error code or not.  While you can use some heuristics
> (e.g. is there any return -Exxx), perhaps we can add an annotation to
> indicate if a function returns an error code, or an error pointer?

The function is normal return zero or error codes, but the question is
do we want to return for success or for failure.  This kind of bug is
normally caught very early in testing but some of the big refactor
patches can't be tested on every hardware.

regards,
dan carpenter

