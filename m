Return-Path: <ksummit+bounces-985-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DA77D250
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 205C31C20E22
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC90A18036;
	Tue, 15 Aug 2023 18:46:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B0C2C9E
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 18:46:51 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37FHiFpv005075;
	Tue, 15 Aug 2023 18:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=E4UlhfV7SpYDKlWREh3L/zaVMhrGDRmHg9IUhaLjmx4=;
 b=T3MFZE01H8SsCZmqthfMipZ62RkenD7tHwlLSGNGMaapmmrD+uRcyKeESJ8pXbcbb6h0
 P70HeLZRJKu+VOdwWOe0D6DUTEzfKLgrh2Jgbn3BdVnlUzxXQPhka92/7VGyHAtPkcbj
 ttDKaSYRNW05XpQDfjGKFeA6aieAeM6jxcUp9MkhoHgO7okjeoyFfEcQ/o2qsJpeEqrM
 3Q9Ji57NDzwecS+8E2s8n7yv7kaP1FOFkEDLf1Lsr4ddChqGc5BIw2vqwIGUj3JB26Jw
 xhsyrAPiWyJRkEux50XKrTdgkGKVe5OBM4SkNN7K+T1AQwuH2psjNB6X2d8pfpZq5mcv pw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3se61c59up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Aug 2023 18:46:48 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37FHBkT4003743;
	Tue, 15 Aug 2023 18:46:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sexyj6tf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Aug 2023 18:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXol08F+Xj9I8kyTAbtfHrpQc1fMm9XTzQtOcntHjIl9G8c1jSB8VbJ3aKsI7EJQ1nkWLG3+eogciPAr5CAfvIFuzfAu+ly0Gj7/UN0cnkqN//Tj89/g16Us6ZAmTOXoMWAAgQGMVXrhrZt9IJHiiCIxvgRefHzBEOUjtrOgzNyw3IkJ3qMZg6EEm1y0zWoIWaCp2Z3w6bPM802nxowcLC3Rh0z9RIFTLy4HD+5HRcqDE5ms3/Za5D1D/2yvE1ixqgVdbTG+fxXFIHHkHuW4g+Ly5FkUSB1xa7BTauro9s5TjTMNawIquZqj1aF01Z6q26mKt87r6ASF0AsIwIUaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4UlhfV7SpYDKlWREh3L/zaVMhrGDRmHg9IUhaLjmx4=;
 b=VnPog4olAEC/xgJh+SV6o/EEXIoShRw9MV7ptX/Ak1wzM/FjJwT/r0zjK4WZAd4MUOtcnZ5d7+NquQWP8OCkkdIrDyVxXJAsAzOrv8n0kte/T6I+phCkJ+iYI32at2zSrpJpj7Sg/sL/+lx8VBaNQLXvpyjmbQhvOV2S+YZtvTEIxHEeSLx9lm4dklTgdiqRnR/45WaO3zqNWQBaRsCHa5+Yg7j7fRJYUvd8TOZcRIMX0maAQbk220eVHbz1MTsVAsddlmvHuaRf72Q+9kGg+9vX75XBpJs2JG2QKuxJS8FuhoEzBc9/RN8SUVmYpuo99sMrDowOv1r0FUFMBK9NbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4UlhfV7SpYDKlWREh3L/zaVMhrGDRmHg9IUhaLjmx4=;
 b=yR6/Cg9ohQrxMfABjhfivlsQVFqfVr94pkHHD1LmZ9fomZXr1Y4c62l5pfgSpiszZqvwV7eIsf0sjH+ghh4/25M0c9ZWG//zmqliUFKAJZpPwWmJhHr5RGth4olrcJdil1e+AfOLT33CoYJVF1HvohCzbp1uoYYRriZgT0NinUg=
Received: from DM4PR10MB6719.namprd10.prod.outlook.com (2603:10b6:8:111::19)
 by SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 18:46:45 +0000
