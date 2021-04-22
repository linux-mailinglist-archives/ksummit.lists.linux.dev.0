Return-Path: <ksummit+bounces-60-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD4368085
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AAB4E1C4C52
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84FF2FA2;
	Thu, 22 Apr 2021 12:32:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117229CA
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:32:28 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MCDOIK016416;
	Thu, 22 Apr 2021 12:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0S9P9b2S9kSlZGoIEs10NTCoFFr8wi6qzh4TycxfvsY=;
 b=TaRMBQJ52TgBdV226dApA1V1VuUNMwJs2NpP7D6V5nCtSw4paKLLbb48u7uN+vH+ml/8
 dXPtK974COvitJy1annecg0FWPqWqAd7Ubo0Q67xE+byY4BDI3GwoaE7vnOpzsWzsDlC
 4qZlY9KEgCiZS9A1fSzOY4bGFU03bA4aha8UN+Qs1hN0YrhpFiec3noIyIyId6icWByd
 HXC2tTTd6t2s1A6bDaZIqnntU6O0Lbg9x8fywwblFkjEjiWTYA3Lb121qPYDiy/eLZAq
 RQVDzwTwn2ZM/gkTqqRlvGMm6b+CooPuKjgFsg8CqKXdyIU/ETYtsyBpybLVgEJ76o1j vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 37yveamv22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 12:32:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MCPP25009900;
	Thu, 22 Apr 2021 12:32:17 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
	by aserp3030.oracle.com with ESMTP id 383006dxac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Apr 2021 12:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdWL1pTuT2XGO66rf1otg1XROw9BnGy/TinKoTB3DKdQPd+DUhb7dHdgzEA2HLcPtgXKHbSYfsG11lk6MrMQH3ZTMefnMQIACnS12+i/iX/3xuC6IDHhl+o1HNsed8/sQHy9HhAlQkbdA0XbB+x3C2QmOpRA33vp0OOL68rrSyTWeQ28uqX+JHTPpw/SvbzwLVE6lSoYcpug8skIO1Nyt33issJop7XC7j5+A+cSD2PqhWMT7fEiE2XArX7aA6lR+TexAeMzaITF41C/pFXIoolwMrwTuMy+uCSKSN2ajzhV8I4x64NxUrot5xUBgpyPEhYibtP2ybH9DrR7xeS2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S9P9b2S9kSlZGoIEs10NTCoFFr8wi6qzh4TycxfvsY=;
 b=PeO8lsXoMQXIdlLnLIU+yInIVNjBkukNXjw7hAW8TcYMeEF/lGOJPQ/HAaxljnYHNtKOGI7+z7ie4NdPDNhc5YYujrUMPKhbWBtfFWW7LLuiIdMGNxa0+SUqT5iyUQU8cYhlv1TbKefRKK5PO03AiWWuhNalpASisHk1r7tLtqC2fjbXV51gMzkGBBgSc9E9i1DLS5CRqoH/2S8/8TuK6c3wY0BQt0w1BDNSvyO3UsfYz6KRbU7qykMESJSPyxpafvqIcLnMoavUo3RF0ZAm1K09nwrE8iWp+m9AQxX29hMbzMpWJIocxGrtwyMgFA4nsgjbFWDtyTmcaDA6BxT/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S9P9b2S9kSlZGoIEs10NTCoFFr8wi6qzh4TycxfvsY=;
 b=n4Ox/XsNZPhqWSQrFFY/SEn5OZ+X2Wg3lRe52pWVNQI3kZDgLpcZgJAXkZEO5S02SXXHx8AfSBGLns/0+12IqPym+60nMfQ74oAOKppIxK1LG0VY9jCx/6yDyDDoiBT1nOh540pWGgMe/cTMhxFv4vscA50zE+PmiaLCUIpQFjI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4423.namprd10.prod.outlook.com (2603:10b6:510:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 12:32:15 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 12:32:15 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1o8e6shil.fsf@ca-mkp.ca.oracle.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
Date: Thu, 22 Apr 2021 08:32:11 -0400
In-Reply-To: <20210422123559.1dc647fb@coco.lan> (Mauro Carvalho Chehab's
	message of "Thu, 22 Apr 2021 12:35:59 +0200")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SN6PR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:805:66::41) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SN6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:805:66::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 12:32:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0a1c9f-2fed-4001-0c01-08d9058aa936
