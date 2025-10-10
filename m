Return-Path: <ksummit+bounces-2480-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E9BBCD6E0
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 076664FF2C0
	for <lists@lfdr.de>; Fri, 10 Oct 2025 14:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C682D2F3C38;
	Fri, 10 Oct 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="U5Aniuyk"
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED01A4F3C
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105550; cv=fail; b=SE7V43Fnc1pNJpvQrVZhzCEXynt7plt1+nJX50HOWHSETZlWmykmuL/wcDzsxRJPI0FUbR+sk8suaklAeI51WKxsDVtoEXZjUhWwSS/ltB7S1NjzHmqXyYsX7TU6HjwNL5irOVmOV+5atDnmbWpdOEIPeCtuuwd8v5eqbiOq3XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105550; c=relaxed/simple;
	bh=uUOK44tBwgQzOZvJcfWCDHepAHlNLzLk45DcHIQWpsc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G073zNyvESrM7h/srKTaZ+lpeMTrHPXcXCiVFAjS+9A/xjucoKnxUAGiOEhFGUPxFAOQX78+FhK7br7tRmehtTIMvsgJ9JumZMBAXN5ND/xsmEBxOFqr5LY+R+UGlI4fk3BlHHDsRsTPr7pnON3lNN5kBfkGPcXZJk/jjk3v5AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=U5Aniuyk; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 59A98j1P2503332;
	Fri, 10 Oct 2025 07:12:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=boxkDLiGBR08bzI+TwsT/x6rQbVCxDj0xtCQYYop6Rg=; b=U5Aniuykx8ZZ
	LtM7tOal/dG9207RvvEiATfER+yzn6iPMWCICOrhbfPu3jXUr8pYz3V4mRBnkFmi
	0IKrhKaejTLTbW59+GLpc31rNq++QDW1ftHDxXA9/tVboEiv5V6Gws2pAccoIjYR
	8f0I+OU57pe1YcfeT9v8xP+rEFLPl3cilg3VHpDg4a9WCrwIpzNOwA+cplJyQoqG
	9JCQoHXyixF0tBfaKOzIJUEyjalMxTKux7m17aqCD+6hC1ZJFvRolrQeZ48KlKVi
	hEcOWGbZTt9j9o1u8Fm/pYu9S8CLyjL5a0RW7AWLcMuyn5yVcg5hGiu06AlrL47L
	9DHQ1LBEEQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	by m0089730.ppops.net (PPS) with ESMTPS id 49py8psw1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 07:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlQ4cFEFK9BE9UTas/7Vq5tz2iIqcRDGnoRuRkcq0Y3ps8EF8S9s/Ufhdz6wniAgIHdu2qg4tVxBtJzUL4JB2chz27KD6o8G6MV/4iOOQTKMofwHBUAyCTzOLtu2tZr1BK8BlPO0vEZuslVXKZZL1SakjXrNGbK2CeWjpvu8aoNb41gVQrX8iMoQnEU5xfaVWf5oPEP0etq+Zx5w3DrTuSjkWrP6NLFuZkaZXCZXQ9Dd3mK6CHzIT2rkqYPBRWEZyOJUKRnfzmnKPyFKbPxbouFiZsaDe4Vx6GNCgXAkFnZCU4M7Ms2EA1AlIFqAulAiXvraOBUJg+AhX2dEFeLErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boxkDLiGBR08bzI+TwsT/x6rQbVCxDj0xtCQYYop6Rg=;
 b=BGq+pMMGJ3/cxT9jF5bWekq+Z617YBiekSigSLlZTg4etKCxzIRnysCDQY/wP6HIPs0f5FbXzJePeUosVmcv+NREsRupyBq9V7SbmEswfPno2uOOsYRWfe+sO3Y2fYgipm/z3no/82CbfY3F7qrb0Btr5YbT6/wok/GaUTaBim207PEjOiXWUwn7lMquuOenKvF46cfdYAHOFUeWIXWZlbpYOuzXre/9b1zG2sjWvcBOQIxzpK4KZ38ElsylgcbAPR1j4ductzAB181i9XVqIXGW5LOiZVWqlVejd++2CUccwaxZHl9agNn2h8OvvvMle/2rRfsnsf1ZuvpnqdZxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CH3PR15MB6308.namprd15.prod.outlook.com (2603:10b6:610:166::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:12:22 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:12:22 +0000
Message-ID: <c61d69f9-3434-44f7-8379-5d4aa280780e@meta.com>
Date: Fri, 10 Oct 2025 10:12:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <be5094b9-fb20-462e-ad2f-2b58e520b949@kernel.org>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <be5094b9-fb20-462e-ad2f-2b58e520b949@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:52f::20) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CH3PR15MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: b77a9900-bfd8-4325-066d-08de080707ad
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3JsdlYvV0tGMmJYNTBJZWJ6dE9QNXYzNmt2ZktkWC95NWlaZE1JUEFiaE5G?=
 =?utf-8?B?c0hxOHJxQnhtNGtYYU1VOXNhanhMa1B2TEJYTERPVTQwRGFrQlV5OWxEVXh6?=
 =?utf-8?B?K1RPMHNZbVNVQmxxMEw1STdzdk90dmJjTk9BRHU3RklKS3dvYlZEOEhvK0U5?=
 =?utf-8?B?cEg3VHIzT3J2SmFweGUvRHd0bUZpdUJaY09sZU4xSUhGUG04dXh4alVLRWJM?=
 =?utf-8?B?NkZucXJsMUJERzRmeElkSTRHbVFncjlVaEs3MGN3TmlmUlZta0o5Q0t4RWtD?=
 =?utf-8?B?L0dHSTlXN2M2bkM3WkowWTQ3Qm5MRWNQcjdkTnJKWWd5SUJmU1MzTzg4ejlW?=
 =?utf-8?B?YXRRb2Qwb094WmtYQVU5TlVFS1RiU3BqVGNJdy9TR0U0SjQ1T0RINHQra2p2?=
 =?utf-8?B?SVhhaTFDR05rNWJuckdkcklIcFFkOHkvenVMeTlLekhMT2JOWDl5WGtzeUdq?=
 =?utf-8?B?QitrU2pYVGZCL1d2VUR1QUlUVGhjY1NxQWY4aUFRMk9KbUNIdnVtOGlvQmpB?=
 =?utf-8?B?QVVhaTBhZmp1WDlKdHRzVDc3SXdjL1pZTTRsWHZaMXBCS0JBb05xTFBWVHIz?=
 =?utf-8?B?c1BObnFpblBFZ2lVZjVyNzcxdGpWMnpUbUZrcE03L0JjRElLRk1KaHhheWZN?=
 =?utf-8?B?MDlzMVU5OWMydlZBS1dyWGdvcVVFKzdNTU02aE95M3pERzJVdzJvYmtVcjhK?=
 =?utf-8?B?VU9jODE0bGd0dHA2RHNnSXBsTDQ3VUE0djhWdDljVVIxWTBUUUs0TVlrMUFa?=
 =?utf-8?B?RjFCV0p4NkNuZWFmbkR6K1Y5NWlCOW9odStCYk4vN3Jkb3BhQ3pZbVBzU0dP?=
 =?utf-8?B?Y0FSbzhLNm00ZnJBNnY2N0FKeEtzWEhRSFBLN01PT2lDK09UQSs0Yi9xVGFz?=
 =?utf-8?B?b2QraXhRYk1JV3hPYnhsUzFwUWkzTWV2dWtnSXVHQjhrSlcySld5bWV2VkJS?=
 =?utf-8?B?aGlnSWd0eFlabzlyTkk1YjZOZjVNVEYreExiV2pXZ1l2ZlUxTVFsV2Fwd1Yr?=
 =?utf-8?B?Z2pWNmtrWnRhVEhQckdNdW5MZlFSQWZGd2cwOVd3ZFpjNlBmajJJMDdGSzFY?=
 =?utf-8?B?ejNqZTg2MHltck9rZmFuMEQ5QjBZd0ZyQ2FLL0NpcWx4enhTYnc4UjRPTUN2?=
 =?utf-8?B?SW1XT0kwQzI2bDVSUUwxQXFtb3d5WFBWWXEwQTlXeEtobVlhbmpqa3U4L1J2?=
 =?utf-8?B?dG83Uk1SUmM3VEt2N2FFdFBiL2hHQUJnREJPK0dnMEVWRWpjSzV3ZzNJNXV0?=
 =?utf-8?B?cXZlUENLVS85R3NLa2cybmNwMUJOMS9DZG10ZDV5QUVkZzk5YU9DWksvZnlN?=
 =?utf-8?B?RkxhOFY3RVNGQnlGNXBWbStVWlJadUI3Z01WcjMrMWVNd0ZabkZwdXRBK1Ja?=
 =?utf-8?B?cE8xRmI1QTRZRndqVDZZZlBoKytJY1Bad1dlaWFhWXBFQ2VJZ3dodnFVZFlG?=
 =?utf-8?B?UE9HRGlwbWE4eC9Za2I4RDcyenBRSjZwMXZ4MUpGa3dZdGRNK0RhVUZBSmhU?=
 =?utf-8?B?V3R1V3I4ZzlDNlJuWStlZDhwa3laaUlPaXpYNktSWUdTaUVSSDdpb09qbzhK?=
 =?utf-8?B?UzB3UlMxc0hFaEk1dkFoWmFMTGdWcFEwTXhpQ3hXTWd5WlRUSVVNVWFXaWRr?=
 =?utf-8?B?ODJ2VzY4RmhNQVQ3N1VCUW0wV1hnSWJidVhUN2ZoQ2lOMGlzUmduOW02R2M2?=
 =?utf-8?B?TzI1dlJvZEtnS20ybjZhazhxWGNWVFBCYk55OGZhZGFJOUNGMi92ajFNZTZw?=
 =?utf-8?B?ai9FWjNWbGFhS3RBdHB3VGE0U1MyYjNoL2Y4alUvSWN1b0NUNS81M2FWMzRx?=
 =?utf-8?B?cisyMGJzbkFxUE13TW9GV2YzNVMycjcvYk1sVU13bSt2eWRGS3UrS2Mvb2Jq?=
 =?utf-8?B?clFnRXhiUFZSTlRVZ2plYXNtUHBqaWRRYXVKd01Kb0RuSlRFSDJseC8zTHdX?=
 =?utf-8?B?ZUg1V0traUtuM0dvMUQzdEVlaGdtaGhDNjVtUlp4SDI0Sm1YK0J3K3g2cm5D?=
 =?utf-8?B?Tmk5VGJMVERRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGhzSzJnb0twdDRUdjJpS0dUbGVZOVVKYnJmbjluZHpwUjA2T2g1ZVhXc2dX?=
 =?utf-8?B?dlVES2IwNE1yYkw4MEw4N1hOSFR0aEZEU1ZhWHJYaFpPNzRBSi9Bd0dEc0xn?=
 =?utf-8?B?TmZnVm5FWEY2VDliWFREenc0NEF4Ynk2T1R5TUFZekhTZ1J6UzFSYkxUR244?=
 =?utf-8?B?aitHOTJsclpValN1T3FjenljTmRqUTFxNVJ4YWg0RktRTW0wNVhZMVY5QzVB?=
 =?utf-8?B?RmM2NTViaEVrekVFdm9VZ05veW5QUjJlN1RJY0p1ZzRnWDhtNUdLL05IS3Jh?=
 =?utf-8?B?L2xzMzdMTjI4N0cyUFE4TzQzMUZvVlFoRUd2NlJ1eXdSdFJrNzBCZmVWQTFi?=
 =?utf-8?B?TGQzOHJzNEUxTDRaN3VHaklGQ2ZjUCt2NXRacER3TjNMa2NUVXR2dTRjQmtv?=
 =?utf-8?B?bWQxNUFqOC9UR0N6NCsrTGJFcWtZNG5YbWsxaHZxdWx2MlNBUWE4eUNpaVh6?=
 =?utf-8?B?SHRDSHlaakFCamhJbDZSaWxEdTVIcUt1K1NSVm5oaktDbkNscTE4M0R6VzYw?=
 =?utf-8?B?WllQZFlUZTN6VDBLY25SZFNEWUFrelZEK3FOa1IvR0J1ZTZNTEtKamZQWjlI?=
 =?utf-8?B?VlVYMVZKaFZmTVNUYktRTTlxdWlPaGtCUEczNzlvNnlpUXFUODl5VWxOUVRk?=
 =?utf-8?B?OFZlTW92cWNRZ2twT21qS1FFeGZGUE1yR2pOOHNLRUYySHdOSDkwaEc5OERo?=
 =?utf-8?B?WCs0QjdEYmJPY0FwL2dsVk1SNENhRUNNaXR1WEMzclBFT2FlUnI0MG9HdDZt?=
 =?utf-8?B?YlpGQXpCNFUzZ3lkLzluK3dWRStDYVRseHpNWWFNcy91Q1hyYkpGUGpBTDNU?=
 =?utf-8?B?S3RtdjlWOVJLOEpSMnJjMmhac1Y4ZmUwbnRFRkc0TlZDN3ZkQWI2WCtsMXE5?=
 =?utf-8?B?cjlReGVkUHhmM0p2VmFQMjFGYTVralkyQklqbS9Pa1pDcDFDL3EwVTlFSUd2?=
 =?utf-8?B?SWtINDNKZENPTkZOUFZaUHd5ZWhJSDFLeUQ4V3dBL0dUVE51YVg3UlZhb1Rw?=
 =?utf-8?B?dzlVeXZ0TkJnL1l6NGdUSXZTOUdEU1h1Q3NnUWdyZUlCSkt2TU1YS3BIL20r?=
 =?utf-8?B?djRsN2pwNStJVUVOTE9HQWVTZ2xKSG9PSGFrdnZRck8wQzQvVktzNGk0cHBD?=
 =?utf-8?B?V0JpVCthM1kwVTdTYUp4YjBObWdYTXZVWTFFOGpWajBoNmFMUlFZWmR2Y1Js?=
 =?utf-8?B?VkdKTTBRbmU3WXVoOGhKcVNqcVlQVzhwUG1CaUROYndzZjdVRmRuR2FuSSt5?=
 =?utf-8?B?NWNmeW5YZDlkUFI2d3JoZzdvc1FZS1VOcVlqL2hvS1YxTjFCdkFMSGxHV3NP?=
 =?utf-8?B?OUp6VDN2ZXRSRjZGWFBSby9NeXpRSWk3UnBIZk9PbWdMQnZpMFdVS3hnd2V5?=
 =?utf-8?B?azZBeE4wNW5pSXFtb0crM1JLSzRiUXFkWFQxOWdCZnp4ZU0yMDZiU01qdFE5?=
 =?utf-8?B?amxpOWJ6N3Y3bEgzUzBlbHF4b1N4VllWY3pOYkJEcElXd1hMbzVUb1VhYWw2?=
 =?utf-8?B?blEzWGxDK1ExdWlDRDIwNkM2WVB2ZjhvalNjbER2ZUJrQ2F3Q0VRYVpPbGJB?=
 =?utf-8?B?R1RyL1VydU0yZU5WQ041U2tYRE5ZeTNCeTN0b0U5OHA0Rmp2TlpWWi9sdVRM?=
 =?utf-8?B?UnpnS1RkUVJoaGQ1UXNtNDZtQjk1MFNrZjF5ZVROU1ZCRDE2d1FNV1J0d3hx?=
 =?utf-8?B?empEbTArSWo0cEtjU2JEMHVBWDlxR0paaGxUSWRZRkN5Y3htQnh3S2xFUWVS?=
 =?utf-8?B?dW5Gb2kzcjRCRVlBSUkxZHlPUWZGTi93SVFQUW1lWEdabG1VK2U2TStwQzUw?=
 =?utf-8?B?V1dYRlBTUTZGZVFQa0tqMjZEdVpDSmNjT1hjYnFhUmtoMzcrbXQ2bjZtMmw3?=
 =?utf-8?B?b3NPM2wvdWlmOHYrQWEvNk10OWhUdGZoRkNjSjIzSEJtdnY1QUMwRlFqMy9o?=
 =?utf-8?B?U1ZMN0RZMEN4cWtBdlhVZU9wTTkyMW1MTWIzdjg0OFZxV010dzlQVTcveWx4?=
 =?utf-8?B?bzlPM0JtTmoxdG1MV08xckh1TGtuRXdUKzBzZXMyQXVId0p5b01wRFlLT21Q?=
 =?utf-8?B?STJ3SXA0ZGU5SEdxc00yelhhZ212Y0ZTREVlY2FoQ2NTWjNCOVJya3ZnZnh6?=
 =?utf-8?Q?2xqo=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77a9900-bfd8-4325-066d-08de080707ad
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:12:22.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF6q2vrcJhihDSK6XbXA0aIKSyHLQ/jeInBC/YVq48I07bi2bpX7fwimfsca3aj7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR15MB6308
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA4MiBTYWx0ZWRfX4NdXEvVDLL/d
 U24n+4VCUu69eqBDPS7zZz5Qbr1dVRQfqYApSqLNRykBOWd3JbkeDeO2qxk+Hh89YEH/NcRItus
 NceogQtRLiLqLIzwvJbz7LLTXrPaK9wU4aeBgndjD+cQOLL8s3+3Yg9fvuLIbqIQTLsRdm65XHk
 xM7Wu9lwFcRbv2nlKaZkXc1AdPHf6GQh1nE+9ckVW4apFSvS9SNQFQuhZi09OZ2ifK1JTwJjSMB
 awmkG1CA+Er8kXNoT6JZvRh6K3jHp9TMyxpLIDukYw5Cqf/UFU2KtMhJozXtTxk8RaKMklWW1zg
 yChwscey0BhMaSPtJwqIp0bPc6FYnidURP3ZUHIrfKuSERuING5q5lAKDKrpWLYkEyOFJUMVco9
 7OCdGRcpYauxnoBa59aUpZCdBA0ytA==