Received: from DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::782e:adbb:c83a:1326]) by DM4PR10MB6719.namprd10.prod.outlook.com
 ([fe80::782e:adbb:c83a:1326%5]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 18:46:45 +0000
Date: Tue, 15 Aug 2023 14:46:27 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <ZNvGKEDS2CBlUliR@char.us.oracle.com>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081540-vindicate-caterer-33c6@gregkh>
X-ClientProxiedBy: MN2PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:208:23d::12) To DM4PR10MB6719.namprd10.prod.outlook.com
 (2603:10b6:8:111::19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6719:EE_|SA1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bc5f94-8846-4261-5e43-08db9dbff976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KWTyhfw8Q5pNbgb+8qUZx622ZuVsIQB3Iu3uGEMIoexD4Ii+aVBPA1M4axGUJLqjZhrwB651rJCl8M35yQXht2fjn1Rz7HB4wuCBiBT4ApF9vRYiUb69mAWTahY1JqFilgSWX+4gxceomDUeW5HZ7Tgi5S/ScMT09dTM/esJ81I+3dyqu1PwLakeEsESgaiBz4nmuMl+QEhAFp4ZMrMc2xDvgHRVSI2/qlkk6/PSb2rM6gVDMqE7TmBwKIDgA7HAOmH7mK03k0EgHXDadjT5X5t2NMPuaT0rQdMmMr9k+BAwXxbxKAvLAyj5iUViJn3j3AR4iiv2zJa/ihfJTVNOoRFKAWhx7smn5pYoPfIZq0oZA4RsTXALEeQBUMr6kGIqcuSkbs/fcOUvp2emqEu+4qLRAXkErXeIUT6HXgPmENw/YUE+XBDYAND8OxtCZTWfeCB0sJsTFBWu5QSNaL0bMC7zcpO6E39C6IJCuL9QnYPdcHaXh0Ku18LlIzBJSD5nTIFZmGY6cpqEjpgYjr/1yQrOA3ugiQv5C21Ie1Hqxoy3LSWXRYaASh8Bbx4o3wBjHtKP6Fi6HeX6ZD/b9yJSuXwtyD42jDG+Cei+7DUNBYl1mGawv7Kzkzo/TRKAGKG1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6719.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(6916009)(4326008)(8936002)(5660300002)(66946007)(83380400001)(41300700001)(54906003)(86362001)(478600001)(66476007)(4744005)(66556008)(2906002)(38100700002)(6666004)(6506007)(6512007)(8676002)(26005)(316002)(15650500001)(6486002)(35693002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SfvEDIKqQSZJW0KXfu1aSjDs2OyKLLX5Li31PVjhOhS2Oyr6ZAyXMZ4OI7CT?=
 =?us-ascii?Q?enp7MMxSGW898UaNaxYjleQL1emGu3AyMOlv8qduc+1h7lVJetaGpQYjkNoC?=
 =?us-ascii?Q?oTQT/LMMra6CbPVyl2jYykMocfMmSIZ/wdlO98Npm2aNxKWkXltJvb80KOOs?=
 =?us-ascii?Q?W6t6HUppaE2sLWwFaCOfCmZ0Kg+C+G99AFxCBDrqLXT8Wn1cH+6kcS8j7n5M?=
 =?us-ascii?Q?U4y5ixrDSoQzFN/IFaogLj6thtI4RT6lkdok7vVdU+naakQKN7Njj29Lcp6f?=
 =?us-ascii?Q?xFnTwqxBN0BQD7zp4UzAUKbbjMD7JVkSnxf1suuLv4wsxs7U6f/QvSTYBKDO?=
 =?us-ascii?Q?UkdlnzO5Y15FaM+MdRxhJ+GIXEX5sEI+dkat4V3TR973ubS3K8sQ+G8JqgF/?=
 =?us-ascii?Q?RnrLSn3LjogTrBjasGehH0jnY/Bo5J0f4ZkrEYo9H1VrWxHaJdV6fWvN1yuz?=
 =?us-ascii?Q?NM+dDJPmhzls0yK//Apd5JdYjXHLB7K2Xq1YE/dlfaXry/c2BdrGzqFxaRII?=
 =?us-ascii?Q?el1NZOD34gs8q78f4zutlbqDwSWTSfA0uHtwGcUppr6GgYwImFm2Hv9Y1jBB?=
 =?us-ascii?Q?G9gbva1zzoIK5MCzvwEQTVsMBh6UmHeAlLq0pPgmgra5tKvx9UpQH8UFEYs1?=
 =?us-ascii?Q?YIq2PDjVizPfavg+70B9C2dZgqUDf9AiHDuvZbnp+3SyKI9cdi/mZ/l8rzTB?=
 =?us-ascii?Q?V4VgUA8sJKlbbyv+R7OdQzh0bz3U8LTWqGrQQmOD6nEqqIk+FTcGq9mOtbmY?=
 =?us-ascii?Q?cIjZUTrPZ0bhMMOZlUy3a3nXh3JQsBZJWk38qfN6ktS7LUPYDczMdvyfSLDb?=
 =?us-ascii?Q?HOSeUJzziI6cq/W4bLErKZ3dxNUav+/X7Akzvd3+fizXYXliUOTziaGWEivn?=
 =?us-ascii?Q?yEJhmbTGxHohk656AE9hpANE5Na0R0oWIySgqUiY4TOmPMZzGLTtcei6PAva?=
 =?us-ascii?Q?4vIAT59+CI8D3PTCV5/SFcgOspAe0Kb+iBcJZzChDhYF8q3AZIOzWtrQrqCr?=
 =?us-ascii?Q?6go7H3kacZFEWoDKHYHUC3MqTqN2DmcaCeWfjRfJ30kEHTRPbcW/hNecHnS1?=
 =?us-ascii?Q?2fx4hCnC6H7sqOnQ4XQQphEopdHhQfMvmJ3kCld0YwgkWA+0hR+sFd1hL/sD?=
 =?us-ascii?Q?dASssTlRdxtzpycF2NPn3mpeixZIoogqmBENKZr4gVvtW3Un70nZ0dh/yNpw?=
 =?us-ascii?Q?mC6slOUS9OL0ZzzaA++Xdko0m1au/h5ea+yR1bL2JEJYpTAHIgKt2KZwRr6X?=
 =?us-ascii?Q?pgfImLYbwmkzFLjB++TrCJnU3Dts7jaiQRvs8IU2ud2H1TQTE39c9NhGIf8i?=
 =?us-ascii?Q?KE3EINuLRf2B2Vc5ZfBV/ONsFJGEKCRwZNK6DE7MdwQDNqc64bEgH0O6kP4F?=
 =?us-ascii?Q?4q/mJThPp5goxW3JRHaRfj2Jw9NrBTDl6hG0kMU53xkoSSwja3u6SE/1y3OX?=
 =?us-ascii?Q?hDJEbIrJopgQaUHYI0E4wplfa7gs3Hl1ofdqNe8fAOTs4Ey3BCqnmPos0zM0?=
 =?us-ascii?Q?3v7ReJlm8HHrJ1X71bUtH2G9B9eH6hGMA2eXAZt6oyyj1twSRVcKhk2MVVyb?=
 =?us-ascii?Q?UjAsexkIjY391imWvgTmHS6japZ7l8WXV8v1TDUrja5DWqvSLlsvKqImh+xt?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AYau3OH8qa9FD7xP6eOyju2SZI4HPUyTgAH/AXK70zM45HQJuN1byKWbCq6J6E0VxNIac8j+662vLfXMRazx9qoCRloQOpmRdBDpOesN7Cyc7dBGN62oRGjcaxpfEumPpcJhQROuX2yKWpakzonebc8HI1xv6VlRwBPd82h6uksbxphz5C7HICXC1ur2e1XTgyOyaZ7CtSbaeySkbDzruuGmYDZVAvHj/eCPaOjgviCv2yixez2imgzlXzaBgSpiROE1uILccZXa36D3pUBb/VlNz5b+5fpJbG5jngtZmQHfgqp1hBHfOPkD1bispUZdQ5QugG+VlDZlZ1LbcfS3EQjAKcNnMan7OUs0LX9491SPAwWTqJMU/Y5Vfre55OzUKMEJw9AGcYOOUGLCud2d7edKO5VoU6JxU66CqSmhkWm6XssD8FscTfdUO+JfGxqotXA+HNTObyNam5SboUETZAEIj7pEa7CwFy7dW2YRxBVtEotSEh9T6RGOABPgEPiNWXh6P8dPqEArKK6DKOB0tGl7te6+EtfprafhvYcsNibWkLTCBWo5bAZUQJag6eeyIdjEmMm8dXqeAt2lkNOd7pUgziCwL1f25pe1dVSr5sYGcvpelkTO+Q9zVppfyoU2BA08+X8TDHqAb9jZgVUAaTz1NQ5yultWJvIGnSh7WNHRw2zo6C0UdP+r89CJB4Fg8OmGaQ44TnBHaxefnhF8Y2ZDoImYL2O5hMsZq5+eJx3MpelgMl91nTfMq6TEoNliUoPVsyNCvo44zS6TSvE1Tm5BNyIfP9OWEiQAzfOKZefQ8DZTZ7B4pCzQ1ZhBtQ0lz0HtdEdZbl342KqO2gao5wOfQ3ucUiVyu+pS1g47YXqdcY+TmO1Xnf1FVf5HmI3b
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bc5f94-8846-4261-5e43-08db9dbff976
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6719.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:46:45.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egQjuiJ1hpXZ07Ct/dYUeaC8GlQLQ0LA/VVVe3uKUxqfL4pqgH0MU4ozjESnOrnqB3w0kLWg4rdv/TBKRJjirQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_17,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150169
X-Proofpoint-GUID: LSASsZE1mEi2ej0wwgE3Rz4uodf_CZft
X-Proofpoint-ORIG-GUID: LSASsZE1mEi2ej0wwgE3Rz4uodf_CZft

..snip..
> 
> We used to have someone on security@k.o that would notify linux-distros
> about problems when we had fixed them, but I think they got tired of
> constantly keeping on top of this and stopped doing it.  It's a
> thankless job, just like being on the security@k.o alias is, and I don't
> blame them for stopping.

Hi Greg,

Oracle will happily pay someone this "thankless job" (actually I think it
is a pretty exciting job as you get to learn and try your hand on
everything) to do this and also help with the security fixes.


