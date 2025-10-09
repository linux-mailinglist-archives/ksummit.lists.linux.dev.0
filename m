Return-Path: <ksummit+bounces-2473-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0DBCA98A
	for <lists@lfdr.de>; Thu, 09 Oct 2025 20:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47E204FBCF0
	for <lists@lfdr.de>; Thu,  9 Oct 2025 18:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8928024DCEB;
	Thu,  9 Oct 2025 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="luHJdrd5"
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A473595D
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035394; cv=fail; b=olpL6QuZpZu9JR53hFue/CCEaEbRh7thcAxo33Z1yXQc1u0xlY7eTCUwNXsIaTv1SGhh5ZAmVcchwi6+PYN8KFKjOQHsD0RYB1Er6Zpv6qYOx4YCHSX4DG8Byg21b+0806li3XveOyGpHw1lUh7lJp1/wq8FU6gU2nbEqv6D+qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035394; c=relaxed/simple;
	bh=VgCWoXByAZv1P2H84rL83ypZLbwJC8qmpB7Ur5upHe0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WJifsVKPuEeNaLvEvYrjKzPjmZBxkpNorNqqFLZ1EHxYhyqAK7evQiQx40NGJv2VFI4iPx2NQTY+1JltYCMi1heoa/WriMg1ZGO/OGzwARH7+wxL8Pk2/gmnfPvjeuNRtLkrzCN+kC9JN2T6EYtgQbQ+xRoktZnaX55wGsbisZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=luHJdrd5; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 599GobuE3668424;
	Thu, 9 Oct 2025 11:43:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=V2X4lIEbRJ/m5kJWom8gYchFdiJhWrtY86BdYIZ+Kfg=; b=luHJdrd5Xm6u
	lACyGFb91p6UtCQ/t/jTD2JBZ7ULEzxZPVaWKakqMa0qx2ZyN1M47/HO30Gxz8Bz
	SssxifLk/y55PrZcqwAznhi1ZpvA6x5ZgAt9j91PaPG6NA0SPCAQe7jYFwRi3iYY
	MXMwYR3N8eJc1WvgiLF7q7qulG7FH0jovTUEb8K7Z9WT7uPElStBjtwB9T4E0j+Q
	TqvexbupRITVJHIgTPtmz5fWsUFWIAo3B1Em8TAftK8xPa+vrxWDhsxWKazuI8en
	dZgIksaAYLPcdeNVrCRE7TrxvkxEfEhd0dxkhZZxruUwcP6/q5zjzOLG6oEgxAos
	vktaPzxclA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 49p9adn5yu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsJgOZaPswaIQ5GapP6+3y30jorY232ImfHZy7sFryqhp0UAGNPMQHsXyBecdBOaRbxRqtPXFEwxaMjEl1c8FlTzG0bGU2Jwy7T7IdkUSkD++yRBXwgPMjXCVswk5BbbBClggV9CKRn4OEr4K9pjO9OijXEFFP1eI5KEgRUF9+0oYpWto/ocqv+l136lhrnaNT9MLlOMI2mH/oErVoOSk1oy6ytpaz7FwUI3+nbHHXw3Hd0nyo5NDiOmp+hKJIZsh/feO/M8BB5Smt1fGxhtRuIUWnRRnxdXqPzEiHTFymfFtKv5yAg2bv9BMtpfrve2BpiAOMxLJNQfkyphQVZsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2X4lIEbRJ/m5kJWom8gYchFdiJhWrtY86BdYIZ+Kfg=;
 b=lgsuM8Xaextm6Ep28ZDpcYzbdlZn04jMLV+TIkxTHyu19N5QUYczScE/PCTyhD0fAMr6CJPEOPrtRPE3MsPP6Pa8S3Kc5ZGwfRzzVauBoX3Fp43+zN6iZusU8q4djNuDFrrm8Tnt16NkJv9xSI5KHu1CG9LcC8e15J24pwoEr3YbxAN/Nj5CQEbDYcg7o7hOu1rBPKJmTmGMBiFuh9z3hdUdxcfSMzoIv2gARutPj3stuhVpppnu1CmAyp2u/ko65eOwgLKNyXgvpjcDSDHGQrWIbYLt3zqTRr5qPIidzIcHczwyUb+xDxZ91NLII5zCgPQE9AHDbK7SXvt432vqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by MW4PR15MB5136.namprd15.prod.outlook.com (2603:10b6:303:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 18:43:01 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 18:42:59 +0000
Message-ID: <72b9b81c-765b-4047-bb3b-40b2a8a6e563@meta.com>
Date: Thu, 9 Oct 2025 14:42:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov
 <ast@kernel.org>, Rob Herring <robh@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <3f25bd06-a75f-4de8-b8f4-f92dffb62f09@meta.com> <aOfuu8InYEUIZdWH@x1>
 <aOfvuqPNLtBPlc2r@x1>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <aOfvuqPNLtBPlc2r@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:208:530::10) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|MW4PR15MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: b2665773-4e2f-43eb-c928-08de0763abba
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blZVRyszOWZ1ZWVIV0RCeTVkTVFoQ3NMaTl6Tk1FUXh1UXZTVXZrNDJoYVkr?=
 =?utf-8?B?T3prakZETExZN2tJN3czRlkwTXJPZWdORkRXWCtweW9lKzlkZngvYkpod0tW?=
 =?utf-8?B?S2REVmFIK2t3QXlSTWhHV1hiMExpdVM1a3JkTVpCQVZMR3dCYWszbjRiRGVt?=
 =?utf-8?B?TUlYVEpwWE9HbjFJVEVZM2xQNmFWSzVQMmpIN05wcDlaZ2F4eUp6SWw2eGp0?=
 =?utf-8?B?VTJGdGNpRzBPTjRKeVFHc1VTS1p6Z0FrVml6eUlSc1hlRjhxSjNVVzVvS0Rh?=
 =?utf-8?B?OWdPdlMvWUhxOCtIYlVMNWFuZ0dGUGxvU2YxVlNJNEkra0Q3WnNqSk1mTkdO?=
 =?utf-8?B?amttMkRIdFJ3anJiSm15VTNvSFhnTHg4WHNNSGhJN3B0ZE1jVUM0aXM1ZVVj?=
 =?utf-8?B?YlVhM2d4QmxReWlESFFqTGNsSGsyTktFSXF4TjVEd3B6VStwSTBaUWF4Z0JB?=
 =?utf-8?B?RSsvYWRDNWsvRUc4Qkd0NHJPajdMWGtZejM0ai9KNWFWK3B2dWdJbUZjZDRT?=
 =?utf-8?B?L3RlZFZjYWVYTzJtSW5CZkJrZzhZdTdTYmVrdm9EV1Y2cEpjT2d2OHNORmNS?=
 =?utf-8?B?cERqVkI2VmUxd0EyZ0gzSHdZbEtybjd6bkVHQkZ6THdSa1VaaUt0K3BWNncx?=
 =?utf-8?B?QTdUdExSOWViMXVlOXNJdEk3SG50UVBWTHRKOUh1RzMzQXdQRkxlSXFqdzRX?=
 =?utf-8?B?OVlFd3BnY0lWM0k0a21iWFJydSt6RTlOdnpITlRmamNaSEYwallKY21WK1Ji?=
 =?utf-8?B?RFFseW1mVCtZdlJKaXcwN1dwWFFZVnBkVUhYcXJmOXB3TlBSRWZuUEJVZmJN?=
 =?utf-8?B?aHJYRHorMFhzUDNCaUJrRk9jTVVtV1RJeDIrbmVXS2thb3ZjMkVhd1V4N21Y?=
 =?utf-8?B?TlNUejBkRXNqRmlhdTRlWXprd3I5S1JPbHlHVC91aCtnTnd3RTRCMEZLdVJS?=
 =?utf-8?B?UmZVQjF1L01lZ0Fyd0t3VndvS0hUaWU0cUdSNThWR0NqTGtmV0lneEMvRHNS?=
 =?utf-8?B?NktOWDJTbnFZSE42cUl5c2pyMGxsb0tMS0hMTmRySE9mcjBlL3RYUDFLMG5E?=
 =?utf-8?B?OUp6Vk00Rmcydksrb0I3QlhyV1JQT3FFb3lLbHJSU3h6MElDdjV0SFBzS0do?=
 =?utf-8?B?WUoyK1BmNjQ4OE4xSWNzT0VKZ3JjVU1xVGduSzZnMXRDV2ZQTm9YaFMybmNS?=
 =?utf-8?B?NnRJdkRxYTZ1TXNBbXV4MXU4dW1WdDI5Y0VYdGhCT242ak9XVlE5TkpWbXBF?=
 =?utf-8?B?eC8xTjFWYUpVS1FVNDludkpPWlBHc2E3bXZrTUFKME4yd3JyUlRianJyS2hy?=
 =?utf-8?B?NmQ4R0hzN0x0eFpiZVoyeHpmRGVUcnVBeFNwb0U5M1hVREF1aWRUeTNUci9N?=
 =?utf-8?B?cEJJRmo1TWIrOExrekhDcWdzWGpHN3VTK2pPNDFSbXJrb1RXc2VGL0wxMm1X?=
 =?utf-8?B?SFBudThsZU0rS25yWTlqaHlMd1BIbSsxSzBueDJQVGRFTk82dVpsbFVwRmdU?=
 =?utf-8?B?Mnh6czJLSDJFblRvbXpwLzlhaHA0dk0ySjZ6Umt4YThpTWlIY3NYd0h6VEdL?=
 =?utf-8?B?S2ppUGYzNitQMzFBOHFsRlFna3llNk4rdTFDaFE5YjFaUFkxNUFiNWdsSVlJ?=
 =?utf-8?B?OVNxOVo4cWlkVXl1c3VLT1hsVXh2M0pJbXgrQjV4TlVVZ3Q2eGg0NkxPaXBM?=
 =?utf-8?B?ZVlxR29zc21VQWZpSTZTLzhKRDFBMlJqWDJpTG1TZ0srY0N0N2xlS0hUNDFQ?=
 =?utf-8?B?WHRSdHNUaFVYMkhOTWpEOGs1QXVzVThnMjRlY1A0aEJ4djd1VThvRncxNzBM?=
 =?utf-8?B?bE52dVNodkxoVDdDbVRsS2RiSGtQN2RKbWEyQkgwYmtmSEpDQnQxYWdOemhz?=
 =?utf-8?B?SkIvM3NJeC9xTzVzWGtjY2lrYVU3L3BmOWRzYUlsVGJxTGtvSm15bDdVUG5k?=
 =?utf-8?B?bVlubXpXYXUwVzZuYWdWZUY5UU5qaTZJcnl2VkRnYUdhN2lRVlhja0pjNEtI?=
 =?utf-8?B?NjlVSEtCZmVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhVQ1Y4ZHpCR25PblFEL0I5ejFVaUEwWmlLVk1tSkxpa3RrM3JubnAvWXFQ?=
 =?utf-8?B?SmdneElGREM4bncrSTRrVGwydldObnNOR0ZxU2xDcmdSUnJvWUtqS1dCcUlo?=
 =?utf-8?B?VmtZWVRZeFhHS3R3dTFVSlRLOE55ZmdVQjM0V1poZE5sWWhPTWk0ZjFxaWRY?=
 =?utf-8?B?MmlBZ0ZKa1ZhS096dVdjTWFZaWxtN2RqdlN3VHN4akE5bTViYm8wRXJDejNy?=
 =?utf-8?B?RWRYcjVTUnhncC9wNTIzKzJVdm9CY0RKelNGeFd5RFhuaG9XUGJuTVNYNVdW?=
 =?utf-8?B?VWxIbTdUTWVQQUtRcjRsUzNCSVd1OEw0cHNNOVpSbjZQL2dyWFpGTTRZelJG?=
 =?utf-8?B?bWt3eGdxUHBUcm5JY3htcFRyelFKKzhQV0xJbW0yT000Q1BPWU4xQ00yY3c0?=
 =?utf-8?B?N2RRL2JiYUdxLzN4Ui9zL1NTVTdPNkloMFZaeThVZS92OExxSTltV0RHZUYr?=
 =?utf-8?B?UkFVUlc3Y2k1VDM3ZmhNNzFPWGxaTHUvUkx0V0p4Y3luYTVTZUYzOTFpZlgv?=
 =?utf-8?B?TmN4M0VpaVVRdmxkZU9sVVl2M2pub08vcTBuaytsS0VEcVlEMmE5UzlLMlgx?=
 =?utf-8?B?bmlYSk5KL0lqYzBpRFR0ZGxvdFlVWEVBR0E5QXk5cFpxZjVoQ0ZaelgxSTZl?=
 =?utf-8?B?dXhQNkozaklVZUZYcmliWlRBVy9wK1BKQllmVDl1aXJyYUpMN0NkUDVoTkZq?=
 =?utf-8?B?bkVKbEkvMlg0ME1xeE0vM1ZXdW02R0pKZEJHZW1TQm9XUzQ0cjhmMjJPcnhD?=
 =?utf-8?B?ZGZ3ankzcHhUWTFCREkzTXdQVXdnWk9qMTd2UmdWb2tiWGZaQzZEWEQ1SW12?=
 =?utf-8?B?a2M5cktKOUJacDBDWnpzM3lrK0xFem4zZkg3WnpodkIyR3VWR1JjemFvZVdt?=
 =?utf-8?B?YVNINEt3NkRXbmpJa1ZOenkxVTNYQk14WnlVMGFiMEZNa29NamZhQWxxNXFR?=
 =?utf-8?B?MnpPUEFiSDQwcmoyRnRRb1BjRmJnUXRzMm4rUmx4WUxFQWQ2dkJxL2ZkREgz?=
 =?utf-8?B?RzNyckJiWXlGTzdCR2wva3F6SjRwMy9nMk4xeXJFR1cxZlBXTVRzSWM5MFk2?=
 =?utf-8?B?OVBXSm5TM0pNazR0Z3V5R1ZvQTlZWm14bU1XOWRSNVh2QklweXh5cDFUQjVZ?=
 =?utf-8?B?MExnTzZuWVVoUTN3a1Jtb3hzTHptVmc0QkRUQWczTnZocGtXUjQ1bU5mVWpl?=
 =?utf-8?B?U2l1UVFaK0JENHo1dG1VTndJWGszUmJQVTlEdDJ0RVFqUHpxcG5rbWF0L1lF?=
 =?utf-8?B?S3Bxejc2aTJTR21jOGRIK2xwUml4TzREand5VGdpQ1haSHRndW52N0xrWjBl?=
 =?utf-8?B?VWplaVVpQWhaaUZpQ2liUktER2M5TXRMSk5jVlJMSjlPZEo1V3JBeXVrN0F3?=
 =?utf-8?B?WFhRZDZRVFpXZityZnNQck5NVVlwMUJIUzRGeER0ZU5OL3E2eUZ6QUVoMWFS?=
 =?utf-8?B?Y25yMStkUkhlREJ4RFBNRTlEQUtGRE9mc0tpNXUyTmsyVGFSb2NKZW9HQTZI?=
 =?utf-8?B?K0Vhc2ZyVUE0eDVVbER2SmtSY2RQUnhMN0hlRU1VTGkwQW1MMGZNellJRGE4?=
 =?utf-8?B?V2RPb3J1Y2piQzFKT3AxdW1lY1lVT1hHTDhLVlQxSitZOFF1ZTJZM0JlSkRu?=
 =?utf-8?B?L1loVzcrQjA4L091NGN1N3Bua1JZaVprdUkwaXJ0TWs0bDdIMFJ3RXBsSkI0?=
 =?utf-8?B?OGpqK2c0S0xFanpkZGM4cXZWbVpFcEtrSmVHaFd1TDRTL2lxbVY4VTZoeWI2?=
 =?utf-8?B?dHp2QzFlZXZnTlk4d3FQKy9zRSt0L0hhKzFlNmFLanJoREhGZDJJRjBsdHpF?=
 =?utf-8?B?R2o0c3FWZGMyTjlBa0lScDJrVVJjclA3UmZLVWZxT3U4QVJCa0ptbmFsL1lS?=
 =?utf-8?B?ZHA1VnFpNnYyOWxDVG00QS9SNXh5MW9Qb2E2RTJmem9NSjkybk03U2YzMnc0?=
 =?utf-8?B?MXAyN084TGlQdkd0K1ZmamVUZ09IbmdzdDY1SEhZbTlvbytON013Ynd5dlgv?=
 =?utf-8?B?NHA3MEk3RTloMDNIMGRaWEV3UjJ2ZVFLcE9YQVVCYVE0dWgzZ1AvYkNYMEJn?=
 =?utf-8?B?Rnl0SGVWYVNzaEtDdUNEY1VOeHZZVUxYV05OYnZyQmFmdnhwZlZFYVpGb0Nm?=
 =?utf-8?Q?63PY=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2665773-4e2f-43eb-c928-08de0763abba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:42:59.8996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF1UykP1wj0HeDKQv65Lu/Gwn5feszkWSxfuwKPW2OD/RbQID6+n5sDmZzxo0ReM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB5136
