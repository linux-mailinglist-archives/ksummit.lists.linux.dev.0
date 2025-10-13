Return-Path: <ksummit+bounces-2495-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50284BD2F4D
	for <lists@lfdr.de>; Mon, 13 Oct 2025 14:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17CB0189E4E4
	for <lists@lfdr.de>; Mon, 13 Oct 2025 12:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F7726FD97;
	Mon, 13 Oct 2025 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="spgxHL2U"
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022116.outbound.protection.outlook.com [40.107.193.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE18253951
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358310; cv=fail; b=DoSer6AhTF5EnIF25OIffD98pRbu3A7etPbmPg6yDWkaQ3vhPw0JIKRcpgmnQmrzsUbvDkMISGNCxyRW+nO7Ygisv6iZ7zbWQffTVG+hK+Baq7P1xzFEix2+nhbtrDlLdw5gTFhrVJ4KGqRDtrHgsygelBghPBp+s678QqdtYFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358310; c=relaxed/simple;
	bh=/+3k3PRExNAHeHJ46QTn9uTOSnu0DhFzwXSb4Xv96NQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hNi34aJjLiIy/lkYt5LfMAtfQuQZeecweqFBrXabm/BYjhUE/fVSYTPKg6E41fM4wHkRvvaGjH75pmJasXlwTGik7znpQJkAsFxTiiO0hb6ZTHVnyAcWOFW+AakuiliSPrLJ0MWQ7V/Jv2fneYoQSK47J9y9RvgkJIkLlXa25vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=spgxHL2U; arc=fail smtp.client-ip=40.107.193.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obW1/VdiVvJA2I0VtXZWaitoJtQxd2pv1+YQUpvM/SslgkP6ceFd1P+ZTohY8C08VwGmTAjeNqF4QJlSakzG/yWvoyPI9G9IBBOTrdZffPM7Geykzn5euF+w98vnmTtkwPffKnF49MuUkj4TvNzyR7xc+IrvYAQYHpRrrgQ1EyxMdRtWRghOdE4GJFiQIdSriG+v3PzOO8R+a0R8HYGomx9UrBkT4HXUrLicsa45EScVtNlzdxEzZDJWKCl1rh+Re6cBDoKoK1ieKUAhSgj4GdqWumlDmYCOmoXCqdpkquroNM5GVxAKrdyBiFbfyjqMkvMB4VoA+zC11YRkHlKL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVDjj4U0ATYMvu4oXmyqK4Y19UBJjZUKQGfCLRYl7lc=;
 b=mHHdV90lj2SiKpsdlr/3Lx3lF8kZffPUHnjotnqc2GYATCXkjUMpg0cIeco0XhfB4O9OySdAX20r4lgOxvC6JSUFWM+ttKv793Rq8JvZ2OhhMpEeH1UF3ZQqSIZZEEgiBJVXpMNx4SBWe8utyqgJjXHTSUCOauf6Uu+ipsY+J9fj4AEb619n46ybaOQut587EuFJ6qKKGMeDlZS43Rh2ErtRdfCBUq9QTNn6CCCbr1sG7qTxsl10uUO9AJQcA0MtbJWITXbZX/Wom9X1e4EMHZ/nAYxp+Os+svKi3Zs8WJlnY9/4M/SzCncn0OcEK7o7kEcQbgqhR9LQO2bYDuI+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVDjj4U0ATYMvu4oXmyqK4Y19UBJjZUKQGfCLRYl7lc=;
 b=spgxHL2UTyuPcp9r3PLmk+uRjDUAIjKZB3+194sJVceKgSngIQfEq5BtMnX0gTSVFakUWW3cYkD3meu2pdetyAWNSWnBmn3UCWsMKz4A90Du1x9Fq4TC5jHDJj+UWANpUotdW4td4JBW/gOQzFda3CWEA+mNS2NHf9rlyS7NhlPNKNyLnLNkNc2UlKJu9/dHJYneuyef+xotKVsuRCF7gdDB0P4FPC0RyCUnocVYxbW9tE8sC3z4qkkI1OHJp8LAUy5TfSUvfJdbyyQq2JtfBxTMlPjrMg1zuQLtqRxy07Ull21WZ5H496bBwAq+tS37606h37ytaKdnMq0SuT/cog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB11063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:144::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 12:25:02 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 12:25:02 +0000
Message-ID: <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
Date: Mon, 13 Oct 2025 08:25:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0226.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::26) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB11063:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c83dc26-c23b-4cb9-e462-08de0a538861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2dFUUV0dmI2MVJCbTRWN1VLR1FId0g2N21TRCtRTDRyU2VSd0ovWThTWFU3?=
 =?utf-8?B?RFl5aENDb212WnhKTjNnTWw3SEpoZmtXaVQrZDFQdi9HZE5CcWVqQk5nYmJt?=
 =?utf-8?B?azZJMnRtMjF6VTF1NTgrRE02RVFIV1FsbWFxVzZqZEtKV2hEakh1TFdMN01W?=
 =?utf-8?B?c0I0bG52YzFkVVVqT2gyRmtwRkFpREhORWVwQU9uWi9mQTN1YVdMMEVEOGVj?=
 =?utf-8?B?TW1uQTBpbkdjcytXTW9EcTRPYktqVlJyTHM5Yk1lWk5YZDNsQXQ4QmF5bjBY?=
 =?utf-8?B?N1Y3TTFtTXp6Mjc0MEZ0VUo0QkJtVmx1NlM3anFtWHhNbnA2VTl4TGx5UWRO?=
 =?utf-8?B?bEx3S0puUmw2MG1CdzZzKzRPUktNVi9jR2t1Y2hIcmd3L1JLQ2YvNGo4RDBs?=
 =?utf-8?B?M1JFaDdJRWtwMUlWc3pNNkRpYlNiWG1VMmxEa2NJblZOaWx1N3FObnIzOEpm?=
 =?utf-8?B?RzVBMVg0UFF5cXFCRkw4NTk2bzBBS1dueFMwcmNaZzR0cFNkZkhva09RRnBD?=
 =?utf-8?B?R0Zoa0puSW9sWWNJSjFrOWl6WXh1SHo0MlFCTU90VXZ0MTNrVExHTUJuUThM?=
 =?utf-8?B?OTc5cXlOVHQrSERGejFRYTNKdUM1ZXZxT1E3bm9FZ3JZbFdjSkp1SlFIMytp?=
 =?utf-8?B?SmZmSWVpeWZvOWF0YlA5VXh6OTF3TDdTK2RMUkJPOGh2dlQ1NTZOSG9NOWlM?=
 =?utf-8?B?c1prZUtxNEtFQlZSVncrK3pybWJZMWxRVmZrZDRleUFnWW1WL3JHVUx6cnNT?=
 =?utf-8?B?RjJ2Vnk1YWhGNG8wOVQwSmZDd25SbktRVnZnOGQzVXdDL2xHWFYyamdIL0Z0?=
 =?utf-8?B?TVUraTBMd0xOT1JwSjdzbUUxTlBnQTg1MzFlN2I4ckNVNEh4MnhiUTZpRTY5?=
 =?utf-8?B?RUpqQVhPWTBmRmpoVjFrZkpKdlRSUS9xRWxENG0wNFVPdmo5SEd1LzRmb1Rx?=
 =?utf-8?B?Q3pWM2hrcXVWTGwxemEveVBDWEEzN3pHcVNRaW5HNlBZYjVxNmIyQURnWVVZ?=
 =?utf-8?B?TkpjaElqTmRpK2NsVUN6Zy9na09xY0VDRFNYT1dDQkVMc0NuMm1uNk8weWp6?=
 =?utf-8?B?MXBIbi95UjhWMzhWS2tsT0JwOG1jbTRhVkFyczE2SEpPeFVpcGczdjduN2hk?=
 =?utf-8?B?M3lLN1pQQ1pJd3ozY09RYk9XSkxOTnhzL1F5YTBGNnEwV0w2cmYyQTljRitw?=
 =?utf-8?B?eGs1OFpCeUN5QVRvWi9OcDNKclVZSmZMNFRBSGtid3Y3TjEzQlB3NnRtT0M3?=
 =?utf-8?B?ZVpRU0lhekNzRlF4SlBpOWE0Y2pCVTBPWXg4Y1ZBdi9QRytsVzVObGkyWjM5?=
 =?utf-8?B?aGxCWDcxK05lWHpVWkVKZDFIeFlHQUxyWTNWUFB2bzhXc0lvL2JxRFFXYnhN?=
 =?utf-8?B?c0U4WFdlM00vK1h6TUpsQStKQ0hySUthV21LTGE2b2M5MHJaL2RadWRyUWdJ?=
 =?utf-8?B?Vkd5M1F5RmliaWlUOVQxRUE2d2JtMFBZTjh6Wm5PbjVmek9jVWV1VXQ0MzRv?=
 =?utf-8?B?QWhBcDJDZGVyR0VDWVNNZWNQT1VDTTFycWVWVVRkWmJTaGk1NWErYmovS1JH?=
 =?utf-8?B?NFEzV2hpV0xRMkdyNU5UNGhCbjZNTVkzTmYxWGVXZjNGMnFRZ2RMYUppWFl4?=
 =?utf-8?B?azFwRWpBWjNmNlNlOU1CcnR3RUxWNHBDeUlkeG5KTjd4TzYzMEQwYmd5ZW9k?=
 =?utf-8?B?RG01Rzg2QlBCUnF5cUs5ZStWSkJzTVM5eGdad2FGUEZ0NlpucEQ1cVdHSFhH?=
 =?utf-8?B?NUhTQlh1QWJTdzNwS3FIY2g4V1hxbXVaVnVUQnVuMzU5THF6N0ZGT1g1bUZj?=
 =?utf-8?B?bTFIZXB3WHVGOHB0ZkJoR0MwdG4xUExUYzFPelUrRnZZVzB1OHhRQlZWdlFR?=
 =?utf-8?B?VDh3WWlMaVFZMHJQNUNIaFUzWldkdWlMV2FBY251emJSVkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0phaUEvMzNMaHo0M21xYXU1K3JXaStWbjQyOTlSV1VYMEZyRVV1L0tpditN?=
 =?utf-8?B?MmlUKzBXaS9teStZSjkwYXhpQTNXVmpqbFpsT0Z5OWxJYzVhVlYyMkpNZVJm?=
 =?utf-8?B?aVdxdWRaaHpqVVNuTWpQemZqTklJMTZpL0lUaENTWDd4aXphak50MVoyQ2JM?=
 =?utf-8?B?MnNQTlhldmVDSFBCaTNGZHRmWDh3am9GaEIxdTExWDBpeEhWUEtBTkp1d0tU?=
 =?utf-8?B?MGdtUEdBOTFrNTluNDlta1I4SnVFRlRMdVcxZUgrcVE2STRYYkQrZEtyY3hM?=
 =?utf-8?B?WGg5VGV5WFRLdTE2bDV4SkNhRzFmdmloWGRXTkZJNTdWc1VjSk0yYy9DNnU2?=
 =?utf-8?B?L0NEVzMveldnYno2VVJ1MTZWa1ExM2lmQyttRkRzU04vL0lubStMYTc2WXpM?=
 =?utf-8?B?MHE3Z1JUNmt6T05JMnQrSGJBWFIrTnRsc2ZVS3ZKbUhDdEZnSWRpeG90S28z?=
 =?utf-8?B?M3Z6a1Z4VGxreUFGQ0ZpVUgvZWM0amw5QUdYNjNxTnRJK2pRbXY4TW9WY1F1?=
 =?utf-8?B?cVBpaHE5VnF6cy8zeUtvZUxROU8rS1Y1OU15dTQzTzVvZjZpeG1HeHNqYmdZ?=
 =?utf-8?B?NVZERGZTcklrK1hYRlg1aHVuMFI2ZTNsbmVENVJUbjJRU09vMTIrbzRRSml0?=
 =?utf-8?B?Vm5oVjcrWGkzWVdheE9lL2FRNDBydzJTb215U1RtZnJ6RU9GSVVRNnl1d0c0?=
 =?utf-8?B?NmZkU3BzRDdZaXZrczV4N3BIcmF1a3VCcXRNek1zZ3orbTY3czJFRkhqSFIy?=
 =?utf-8?B?ZnNFVWNESlZYK3hiTTYrcGFIUXhrZzBXdmxvcTlYQnJEQkl6SUQ0ekF2dmtW?=
 =?utf-8?B?VjFPRnV2a09aSnlhOU5oSTRzQ3pOM0dySHdBVkl0c2dGRENUM01WS1VtSjh5?=
 =?utf-8?B?YUZ5U3lHR3ZwMVN0TWxvc0FYbXE1b2syOVZCWThIZ0VzV0lNdzFSc3liOFhh?=
 =?utf-8?B?OGJxd3JTdXk0bDhJUkpNRlFoMDQ4Wm1QNmMxQWI5ZkhZaXR2RWV5ZW1mTWgw?=
 =?utf-8?B?dlpTN3BPelE2RWN0dDJ0QzFvSU44TEU1MDJaOTJ2NHVaT0p1WjIxa1IwOVRE?=
 =?utf-8?B?a2xuM0VuSm5QZWd3N29KTndsTXg1UUgxemcyZ214ZnRvVmtTSkhjUlRGc1Iw?=
 =?utf-8?B?SGlQbU9PYWo5NXZxbkNDUng2Mi9sZzg5dkwvYkduYVVJN3Q5SUMwMlVoTmRj?=
 =?utf-8?B?UHpjcHdsN1ZBT3A1VEZEbi9vUktuTjRrZ3Q1YVpPeUFsclQ2b0g4MWwyd0tB?=
 =?utf-8?B?TERXbzBVVTNDNXM0QVF2RW9DRC9XZVBta3pHeGR6eGNvdHlhNnRXeVlWdDkv?=
 =?utf-8?B?UFJqeHV5RXNWTW1UMGQyVVc1S1MvenVRM0NkQ1R3SGNtZFZxbEh5VDFsWHU5?=
 =?utf-8?B?dmlLa2hONHpScHIvS1drWFFjQ3VoWG1Oa0o1OUtqVktGdU81bWE1UVZaUGF1?=
 =?utf-8?B?ZTFsR1dBQ0w4MWJ5WFZOZnE5cERCRU5FTDdERys3bWVzWDFMRnZSOE9Wdjdh?=
 =?utf-8?B?L1JWYzBaRVljVGpHbTJmUGhPVXdMSGNKMm41dEJzRE1pVWRYVXRXNzdxSWhy?=
 =?utf-8?B?c1h4TlVaM0M1cG5La0pndmxWcFdjcG42K1N4VDFqNG55bW8rTm1JK0d2YWQ2?=
 =?utf-8?B?WG5FV0JKMHk5NWVaUVQwZkg0R0YyRit5L1ZvQzlzOEsyTTNVSk9TMG1yaDhM?=
 =?utf-8?B?N01EMUVMdkFUaVRTbHpBRjNnczJCQXF0MFAwL21NdC81ZEJvSFluUDJRRFVz?=
 =?utf-8?B?N0Y4bEVVcWdOcFZmeUZwZ0FXQ3VGUXkxWjNsVFFmNEdFWjVHVHRPOWpqQTFa?=
 =?utf-8?B?WUJOc2o2WTFWVzZoU09LdFhuM24wZ1E5TEJrTHBmYlZWZUFmd3IrVnpnV2g5?=
 =?utf-8?B?WStrUWZXdXkybXJLenB2RFNjZG5PV3NZNHRZRzdNTGVIcnpuSjdoTXMxRW1T?=
 =?utf-8?B?dyt5UCtCT0hBU2VyMldIemV5SXJRRGhNWmQyVkoraVVWK2h0STJ4QnVNb25q?=
 =?utf-8?B?QUVNcUJ6NzI4Q1BvMWJVMjU4RE1oVHhuQlFJaURyNkJkNnM3eUw3THhBVGFs?=
 =?utf-8?B?VlJCRmlpTEFPMG53cTlERjhpKzNaR2VRR3RiS2FCTjFvKy93TUNaclBqZ0sw?=
 =?utf-8?B?OCtNSEN1Y0NvYVBERzE4eWxLUkExdnRwMFUxR2tqZWNYSzVLZ3VzajFWZHo2?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c83dc26-c23b-4cb9-e462-08de0a538861
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 12:25:02.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItgYPxoW3fvEv1TbIr6kJnlUqE5s463RDZxU8PnxHbcDsAxTwTl/oA324w8j9ivCTdJCrnB5p0crB9KQjDPsonXGh6GeqGupYSexFOygruA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB11063

