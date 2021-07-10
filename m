Return-Path: <ksummit+bounces-375-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F83C3370
	for <lists@lfdr.de>; Sat, 10 Jul 2021 09:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 727BB3E10DF
	for <lists@lfdr.de>; Sat, 10 Jul 2021 07:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4DA2F80;
	Sat, 10 Jul 2021 07:09:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D070
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 07:09:51 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16A40tMM009334;
	Sat, 10 Jul 2021 07:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=NQwsVdu3381DrWeV49mayFCyzttGRGW+4YX208+dORQ=;
 b=MbHrtpwuy3OrN1Kl3U4OKUx65hVe+bqDHLWzKUD7jdfXRkXJ0YzqRanjE1wTo3QkgPqd
 +m4IxmmpJ/gGRFv6kMCfn/xRdLTGRYyScyZDXtgqXL0j2D0sEnYfgS3ryru58P4w6hlF
 nm62Z31zJfaLgcQs+5K+WV91YQSb12VrbrDT+vu4D0YZyRfCV3/jUIgAIC5+hTpofUUN
 oL1cq0HuyiNtgT660tOsOGxe+FISBCqcRYAHmPU28qZepLrNddjyf+DzLGJ3zURIPg1C
 8KUfmyQTWCnqTh1aF2ahTatdnmIydFPxQPwxT7qACCYmTTwmweOskK6QypF6SRb/ftN5 xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 39q2b2g57w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jul 2021 07:09:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16A46RJk133972;
	Sat, 10 Jul 2021 07:09:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by aserp3020.oracle.com with ESMTP id 39q3c2tgww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jul 2021 07:09:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqcw5ewwSHTuHpuEfAcNjEJ4Qoa+JKVea/rjesW/axCI+uJm9urY0pJtKckPw4qUTqndH5l325gPEoovPLhr6hKTSiInN17aBkmYsju68EreCK0J7AasxHAJ5scAcCuoxOONRSnuxBxayx15qOzIKMnm6Z1mWCJZD/NM+cmjKlNFDKvHVDjX9H0ve6K2RgZLGUzln8ZpVNc4yIJrxYdfcab4DRzwYyzYXMIYW7FzSR41vj9zp8ehsIPY10hN4YXQFWQPZn5lOKxE/ILPmrkUX/ESp6o/0en2mPRZo81hlQ9eWwuSW811bsvxYUD62b3DNMrOJdzUV2CxMRBGPUN30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQwsVdu3381DrWeV49mayFCyzttGRGW+4YX208+dORQ=;
 b=MkQ9EAVGLRWuHG5KPAnk22KIZdAddq6NhfzwN+nt/pJU6ARmS53N/DmQw0BalWSingb41GGCKkcoUWMuB1BajSQh2iyiSMxZUXc9Z2oFIl39Wa25CCVhUzRe4L00mXRPUS7WBXJP3fGAbHAclMiYW0eDop4Ppi923JlqmlYY3TsLMcRbe8oDPe2QLj9zQl/daCtjstixmD9+g3290t0/graa319kIQrTQiCLmeC8tvnLusEXg4BFf49uUDDalwIKYPJy8/aqfJb31vF70FPEc98HXHdNDLO0/sZ42v3HTFwC8dxT5NF6Ea4nMh9axlxJm7oeIhGqXlOfo3grL9W5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQwsVdu3381DrWeV49mayFCyzttGRGW+4YX208+dORQ=;
 b=EbFSqP0hGkLNXeOM+HtpP+s2aIcjPqlRb9IdtSUByPadSOwjkqwH8YWQwV2201CR//0HQgIoAgRci8w55VsljD2oj2uQZWPw13xCe4uhdJbNrHWQwEOnb6sObVqjLDXuEeAB1rjhJAGRvb2AvBagAbZOCjHP3X/bLtCoayHEZrw=
