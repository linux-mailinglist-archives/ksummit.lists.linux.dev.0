Return-Path: <ksummit+bounces-463-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296333D5651
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5F3481C095B
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7232FB2;
	Mon, 26 Jul 2021 09:17:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2C72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:17:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16Q9BTKW007241;
	Mon, 26 Jul 2021 09:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=pJMPxJsSyRwqLlERErZLeN9AWf6j71GlUdExTppShuU=;
 b=axRzvc6DdnyGfiY/wxQubNX65mSuppN1EE0XfCFYvcZ6FM+njAw4ToiLay3YmyMwHvMS
 n+uImvy4UaUh2g1Z3K61ElO9ET/SJKlOz/pE81sfgc3GBrzhUg6a46dPg4L+SFyC4pQj
 4ov3Tq7vyi/9PhyvvpOIcln9WcYPM9rvwe9FFBqWfUX855VB+a4MS7pqp8rGpY3MIgC5
 22OC4N3WcQEYXM9wYsx7aTIlMMZJH0hdpp779zFXeAQ90J9suN4sIs7F6CVrgxAhD6/O
 8WyB3Q4xKusTDsmds94tguhFCpOzvM/tQDIvh97CzID1W9b1zumphk0p4tyw5ZiagCbE FA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=pJMPxJsSyRwqLlERErZLeN9AWf6j71GlUdExTppShuU=;
 b=bLrrvYK+EjeljSFL5LSinci0aRgxSvhjGgVtTPJMn0S8wpfzL35hC+xE9xCnS75tW6aG
 57g9e7RSYd3fg4Y5GVOOrNMtlkMFW3u+96IhFQlWMcZAKf4idBkDw12Con69nf0CApgv
 wmprwEdGMr/4otfw5wg5Q1h8RgrCDh99IMefoLMByE5YcwJfnl8pDhoucUiyDIgOh3sF
 IKSLicr6wL9KMVhN3SOPtoxFdSzBMBoTZFiaFobiEYhK5t8/4EokkVHnWuGvgEMdZAfX
 hwMxTXaQ4ylaD2Skrdf7nomZiHAKWf04H7kLG8KoazWXV7/RPY5KXllmEt19xHiBy2u2 vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3a0afrtjs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 09:17:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16Q9Gfn0176218;
	Mon, 26 Jul 2021 09:17:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by userp3020.oracle.com with ESMTP id 3a0vmsjya5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 09:17:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV46LXci3iWnl90+Wnu7kLYsREUpKfSa5ILCR7IXm9GT9MZB7lZZn5EftfpJbLgI4AG/PjjBvwVHvqP30P2aNpqES79UoRCHr6YGaBDKauq2Y2ByZxAn+C/IKedELTEtmXlJSkzzG0h0UJMjtUDHBrxUCW4kxEKi3aQaZKkz4CU7yUg7MkMRgHeenCePQNIk9vKoP60jEeUoxggkreDtBNQZkLuFNKDrF6Yqi4Uelq+SITnLtwsAwHTTtYL2MRrWhzV0OnCiKTRcUeHTpZPl8KXulqqzrRO5M4UlPsC+fr9fuP5lVz6pRmTNt/YSH/H9KkluDxRj2jYl2ltklsCjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJMPxJsSyRwqLlERErZLeN9AWf6j71GlUdExTppShuU=;
 b=JVRMqqJOCc07Iwh2n2WVWKPp3m1GJmiPbDqOObMsjjZpvVqVOD0OUaDRIDJp2msqLDitZo8MBvIvdEpEuEIfv/sii7TE9YnO3ElKH4gghd3UsCYi+Vn7EMLq3IHRiGWDpMj8+HFxtyxed2CiFRwE8lom/aOS3rutb7Q3ahFDfqA9Dup359yd9LVlxasKfadrZ3IC7/lkDXyIEVFpXjFbKeWT1PyJOF9MQGbf/PwJtRUQ5tkr1ipbOZeCq6u8oqlvMHhpKgeBcbvQ6XNniRM8BybSIMayl8itUHZwLM7DiWLrpG+8L0pmQuvZsStdOyAZzf2j+21tBZSfHfjlz5rg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJMPxJsSyRwqLlERErZLeN9AWf6j71GlUdExTppShuU=;
 b=w8NVhS252JHI/6VNPeFwEpfMJNQujNx9bIMAgz9vTobsmWr0pf4szVDbxFmo9L2Jy6iLO5I0fH378tCqkk1LW0rJSNHSq6WiCbsDz66r2/lhPuWakV+dbLs8Y17qaH9EgqCOs6YKQ0W/MTkoZiQBze+JGdH9B6NAjFPOQFVnP/Q=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5570.namprd10.prod.outlook.com
 (2603:10b6:303:145::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 09:17:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:17:40 +0000
Date: Mon, 26 Jul 2021 12:17:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
Message-ID: <20210726091720.GI25548@kadam>
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
 <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JN2P275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Mon, 26 Jul 2021 09:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53db1a22-a12e-4c69-dc10-08d9501637cb
X-MS-TrafficTypeDiagnostic: CO6PR10MB5570:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR10MB5570FAA5888503FDE0EEAE158EE89@CO6PR10MB5570.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aj7Xz3npYPZOuCQ0qdTkiDZ7t89vczpbC9xeh3Bz2edBmq6sCoh3lGZ72VGaRA4U6zXvjVth+LN4AmUk4hs3xFgQ/ZqkNa5hiwV/rcLkUhu92NVF3iOvWPpdxOH5yz6BlJ6rHU5E1ndqgPHQEgjgI4TbB0lGCJnZu3HwBa0UkxLkSaVvhf6Gy4OQV6xIeImbMsBRrM32xTYEJLtTr9wuQuS+VxyO4R7hUZufzducsCVB4d3edzX9TEbuXO1+iZcX9V6Z9aVcLD1Hh44mKVu80TPK8DhLl3sST/clk3phZK11cyn7OLaggQzGegMZGiwR2V6nLqZB3jBsdc/vkmarDcsTDgYy/4UW9uH9FvaCUx/PVfbii3iXYSFwAYv4vDKY+oCl5sBy0rgDXtNaMM2I/ykpZE0nlBAZBjUt/aack0cxMVJMKO1TruJdYhaFXkuFZHSeko3V9zdgfhCg8ntbSJTvt/F/oy9dQrgwkHc8+R1wwzSNs2LvcwEhFjRQSSkcqDJ9IJWrZWwq8TllKx127prCz/x8R1Q3y851t0EZRsmo8jhd8iGoE9PxWWdZXQE7uy5ais49ipW8Rd94A6mZVJm91HlqHahXkd/Ch5XoA4dEfEL0GWJuwF5O7X+Vt8xyAAgzPpz1df8r/GdvP6em8wkyxAok/9nVBmx049dUxxnNWpXIi8nrVcV5xuPpdF6XQUMssIqIr8u51uECARtQig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(366004)(376002)(136003)(6666004)(38350700002)(9686003)(478600001)(186003)(26005)(66556008)(55016002)(33716001)(66476007)(66946007)(33656002)(44832011)(4326008)(5660300002)(6916009)(8936002)(38100700002)(6496006)(9576002)(316002)(4744005)(8676002)(54906003)(956004)(2906002)(3480700007)(83380400001)(86362001)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iDnFlNXof5QWdgmpOPJiId/dJZf5FcubnDOK0iG64Nc1rAfmMC0JOZQEhRhn?=
 =?us-ascii?Q?ALOCAEHDxamBzBNXNXGqVlZOYW1AeW3dRHFRNP1NeF9yt+r2AM19KMZvjxS4?=
 =?us-ascii?Q?idbikxDmj/QKcND9YVICgZT2DdlXm89LzpH6XoCz4UGuUNXMXxaK9A6wclp8?=
 =?us-ascii?Q?3+fRoMJf0OgPIk4jMWEsSW2f4HaNvvG+C8XSeNoIMiRVxGM6AoQQSF9yUIIA?=
 =?us-ascii?Q?ZFYv/WSByEZHlDGXvUuJy4bKSes8r/allJo5bhI3n7T49DPrq9JEZE+cOhfr?=
 =?us-ascii?Q?DeAbqbZ3iFFYOgYLK7ExglA+UW3lbwtD5EVnNb3PxHqNq2wEb9vxv5Bcmvwc?=
 =?us-ascii?Q?c5nQu8Ft7kZhpt0lfKukR+Sf7lGPabmO87DfHiHeeCfEzg8zrqZlBKnjw7aW?=
 =?us-ascii?Q?lFXCq5ROgLK+SmCF8kfBBwARVt0J99P5dJAZ9hBUY4GbHQPEY1xR8luWP3cK?=
 =?us-ascii?Q?j1nqXehFLYV4ypFobL/QOnogrDgu2gkdyl/RnDYHpDLDntrYLgfQKxS5XXOU?=
 =?us-ascii?Q?/GjDTIeC9RCq25Nb8BLM4HmecwmZ9WgmZkgg/XOtLX04vfmBpVfOOhDSYMMm?=
 =?us-ascii?Q?+kfWdOo8NaxGvhvBLghfnK8H0VzZ8BekTavMntAZp7cbIG3JWpXTc/hXqxn9?=
 =?us-ascii?Q?h4nalWyJlMvwQ8oOdfUtY8Jw8GqDfTtrISchgYQ2N6b9Fb5M3mk+Rn7G/K96?=
 =?us-ascii?Q?KJLnEXzElabpUMvhahdTQpsyNRnUzc+lHwnI0Yb4n5hMA2WZunou7C4GI3e8?=
 =?us-ascii?Q?yvsMAGQdead9qawAYdLfjjBLdKy4+b/Qs9j5aNyJ5YMORtoWGbFmXvwtplBa?=
 =?us-ascii?Q?5ZOuiNy1aQNXtA5HLL1d8i5YzVQn0m2zvZ2zLexuwF8n1nb/6GqN2+1427RK?=
 =?us-ascii?Q?ol3k981xC4LN4l4PDLK2NqwuodwCwdGsVMy0lcns6ogWHZ1tIFyp/e1x1HkC?=
 =?us-ascii?Q?ro33xsrIABaSRpTl6/pSy2rSqkJomXcB8ECo+bn13JP8ogiTqUaVWhoHU4hn?=
 =?us-ascii?Q?2YLlnYi2Cqv7DdrdqnUhR5HSUSLvFaq3cgPPzMIgmt5+waj830nn7IwghGSc?=
 =?us-ascii?Q?q2KFlzzTYLPoSrSnXXSbI4ezxehgBlyKc7pbWR9ogUtVeA4/RZeIslMoLxPF?=
 =?us-ascii?Q?7ALwbOLgzcgrIZipo8SOTtJLCRO/04UZBU3zxRX0ZIFTVX7FehwnFKMNBhxD?=
 =?us-ascii?Q?q8A9FIGWXDzd4A4yo82dHKDM6BdiyTap6lIo7c+FF9n4tpgbucE2O+vKo35W?=
 =?us-ascii?Q?SVUFY58JIdwPJJXIngLVDRXu8vfrUjykVv1K41GXQcm4ENLft27cMehoHjfT?=
 =?us-ascii?Q?jVhRDmaG+krneiohkUB7s/S4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53db1a22-a12e-4c69-dc10-08d9501637cb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:17:40.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwH0B7ArmLKG54l2DTq1odM1mM+raFtEDn36f6e6QrjVaCLhr85A56VgPkWs0lb1DeWuSpWE1sMqLcGs5DnhVXrchxrHMEVyjJUB339VxJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10056 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260053
X-Proofpoint-ORIG-GUID: 5aHOJyof_q7tris4JB7tvMGv4KNYbQN8
X-Proofpoint-GUID: 5aHOJyof_q7tris4JB7tvMGv4KNYbQN8

On Mon, Jul 26, 2021 at 11:08:01AM +0200, Hannes Reinecke wrote:
> And that I would consider a coding error.
> If a function is able to return an error pointer it should _always_ return
> an error pointer; here it would be trivial to return -ENXIO instead of NULL
> in the first condition.
> 
> Not doing so is just sloppy programming IMO.
> 
> Cheers,

But it's not an error.  One place where this bit me recently was I was
trying to debug some code and I added:

	if (err)
		printk("function blah returned err");

But their list iterator returns an error code when it got to the end of
the list so I was flooded with errors.  It be nicer "if we can't
allocate enough memory for the next item return an error pointer.  If we
come to the end of the loop then return NULL"

regards,
dan carpenter


