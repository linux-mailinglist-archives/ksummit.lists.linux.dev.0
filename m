Return-Path: <ksummit+bounces-2431-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E5BC63C8
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52FA405D08
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F8020296E;
	Wed,  8 Oct 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="uZo02id2"
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A128534BA3B
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946696; cv=fail; b=Xa00vrhCv5Yx2RGTx2Pj5Rfoge6LS0q3WA6ThJjj9erSR+m5JwHTlRSJKj4t6j+0ATPxONxkeNUB7syJ7g8D25maxM5TnU9oW7vkO++YVE2A3m4ez7Rf6lsy+yKiIwEMhRw+cvEXwji7wuzqyqDgGy+M1o72OLLh9Z/6lj9cZV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946696; c=relaxed/simple;
	bh=80+3oSyyCOG8/fRD6IrAkOpjoCErP3yeliZlp1i6D+w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J35Sb/67shMRL87+nYidj+EQEOyC4IrrU4oQvkB3k5vPpLuDZJslkzvwu/UUfmAKxkWcU691Kw+fS7G9WAiJI1WEYkrofbiM3doXy0tR/e7tEAqoCPTizTh16J/F8Ol7vBGOxeVmgfVZoCbKZl8w3nE05GYL3MBDvzV+HxJ9A4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=uZo02id2; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598EZdfN3818023;
	Wed, 8 Oct 2025 11:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=RP4zj6RZ0Nl0rSmPykvBQk46p/zyOZlkqAWPB0JrdXk=; b=uZo02id2d8w/
	glcabYfBIYhnM9d/GF7MTk+ZVKnoWXfAKtV+BLDCyIkyG1b7Dss3zeca/HPMoMfr
	raCs7Zo/v1ljfPWBL5GzwmvZpBhR3IQ9eQv0S3W0hGX3wGv++wOF0FAdKj/lE2j/
	2YSDEQuEAS7ZcUWYjhOV+aomz4jUYFcbvpWLl6+IM7/mxvoaA/6bR6X+dF6Nv3N7
	jMwSch4YkBDAdJxB4ZlCyr3GFz/HuDhhgzDFa6QWuM+TidfRXeP1E4qjy9eyCHCm
	GWyjKg89QXZemmfLdn5jyH54mNq469mN2aHKernHo/I9ZJpAQ65n+AX+nu6qRh3D
	Ay85k5HgHw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49nsut9ydv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 11:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXeaoWYDnOX9mkUC/lhKlquG3kT3VSXtc1Hh3+k80pgxAUb9jXaMXGnk7yyfGZOwN24sQfmNJXN4kW+0SGlpswqsgonns+Y+mrD/ebgusQp41gBVqPxvaDcN85WC2B6V1iFpzzoszQuM636X5na+boi/iE2zDkCoM8WagSNpZAp2XwlX51KneOqQAqQpow5EDLiR39YShJyZ0Otm9eVQdXfCsVx7eOgludIUIHH6gHQbpY7U/Mdm97Q8A1BTDc5563EEF3DTX9ONXG18ewhBbMp0Cz7DNHaYWFJzoTsY7LMnZHtc6DZa6P7LvrCLBGFP7VMlemYNr43dGIJza58sLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP4zj6RZ0Nl0rSmPykvBQk46p/zyOZlkqAWPB0JrdXk=;
 b=GjUQWkKp/6LZJzmLu+4l4DmHjQ2RLRq73i0fNuYrwg7Yg4PKM4HU0rD9NngldymG8SSelJsFkL4Y1Q4PuRaIROTlV4yR1BvpgXbDRoKpnMito3qYy/KsFA9j2ubBgj7xl2+de2plTRPrin5864OM0guGM38CXOgnj1bg0J65ZTCRZDk4eGZDiQcnMjVpOn/iyWzZxaihTsFlSMOqDd2U/RH4N8vuvQYfJI1Zoam8Cy66BpO4JFlq9QkHseVqyjFnNY+FkEqsw/tZ7ixGZSkuE2qIHhmW096CHah/bZskhCJROmgmuD3QnFvxHCa+9wi+S57kVouFGT4C8Q7OKveOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by IA0PPFCE61BADDD.namprd15.prod.outlook.com (2603:10b6:20f:fc04::b47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 8 Oct
 2025 18:04:37 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 18:04:35 +0000
Message-ID: <3ffd9164-919e-4fea-8597-601452537331@meta.com>
Date: Wed, 8 Oct 2025 14:04:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:408:e3::22) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|IA0PPFCE61BADDD:EE_
X-MS-Office365-Filtering-Correlation-Id: 444e8b96-8165-45c0-ae2a-08de069523bd
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkVPS1Npb01zR3FIK2hVeDB4TUk4OWIwUTJvMFN6SVQ4c2tNc3pHSlllMncx?=
 =?utf-8?B?L3graDltUGJpaTlYb21RK09JY0pHMTlaN3Rqd2doUVZlY1I1S1Z3elBGMHJL?=
 =?utf-8?B?YUFsTHMyV1RyWkp5LzVISG44cjBpbGVpZk03QnRiM0phbStJVXlMMkpkNE9s?=
 =?utf-8?B?UWtsVzJrRWtSK2JrM0tqME1LRWZ5cjdjOVE3MXgxdE1nWHNMMmEvayswb24x?=
 =?utf-8?B?YjRuTVQxQ2ZWbGxoenN3MXNkUnJsZVBYZkFjdFh6c09WK0ZGT1RaeW1aenBP?=
 =?utf-8?B?R3JuRlBnQndGUjhRTEtTZ3pVdEYxZXhVdWpDa201QXFYc2ZtcG10b0p4SDJ1?=
 =?utf-8?B?TEdXV3hPZG9oZ2tIQkRhZUhZMnh3YlZITmtFZ2hxUElpQW9uVXJxTjVxeWpS?=
 =?utf-8?B?a1h4QWhndjdGLy8wd2dJVHBhVmdpcXVDa1lHTzI0bHE3MGxIYzRPSUZTM20v?=
 =?utf-8?B?Q3UrNDBiOS9vV3FWWEJzRG5CbmxWd3I0ZlVYd0d2b2lHTzk1SW5EdWIwNWJv?=
 =?utf-8?B?UmFWazJqM0llOFZzc0RPcmJSSlNJcW81Zk5UWjFTUzlNTEtNaXhTcGRKTTho?=
 =?utf-8?B?TllUOVEwSStpZTZGcnJZcUJpekRDYWFLK01JQXZLalBDTVgrNUF4dGRWZTRs?=
 =?utf-8?B?NFY3SnMzZlBUNFEwNTE3ajVCODVIK2ZhSW0rQ01pZ3d6VUZaZW8xTDh2Qm5K?=
 =?utf-8?B?WTM4RkdpVEoraXVjTWg3ais4bTRCRXJ3SHluNUVtdG9sQ0M1REJ3czdrSy9T?=
 =?utf-8?B?SXZCR3Rzam5SVVZpNXRhdW9qL0ZKZks5bHRCaTJFZzBmbkQ2eFB3NlJmUkRw?=
 =?utf-8?B?UVFZTVVqRVhrbVZKeXIyK3BMVUVNei83ay9HZ2ZDaTR3ZHBwTnI2bE9jbUVO?=
 =?utf-8?B?b3NleTNhTFQvMEh4RHJMWHgyTXdPYWxhU2FZR1hsTzVrbWxSWGVacVNHeUFU?=
 =?utf-8?B?TkRLcnUxVm9idm5RWlJYaGp2MXlOK0dzdk9VZmZGRTliK21mbkFwbTduNm9i?=
 =?utf-8?B?NG00VEZacnZKY3p1dU03TTdGM2xlZmRxU1Fsa3RPZFdCQmVOUCtRYjFZb1Za?=
 =?utf-8?B?R3lPZFhsV00wTDE1THRtZzR1WHdvVE9VckxtbUxWak1PZ3BFWXJaaXh5b2t2?=
 =?utf-8?B?cHM5eXp5dzcxZVF4L3NES05MWElpaU9GaEVmNnJ0eWpIZ0RLTTJoMlNLTm5z?=
 =?utf-8?B?UDljdlo4VXl4VkdGUXhLTFlZMDk3L2Fha2RGT0V3cldmenBkRmRqK3dDSnpG?=
 =?utf-8?B?Q3VoQWhCOHhYRjBhRzhOWFFKUThvVUxDTHVMM1RrZ0E3dmJseHp6MVpuK1Jz?=
 =?utf-8?B?VjJUUG9VWkN5alJFMkZlZTlqMjFHeHQ1aW1qSk1qM1BRSW1LeENLczU3R01T?=
 =?utf-8?B?aDk5cHAvS05uMkw1QzBzWFJIdDEwenBzYlFwU3I4VW9PZ2hmSWVGRkhEZmQv?=
 =?utf-8?B?SWdxeXFsZDBHNFI3MXNNQWo0SFhXbzhNZE5JYkFuTTViR0tPUCtMNCt2RWxP?=
 =?utf-8?B?MHF2WVFOa0grNUd2WUhQT3FsN2xEYkkxVURGTEdTV0VpaE5YbXlnN1pxeTFU?=
 =?utf-8?B?MkIvMWJEcUlScXNLMWxRTXc4RjJDYmdOUllVd08zaUN5L3RxWG5yRXBGd082?=
 =?utf-8?B?QjZEVzVXSHlGZXpBQ1VKMmZmQWtQVkJxVkJkNVUvelg4MUU2Q1FjdTVZdzg2?=
 =?utf-8?B?bUtCdXIvOWdpR1ByRkprc3E0bnU1UHRuRCsrVlRHMmkzbW1CY1JkcXY4V3ov?=
 =?utf-8?B?Y25aZVdWMzdGZGJCRWVsK0Nyek1udmg5bzdEejIvQVhKaWZoekp5enhPQTFX?=
 =?utf-8?B?SS8ycFp3ZmVLWlhiNHZQckM5bzZGK3AwWjNwamljMmVzaldVd2prYjkyK2FM?=
 =?utf-8?B?c3BrNzQwUyt4VE1VcDFXOTdQYlZqRTFFcXEwM3ZCYmJ2MjBqbzNDWklleis1?=
 =?utf-8?Q?G8ER3d27did1Ec18t/gBylfyZON+cX8Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEJhY1BjcUNWemVsNkxPNkNiaXU5WDlJMmNyd3FkOHdFWXJhR21IWXIrdXc2?=
 =?utf-8?B?UzdtUms5dms1NkhuM0c3cDlkRDBaN3Fwb2pDSm1QVmRsMTRiTVRhL2pxZmlB?=
 =?utf-8?B?b01TS2tKZW84N3E3bk56K1A2dEdqSG5aQ2EwWVRSSXFkcHBLeXdvWm1SUTBs?=
 =?utf-8?B?d1FpdHVadUFsalVxNUhzNElyeGJoRGpUb1R3a3JUS0NIcFkrMkNwRmk2SlVY?=
 =?utf-8?B?UnNUQ1B6elVvaDRSNWlRWVJobWRpN21xNjhyK2hyWk10TnBEWk8wcDJyWEVC?=
 =?utf-8?B?Vjc4aFRja0VwcGlZMy95NndQcXg5V2xEenNLYTBrMm9tWTdUdHBpRm9KSXV6?=
 =?utf-8?B?L3c0SllOQytDYnE1T2k0aFpMb0N2WDhTaGk5VWFMUDh3ODBkM0wvZ2xuLzBn?=
 =?utf-8?B?a0RMZVpTODNxK0svZER2YmMwVXVQUWJrakxLMzl6cFBYS3pXdEZiSDQra1E3?=
 =?utf-8?B?anBwVnAydzRwbTVHdjFoZWhlT295QmRHVWt4VlhNZXJWeE9SZjNvd3k5c2Zz?=
 =?utf-8?B?WW9rQzY4Y2ZvTlFFNTA2Y2s5d1J1Qmd0cVNDMFovNk14cDVRNG1OdFp0QXRT?=
 =?utf-8?B?NThKOXVEcy9zbWNsVGgvZE1IOFVlT3Uxa1c0MHdiTVJ1a2hBamI2MTdIb0ti?=
 =?utf-8?B?UzJNRndLRGc2dzFQczJNSTFoc3hzejcxZVN4Zk5mQjgxK0RkbXlzWi9KVkNv?=
 =?utf-8?B?NzBHQXBIMHVVLzFKTy8yaldBbFlsUzg4OUVpTXJsQUJ2OGM2SEtDZWhMcUw5?=
 =?utf-8?B?NlZUYjFmNXl6N214TGtEZU9GNHVIQUJoMi9rNXNLY1A4ZWo2aEQrZGhZV1Mz?=
 =?utf-8?B?NG5XdlRNaXpBdEdRZkhMdkJZTTJMZTVvWFpLVnJsM2doTDh1cytOYWMva3J5?=
 =?utf-8?B?Slc1cmh0aEFMd3AvMU8wWXpUTlNDbjM5Q0h5NzVadk5mNlFmSWROTnFUdjkw?=
 =?utf-8?B?ejBEU09FRFlLUDVxVHBzNGRZUlZ6TGVxQWFVeUlWVmxEc0xTSkcwNnhHdmMz?=
 =?utf-8?B?dVEzd1B2VlJ5REoweDRPQnM5RkVMNjd3d2x0OWxFRnpKT3VLM0VDRlNMdVF0?=
 =?utf-8?B?ai8rbEVnQkZEb0lUTnQ5OWt1SHhsNDVyVVRqTXNxb0U3K2d4MFVxZ1BXYXp0?=
 =?utf-8?B?dDNGbEJ0cG1QVmNMK3FxQUJYN2JjVnY5MlBPNVR5aktEV0lBMVNHdGxHR0JO?=
 =?utf-8?B?MVhROXRyV25nUE8yaU0xZGRRelJYSU1aV2VNNlVlWStiMTlvSjdRZzhFRENn?=
 =?utf-8?B?MEJlRDhCWkx2MUdkS3JGVGs2RG1Oc3pKM2RqcVpMajhaZ29jdnVaMUhwc3pr?=
 =?utf-8?B?N3BKQjI3a0RWREdXTFptMnBjT0pNMWx3bkZoVCtKb1JuR2EvckVkeWNFNG14?=
 =?utf-8?B?cHhEUS9DclJDQzZycjJleE5hMW90cm9jenM5VnQyQ0lIMWZkanZUbUEzQ1po?=
 =?utf-8?B?VDNJUkE4WlNLWjlGa0ljcEsxeCt2cFYzMVp0VEZxV3BjWktZNUNaV21XbkZn?=
 =?utf-8?B?ajVxWDVLbm80TmFrb0hxOEdTQlJTNXQ1VWdRQURJZUtlMXo0MEs2UGhXMkN3?=
 =?utf-8?B?eTJPSWNmaGxvUlp0L0hrNnJibm81aXVBZ2t0UjBqVzhSbDJhVERydkc1YTY4?=
 =?utf-8?B?MGRjZXJ4dmJFaTlrVFkraW1GNzdwUlRTZTFvOThOWlVrZXp6NTNWTllVRDN4?=
 =?utf-8?B?RVl0cHRwZHcvamRBWkxKQk5zMlBGVytlbzlNME5jTW5EZnN2ckdoeTRleCtz?=
 =?utf-8?B?U2VadlhOc3RnU1kxZzEzR1M2MWQ3MDJCSlg2VjZNTHNwbFV4NnF2V1pTdVB5?=
 =?utf-8?B?Ui9OLzhpZk9YSXNjeDJWeURlWFkwblpOVzgyemtYYXpTbmxEUDNja1ZrZy9X?=
 =?utf-8?B?NUJQVU9lcllGTVRJSy9NMGlacS8xS0pURlFBNld5SG9jK040anpWZ2FTbnBm?=
 =?utf-8?B?T05IWWI2Q2tPa3BTaDRicjlBSzVPYk5OeWcxWE14TSs4dlJjYzlQdklJWU5T?=
 =?utf-8?B?VkhzZGN0RUFtT0M3TGNzUUk1SG1lZFQ4QVNRUTI5ek9tRS9taHYweldBQ1lL?=
 =?utf-8?B?SWc3ZGZZeUdsaHR6enFVRjg3MVgydWhlSHVVR1lLT1dPSkZaekdzbkN3ZWFC?=
 =?utf-8?Q?JUcEO9Zv9V5rPGi+M+3qc476N?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444e8b96-8165-45c0-ae2a-08de069523bd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 18:04:35.4245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQdCJGBP8vNGm4Xo1vNUeGdU5niI78ulmG97cyUidTTENgOfTIuuFCwgetXTgd4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFCE61BADDD