Authentication-Results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1999.namprd10.prod.outlook.com
 (2603:10b6:300:10a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Sat, 10 Jul
 2021 07:09:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Sat, 10 Jul 2021
 07:09:35 +0000
Date: Sat, 10 Jul 2021 10:09:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg KH <greg@kroah.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Roland Dreier <roland@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
Message-ID: <20210710070910.GA2190@kadam>
References: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
 <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOagA4bgdGYos5aa@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0055.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0055.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Sat, 10 Jul 2021 07:09:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4ce8bc-5ab6-4883-49f3-08d94371ab90
X-MS-TrafficTypeDiagnostic: MWHPR10MB1999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR10MB1999B9A9C46C8CDF5868DEA08E179@MWHPR10MB1999.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MK4zWN/8/tWCjt1qLjFT67sTiTyvuXvcx8R/ebrMJ+wyGiWZnHNBOTO0Vp28yR/d5x6B81Y/ud9uTVkk3cVsJvDlXryt7Pekq1cEMmk2FRO7RwEOgOKa7tK5UFqlAWSwhy0BlSYlomRNdJb5PnBC3sn6GNgQ2P5eo4bRPNm1ax22/zpbHZ3DvSA+XBIi0MOTAjCnoi5a3ldti3dQpm1hTrOhRL0SNFDSC/ciYyZbF/Ur5fuTnWi/TFpxdIHi+2K4nKfU+SrThaop2Oonv5vARuX+vfjlYRP3knc1O3zlVlPKj6waa6sOvrZ1y01t+mIF1jb+vhBh3UElHrcPq+N8QO5BM+ps0g7SbpvHTX1gICQ3WEWr8da7FtY42zsrnRnK2FObvVumBpG+fOlV1mZXoRCaxOrcvdMm+GVKTy33HUvg5DpWsCasR2HnzTOEH9DcD538KxYWR9FbPZHOzarQi1NUAXLuu7u7K4B590f24OnYfsXa68QqBE52R1LPFfuDSWP2rCgMSydUU3rKPv05Kfu3AntZUxMoWDI/d03Y8VUtgUcTepwC6wq2SkPhuNJqIEYSz8XUkg+8z1P+Uw/4dhGJS8qKmvWVwrFqHbFDrlke8rtvaiMaR3VlTmJCLG4h25OUzPBwLts6ZBQcDUaVVA7yCa1rFAodPHP/5QsSVjoFX/MCvfWRuVJuCiX6AgsJq+gXw/nawyyhvKslRA3DpQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(33716001)(54906003)(478600001)(186003)(316002)(9576002)(66946007)(38350700002)(9686003)(38100700002)(55016002)(66476007)(66556008)(6666004)(6496006)(52116002)(8936002)(26005)(44832011)(2906002)(956004)(5660300002)(83380400001)(4326008)(6916009)(8676002)(33656002)(1076003)(7416002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rZ2ODPoIfSDYEyXCO2pV5XpmVKH9DW+BXmSkyZWdsrNtJjHznmdkrxOgsWQB?=
 =?us-ascii?Q?qlby0whxrrE3HUiUhPrCgLYRj6Tx9Iw+TqlpEl2SQfAZ2oRFjQ6J46e248Np?=
 =?us-ascii?Q?R+QaUFX10qvufv7372wiNKGphnuDtBXEzjl3BhdyRwN0sFLyagSd+iLmwc/Y?=
 =?us-ascii?Q?h8lrezG8ZKZR1pfutDVY344q6GSz8k8CjfFOrUWtwp2/v+58qPwMlv1wfIxA?=
 =?us-ascii?Q?u8TZnvKoIyRwg6q8XaKPDzGtZjLvD0dqbvWm6YlJFrV1dhxkS6fEsikWwoaW?=
 =?us-ascii?Q?Km3Y1oGFq6aM1b8Zi/vY3pWMPNewEztt82xZzLO8YzIN8LNt5Nmkz0K3bIn+?=
 =?us-ascii?Q?cotAGEk9DLo/UCjCS3ieNca6gRpqN2xcQL0A+xHJQVv/POmdycwWM5l8PrP1?=
 =?us-ascii?Q?EnFts9XahKdOl1gA2StwAj7pRszpl1K+ps6ur+WBKAGQ+Qx5c3ttkVUd21Yt?=
 =?us-ascii?Q?ybnK2o/TUNtB1A0+nNIVk4WX9M1WGw6spo+Q8cPlAzikJsMn88SRZl/nY+Rz?=
 =?us-ascii?Q?/7KxNUVks6WrabOnlGHxiEk+Xib5HYE4HLU9TUyfiChUwX6N5gA3IjdPLMwU?=
 =?us-ascii?Q?tZPFMSSvaJKtm9OLoGZUH8SzLu9AYiAZ8YZq+lJ2cp3b42Q4uFlUXiGsru6G?=
 =?us-ascii?Q?Um89j0Aj2xKNXgTkMOQWhW/3sJr8s/pXgTJf8M8eWTtVZ1+pfIdE+aa/NEQf?=
 =?us-ascii?Q?PrpvLPGfsNqZ8r5yfDk77+tWgQaU1zAQdSuIVBuqsQhHYZPggSsLtl5Zj5vZ?=
 =?us-ascii?Q?F9B6CdNmTfHXS+yFmHZDCkA1BSc3MyYwBwhVb1OaLrk9WLsmfd5G7g/NwsFy?=
 =?us-ascii?Q?VzDjbe0q/GeoHx/nfQ58M9QSDqL7mk16doiS321v5eadzMKOK04rqytOwypZ?=
 =?us-ascii?Q?Jf8239sVkTSXo40gYsclwws+tZdt1l9fOEiU9UkM8UPMK4rxLXfe48/JjeK2?=
 =?us-ascii?Q?2l3JNMv+elXWE7KgwvXDNOzWTCpdOQqTxgXCyDZpZh666SvsJ1xqc2ASIdV2?=
 =?us-ascii?Q?1Q/tON1VaoEtG3/DNvqPLy+llSssnXGv9Eot4gZzd8t+z4DeiNcHOs8apca7?=
 =?us-ascii?Q?WC3to334xU+1alwqC5f6ta0Ng9z7LL1B2J7dy9AT+CFfQ997kelIgaME/Vp9?=
 =?us-ascii?Q?jk/QKpituoWmCp4u8yES4Kvg1mi96+0viRnBlPLj5q+zPzguYAVFw6Qx/6Om?=
 =?us-ascii?Q?/31YVrOis7I6ib/2ztZTexUmHp5I7a8w7XnAYPPzVObvPYeV/n51X4CtY1fO?=
 =?us-ascii?Q?2g/kgxNv3NyKMX6VEnIXH+an7z0RZcwhUyUWZ5NjNIak3TnH4lvdxo2/Wafi?=
 =?us-ascii?Q?N2R5OdoNdGp6CgSv7Irorfeh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4ce8bc-5ab6-4883-49f3-08d94371ab90
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2021 07:09:35.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qD/SKw1q4Ad09fSpKSfxEwWNdeR6wSKgSjUkuFfJiTYoEKOsTNzxd+7VBBVPLnv4J/p+W0CyUmXAPe8k0BepAlDmtpDEQuLodk945lN5z1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10040 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107100024
X-Proofpoint-GUID: 9IEFBrcQy8h5OJfvyuh8PKVNDyKYZk80
X-Proofpoint-ORIG-GUID: 9IEFBrcQy8h5OJfvyuh8PKVNDyKYZk80

The other thing which is quite tricky to get right is kobj releases.  I
have a bunch of these static checker warning but they're annoying
because they're not something which really affects real life so I can't
be bothered to fix or report them.

Also some of them are just unfixable, for example
__video_register_device().

drivers/media/v4l2-core/v4l2-dev.c
  1031          /* Part 4: register the device with sysfs */
  1032          vdev->dev.class = &video_class;
  1033          vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
  1034          vdev->dev.parent = vdev->dev_parent;
  1035          dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
  1036          ret = device_register(&vdev->dev);

If device_register() fails then it's illegal to manually clean up.

  1037          if (ret < 0) {
  1038                  pr_err("%s: device_register failed\n", __func__);
  1039                  goto cleanup;
                        ^^^^^^^^^^^^^
But this does, but it turns out it's fine.

  1040          }
  1041          /* Register the release callback that will be called when the last
  1042             reference to the device goes away. */
  1043          vdev->dev.release = v4l2_device_release;

The ->release() function is not set until here so it's just going to
trigger the debug message in kobject_cleanup() about a missing
->release() function.  So no problems.

  1044  
  1045          if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
  1046                  pr_warn("%s: requested %s%d, got %s\n", __func__,
  1047                          name_base, nr, video_device_node_name(vdev));
  1048  
  1049          /* Increase v4l2_device refcount */
  1050          v4l2_device_get(vdev->v4l2_dev);
  1051  
  1052          /* Part 5: Register the entity. */
  1053          ret = video_register_media_controller(vdev);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
But then there is no way to clean up from this is
video_register_media_controller() fails.  If we call put_device() it
would lead to use after frees in the callers.  We just have to ignore
the error.

It's a minor thing, but it's so frustrating.

  1054  
  1055          /* Part 6: Activate this minor. The char device can now be used. */
  1056          set_bit(V4L2_FL_REGISTERED, &vdev->flags);
  1057  
  1058          return 0;

regards,
dan carpenter

