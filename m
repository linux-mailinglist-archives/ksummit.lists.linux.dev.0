Return-Path: <ksummit+bounces-753-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E2A58EBA2
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DB03280AB8
	for <lists@lfdr.de>; Wed, 10 Aug 2022 12:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A3717ED;
	Wed, 10 Aug 2022 12:05:27 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087E17D3
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 12:05:25 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A8hwKc013170;
	Wed, 10 Aug 2022 12:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=iNwfsg1tpVIsL8VteGo+YzVp/EYgkg9kvCBcCo8OQog=;
 b=JVzKjZ34ry8z4TJgzLGbGmZayVWFRxSeGysVRpZ1nLJZPaWIZyw+XVvSaQtaCP2StksW
 67e4G3ws1eB7CvagErZ0Mgi4ouRcCJ+49JvWu0PJOz2Aj9/4nYIoLYkDSZeJu+GyWDha
 pnSdUReYaLJDD+GNzy2vIEkpNIV2k8whHmQ7FrvZwc3INF0XOO3BOuwZ3EHQ25O/fnZm
 D689Ffg2Q933dzcvDYFUzE9gBbkLxkDXm8QP/MseJfbJRML9bMl1nFxsbpMFEGmzD1zp
 WygbUAh7zXdHsnLqUfgVKi1UCcHUgFtI05llFeWuKk0dmGs7Q3VqMxLwAK/cquJV0Sia eA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqghkmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 12:05:16 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27A9Ks5c015414;
	Wed, 10 Aug 2022 12:05:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqj2nv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 12:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Yrnml99FtDrbCpJdpIgZU5uud/QxVwiNXJbWo9cpGX5zTXgAavC9tKvUcRETVdt9epikWH2/kUrraMioDPn2QknHSzf2HbN8injRiUUYChQZCEtyrvSLCPPD2+evoY+6zxdaVNxG/KcOXzo4sr+wS4Qdjj1qyl0FawlUsDEZxe2hcFvme4d4nhfgOEsWhkRx34skOIIcHwCINTAaefPe7ZebeAGq5Vt/44knAcA2wjLtcIButusKN4qzRR+xONGTp1SmPKPeL4su1gzs74HwdD2UCX3sv4/NLkAPa492egvI3oTD3U6AiM9cwIAq6jETjzJUrG2A4jeAlEG+4i2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNwfsg1tpVIsL8VteGo+YzVp/EYgkg9kvCBcCo8OQog=;
 b=lhLirxwUitwituT82RYnqF34+47mcX39uCFTNH81XIObSCNcWRR6+jjI1oERHn6vGjvSqKPceGNs0+yJhxvg3Cex3Kv8iR+T6U9h9lcbeffouY0IeIs2sEpjZm9A/nG1v/TBslJgWvQdE2QvHBQcfwyQAp366rEQD1yokwOhkuCMzqC6/9sNk0f7g1D66GpxNtJ0OjDmd37wYJvAfFS29btzap3DEkzDk41y0IkBr0RHkucpeWZFXhkZTIKAFtTtQPJJ2OS2fd5FsCfEPb2femuaoUPEZv50uPdrDJozIzKj00co91BvJU2mQkYUKxahK3LpzLxdA/CN0+NQH70i4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNwfsg1tpVIsL8VteGo+YzVp/EYgkg9kvCBcCo8OQog=;
 b=Gi6mpg+Cht0FxyjWiLLIkqDztQ9MxKOsGKqXDhOH/3V+CUVExq/O+xerkWMQP0pXNRre5lpgbHdoAza4/IL33Dy1dofbZ6Uo4EJUQ+hEdkE6UveAIc7b1WjSZ+ptLwH9F/75otIh6kUYAFzlNWE+QkJJS0lQpTFB3I35HsDkntE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4611.namprd10.prod.outlook.com
 (2603:10b6:303:92::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 12:05:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 12:05:08 +0000
Date: Wed, 10 Aug 2022 15:04:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        ksummit@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <20220810120450.GT3460@kadam>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvObmmmLiX6z8eA3@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0059.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::12)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d31ccc2-e690-464f-07a0-08da7ac891ed
X-MS-TrafficTypeDiagnostic: CO1PR10MB4611:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1i33lTR9gh5+TxnBNLBKKOiDHQ53d+i5fAmAXvKmr6TplvP7FG3t/28QtDecM72pbKarvNBLBO03vFMAp01t+KOjQIQPyz5E67BvduJx6NW968b9AqTljJzV2qdtP5kS5REKs7rwga6oAE+TKo7PmE6b+Cn1dvBprCXhlSHzihB5gr6gjkKCQMDy+PvVXtsqzQ1DNKLOa8IfRvsnSqCOCD5EqE8tQWqWeZQ1gNYn4EVLur8jWem/LFWI1+d2TAGQ8h1ef+yfJowR7zYlToTkLtomV5GsCif4FHHdoSO1A0R14Mjs8v1C/avxZlzw8QCYmUx5gMC8PaJMjCbh1YIPcCzSmZb6uPlhqtQVCc61ddUIUzcLmDsh64RE0Flwj68O8wQElfp4N6L1eCcbPZtw8eF0YHjDgusFXGUvjsjTQ4T4sZuCfTQHbntm92pO29IkNb7poO+x2cEm3lgitl+60L5+aAtfzPO8P9SzfzNnUSdDrQVX5NgviscJregEqj4hN4tuNii7N98hPiLvBHRmrtThFI6x7GsrPkw+L0MuQxEodnTzaUf2sibfuog0SrlvYesVCJ3kL74ynd3G768PfLoa3Wxnumon9P6m3axq6HpFQ6eML1PorQRslyXKXj/fPf1OIJZhCmAEyZLwA7FmLqNxRQmnVCy2++M7DgHRp/12pYh3OhLwfdOoLoAwbq3N2G0qJ/6MzTE8HlAwOvRgFNase2s2GrkqUrCVzLN19k29ubMHqeWHWN3ZeHXVdLs4I9Iio+8Nt9xY9azKMSp3EEDnb2VgFNigXLgz/doerchLfsr3fCArn1QXbPbSftpw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(39860400002)(376002)(136003)(366004)(346002)(83380400001)(8676002)(8936002)(66556008)(66476007)(66946007)(33716001)(6486002)(316002)(186003)(3480700007)(4326008)(6916009)(54906003)(86362001)(44832011)(5660300002)(6512007)(1076003)(38350700002)(9686003)(52116002)(33656002)(6666004)(478600001)(26005)(41300700001)(6506007)(2906002)(38100700002)(7116003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tfYiZthvsb3rsaxPrOZv7SkW2dFtVn3451IxadWkfqRemunMAbcUexxdIxi7?=
 =?us-ascii?Q?1NPscS6XGuRkOOdcDzkmhX8TmtvO9d4Kjd51ssJ8ZhxX5E6QBT/H9mSEwkrn?=
 =?us-ascii?Q?vzEfJSOnTmxF2hw5Znyi8vW9oAXiErRUyOww76dKdxpJZ2Ld/d3wN1b2a2dY?=
 =?us-ascii?Q?JHRQYXGQfUFUwgrmGhtkHU0M2Wsl4rymq3YSXMAITwqAh7mzbzEHQuWMVhmo?=
 =?us-ascii?Q?3lOpYhKMSiJzkHvmepwX914uzOhoATKAjUSBCH9fZ9QLd5OLgrwJ857ESNY0?=
 =?us-ascii?Q?DCpZ9+dcOfzo8HqNr4jIumGdfMiDR/GweoQqwYmbQ76KRFeoFpd9ZwHMMurG?=
 =?us-ascii?Q?5dJawKyg7Pte44EI1gneXDRACFOwGlc2dpTqM3KraNyMcrOb9IvMKTv5+cpi?=
 =?us-ascii?Q?d2aganaO0DpDVdHkkiWboeSbEiJsHuxqjcifGspx5fBoTrpjAiAbuARuWDKh?=
 =?us-ascii?Q?o78iabeDm/2wGvCGJWOHK3/Yl1Ei6Tackl/KaILvT6TIi9MlfCSA37oDeM32?=
 =?us-ascii?Q?cPLopzFAnV6JaNcCIKLN7lKOhoh8vH8gzagn1qQP2uer1NXSuZCj4+y3HFOx?=
 =?us-ascii?Q?Ad8DtZsnyMDvIiCmAgAWdOpeTWhuPoMqMl1loAWueDk7Ybi7ChSfk8uzfNJ2?=
 =?us-ascii?Q?Bc35qVmgBhQhcuJNjD7pH+gcCOSYRDew9AACGPSJ2+6ukrrEZsJ+b/9Kmkxo?=
 =?us-ascii?Q?90V2Wv0htUnj3AeQXimbSfzYtCJIoqWjB3WxfGiHq7rb/uGgexeHKuwStquU?=
 =?us-ascii?Q?DdslAd3OFsG9Y/sO6eWNJA9TkuPWHvXsl6kBJu5+ro9xsGvG3ofiu6Y3wXD7?=
 =?us-ascii?Q?Tj/uDAF10WYxx7PlYHfeo1RtGAXIqHzvnHgjF4bYW1/vUbchAMXs6D5PH3N+?=
 =?us-ascii?Q?hd1iR2fhHIEE3dPD4fx5GgazencRFlXn69l/8hbWUBsM8hD9Wm8PcjzDDwFh?=
 =?us-ascii?Q?AnpscnNvLpCZAq5Cr99fZA7HMapKDR9GtJWHkg04fwPzAtSk5nA4bWQxfHhS?=
 =?us-ascii?Q?4otq1mM1n306I3LSlWFjlSXtQT1VLil5RMFwufnSkwB8pjLCuwf0B7fAiOGZ?=
 =?us-ascii?Q?ON3O45uDKaKffpQJFaMRq+kTO/gCsLBHtRyl1Ne+0ptdAfRQ4uYUZyLuF6S1?=
 =?us-ascii?Q?z2plff9FAxKSeWLq+Yc87LqLtfI0uZ20AAgSP/cpmNvf5HRxAmeEOz+sRtKO?=
 =?us-ascii?Q?+jqW/ojiombx2HWS+WFEi5u+nCXZqpJkrWFSPCV5Q+B1K1KEuA0bv4ZmqNI8?=
 =?us-ascii?Q?2Gt6wbKieTiLFFJn6Dehd6CUDlyty/OS2BFQZum5ZJerXiE0T2halk0kPtzX?=
 =?us-ascii?Q?QKkbMG2OHfLvD1/jUZ8CcKeDae4KIdLbpTfABxN81FZnTtURwt9zQYk2JMWy?=
 =?us-ascii?Q?Fty5AeWdPYnsr0AdDbUMA3FvV+q49MWw77S3X+uLotVW2u09bMtB7S3nNb0n?=
 =?us-ascii?Q?Q4rS76wGm1NkM9pb8mr1B1+Xs7IHdUIOQscstDigdLGsBO5CnzETGUdtuX97?=
 =?us-ascii?Q?Ql0HyL9qFWNyRarf0rHIVmGZ2Ds5HelToUMUgIv3+0RXUwVniBjUktZi1KSF?=
 =?us-ascii?Q?XrQKG85zPbmxn6vMihsFe7YJKakRzRW6gPvIKNXbGrA/0gsXOree64IGyIYb?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d31ccc2-e690-464f-07a0-08da7ac891ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 12:05:08.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZOAkiJ8FGkbVsJMz2flQ2vV13srFKnTmg3unbJgZonnHQttpgNy9a+7hj50Uc5zDqa8H7RZ4Pb2VvFc0ZcAG8y6d3MBLv8nz9H+srVjy/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4611
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_06,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=619 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100037
X-Proofpoint-GUID: euTCx_UsKUOU3aySlHq3gsQIeBZ7fudL
X-Proofpoint-ORIG-GUID: euTCx_UsKUOU3aySlHq3gsQIeBZ7fudL

On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
>
> I am presently plagued with reviews for lots of files that I've
> touched over the years.  Even if the changes were trivial.
> 
> Or is this just an education point?

Education is not the answer.

We've got thousands of devs and no one can keep track of everyone and
their motives.

When I send patches, there are few people that I know what they're about
and I manually delete them.  I also know which mailing lists those
people read so normally they're going to get the email even if they're
not on the CC list.

Other times, I wonder why maintainers are still on the CC list if they
haven't been active in years.  But I'm not going to manually remove
them.  It's worse to get chewed out for not CCing someone than for
including them.

The one split which is quite confusing to me is the netdev vs wireless
split.  For wireless patches, I generelly delete all the netdev
maintainers.  Some people I'm not sure what they care about so I leave
them.

regards,
dan carpenter