X-Authority-Analysis: v=2.4 cv=SfT6t/Ru c=1 sm=1 tr=0 ts=68e80238 cx=c_pps
 a=XYu8HXWfxIrayFrXgJv6cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=SAwnmHUCs4rj0GXYkq4A:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Eyk2tVpvh8E-crtwwAlWnuJ2TLWz-TS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDExNCBTYWx0ZWRfX+ZgdmyUc+UUi
 HuX7VqmN3uDkqIT+YoMHpb40I7aqLbtJa4885sGsoxeFMpQnxys5txG0A/qZNbMrGMvBe/aivF5
 4UGancN8XFIPqNVxc9qbCZFYJ+7h2TzwRDrjPemWPGkIi0eEqTP06h5+vwOLx3D/UB9Se7WWH84
 g3DKPlqVr1EYYoER6DORRqQcMkw4ZGTJqraw6bdzqUJRKmtyQcooG+VVVXM7AEJTjXeygfqoSa2
 8hgGmoqfR6aDWWM0DCx2wMBmFna4rzYptHA+gDX7Th/td5Xerxy1Xsm0IhXCi4pAwmsO3Fw9ZUZ
 shg3PeAOosv9okOU/cQf2MvRIl0Gjd1v0doEK/xF+VH7pxbqdn8VaizUGIu5Xj014bXtR23RUp9
 XwhE/YGiPFi5Vh8WZeI9WPtwU5/DbA==
