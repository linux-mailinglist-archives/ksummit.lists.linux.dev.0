Return-Path: <ksummit+bounces-2453-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B0BC7201
	for <lists@lfdr.de>; Thu, 09 Oct 2025 03:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B07F4E309A
	for <lists@lfdr.de>; Thu,  9 Oct 2025 01:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9C218DB1E;
	Thu,  9 Oct 2025 01:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="IPIkDnP4"
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9844C6C
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 01:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759974247; cv=fail; b=W5qBdSn24n8gPAgmvt+tX8Vcg4k8GvQLCPVRPXEiqXeNjvdyvgH+qKbl3F4zFDZnlx9ferDuKaTatcYnlyvrnuacyrhZmrbTYxRqqbNta3AYVSydVvOuEPz2akjrBwAzm1SvHdldz9dQDX2z3+Xvf9AUtgP3PF0PXVHMBcKWUd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759974247; c=relaxed/simple;
	bh=du+X8tUaF8FuhVjV3liVlBhDTrqh8O2LvxfLRANzRWw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A0v3Sud5ZfSE966sikcVaJ1BkTv/G7BG3o4XfAapHf5xalGFR7RhFUrIrRVUFkjw+2Gl8BeZS6LUfdQXPJF03yPQMX5/PQlq/amhpVQkJxnEuwOjXjN6uoGF8nk9cawS1LwkIAWSg5OMvklhDxmlnWPB9li/xdYVn4iPaZnHC3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=IPIkDnP4; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 598JMhb61662885;
	Wed, 8 Oct 2025 18:43:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=uBdG0uGIxcmFxfW3LUOKfsDzYkD9Wcr0v6Oslde/P+Q=; b=IPIkDnP4BEnj
	TEHdqUCgBkl0Tqu7S4STeNJpJpI7ubkHGM08iwKN57g5dafABUf0gqzxh3/m0/Sm
	BpyEH4DLKoz4k3IdAuryHI6uAsIHSKH3KVgIbnPPa/gVJq4FW+TOfUjxOaIiHO+M
	gkGzICwyV3rObZ5sHnCosAzqukJqPRpJYu3mafdbJ/zyMUtmQacmPBToqTh58P//
	TDYx4/ViHt6nYOng6VSadzmjRHf+V1TE7eA3q0bVZMLbrU6crzcq9uGOu3Z7W9cw
	DxoKqKglTQaWeX60OLPtiMOPI9LX/6SnVHWo5S4M+29+u5/LVYZjvToApGHNsT19
	qGzv+WULAA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	by m0089730.ppops.net (PPS) with ESMTPS id 49nx2gaka2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7E/1Q6KHhD52TpEcdYP+zjpeFsWXKe1e0Kim4hoS1xNlK6c0KV3doyWfvRbCH2k2Fc/gZAR0q5mJfbBXIetvnxMsBYleadUGTU9UBnCTXlUdJ9AslhF/BnrcnMkeCQApmC9UDyYmq/mV9dRNLM/bRMlAG8lNdyA05nvHmNREbRBNlZuadT1A33E4Pn71J/Q5rc4Vibmx855vSujVIM+1bkwiagTPDqBsS7oZlOec0+b/lUUadhwwr/ukYv5bfdNu+fvAjlz+AoLX2o+yf2pHtrQdzMB9KVLjnbhYWRuTTqewVcIRpWtlQko5dNpiLk7VlsIXNJReZX93vTmTwPUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBdG0uGIxcmFxfW3LUOKfsDzYkD9Wcr0v6Oslde/P+Q=;
 b=hxMy2lFstCQhI5Bj5tJI7e53vdVLKWrlkvx1+CfQesALV7DkSrstMo3i6JrJbhdOZsztFqxaosWfH6t02x3McakLwK4NrcydqYnbMgKhuf101T1XixSH3i0fBnsNBvnSKPwD2XXIK/lp8Yw+sHPRLU/2UUQ2nSh6LLxuBJGjgrHfXggiFKm0snXxEI2ULfoFqjxlCmVbGsGcMu/E1N7WeC9u6PxQn8chJx4p6rz9XfAy3T+g9fVDcXWQihLei7/3QZooVdJgJAAkOSmGYdH0vt1oQNd9MzQMk9vZ5Y2Dr3l0Wt0dLIzY/AOBnfn8G/Ge04TOdHtt9ZCuW1WJ8nGDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by BY1PR15MB6176.namprd15.prod.outlook.com (2603:10b6:a03:531::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 01:43:56 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 01:43:56 +0000
Message-ID: <796882a3-cb05-41a9-b7ca-8af49a05623f@meta.com>
Date: Wed, 8 Oct 2025 21:43:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <aOaujzH1dl-OEbsO@laps>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <aOaujzH1dl-OEbsO@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::27) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|BY1PR15MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: e7756a91-61ee-49c1-f3ba-08de06d54f2c
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2tmRmU3dkxOazBhMG5XK0htVEUybHVHZ09ZbGJwazF1cWRvK0x2M2IyWlFT?=
 =?utf-8?B?blV5ZGsxUlkrSEVrdDZyU2gyRWhnZWNkMjhUUVVPMU50N0FMc3c3aU5uT285?=
 =?utf-8?B?VDB1YjVINHBubW5VUWQ5enlKZmR2L1BoakU2ZlNJdEpMcStPdEtCcGFPV3Zh?=
 =?utf-8?B?UXBVSWxHbDZuV0g2ZE1RUG1NZ0xxb2gxK2dxU05QeFp6RGZiWlRsMVoyTTZI?=
 =?utf-8?B?eDQ5VjIzVkpZcnlrY09HZ2JvNXhMQ2JCemR1WUxtV1pzZ0E2cm5vZlE4Nmox?=
 =?utf-8?B?N2FwZlBFSU1nTXJhZU1BVE4zUWtsYUlXeU9tWnc3aVVwdmRBSkg5b0RXN29l?=
 =?utf-8?B?WkVPY3UrM0hWUzFKKy9uRy8vb2VVQ0tHNHpqMnlZSDV4eFk1Y2kvN0dTQmxH?=
 =?utf-8?B?YUdPckpnM0RvTXIwVzcyRW9PVW5DUUdrUGVnblgvUzVzWDRSN1dRejB3d0lt?=
 =?utf-8?B?WnVFZXF2Ry8rR0M0clk1d2RZSkVibmNnUnl4b2ZDVVh6STRtV2pWZWNQNE5a?=
 =?utf-8?B?S2k1L0JLWXlWdGYzQzNOR1pqcTdocWMxQ3RNSUVFS3N2Z0luUllubklLcjRW?=
 =?utf-8?B?dzZDaUN1VkpHa2kyUHhxREhHU29qajh2d3BCTFpCSmNWaDRaZUJ6R0tWaGU0?=
 =?utf-8?B?bnpJMmRISklVNlhnbTh3WHduTGdDOVJlR0Z5amRPMytuTytaekVyOE9Nb0ZM?=
 =?utf-8?B?VjZSUU5Mc1FyQUVTbGlFZG9jUGFrSHA1UkowaW91Zms5RlRtUmxvRnVhVVB5?=
 =?utf-8?B?KzlPOVB6WFBxbE9DdC9vRWRBTEFVWGtGdkxZUm9RMVpORUcwc2g4akU1eDVx?=
 =?utf-8?B?enlsd1RDUDJDMTIzbjdFZ2pQakI1WndRb0d0VHhCWjloRk5GdkRMeFYxaU9K?=
 =?utf-8?B?RVhyaElpdmFrdTN0MDdpcWtnS3VZbnM0TzR0RzBuRVlKaS9reHZINnhaZ3Iy?=
 =?utf-8?B?UVVORXJ6T0NDZmhMUFFYTU0zT1JNSzJoTEZzZ2ZGYk9Od3NVbWRhZVhmVTdW?=
 =?utf-8?B?SGRkWFVaZXY4cGtVSnJKOUZBSjlJci9rY2RrU3NZNi9xZTMzRjhPRHlpb0FO?=
 =?utf-8?B?eHJnZGwzMGlaend4MXVrOTdJMXYvR0owNzZ2UUtaUURlUDc1QVlaL29UT1FF?=
 =?utf-8?B?QVl2RW5sazhwVHludUk4RzhObm50Z2U0VUVFbk4vMHNmZFhhNDluR1dIU0pz?=
 =?utf-8?B?SWV0ckI0a2lTOTJ4Ulc5Zm1VS0huWFdLa3NwZ2RRRWc1Smd2Y1JqdW1haXVR?=
 =?utf-8?B?T3dLR1pFU05VaThnY1RMQ2Mzd2oyelV0d2F4bHJFSU8zY3NYaHhVNUZNWFZK?=
 =?utf-8?B?RjVmUDgvSnZBQ1U1WENmZTBOWGYyUjNuNjYrdFNJR1RhdllRVnFqMFpGc3lj?=
 =?utf-8?B?TXFmSUk4ajZXTmN3N2RGNmxYVVRNUmJhY1pXRDRDSUlvYXVLOGoyNG9RZXIw?=
 =?utf-8?B?djdZQzJaWnUvOEZ3eEJLZnZLQWdtRWZLbGtBRktjZGdueFlYM1NGMEFqbE5G?=
 =?utf-8?B?UGIvdXBQQ0NTNHJJK0w4WStOZ2FxREtQT1RpLy96TlI5cGZKR0Z1dzg1eThz?=
 =?utf-8?B?b0RPRTU1bk40TGhrMC9PelpDN0NNcVRpR2NtQ05reldQQjMwQ0QrVWhYYVJm?=
 =?utf-8?B?VmRKT0YwQ2Y1eWdzM012WHpiRVkvSEtWZktEVUw1N2I3TXptdXJVSGJYZG9L?=
 =?utf-8?B?YXk2YldIUzk3ZmxsVWJ4YW51YUlhK2JGeWRsUXJVelFSK2RKMTFxV2tqQVV2?=
 =?utf-8?B?SmpEclM1Zk5pTCtQcldrRkFST0N4ejZ5UXFKMlJ6WTZhZGxmWUtDSWkxcXhS?=
 =?utf-8?B?QVlIK0hnSFpaUHUrNHZQblFvQWRkd3dMLzFpa2s0L0c2dlVaSDBSQmxJdXFS?=
 =?utf-8?B?U3J0MFJ1ODlhN0cwVTcxRUpQR3NEcjZMTHR5aXF1ekFlRU1HK2JLYnh6SWNr?=
 =?utf-8?B?b2tMdjRpSUY3Q2RGUk1BaW1pVUdFd0hBRlNVUE5sNHBiWHJnNXhrM090QkRJ?=
 =?utf-8?B?Wmp3R3BrN2pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UktIUTNLODd3UDJBWGFNVUxNelc3bVd2dGRrWUtVTC9jMGk1ZEhEMStocHo0?=
 =?utf-8?B?SVpwNW1ZMU9KYStyOVczU29uQU5TK0VQQkp6bEcxbE9GenBTS09lRytleEx2?=
 =?utf-8?B?RUlhNzVkckNmZm9vdUtkOGxZWWVHOHFFeWhwYWJSNjFsRkY4bks5SUZ0K1V3?=
 =?utf-8?B?QjFqeE5vRVdhK2NVWTZyOVhWYnFMWFdpSDVQTWJaSHdVUTQyc3J2THcvRWxu?=
 =?utf-8?B?cy9hT0ZkczEycWRURXB0YmhQeUdUcHdxRHZpWVYzWXZqbDQ4RDVtakRIYzVO?=
 =?utf-8?B?TExpRXQ1NTk4V2ZjMEM0VmxEQjRJbGtlS3BSQVZNSGdJUjlMc1RmVGlldWhP?=
 =?utf-8?B?bEtaNlJxK3FIbTBLaVZIRkR2NmdiWSthZWpKTC9Ca01oUXdob3o5cTJDVjdo?=
 =?utf-8?B?dkZUNXdEbmFiUm14bGpIaEFISzFqNEZNOTNiZDZnMzk2YUhMNjFiWURzUXMr?=
 =?utf-8?B?eEVqZjI2dEVrU3JZWjhjNmYxVmNuOVVBWHZndHZkbHFORlpGb01OSlhYcVE4?=
 =?utf-8?B?L1FjTjFkQThubmtqaC84QjhNNXVlb3hBVFovdHJ5dUVmcXB1cVhNdEJ6WTdV?=
 =?utf-8?B?ZGExRHVGUFp2eVZsOTNlNUNRbDV6Q1k3RTZ5dXY3aG9TZHFHcW9UMFBReTR2?=
 =?utf-8?B?aE11d2M0Ukw2TW9Jci9Oc24wbGg2MjFxaWZrbW5keHFMWGsvTTQ5ZlpRaTBG?=
 =?utf-8?B?ODB1cWl2NHh6dldFSnhiT29aSDcra0Y5dzNWbVJmbW9xWGx0RlE0Q2gycHEv?=
 =?utf-8?B?dVptUC9SQ2FPajlMV2wxdkl0UUZrTGtFMmNHTHFZYkRqUWZWK0haTVlJZUZ5?=
 =?utf-8?B?ejk2MlYybUlISk1ucTZVZVhrN1NUeDdZTTJjRHpiNEhQYXRqNGVnVGExRVRC?=
 =?utf-8?B?RzhTRVoyeFBmQjQ2WXRBL0FPc0l3RGNBVVBDSytWMXpwLzAvOWUvV2hLMVN0?=
 =?utf-8?B?YUNFeGZGOGJWNVpjYnJIUHM5VVJoN2lHTHFpdVJvVlNROHlFQ0RoM0M2ancz?=
 =?utf-8?B?V3o4NERBT1NPbzYzWGlabUJtUVkyRFdGVCs0MWhKVXRVWGVUWXlmR0RtcDhu?=
 =?utf-8?B?OXVGZFpzdXNoTEl1YnBLQ2pWU24xN0tiM1lnMWlwQ2RPODM3Mk9TUzN5aVpY?=
 =?utf-8?B?WGRacDI2VjJraGtXV0dMMXc5MEE1RXRSOG9IaWhpSG9zMVhub29xYkhiSXMz?=
 =?utf-8?B?SERWdVpxWGJ3Yy9wUEFBTmlTdWlTUGpKejZReTZJZ2RxQnFtMjJnZ1grWktt?=
 =?utf-8?B?Y09tZUdYY0hKa2pwRUhQblk5QzAxVWNWSFFZSVRCWFV4T0VLN1J0OEI2anlJ?=
 =?utf-8?B?c3pZUkF3dGFXYXFQNW9wVnV0Y0k0TlBvUERGS2ZnQjhXWDNJL3dmS2lRN01C?=
 =?utf-8?B?LzZFd3hia2JublNMTUhHWkJkaEZVSGkvQVFIWkk0b0JhRnRJQjI4VkRMMU1q?=
 =?utf-8?B?NFk5VjgyUFJKQjdwWFFXVnB3djBUdlU3RSt6RHNvcDBqdlN5NzVLU0h4RjZK?=
 =?utf-8?B?MzdYUFhsRk9yb09ZWkdPanRCUWNoS1dKQ251WVZGS1plenlYYWtOYXFqNGpt?=
 =?utf-8?B?L3FFUkx1YTFhVCt5TytnZ0R3T0poZG9Yd0RFaUxzZ2Q2Mk52akY4dE5ydEVu?=
 =?utf-8?B?ckV2RWJHVVRnZFZxRVZDalEvb3pjcUE5azFGc2RoYlllY1p6dVUzSHBPYko3?=
 =?utf-8?B?cXNyZmUyN0huaGxXNXhyS29LNXV1TmlDQnQzREhIUURLZUovTzRGM3dITFRM?=
 =?utf-8?B?YXNjMUxxeHZGZm5mbFpUUUdiODBIYW8wRWpPMlo5cE1BMnlpa3hDNEJiTXRT?=
 =?utf-8?B?MEYzMkhoUHQ4dnZVbStHdmdncDNLVlZHdi9pTWw5NTVZamhDM3AvRW9RWHhn?=
 =?utf-8?B?YnZYRWR2VDVxK1k4OGMzMjgvTUxoeVpDSG01RURtT0UwVW1heTl6TnNSS2NQ?=
 =?utf-8?B?eXVHNXQzbzd2NlF3S3lpTitXZjQxMTZzbTFFQXpHQmpzZk52eTlOQ2QrcTlk?=
 =?utf-8?B?dE9Ka1N3bTE0azhJd1NhOCs1ZkJTUDBraTdEOXFFVEtNQ3g4b2dqeTh2WUxU?=
 =?utf-8?B?UmVTQVkxVDM1MEI5dFRlMnFrNFZ1eDFaOWlxTDUySXNsM3VQMDJFNG8zQnVz?=
 =?utf-8?Q?R+C4=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7756a91-61ee-49c1-f3ba-08de06d54f2c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 01:43:56.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLvVDu6HIt8rd1ZQMyG2ZZr1h/sNrC6sp2m+BEh9WzFA7OgtPLaqDP0yOe10SSvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR15MB6176