X-Proofpoint-GUID: O5iHkh7JFvoZBJBUnjm85_5gUhTCaO_W
X-Authority-Analysis: v=2.4 cv=MsxfKmae c=1 sm=1 tr=0 ts=68e91448 cx=c_pps
 a=6BjqzLHNfcmCQygjyc7k5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=mwQmMAe5yOl3DbaEHZ0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: O5iHkh7JFvoZBJBUnjm85_5gUhTCaO_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01

On 10/9/25 11:08 PM, Krzysztof Kozlowski wrote:
> On 08/10/2025 19:04, Chris Mason wrote:
>> Hi everyone,

[ ... ]

>>
>> https://github.com/masoncl/review-prompts/ 
>>
>> These prompts can also debug oopsen or syzbot reports (with varying
>> success).
> 
> 
> In general, I like this entire idea a lot, because I believe it could
> drop many style or trivial review points, including obsolete/older code
> patterns.
> 
> Qualcomm is trying to do something similar internally and they published
> their code as well:
> https://github.com/qualcomm/PatchWise/tree/main/patchwise/patch_review/ai_review 
> Different AI engines can be plugged, which solves some of the concerns
> in this thread that some are expected to use employer's AI.
> 
> They run that instance of bot internally on all patches BEFORE posting
> upstream, however that bot does not have yet AI-review enabled, maybe
> because of too many false positives?
> 
> I also think this might be very useful tool for beginners to get
> accustomed to kernel style of commit msgs and how the patch is supposed
> to look like.
I really agree with Linus's comments about how much we can and can't
trust AI output, and I've tried to focus my effort for now on high
signal tools that maintainers would be able to use in CI without too
much frustration.

My first prompts told AI to assume the patches had bugs, and it would
consistently just invent bugs.  That's not the end of the world, but the
explanations are always convincing enough that you'd waste a bunch of
time tracking it down.

This is why the prompts spend so many words telling the AI how to prove
a problem is real, and framing the review to assume the patch author is
already an expert.  There's still a bunch of work to do there, but
hopefully it's small subsystem specific rules, or short explanations
that rule out large classes of problems.

At some point, I really want to be able to go back to telling the AI to
assume the patch is wrong, but it feels really far off.

I hadn't seen qualcomm's tools, but I think it's a really interesting
and slightly different use case.

If you're standing up internal gatekeepers to make sure early reviews
are done and internal process is followed, it's a chance to shift the
review bias toward teaching relatively new contributors about the kernel
and helping them research alternative approaches.  The gatekeepers still
need a person in the loop, but this does fit with the maintainer usecase
I've been targeting, it's just someone that might not be getting
external credit for their work.

-chris