X-MS-TrafficTypeDiagnostic: PH0PR10MB4423:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PH0PR10MB4423B5F6DEA510501D8FFD908E469@PH0PR10MB4423.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	20BU60QSAeKkaySCToL8LoI7yye/DLnB77gCQtX4BLinSxskl3yoG6WPHdJJcBCCU9oBNypCCAjUTXfz4LKLeh7ggK3U0dH02MwNV6dqZFh+DjbAVIbKgirucmQ50d8ytGdUHfBSpY6kPREAVNfYKbiNKhXETFNvCdcjwoyq+3LB/3ccBOUNrejTpwy6UPguw3S74x3Ak63cslnSfO3NMsNvKsCbr/MyVfygstVZs2zvuJyxEQRnVRunPYZf6QuF/DdDq7KTpUWocGM05CWELcakvAZX1pUwHgbFlho5ZM60LwHTdF+mdbID+wUMdnGUCm4oM6SODC2dhngYMcFTFhIFxJo9pUK1V/WMktDblNCcUzNfb7VAA50c37IMaQmhz2fGX2CHxBfwHQ2MPP/1JDX4HzJ2JJvcbwJsAsFvfZDS4a4+t4b3FN+bQnscMvl3eov/RPt2kZyaUOWjzQu04Qa6km/j3CaTGGfb9R43eyM0A9uiRP12Cx89kwsfqosqZtsRYGgrVTsm2kiu4sKXyTyXUvOxUXNStvGAseuZBgBLG1IqUAlMz3JbyAwe8JPXOTjucQtLqqbuTMQB2dtnS066zQsBNRKVPiSd6ucTAq93nnkM5ckD8GaAcWaKsjH9mrkuLsGKS0htLMBwR7cVAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(8676002)(16526019)(38350700002)(6666004)(86362001)(38100700002)(2906002)(36916002)(186003)(55016002)(66476007)(66946007)(478600001)(956004)(26005)(5660300002)(316002)(4326008)(8936002)(7696005)(66556008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?jk+dwegeBT3gQ87Ut1wqibhbqIZ+95/K7PjZe4pSPlcKyLC3L6zs9zlV7I4r?=
 =?us-ascii?Q?qPG17vdIvOabwMzA5mUVu8rsOFTaslAgT01+oxjmgY8Dv2D83YnJbG5YpVr5?=
 =?us-ascii?Q?LYDADToRsf0I6HKnrGd/JFJrBwPTQpLrNbg0EZYk6liDX6od+QN0oM0VTFaz?=
 =?us-ascii?Q?4Yd+8QtmCZ8X3W7HO+fZSj9Nt9YwyX01zx0sQHwDV29tzCl1Iry8w40HYCsZ?=
 =?us-ascii?Q?aQuWDYo3+mrXBIMhODEgp35t6ZnrryoSCxjzerxh0SSmb8DHs7StcRHStWO/?=
 =?us-ascii?Q?H1jo5TGSCgUBIvmJ74JVtxdP2f4PRrlbCbIZwAyli8JSqicsOhGD1HwIYXku?=
 =?us-ascii?Q?Ng00Uhhv4nO3PuTMt/7Sqh6dQqdTpoPm1T9RtertE9xakQvm6huc/uC/tHjT?=
 =?us-ascii?Q?gGG6hXwKohIsWLQ6Fl9UOVuljDyv3mkMleClBAuz0qimAw3ANw2iOuLobgx1?=
 =?us-ascii?Q?A7wdzmxDixEb4qMCa7+xrlI0/Y9VbcbQ09GNyGK+VfmEzdtRL8kJvGkdhyK/?=
 =?us-ascii?Q?aY6TzneBjtW39QY1M9KriWi51tN1dujtET95+zFjxp3NkmAwLcfTWb5Kk5aP?=
 =?us-ascii?Q?YAxJcKLMRMeRwgc5T+JnIiOCozGYjidYYV3TmFBelndvhjYsPzS5Se69I8nB?=
 =?us-ascii?Q?MTJBm6J0Hw9qCgdOahyIFngAyqdoJbDODQKkrkXwFqzeyVHDewhMf4qtq35O?=
 =?us-ascii?Q?GIOcz7jBIVNozyBxAlMKmXH95M19tz829EeT5bjx8sH51hQk62GRtvCBUa20?=
 =?us-ascii?Q?hQdRU1mvjLS1P8CndKwpYL6qyFTpA12wN2PJF0mGAKuk2F8lTT7Yw0jvmCvQ?=
 =?us-ascii?Q?EgWUbmAobe/BVVGr48bJAt03Arj8ppVNS6Z1/vxWYZOxvPQ86o5sTOllJJeR?=
 =?us-ascii?Q?Nnnad9Hr89bTPShgZ8RoDw7g/aKJN8uCVJEW3geXJ5a2JaNGc6HTX04Kw8yQ?=
 =?us-ascii?Q?aLK2FsGG/Uy/kIntCP7DVoKo36Xoods9ydPnnnNb25xIRjo1Zm5kUkDRa30c?=
 =?us-ascii?Q?V4qfks9r+qs0PM6erPBwa6GoCQvJe9+/VXFijtPcKjY7Iba5IADKsYLSAidq?=
 =?us-ascii?Q?LgWqBTLWqgP0C0SjQ2XGKSEg5LVPi2AhjREjYgPv+gieBSbr7QE8gcmkOVXY?=
 =?us-ascii?Q?dJAhqPoXHV3yljHAzE+DrIaUGy02Y944gJdsTUFkJ2nx7jfs0mZYCw8c007r?=
 =?us-ascii?Q?MmSMaT6mdGKgVvDaKDvKx5/U6XYzsMth4tP005Ytx4Vub2aD8vW8+iTZKFGi?=
 =?us-ascii?Q?kil1pOzj3vq6diSksWv+feGXFzBrqooDV5RMIljThwBBMf1SLseV0aJluPnd?=
 =?us-ascii?Q?TndsH2r7aYVCyh7fW8hH+inA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0a1c9f-2fed-4001-0c01-08d9058aa936
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 12:32:15.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkukRbk3KGDYBqP/RZ9usRVv0ZCN6ecAl7XHDu2auu1uiJz1b1Mr4agAqi+VjPeIWgXdobBL/N1f2gacI0C6LPLemD45LeTSsSaTkDvRhLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4423
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220104
X-Proofpoint-GUID: dPkkJ65zfbNEkhOvWLf43Qc6zx4qMj9d
X-Proofpoint-ORIG-GUID: dPkkJ65zfbNEkhOvWLf43Qc6zx4qMj9d
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220103


Hi Mauro!

> Perhaps one thing that we could add would be a
> scripts/get_developer_trustee_status, which would be returning
> a set of indicators that would help the maintainer to know
> how much it can trust a random contributor, like:
>
> 	- how many drivers and patches a contributor has written;
> 	- how long and how frequent he's sending Kernel patches;
> 	- what subsystems received patches from him;
> 	- if the developer isn't on a blacklist/graylist.

I do a 'git log --grep' when I see an email address I do not recognize,
sometimes I also Google. It would definitely be nice to automate some of
this.

From past program committee tenures I have a bunch of perl hacks to rank
people based on git history, mailing list posts, etc. But until now I
hadn't really thought of doing something that elaborate in my patch
workflow.

Scraping the list archives was the most painful part but that is now
trivially easy thanks to lore ('git log --author pakki001'). And much
faster too.

I think your proposal is fine as long as it is just printing raw
statistics. I am concerned that if we turn those numbers into a
one-dimensional "trust level", people will instantly start to game the
system to artificially inflate their score.

Another metric that may be worth capturing is how many Fixes: tags refer
to patches authored by this submitter.

-- 
Martin K. Petersen	Oracle Linux Engineering

