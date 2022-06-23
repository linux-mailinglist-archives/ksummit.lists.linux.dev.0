Return-Path: <ksummit+bounces-689-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B45578A8
	for <lists@lfdr.de>; Thu, 23 Jun 2022 13:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04479280BF9
	for <lists@lfdr.de>; Thu, 23 Jun 2022 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB4E1C2F;
	Thu, 23 Jun 2022 11:24:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD21C2E
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 11:24:54 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NArfGq004652;
	Thu, 23 Jun 2022 11:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=oEz4VdouvrMieoWAVULQ5JryE7qT4AY35LRj6SrTuVk=;
 b=D7/XloqfLBY0xuoUrNHITXNTci0XHOQXv9mlaXyqwHCVbBEHWJxkkEPBlNwgWv4iSEVR
 8oQfgGBrqTahjYLQC+7nzm3r4ekPGkXdsgvtAoLYXPoLrZ6w1wHA8BVys7VhlO/ChrPF
 O3YK0IXJSiGUPSpOFWJebfGiSS7oI7EcM4Rdfg/EU9p9LlTj2+c0H5o128BO02Scz5M+
 WxBDFBLUiQ7u2pN9bHzSSo/sn0QOrkMHMVW81RM6lJesROl+iWHm8zTh8yONhl5+oEHo
 yIAt5LAyfWyUV+SPRn2k3Zc11XEqdYi1Tmils8TkwYAHhnDE23C74YoBaDg15hF3Yrkp +w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54ctt0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 11:24:42 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25NBKlsM015645;
	Thu, 23 Jun 2022 11:24:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5wds3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 11:24:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSwBi0jKXo5/9xDwjdyXvgk50Piu1l1rPh67zhz5xIakex/ZCT4YVNFnAlM2BhDa8UCSmz3mYekqkkescc2cIQOzkklIFgvkr48bEJ8bmQvPGk4tn1ambhLLcCOY7Wvx9CuzRM8D9Mwt1FeQLW75ZfevUo+/NBnCxGggAhMf+oQXzzd4E08GIWI1SUtk8QSd9DiE/XEwLQEha0Al6LM0MfrnD2OFD0pMNzSWTUiNXXt1WTl7kcx3BBGRe00a8D7mQ5EfQKKMlsYAyoaF55zHpHHPXCYKfjPZefUN99B6bK0CLhOW8kpQ9y20vx7N2gAqyrdHNZjeykJvH3xGptHaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEz4VdouvrMieoWAVULQ5JryE7qT4AY35LRj6SrTuVk=;
 b=i2QMqj8GTt0I0m1mvcN5wS4cwtpxBGg6InXG0J/U84PS/97GEhJ/ZFR4YhIVt+B90isVXGQ6PiY+2yVwqkbUVh6kIoJ5CEqkgOgqwTGG3kMuqMdHrRy/cgbObyWeQtzkdsCKqJFCWFaNnE1ssmFnULos1uDtazy2e5cO1vsexYXmkBYpIB0fGZhc6F1pH70J0N+UqwKzeWYB6KVMGYzJMPt25Kkfcvj39ZNssqqfzqbK2zE9XJLqX1AfpSeuvxFL5i9uHqfukPB6GnmBoluYkon/wUKb7pC3ajKv75d5XGHbGl4BazpEGWz1EsFGn8aKi9H06W7ZeWDYUkMIpuQ1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEz4VdouvrMieoWAVULQ5JryE7qT4AY35LRj6SrTuVk=;
 b=S0jOY2JzZXA566QGE5ERSZ3VO5oXs1zGZ+fz3XS1rlCCotwkW7lIWKBnvjqVqS8hz7TD22U1V8D9SF1tJNxAeNkYMPhWN93sKwcJGfvUBdaok0+s+rjPOgrlIQrGTlFYDFYaLzYxIHDT0985xyVYVcnmCp0Ous5ZM1N+9w2nF3c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4016.namprd10.prod.outlook.com
 (2603:10b6:208:180::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Thu, 23 Jun
 2022 11:24:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 11:24:40 +0000
Date: Thu, 23 Jun 2022 14:24:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [TECH TOPIC] Why is devm_kzalloc() harmful and what can we do
 about it
Message-ID: <20220623112422.GE11460@kadam>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
 <20220621151122.GL16517@kadam>
 <YrRHZlcwqPChB/Yt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrRHZlcwqPChB/Yt@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0058.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4017a375-80bf-4c65-04d2-08da550af672
X-MS-TrafficTypeDiagnostic: MN2PR10MB4016:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB401650A465821776C50345EA8EB59@MN2PR10MB4016.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zuov67PkXtuTzlTFCEWJTdXzXfKSXqvtDUW4UJvk2+4OXMAImqFTdpiRAtbkKgZkPpS5+Ov4lj+4yw4tjb2wRPG8XnJf7qRHj5HCBVdZUf5/ILU+60vHHw2ghKjJgdzCl8m4PTeg/8pzjq79A/2TxexuxlWLZBvddMde2vZqThlgT1KvX8tMfcYoLQ86hV055k89MhluPHLM5bREVHgHPAx6DINnRHtj/mVywx9TL/vWMrsT3s7Nn7RIyrOeu4g6Gz4Qaf1vuw3eNlBH8cmeIr/vUJydSmTUBLCi6a99t/HMpWzGoN+X3qizGdlsRtasnTnU1zd/SsKUamzRJQ7OpvI2tWFQ+z1xp17aTInWu5hK6BgIJjj0TDOdUdQdguk3/HFkq+dR70w7ALOVkpCdzzwAw9w/nUA+RkuhhX9wHII3cEcmRC2agxr2YllEzjjC52W1JgVEfuF+WIswVOD8/9D373UBjzoWNJwc56NAq4e6chex5+booLAqsB5ipivtv8jIyjlPA235EZ8ck814JSCghd6Nm1wDAdxqGVJhIcGj5DZURPq+THeHDH+crsw6OphMztBWrzIeMO46Bl9d6AXdSznmBmEoJ2OTznBazP83J4HNCUUG+6eCbILslxjDGVNr8s5/wO2YnDgr8ahYEgCcNMiRAMkZdEFmRWa4TFzvsgIWCJ2AVsDP6cl0GcvQzmeRFp7ez2q+j+1J14vebuRv0PMw8muSJr6YquB9qHpBorVBZOyT+d5JgOGNbF6epsub0B+EV33jGCos6nsU0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(366004)(136003)(396003)(346002)(39860400002)(6506007)(38350700002)(38100700002)(86362001)(8936002)(83380400001)(6512007)(6486002)(33716001)(5660300002)(44832011)(2906002)(478600001)(316002)(66476007)(33656002)(66946007)(6916009)(52116002)(4326008)(8676002)(54906003)(9686003)(26005)(41300700001)(6666004)(66556008)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nLsu5YgtCwqlpQPfF9dZnM3G/6LE2dmysmPyUgM+Iq4593vFrA9lWiigPFE0?=
 =?us-ascii?Q?P6PS0wl5wX9JLxGrVZjoFaMi+YmaSMNR1554U5rtIdUkQgALNyQ0nHpm4R5x?=
 =?us-ascii?Q?CA9mUWebU4uAoBR+YVAo7pThyauCNGuUTLaKsjsJbClQFOWLMNv5p5LdY1YS?=
 =?us-ascii?Q?W0rryOcXKo+6vEGRMzHmOKZTmszQp3lyc0YTC6TM3wtW2FyJ0AoE2+a5Bou7?=
 =?us-ascii?Q?qBEJOyaodqUo+yI1AdKbteeOJl5/E60xDHZEn5QjKKR7ldCRJGPT80navnWB?=
 =?us-ascii?Q?XumA+/+pIHD/mnMao7o4AkiKTBNGJJ9EBJvuzWc8PJ0up1gM09hZ7xySXpK/?=
 =?us-ascii?Q?ylrXaukozNYWzyy/3RSvwEBK/IZDZBcQYxyFc2bC9pkddOBlOoQsh9Z5tEDT?=
 =?us-ascii?Q?VNUPfP0VM4AxIrU3zkyeTIgOE51xFIbasN2KRkLsEF/peGnUA3MS2GsKnUMg?=
 =?us-ascii?Q?OSAUad3WhOrUr9Ke+J8EX7ClXZf+MAz9tJauLZhS1FExpH4R+++r2keR7ALX?=
 =?us-ascii?Q?XnIaqYer6RYLd+ybxVCuBknlzfgtIvjXrXr280lih7m7RNTcoKAVOma0glpm?=
 =?us-ascii?Q?sUzisHuHAB2wBX1o2IaW3EzW2tYnwzv7hNEKJchxuGaK3v55bOmVuqewI5oJ?=
 =?us-ascii?Q?6BrLTo3Ovfdid6H673u6WR3EfKi2JC5WazfbI7HAr4f0P7ZWhdFrgFFlC091?=
 =?us-ascii?Q?dDfT/GqGi4aTrLw6FDodZA2TOunLewoqYcim51Ggb2aZdybCFvI9R4L+SsEm?=
 =?us-ascii?Q?BMMNpsYqZCeUIF8BFCBgxsYc7t5s4is73iIYJvEJGnRbfSXGuTTw7nexGSsY?=
 =?us-ascii?Q?eR5wSTRpmPPidAGQHcPWYbd5vmRPJcSQQ5/Gi7XlbdOSoGY4PmvbkGTBOrSM?=
 =?us-ascii?Q?iu6xIEDk0uQXPo3oS0EQqihkN8PuBEICF1POhoq4o7QrfvxzJFuYNG+ujLyE?=
 =?us-ascii?Q?mrkbQ6s3JnvHZJJ4gNFDutaxiie3Dfm2FNOvBQto41yrbiObb6FZmIGkPClM?=
 =?us-ascii?Q?Hc/Cq2cgt/mYPaFL9YokcEE3NHvQj0i1kMUsFo5cPH8KvneyLReKVcHAg2G2?=
 =?us-ascii?Q?mUKuOdhDPbVsCoJr2t2O+dxgSkKD/EDGOddXqhXpZWdegV2R7BUqZREZ48Xn?=
 =?us-ascii?Q?cTi2BtFcaPtP9Pa2XtKnNjf4DhFwKRRBWzcBw9AZcjNqbOOutGqq9dS9y5iC?=
 =?us-ascii?Q?Zd4Tr48XqiJV+6ey5CMf6jDxqIQX0XyUENdt1mcbct8xXi3kF08QMkgndU0y?=
 =?us-ascii?Q?0Qh8jA98duWHVwk5sgfy/soCqRLdsVld2mCMnAxt3avM16FF3r4wKfzF/VP5?=
 =?us-ascii?Q?dKFJwvl+sfMAOjGhonuAtLiolCHDnjx0jhX2BulyNkwzvhZ++HL1NKNGnGkt?=
 =?us-ascii?Q?ftiYZkwnP07AqH6e0aQ0dgXvhdo+G20WQnJymotovTqJiXtymNrSRgo+kXO8?=
 =?us-ascii?Q?Vp8TRWOYJ39IHDFmyfdZjJy31CjrjRXxiElRfPm4dEgy3wsm55KJy2wXrOf9?=
 =?us-ascii?Q?oSqass3JgUL++QVuwNVyXoDBlJTsBnMLM1tAP/GDLuXe5Q3tsgjptqHY2eI3?=
 =?us-ascii?Q?3nxvJuU+naq2py1ITRSfQmYhmpQkU7XBPvQUJqfQRVibMn5UaSRNLUp7t6CQ?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4017a375-80bf-4c65-04d2-08da550af672
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:24:40.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8JeWyscbjD/oKCGs7T2HNAqwHi2ZXv3evHdnWcU7YpAUzsStvZTLIl29RhBAJYcEohX+iOgAmNJW4HMkC5FvcdHPWLq0DTaBYYXLIiER6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4016
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-23_05:2022-06-23,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230046
X-Proofpoint-GUID: -HB-pD0akZ2qluIsT2ZT2hhFea52KBkq
X-Proofpoint-ORIG-GUID: -HB-pD0akZ2qluIsT2ZT2hhFea52KBkq

On Thu, Jun 23, 2022 at 01:58:46PM +0300, Laurent Pinchart wrote:
> The devres family of functions tie the lifetime of the resources they
> allocate to the lifetime of a struct device bind to a driver. This is
> the right thing to do for many resources, for instance MMIO or
> interrupts need to be released when the device is unbound from its
> driver at the latest, and the corresponding devm_* helpers ensure this.
> However, drivers that expose resources to userspace have, in many cases,
> to ensure that those resources can be safely accessed after the device
> is unbound from its driver. A particular example is character device
> nodes, which userspace can keep open and close after the device has been
> unbound from the driver. If the memory region that stores the struct
> cdev instance is allocated by devm_kzalloc(), it will be freed before
> the file release handler gets to run.
> 

This is a good general description of the problem, but it's not specific
enough for me to write a checker rule.  What I basically need is a patch
I guess, and then I could try write a checker rule for that exact code.

If your RFC patch were merged then the problem would be solved?

regards,
dan carpenter