X-Authority-Analysis: v=2.4 cv=Q9rfIo2a c=1 sm=1 tr=0 ts=68e7135e cx=c_pps
 a=IaRwrOchHg7qSZqgGdB+Bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8
 a=y-Vo86HrLYu56GzfG_MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDAwOCBTYWx0ZWRfXwHS9WWjWaeTa
 C48A6xAAvtP1eOFtPj3sOToHEkLqvFb88G0t6BC1S0Cid1BSm519d+ruqdmwp+bPLt8II3SYP+B
 oEBCPYNlOQcxSaa1QNhDp5LoYZ62LXc0h149e8cZRvSxNcNeUD6HbBa6fEhYlo91Uj79AI/R+YA
 M+xA8Yrcduje6gSU5zWvF14hvaiN/tH0JBUQWfRQ586FgddFXrN3ML65j3GlnKltWLZ7CO46RDI
 dCRa0nTS3aljS3f3VIl2eQwzzNYOY4x5NHDdP9SMybZkOUG1zXXFsoVsRwJUFBTeNh4fnWpHeqT
 HpJN3u/A5DUDzlq6m0usKa6g3Qw5Tb3UNjm3eXiuBtrbvmdU87BSdvgfAa7pNQ0N9Byc8JlOwGM
 BP1V/1Yxu499z3UpRJ6opblM0CwSfQ==