On 2025-10-13 07:53, James Bottomley wrote:
> There has been a lot of discussion on the tooling list about how the
> loss of link trailers has updated both tooling and triaging issues.
> Konstantin has proposed a tool to get around this, but while that's in
> development, I propose a discussion about making Link (or some
> alternative tag) into the pointer that would work for everyone.

AFAIU. this use of Link trailer is used as a strategy to work around
the lack of unique identifier in patch commit messages that identifies
multiple revisions of a patch, for tracking by patch review tooling
and facilitate digging through patch history.

I think it's important to spell out the problem this is trying to
solve from the get go.

Based on prior email discussions I've seen, I don't think Linus is
convinced that tagging commits with a unique identifier brings value,
whereas people actively developing and using tools based on a
workflow that relies on patch revision tracking see a lot of value
in this.

Putting this in context may help listing the possible solutions that
go beyond links and evaluate the best solution. For instance, gerrit
uses change id tags such as:

Change-Id: I9bfbee7a3219c3f293cee2bafce7233ec34d3e84

to track the various revisions of a patch. Unlike "Link" tags, it is
clear that it's only meant to be a unique identifier for the various
revisions of a patch, and it's not meant to be used as a link.

AFAIU the use of "Link" tags for that purpose tried to achieve a
similar goal, but ends up polluting the information seen by humans,
which is an unwanted side-effect.

It's great to hear that Konstantin is working on this. I look forward
to see what comes out of it.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

