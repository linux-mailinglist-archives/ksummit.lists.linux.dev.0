Return-Path: <ksummit+bounces-2435-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E262BC64F8
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F0BF4E336F
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90853284690;
	Wed,  8 Oct 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="WuIJtd9h"
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515B11EF09B
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948552; cv=fail; b=B2xxEm0tf4okcbM32wKwuHEQfTOAZG9fTS9rxSFt5LalP3hmZoNgtqbT0vqXh1FRCDCSd9nSw3jY0PaKBPl9HkssLyDQkIwytfBlHpBGbUSjl468mxQcz52UADCMBYu5lVPdAlxZN45PYQuSoIOdwR6MklReznz1xcn3/4rUQCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948552; c=relaxed/simple;
	bh=1j873eD/+dyVYwXbIK8rB2nIyvTfTYogzZS0KinxqEc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kfvjBIZgvvlTxmn++4zsc8PsbY05HAEzx6STnLhaxrzQ/Nxs/8wFvynTjcJoVdczxbEO5jNBeVSmUa4pSqoHSuQHTDOR2ojdzkmndd1ncG0dxuiZmP2ykrLpUOzC0xRBZGieJdYK/jf5l/q8+MLVXGtr+gXSR30mFxY+W7tOjHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=WuIJtd9h; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 598FGCd5476036;
	Wed, 8 Oct 2025 11:35:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=tq97OHKO0Y1A7aUuoR4qSWFzP24Glw7bn7GqaZRHOVY=; b=WuIJtd9hJ6Fo
	6uDR6W4HrHpaUv6otZRvzy4S9vQvWjTy60Fdi4pTpppVSFqUHOqs8ufBLMv4vTAA
	QcIojPjkfvC9P/AvOYNYodaz7rT/uD2/BRgwDyob+o6nRe/+RZq5kqF9xyr/XLWK
	us0qgsDpe4N4mH/mQIiQmjfl4t53PD7L05TD4FBO7a9/xLE8VhLlg2NwOt2+PvjQ
	cQlAEm/FEw0bFVNlR3SCsa/rzRMQUfA1BWNuo66+xb0jdu7fjamjT+PeYt6ZXvGS
	HttUHux3sx+Pk2IAeBRM6qEU96VMs7ddo+K3XiDKoyYWXr0eiaEXmFC+3Kmd2ZP/
	gvEhtt+3rQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	by m0001303.ppops.net (PPS) with ESMTPS id 49ntexhvh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 11:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCCp6cXhEODbiTEu7xuBYvcMblGwlVHUpLVZeW659/YBolOvzR8iPVL+mcAlPUnSt3mI/4fhRbD0k0JHg1u4PlJK/5ozA/TJ0642406YppCQ/UgOh5/aheCjHFZW/vLQCy2YoJQNLyTE7cA0SH7jcUGwuzA5a/KnPGEg1URMdaetpg+nIDwaDga3hwAuRy1gLzULmf0ZKdM/ihoM7Cw4JZ8yg7sbpP1urkzNBFEW1rezxKlccGHP9Acie/e8sOklFvz8TSjknM+2IQq5QneRWk+NIow8SdMpdDY2rQ03olrhL9RHax9PXrR52To6/hpL+BJBAUR5JtfIQpNqymb5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq97OHKO0Y1A7aUuoR4qSWFzP24Glw7bn7GqaZRHOVY=;
 b=jJfvR6Kh+xkWZ6GqtFD5jPh5LB60pgEmcRQOGGuMtVsUbZiR4EPJpIlekSUr6MSWAjfHZem2aeC+65ZQsXCBV9uZ1gOIllB9Fy2Z31wuoBrX8/7KnLiii8ZHYoRr+toWwgOy47kuN4GA71ceQ1xijB2yfNW+JIoX10Zf61r90eE+8WXrD0ZpQInDNkDpEr1lSzaOQG0kT5l4Z19ZUr660NjsFPMqvPXVSIhkK7+OOuOJBYCYuAT7lW0sjjWZqIx7ckLLnji6lNtCmKrUu1nZju12eZU5g+OLneRnFsFp5eBa2h2daAx5nkArdQvej1yeYWEeOfQHiG/cpvgdeLzVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CY8PR15MB6355.namprd15.prod.outlook.com (2603:10b6:930:7a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 18:35:44 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 18:35:44 +0000
Message-ID: <6c82e19d-a44e-43ec-9612-913eef72daf8@meta.com>
Date: Wed, 8 Oct 2025 14:35:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <20251008-lively-vermilion-snail-beff9a@lemur>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <20251008-lively-vermilion-snail-beff9a@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0805.namprd03.prod.outlook.com
 (2603:10b6:408:13f::30) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CY8PR15MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 6995e7d3-ab7c-48b1-6558-08de06997de2
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2E3RXMvV1hva1dmQVpJT3dBUjJPdzBoMTBZMGV0dHFhQTcvdHpnRFJRLzZs?=
 =?utf-8?B?Sjl6aTdCUmcrWHFSZEFDMWVCQ3RJY3RFc0ZjNzVIOG5BZys2MHZYQXBFcDBi?=
 =?utf-8?B?VWxheHhUVWdzR3I0bDQ5YlpBSmhlT2gwWnZSUFUyQmFGYkx5Z2R6a1V3Zmt0?=
 =?utf-8?B?Q2t0YXpJKzhRekhnTi9KWDRNL2U1bTY5RHZoSGRrdXRzdHhTUGlYWGhVN3M1?=
 =?utf-8?B?d05YWWRoQXBKVG5tQWdhWVhmWHlVK0RrQ2MyblVqYnFSbVc3bXlzdnM5TVpx?=
 =?utf-8?B?dytkTWdYN055VG0yZ0V2QTQ5VExFRUhlanNZM3crTHkvVk1KTDRDNnBjS1lT?=
 =?utf-8?B?aWt0NkVtSm9DbzB3UW1RMEVOc2lsL2xjdXpUOHdWVi83aTVsMzVRRjJLdk9D?=
 =?utf-8?B?MURua3Y4NWEzQVcrSzZnOUV3UjRXWWQ0V1hEWGxpUy9NYWVUVnVYTFljOGVY?=
 =?utf-8?B?TElFNTVHZE9xMTBaTXdWQkw0OUl0OXV3eG9Hd0JzZjBJWVU5R3BiWk12WHBN?=
 =?utf-8?B?MHNVZkxWZXRBTXdJb0hrb2NHa3ROVEFIMGdjU3V6ZGV1Y1g2Q21RY29MM0xX?=
 =?utf-8?B?ZUZZN0FFdDhwV1ZmQ2thMVRPMTBzc0tqdVNBMHk2SEMwQ0RyYW1QYlQydWR6?=
 =?utf-8?B?VlI3eTdZdDZaeHNMZXBiSVpGNW9lcTJqcm14bjFHZi9udDZlT0xCQVkrejEz?=
 =?utf-8?B?bFZoUFpmVGtMbC8xSTk2VkVBSXdnNlFlQ2MyNkxqTFB5ajlvdDQyczhMa2RU?=
 =?utf-8?B?V2QyZElmb0pJeWxLR2UxVFdlckZuQ0xKQ0duUlpkSndjSVQyZ01vMHBXL1ha?=
 =?utf-8?B?TFRwT1VRQnA5WkY0d1VERzRiS042Z29nSEszakgyclpmYjFLckd0elYwcmVz?=
 =?utf-8?B?V0pObmdZZ2JpM2pKbjRZV3N5Vmd0ajlVYS9iSzg1N3pyQS9QaEN3aC9IVFZl?=
 =?utf-8?B?OXV2V3A3TEFXZUQ5aUwrSzFETlkzc3ZjWS9Dc0FWZERYZHdSYi9jRGFOcS90?=
 =?utf-8?B?REhBNXJDSEZ6TWNOeW1wcStkdCtEVkd5V0dqTEtLSXBuSFovajZubHlTa1NV?=
 =?utf-8?B?Nlpaem80WEhvbW1BS2Qxam9GczdHTTdVb2h4Z055OXl4aG14SVdMY21DeWJR?=
 =?utf-8?B?VmFqRldQU1ZUOEVNUTZVajRMRkZBdXVLM25pSXNlNDIvRFJJWlJyZ08yZzBR?=
 =?utf-8?B?c2cyQmhqUWswZktSS2pHVTk0NXV2UlBGOGx3MTREMElRcjRFWjdBK09nNHJq?=
 =?utf-8?B?S05kcmFKQmtlc0dXVEQ2YUFmVkVmbnFQS2RjT1Z5eEFmRlBRamh4Ry9MK09B?=
 =?utf-8?B?SmQ2cnk2MlJhRDJiNTFhd2tiY0FUaUw3VlVRdEFiZER1L1AraW4rSEQvV2V2?=
 =?utf-8?B?S09wUm00WWNwME9UVCtGOHROVnhhT0lja1J2MFdUc2hHSENBOVkzQW5NTnRW?=
 =?utf-8?B?a0h1cTdVWG5pYy9BVkkvbGxhWEgzYzZoMTNkT0lNcnk4c3VsSlhzM0IyZTR2?=
 =?utf-8?B?d0tvQUJKdU96cEQwQXBJcGg5QWNNMWZtQTJmSmJiYmtwNXNOMy82SjBmNTdT?=
 =?utf-8?B?c0l0TWJzcXNISWhhSlUzaWlXSTQ4ME1VOUsram83WVNxajlCeXl0Q2hlZ0R4?=
 =?utf-8?B?bEVHTW5BUG4zMS9tYkpJMzFRbjRaN1dQK2VtMWZ2NGdDbDJJU1lIdjI5TzQr?=
 =?utf-8?B?aWlFdVFwSTg3ODhhKy9aWWY4QmxMa29tcEV0Ny8rVTZETmRNTm82VWxNMkRx?=
 =?utf-8?B?dGVxeHVENWEreGZBNG5pdWwzRitPRlNoeUloNmNERUpCVEhQM3VPdWptYTU4?=
 =?utf-8?B?bDNuYkx4WE5NTHRLTTRIdXFGUjlzdDVSMHEzTzNlZXMrcHNEV2xReG0vNnRi?=
 =?utf-8?B?a2JyNkljUFhQdVRlREZma0RpQXF2RzNKSHNTWTVQWHlpUmU4bFdFSnZMU3Bk?=
 =?utf-8?Q?YXbQq0xPpCfDSRZAWkPUK2kvIOxlndvF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHFLVUp2YUFLenl2Ylc3U0hEamJvTitkVGVEUkdzeithcWxWN3lrN2FSakNL?=
 =?utf-8?B?S3lHMUt4NDNDWDhhd0RuUE8yZklzUFFERWNIa28rcWorckxjZkY1K05KcTBh?=
 =?utf-8?B?WVFFWXppYUMrbEoraFpteTRINzc2SEtsREpoWlpQeVpKdDZSYTRJaE1FaVdZ?=
 =?utf-8?B?WkQ5cFNuRlFHZTlOTHFiSTROdGNiSkJPZEJ4c1JjZzVZdUphUDlUT0swd09G?=
 =?utf-8?B?b3NTays4WWFIMnpxaE1WR2lIemJiSmI1REpiR3lGRjFsT0xyYURBSFFNSFJm?=
 =?utf-8?B?dDIrN3NFbHdDV0hZWHhyNWdnN2J0a0lPRCtzTlBoOFpCUWVtR2c1YVlZRHdI?=
 =?utf-8?B?SEZFVXRyYWRvaWM0Zmd0dHNNMC9sUnk2b3laT1lYbXEzNzlXVEd4WVNDRFBu?=
 =?utf-8?B?aytLK3h4bExVWklsN3JWOVZpeHlVdDFZYlYzT3NjeDdqSWNhaURpR2VSdXN0?=
 =?utf-8?B?OEtZem41UkFxMXVSY3F5MGpLS2VKOUhjY05NVXR4Uk1qUWQrZnF0NE0zdUwr?=
 =?utf-8?B?dVliQnFqbWxmS2l1cFlMMVZON3kySkt0dy9KRml0Q0Jjck9XSngrSWZvSDlI?=
 =?utf-8?B?TXkzQWFlb0FpQXZ4eG0xOVhsYXZMaWxMOWs3SFFKUUNyL3k4eGJ5VkxzMngr?=
 =?utf-8?B?czZyZy9Pbjd4WVBrM1M5ZXM4RlU3bDJ2ZXNoV05lMlNhNEU5cmMxcElYcEFK?=
 =?utf-8?B?REw1amgxcENDdG1EUm11bzdiRk81TFVtUmFUWmRKYytqT0UyeS9WY0E3TG5n?=
 =?utf-8?B?cHltVWFHY25JUWd2Z2JkUGx5SzAwQ3FEK2IzczhhSXhEdld2VGxaMlpld0pp?=
 =?utf-8?B?V01paGFBSnBvdmVNdHo2OWcvOUlHd0gxUExnaDZVMW9SYWU4akdqVEFoQm5z?=
 =?utf-8?B?TUhqMzl5VnRyRVFrWUhHR096dFpkWmpUMGZLMHJIaW9RT0VMUk4yeXRjcDJF?=
 =?utf-8?B?M2lZU2FIN0xZVy9VR00vdzFibGlNUXNiQ2lFZkxqY0Q0TjlLeDArREZUWjdR?=
 =?utf-8?B?dHNyUmRBYnZQcjVYM0pqYlRsRXVxUXNGY3QyZ0cyNEZxNjhnVkI5OFlENmVF?=
 =?utf-8?B?elJLdFM5NlNzWnc3SldSN200dWR3QnZLaDcxeHJJa29PdnY4SUc4SW9WbjRz?=
 =?utf-8?B?SjBzRlkxTnM0eEZBc3IwTHk3TzFheEVPRC9hSUtvUm1HUVl3bW14M052KzFp?=
 =?utf-8?B?a3Q4a0J2S083M3lZQ3E1K3lmUFo2U0ZZSWRHVSsvY0ZIWmYza3M5aTNNMUgy?=
 =?utf-8?B?SUFUZmtic1o1MnBySmJFc05YMS9TMmk1S29pQ2trS1BkaklHK3Z4VTJvZUN1?=
 =?utf-8?B?SDRuSHdXNWtxK1hxUmJmaFQ0c08yMDlYMzFqdlNaUDZtdk9VY0JNaEdyblkr?=
 =?utf-8?B?UGhMWHUwWkFQczBIWFpTSkIwTEczemRDanR4aSsreVJPb3BhbGRic3ZUanR3?=
 =?utf-8?B?c2h1bFllUmVlU1drTmZuSG9XYnFkQkZERXp2UXVQVUVCczZYbXJ2OFA2eU5Q?=
 =?utf-8?B?SjczbDgxVzZpVXJycGI2eU4rTDhDd2VzZHZLWGgwVkEwZGh4SjMzazFEZVQ3?=
 =?utf-8?B?dmNpQXlrZFh3TDVDMEpzS21RVW0zQ2MwVEhLWCtSbkhTdVBuVjJTMHhBNXN6?=
 =?utf-8?B?SjlyZmRDaHd0ZDVzVnU5S2JvYVpnNmNGWTVreEc1aXl4QWE5L0xZVlNaRVFB?=
 =?utf-8?B?T0xFZkYzVXdSa2RBNzV0b2k4RUNyZjM5UVRTTHVONU9jSkcrN3B3Z3JVa2sz?=
 =?utf-8?B?cjZPR0NPci95UG9pRFI0S204b0N0M2Z5c0xyTlQ1dDlGSmsrbjNjeXBEcVl3?=
 =?utf-8?B?NVpuSWhEMks0M0N6QzFUaFVka2pHZ3U4dHNSTzBpRVVzOHNWenlXR0dnS1FH?=
 =?utf-8?B?Z29FeTRxQ1ZtYU8rRlJiQXUzS3ZQODRQVUxTR0QvYW1nSmRzNk5QVTd3N0NU?=
 =?utf-8?B?TDh4bHROR1VFMi9kMUEyUXJRK1VOYVl2Rno4YjZ0MmoyMzFVRVdzMlphT0g4?=
 =?utf-8?B?RERicEFOUXh5NlRWT2JNSm1TZ0lKTHVXMFJpUUx3OU1LYUd5RjNRN2o1VnFF?=
 =?utf-8?B?czNmenFhaXA4QkRlYkNYM0hNSHQ3WmF0ZXFtOUlWY0EzSFE2cW1PR3Z1Vm5y?=
 =?utf-8?Q?69g2IK4eDOJCnrYhLyoUR25o5?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6995e7d3-ab7c-48b1-6558-08de06997de2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 18:35:44.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F21Gsz0wjwGUzU0arF3rT/AXG6t9hRg7U8lLYdlYJ/dQ1S3ybahdy6wJ2G+m/fdv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR15MB6355
X-Proofpoint-ORIG-GUID: OjsydhNcIubn_Lcjm_gwYDUBQKetO_uP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEzMCBTYWx0ZWRfX/eoQpaZ5JDry
 DzYWAlLffnH/doTBOcpTC/l+1y2w2wgfpEAH9xWxeooFXV2glvfQ3N+LoQ3KrpjikTEBi97GWrD
 Ny/PZQWMyFVx3G/GbWgY9+xqwXKW03TqVNrCc9McAB+ErSDasZ5d6vgYckbuS2jY2pkDkWPGEnw
 0LG3Ym4ihl6BjXdJpY+vCMmV1m+dxd9QpeXni+weAfRYP2SwgF7p0SpYzA32kdy0ScuuJWm9kjt
 lXKB9sIX7BTfoUlE7Pindgq8f8dF0aCgiB8sja2ZoFN0CV5A2x3XIr2D2KmH5OijMBLSK8Dm70P
 QUnh78vyDlDebFidsVWzxtkEtAfHaGyaTkHFjmxbGvfbwBZyezM1FbQUQXLxBWOV1tmPY8xRQK/
 Fdxgs3dUeVQcjeqwpHS7M4Xtay4CLA==
X-Proofpoint-GUID: OjsydhNcIubn_Lcjm_gwYDUBQKetO_uP
X-Authority-Analysis: v=2.4 cv=MbFhep/f c=1 sm=1 tr=0 ts=68e6af02 cx=c_pps
 a=E5oZx+PGEUUM7Gb8cE5EWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=E-NUxBof1FUa_eyYbJ4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01

On 10/8/25 1:20 PM, Konstantin Ryabitsev wrote:
> On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
>> My goal for KS/MS is to discuss how to enable maintainers to use review
>> automation tools to lower their workload.  I don't want to build new CI
>> here, so the goal would be enabling integration with existing CI.
>>
>> My question for everyone is what would it take to make all of this
>> useful? 
> 
> I am generally of the opinion that it's more useful to talk about it than to
> ignore it. Clearly, this is a controversial subject -- many will liken
> introducing proprietary AI tooling to what happened with bitkeeper.
> 

Yeah, I understand this concern.

> I've been working on incorporating series summarization with b4, but I'm
> trying to make it work with ollama/gemma3 so as not to introduce a proprietary
> dependency. My results are probably a lot more hit-and-miss than with Claude
> 4.5 Sonnet -- but I find it hard to judge because the summaries *look*
> reasonably good to someone who is not a maintainer of that particular
> subsystem.
> 

You know way more about the variety of kernel developer workflows than
me, but since everyone will want something different, I think any
reasonable and open default, along with a way people can plug in their
own API and prompt is fantastic.

For the code reviews, I don't want to exclude someone using an open
tool, and I'm actually really curious how close they can get.  At some
point I'm going to collect example bugs of the major categories and add
them to an automated test setup for the prompts, and we can also use
that against alternative AIs.

> Maybe it's more of a BoF session material?
> 
I'm up for anything.

-chris