X-Proofpoint-ORIG-GUID: Eyk2tVpvh8E-crtwwAlWnuJ2TLWz-TS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_06,2025-10-06_01,2025-03-28_01

On 10/9/25 1:24 PM, Arnaldo Carvalho de Melo wrote:
> On Thu, Oct 09, 2025 at 02:19:58PM -0300, Arnaldo Carvalho de Melo wrote:
>> On Thu, Oct 09, 2025 at 12:31:48PM -0400, Chris Mason wrote:
>>> On 10/9/25 10:30 AM, Steven Rostedt wrote:
>>>> One way I see this working is to attach it to patchwork. Sending a patch to
>>>> the BPF mailing list has their patchwork trigger a bunch of tests and it
>>>> will tell you if it passed or failed. I'm assuming if it failed, it doesn't
>>>> add it to patchwork and the maintainers will ignore it.
>   
>>>> Attaching AI to patchwork could be useful as well. But this would run on
>>>> some server that someone will have to pay for. But it will not be the
>>>> submitter.
>   
>>> Just to clarify, that's what already happens with BPF today.
>   
>>> Ex: https://github.com/kernel-patches/bpf/pull/9962  are all from the
>>> review prompts.
>  
>> This almost relieves me from the guilt not to have reviewed that series
>> from Alan ;-\
> 
> But this goes back to "developers should run these tools before
> submitting upstream",

I'd replace "should" with "can".  Developers are coming to us with
different levels of experience and resources, and we want to help them
expand the size of the problem they can tackle by giving them access to
these tools.  (szybot, 0day, perf, lockdep and all the different
analysis tools in the kernel apply here too).

But I also want to recognize that some people just aren't going to get
there.  We'll spend a lot more energy trying to force them than we would
letting them use the CI.

> which would provide them with reviewing comments
> that would improve the quality of their pull requests by using all the
> money that is being dreamed into AI and would saved all of us from
> looking at github, etc, before AI is satisfied with the quality of the
> submitters work?
> 

I think it's also important to remember that AI is sometimes wildly
wrong.  Having the reviews show up on a list where more established
developers can call bullshit definitely helps protect against wasting
people's time.

-chris