X-Proofpoint-ORIG-GUID: d5CS-ePOsT6j9DaL5bySMOFv-5jCI3zT
X-Proofpoint-GUID: d5CS-ePOsT6j9DaL5bySMOFv-5jCI3zT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01

On 10/8/25 2:33 PM, Sasha Levin wrote:
> On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
>> Hi everyone,
>>
>> Depending on how you look at things, this is potentially a topic for
>> either MS or KS.
>>
>> One way to lower the load on maintainers is to make it easier for
>> contributors to send higher quality patches, and to catch errors before
>> they land in various git trees.
>>
>> Along those lines, when the AI code submission thread started over the
>> summer, I decided to see if it was possible to get reasonable code
>> reviews out of AI.
> 
> This is a really great subject to discuss.
> 
> IMO when the AI topic initially came up the concerns around AI drowned
> discussions of finding places where AI could be useful and provide
> support for
> maintainers struggling under the load.
> 
>> There are certainly false positives, but Alexei and the BPF developers
>> wired up my prompts into the BPF CI, and you can find the results in
>> their github CI.  Everything in red is a bug the AI review found:
>>
>> https://github.com/kernel-patches/bpf/actions/workflows/ai-code-
>> review.yml
>> My goal for KS/MS is to discuss how to enable maintainers to use review
>> automation tools to lower their workload.  I don't want to build new CI
>> here, so the goal would be enabling integration with existing CI.
> 
> This is great to see!
> 
> I think that AUTOSEL is already a large scale kernel patch review
> workflow and
> I'd love to work more towards a unified kernel patch AI review story that
> community members could use.
> 
> I've gotten good feedback[1] from Linus about the AI AUTOSEL workflow
> and his
> idea around expanding our AI tooling to help with maintainer workflows
> sounds
> in line with what you're describing here.

