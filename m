Return-Path: <ksummit+bounces-441-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id D277C3D21D3
	for <lists@lfdr.de>; Thu, 22 Jul 2021 12:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 55F431C0F1B
	for <lists@lfdr.de>; Thu, 22 Jul 2021 10:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8992FB6;
	Thu, 22 Jul 2021 10:10:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDF168
	for <ksummit@lists.linux.dev>; Thu, 22 Jul 2021 10:10:27 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16MA6qTl004623;
	Thu, 22 Jul 2021 10:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=yDSzor7i7BGwbpW/G47osTXC086zMNLCyvY76mzYiZ8=;
 b=t3SpTxR7u+g07h5Yu+bOmeop3p898de4UZNHQYhFLAeEZcb6B4lHrQoAXYtSNmzIR07X
 Kqo2s0pSS0iA2QwBO/tKQqRj4+BEvYDZVKPa+vSLzVPTDVl+c00Ni/bJOYOaSql1+VQi
 sJ2ya28Ouwu6OioANIQ7pLElqNGiaGxWTn/xjvBz/iRYPjFSfknru19oLQU0SeUBSobC
 KFS5LJk+Crd33AhobW+TWi+kflG8o9CnWZ97v70Ig0466Zx482I/0oErzisEHFgIQuNX
 6Zgac5rr/hzGefM95bH5ENf4EinLLVpalHTducI8fafEHRk7UgTEjpqRg53FfQXTIV2I VA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=yDSzor7i7BGwbpW/G47osTXC086zMNLCyvY76mzYiZ8=;
 b=OqVXsNDo9w1wmStiWDgMV9UXAeepSiWmdJgYDH1qQrHQC8KTUTuB7qHMIaLgIkJ3DRbA
 WRcMsvYhCtkgiAHojOJNEhkQAVRQ/AzlG7QzH7jt91XhLkphVNgFOx8jfelvU31aFnu2
 sRIJiiwA7zoc00OZx9VBJaGrLjhVKGjlh3/hZgI6BFsPB4r26ab8XAIoQhktKzR3H7ge
 w7eyY9mQBiFHTAaKRRhYgwYwC3jUyzg+5+eK5vCoZEatcXFWD1rRrSlMlQ27yyyjYGGp
 rd/ail1WN1ArpXBzYTTTozMKR+BfLPDvip0Mx0VFUp8ZJDe//lZRFcQOTiIeJoxOaMaG ug== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 39xvm7rxt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jul 2021 10:10:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16MA6SMm108268;
	Thu, 22 Jul 2021 10:10:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by userp3020.oracle.com with ESMTP id 39v9009kdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jul 2021 10:10:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxI185oM68O7OdkxGM7li7+wH/Gw9UoJlNG9OWSgdTmiPzPFw2705YNECVbjFrnxc+85Y3F1/mlFneU5Cs7WkJuYi765oMFXpjkTLgAxaN9nAZ+0OlLzP6eJn8sC2Mg6sqgiLO8DucG2FYnUtCY9EI2pc66P2XZxzspWpqS9O6n52Nhe6sXz1g4JijbXzwW2hbuWC0H6uLZkNAEbzihCt7TJPRcqIwKfqHm6p/hX9cpxJOCPRsZ2FWHbmh9pPK/hSKnkAKXk0/5qLi/BWs1cx6Y/eW3oale9PJcD6sl53z1OJkL8GiLaIfeIMfozF02pVUi7ihtxrmsvOArvlBK5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDSzor7i7BGwbpW/G47osTXC086zMNLCyvY76mzYiZ8=;
 b=mMfULQ3mxqvE/SBlFK9zEBG6UXITbEYcBzM3huAV3x6AxxwDdi5MFSNCYq3NTOIX8d8OF4TYoI1kiIHX4S638/RsokF0Aiq45xH+rV1J4t76imVajOwV5Dc+IHs1HVq/U28HbhaQE+G/stwwS5McNJyQqff1AdkRiK1whig4Tn+5hpFFO51MKaXUN0VHLQ5z2umcYRFiviPADZz9YiPykkeXjcjLkF84y+myqy7Nv3BHTMEsb8O7v9190BU9gzJymsg5keuVFKOKPNuKxTUV+OFOy9VaTov7FV6xhKK8NuVZk3DAxeGPM5GsMq2TYZLyCmTBePf/6yQglsU0TZoz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDSzor7i7BGwbpW/G47osTXC086zMNLCyvY76mzYiZ8=;
 b=gtIrwxZItE2de8G4+xZdAf7eZsIrpxWTW9k4+Om/HQlw0D/QLhAN1l6wiVyVYngiMkybBorgGzHJLFMNpoAwQY07JdCjG2JiUPVzcXE18JOFlKHIh/vMlE0vvILB67lXY+G834tI1B6iZFZYunUENS48JsZGZ/N4cw2SQtwIDkw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5476.namprd10.prod.outlook.com
 (2603:10b6:5:35b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Thu, 22 Jul
 2021 10:10:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 10:10:05 +0000
Date: Thu, 22 Jul 2021 13:09:45 +0300
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
Message-ID: <20210722100945.GB1931@kadam>
References: <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
 <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com>
 <CAKMK7uHgtGc9ncD3LjHzWxF1eOJ5-M+u=45ZG8-vDtgEAHVJ4Q@mail.gmail.com>
 <20210721090841.GW1931@kadam>
 <CAKMK7uEJjx5kLMcAPOnnu=SamwwikEyO5fMirS0rAxGwxrLwmA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEJjx5kLMcAPOnnu=SamwwikEyO5fMirS0rAxGwxrLwmA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0028.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 10:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61133cab-0799-4ddc-dd89-08d94cf8e09d
X-MS-TrafficTypeDiagnostic: CO6PR10MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR10MB54762D2AE87EC84AD0BFB9668EE49@CO6PR10MB5476.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	evZwhTkuqd+/wZ0ci7BFlUT+JT9fzugfBc9xEgE7gNMd+ZKnU1zhL6BQKYTsOPOZvO5miRyHO8S7Pl2qmm3P/gl5JezGZM2KUIQRytYLpyKs+glflsmy3i8huwkdBW6rLywEiEDcyBc7gDzmx7diX/LmLEA+95btMEvW+78KWbOmk8eAfNRQH2VKnPnrBAYzlTci6EipjVW2PwTY07OUdIVh6mZwJbbv6BEC5BspjiFH1WhEhBBqG2xairTz9POfqMBd5VF16wFLfxsiptwOu8TMbaLzqzL1VXJlm3vTDfnu1+qpVDDHSFaHWQu8Lg11IiCCf1BxoIUJriD97A6gYGFnS9t/90M4ZozC7hLO9oPe1BZA3BpnpH2PPYy5GAE2vxkcHqdhUtw3VESVzu/OTnvbwYtXXwGNrH10lonME62V4a5a+bjyb7Ef3tkTBwzBLrYqowMOGBRtJkH73HpRgqhTnAAMhjL/UFVyxuDio3tdtseHCCMaMd5bzfg1etz6wEr8L6CKsUAEb+BADgV7ip1Tvp0CZT7rf4YTGsjXbSkTdhQssCIXSGJmcwUwNZDBrwEZbGouMhuLAH2HzchI0WT8TnmG50uez/tySuqMwDGtJOFimQcZT+oEABRGw4McbZxNw7h7DdPgixo0jgE51SsP1wfG5e6W6vq1X9fGbyT+agbROmeL0UxaRdnLX1AJlbGvOKBer+mX1sb8ged7HA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(39860400002)(366004)(346002)(8676002)(86362001)(54906003)(52116002)(83380400001)(8936002)(5660300002)(478600001)(6496006)(956004)(44832011)(316002)(9686003)(1076003)(55016002)(66476007)(6916009)(26005)(33716001)(66556008)(33656002)(4326008)(9576002)(186003)(38350700002)(2906002)(38100700002)(6666004)(66946007)(558084003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r7topdrKlzqGkymqp5Jy7n5ifFg/QlhMB1PStmo/n4OG9r624xCnMjMsZwSF?=
 =?us-ascii?Q?IogmT+wg+2jtYh40G7KhjsB+9O03BQW+sMTHQ11NxLSlVsxcANUZDrRVe3T7?=
 =?us-ascii?Q?Ki5BgMVrZMINUyxmb0hBJbtFAKEtn0H/X3sdSxRv/1oMzmmSwOiVSCutflUd?=
 =?us-ascii?Q?+/TfJS6HdDqR3+YtQxP+vNPmppa6VPRFRbAVokdg0cSjlphlOAkNaPQM8duy?=
 =?us-ascii?Q?w7a9uv1/a3WTea/Rma+yglLSuglZ/gvSFR2XLngJO6BI5ouMpG17WcIbsafI?=
 =?us-ascii?Q?yvO5TiPQ/1J0OD8jc2V7yFUUO1lSV5WIoPbx3QAykpZRSyHBxe12GScv2PU2?=
 =?us-ascii?Q?RHsRNj6YbM2E103pkL8tCNxOYcFVvGL2Is+t1MNFaN08l+nEKig0cotWUlky?=
 =?us-ascii?Q?JBMv9AR0VwWIFV4SFy5PD00j2afMq86DppDkch8VDilskawy04uOGdms0NGG?=
 =?us-ascii?Q?g2bjEUrPZiMvoM5nP3qrsozatXbr3qjZ4vZrYD7DYvvyUbze4S4ID6d7g8I+?=
 =?us-ascii?Q?63nGIm9U6uJRS0szMZ3yUJVyXMkLbuqzshpOZXmH05+ozWYR7cpbu51PT/u+?=
 =?us-ascii?Q?gJzQhxMc51LluMlnTyNd3GynN1nCu9hMmG9pkhg5xDVty078AAT4NduuLIpN?=
 =?us-ascii?Q?o2uG8kRqnNBrBxv3gLC01hUYA5t+ZI3BHscy4ssq+o8hqLbnr0YcRUX232vm?=
 =?us-ascii?Q?jIAQ/omF7jF8IcDS7DIMRcMlXxQeQgzdAXiHOvFNNV2xpPJVM+9WEhJRlY0r?=
 =?us-ascii?Q?+t2mwM4jGaHXiS38zfBJ0nCF3uiBXYw6HEuPmiiwd7iyDQ0RYm7+3Xkx8ZeG?=
 =?us-ascii?Q?pngryx5hsxI4eedAFwMRzkOvLPEZEE5202WhHa18kgLd4qV2PMcb6cF6xF1P?=
 =?us-ascii?Q?SXHMqLnhfyssTwEOqs/2FXzS1V2b8xt7VHwtWNFcDTXxd/3uz67ngwxyr/Uz?=
 =?us-ascii?Q?gYzP9QJDqCeo31mp0GphgP+F0UrmCDY/sXNBQ8L49rt5Npz0bv8hj3OKjnun?=
 =?us-ascii?Q?pxaJ3dSqA/W/eh0mh8EClQ08Vp8dcgwcnlPdu6SIszGE8mt7sIs2eISlaBBA?=
 =?us-ascii?Q?GGOFXLCM/JY2q3VueFcqbnyuQJ/sywx8HITS++L7nT/aiF9Voty237KuLyoG?=
 =?us-ascii?Q?IwbTlaD7z9gfDlXGEFQsdPvxy2tZzN7O9n/zpkjVy7IQs8rJKVyHfwyA0jKO?=
 =?us-ascii?Q?Uuhy+kc78b+3ydUZahQZQTxHfNOW56A2x0iCquacCJf6yFC/lw+BsXtUHgGD?=
 =?us-ascii?Q?ezH/Xtjg+J2QI8SFemqOkPHOB8j8kDq4B/s/CmEh+i1Ge3KzjEbsCgzaq4PI?=
 =?us-ascii?Q?d9hN/f0c+V5JIswqILz2rtjw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61133cab-0799-4ddc-dd89-08d94cf8e09d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 10:10:05.4887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJnrzoY/wquhV/OH2tXvt34qH9pnFTvyz0nZrrFcwNdwtrvu6CYNnLsbzQVLnpyvypq5a5ZL9QJBjsbe6HcZ+D3+BHrcdTH0KGvZM792C2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5476
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=940 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220067
X-Proofpoint-ORIG-GUID: uqmUzXCO5zZc11eqX3qhLQy7DT0e70xU
X-Proofpoint-GUID: uqmUzXCO5zZc11eqX3qhLQy7DT0e70xU

To be honest, I don't really understand the details here at all.

I feel like if you give me a few samples of buggy code and the warnings
you want printed then I can probably write it.

regards,
dan carpenter