X-Proofpoint-GUID: J3lywaB83l47pWQqljx_MsvEowTIgc5G
X-Authority-Analysis: v=2.4 cv=UadciaSN c=1 sm=1 tr=0 ts=68e6a7be cx=c_pps
 a=0CcWBAfodXOgQTORYPtXqQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=4S_XNI7_UbG4_VBkAhoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: J3lywaB83l47pWQqljx_MsvEowTIgc5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyNyBTYWx0ZWRfX97aKvmCswuiD
 /YfGFjtXGUp5MoHPcsW0NsZ6MmS4B79wMg1y3LRnGpeIvTMZcSMxbEYRJaAp+dSs/W2bhkvUkkO
 2IKoSEl9x8B2R30qGjeeRlAx1a++WQfffcPfIvMQJLYVI6MnuNSJkzxZkvmWR20/zaXn9oNhTkP
 U1GWWk4mQm8PsYWg6z/B565RLuKvjzyb5k0rLvae/VfQk5ZAWqkXHARVP1IgVaU9JPZt0H9Gxb6
 nVvzQIuP5E81GwJQMQgdpW7NzygMYEVBzkerDCcjFdvJTgiIjeF6M8X4cllAC9l052hStAJM9fj
 70Ya8y29FWOjrsIvstC34q6J8rpIfsZte3G+uwRKbSHn7EVSCslHgCvO51ft8cUj1MSCQ/VC0DJ
 fmIkaYMYlJmssiTu4eQVBPM309c79Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01

On 10/8/25 1:57 PM, Bart Van Assche wrote:
> On 10/8/25 10:04 AM, Chris Mason wrote:
>> 2) A code indexing tool with MCP server that Claude can use to find
>> functions, types, and call chains more effectively.  This makes it more
>> likely Claude can trace complex relationships in the code:
> 
> Different kernel developers may prefer different AI systems. As an
> example, my employer expects me to use Gemini and I have seen it
> producing interesting code reviews. So I would prefer that any AI
> code review prompts that are developed for kernel developers support at
> least the most widely used AI systems.

The prompts aren't specific to any AI, but so far I've only tested with
claude.  I'd gladly take patches that enable other tools, but if you
read through things, you can see it's really just a basic framework
around gathering context about the kernel code.

Claude really needs aggressive use of checklists to get it to stay
focused, other AIs may need other tricks.

-chris