Fantastic.

> 
>> My question for everyone is what would it take to make all of this
>> useful?  I'm working on funding for API access, so hopefully that part
>> won't be a problem.
> 
> I've been playing with extending[2] b4 (unofficially) with AI workflows
> that
> are useful for myself. The patches themselves aren't too interesting,
> but what
> I found exciting is expanding b4 with tooling that maintainers can run
> locally
> and which will save them a good amound of time/effort.
> 
> Something along the lines of "b4 ai review [commit]" or "b4 ai style
> [patch]".

Yeah, I think that'll really help as well.

> 
>> There's definitely overlap between the bugs I'm finding and the bugs Dan
>> Carpenter finds, so I'm hoping he and I can team up as well.
>>
>> In terms of actual review details, the reviews have two parts:
>>
>> 1) The review prompts.  These are stand alone and can just work on any
>> kernel tree.  This is what BPF CI is currently using:
>>
>> https://github.com/masoncl/review-prompts/ 
> 
> I think I'll borrow some of these :)
> 
> It was interesting to read through some of the prompts and see where you
> had
> good and bad experience with the AI ("You're not smart enough to understand
> smp_mb()" :D )

If I'm being honest, I'm probably not smart enough to teach AI about
smp_mb(), but that's a different problem.

> 
>> These prompts can also debug oopsen or syzbot reports (with varying
>> success).
>>
>> 2) A code indexing tool with MCP server that Claude can use to find
>> functions, types, and call chains more effectively.  This makes it more
>> likely Claude can trace complex relationships in the code:
>>
>> https://github.com/facebookexperimental/semcode
>> Asking claude to produce a callgraph for btrfs_search_slot() consumes
>> ~444K tokens.  With semcode installed, the same query produces better
>> results and uses 25K tokens. (btrfs_search_slot() has a huge callchain)
> 
> Also very interesting! AUTOSEL is a token eating machine. Reducing token
> counts
> while still getting the same (or better) quality of outputs is really
> great.

I think/hope the extra context will make a huge difference, and I want
to add indexing for git history and lore archives as well.

-chris


