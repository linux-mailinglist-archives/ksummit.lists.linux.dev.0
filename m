Return-Path: <ksummit+bounces-2386-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028FB562AC
	for <lists@lfdr.de>; Sat, 13 Sep 2025 21:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CB12A0071F
	for <lists@lfdr.de>; Sat, 13 Sep 2025 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E386E242909;
	Sat, 13 Sep 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UTXgO4mE"
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BBC211C
	for <ksummit@lists.linux.dev>; Sat, 13 Sep 2025 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757790698; cv=fail; b=hxUEKti+0AXuuJqV7vNS1HjVcmx8d7qXHA1y/xOUdjizrqgdf7zA1g08VoakrPUb7hbzDwj2wd6WpqpFsfr8AM50rkHC8TZ9EfeTr66u7wsYB64l/fkGDAGF3Hc4rFc6lMR92QKAomYbzAabT0VRtC9c+RD/qntFySQG5w1tHWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757790698; c=relaxed/simple;
	bh=GpbfFosPmlKmDwozcffqSxGxsqL8RmaKndgzcHQH2kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fb40/NGoGK0mJLdWEdiC76mguaYbq6tGne6CXGHNV11AfsiLBj0S8N2U2B5+mzhVd0Wsf2uk5aCs4R8EMTbE2KVYHvE8kzgg9VqTPe4xX4rWg7IbH69nhSU/kZ0wMzgFERrYIOtI/fF2OLh3niyKWEW9Gi8hTkJl0stKawe8Q0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UTXgO4mE; arc=fail smtp.client-ip=40.107.102.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvZhNSzIsDl9oSizvTPOuHcoATbRvODflIA/k+zyeCefFTqbnH68nGNPBq6aZOWVNlyfsGDw1pyN5tnyFdhcdEj3TBrVenA8OBFpXHlbcKbZFv6sFUGA/zwzIJ3LOIo26SKDKA9+BA4brpFEHhez7/zponDlh0x3cdrQ9w6/tvnGUBe6YLEann7tfVcu9f9tYqXU/lkNjkT8Z8pzGPGehyeg2klWBBrkq6LUQu2PUbhKUuWVlOGz47u5mW+01EdPhA0uhlPeXlj1CV4XbbmShh4wG5AFHiHD9ZKHOjRDvCdfqmeF4xva5g/C9GdwMGgaP3QytNL/N0DQ6upnyVBbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJxQ3k0Ll5cB9qwKzLzo38fbVR8k8hAk+n4WuF7Rgaw=;
 b=QnxzBb7gjDpl+w+UQMPhaSnrT/perfNxWwm0/9pAarFCqeaoHtvfRt7kjydcErcN+sFYi1gIyC1tNGwilHVqZeXc2c6qwM6EE7Sd7G7mdbNzkKLsden8TmBiX0Sp6ck7UzvNCniOnQ4ng0vEV3LTupCdNHGEDV7dnBDo7dKHqgIXG+tya2xp0coAjDC6fsDoSvs8ZDk6xf59n38m0By2AUaxkfaM/MElP2vKp0XBfin3CKmuLRpal3JxxwTa1qRX/4zmnDg64GS1D9XUeJCgp1JWu4xuETHhi7EXFFZ09AePtEblq8m2jTpEddcWKlbVEgf19zDej4kpuMFGpnXv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJxQ3k0Ll5cB9qwKzLzo38fbVR8k8hAk+n4WuF7Rgaw=;
 b=UTXgO4mEMbTBmw9GfKGbAgTQoPbN/kWbaK+XiWJzyPcHhNlr93l5p2xvH5bzlEoKDEykjwM5slnUuS5RoYh2UrZB+dIXfJzQeTs6W3MtfWxziCVOOJhDhT5GTfMNDmQczbwdjVXkS8QUv4+2bwefHT2QZCxdbkZbkAwj8dSrmEEoXtUfHq+EvQiLLhr5B6+GBD0uRpyJ9UMTVRCV62DM+PNUx69tJQ+gl3vuefHwYbaXkuZ6+JPsecPQWX0Z2FiHW4/3EnHAN6f2mLLCgOnz4/tktYcCDcDBWv3bufDir/nmWQj5J0wUSyRWJvYClLf4n2/KgUrq97yezdf3lX5J9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 19:11:32 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 19:11:32 +0000
Date: Sat, 13 Sep 2025 16:11:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Konstantin Sinyuk <sinyuk@gmail.com>, gregkh@linuxfoundation.org,
	ksummit@lists.linux.dev,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	Leon Romanovsky <leon@kernel.org>, ogabbay@kernel.org
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Message-ID: <20250913191130.GA1003573@nvidia.com>
References: <2025091207-blouse-scratch-dde3@gregkh>
 <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
 <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
 <CACRpkdZZdj1o++Z2tYVuHBkY_Tjypo=gu9srw=f9iL4rDJ4Jbw@mail.gmail.com>
 <aMQlBBu-ieIk1T38@intel.com>
 <aMRGo+JctQbEo80I@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMRGo+JctQbEo80I@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: YT4P288CA0059.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::16) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2426e351-49d9-4b6d-3591-08ddf2f9597a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFNoZFM0MDAzNmlBdytlR2paRWdyN0JreTNDQ1lsMGxxWnRzS1d6TjQ0UHYz?=
 =?utf-8?B?UHpEQXpDMDcycVhlbktVWEo0Q1BtQ0RmSkkwZTBtNENJdjUvNGFCTEg2S2Fj?=
 =?utf-8?B?MFFQaFd3MHFvQnJJZHhVUDVSS29rSVphbnBJenFsU2ZCWVNTdlNoZVVDZ0x6?=
 =?utf-8?B?WUhHZVNVelZKNmNnL1NIZEJFOVB5WURITmxHQkhPM0xEZEptOWpHSmFHWWxo?=
 =?utf-8?B?T1MzVDZyekNVcDZ1aVdiV01PaTlKRHJ5N2RzWFp6T1BoK3ZUZGxBdTdmdGF3?=
 =?utf-8?B?a0xLZFhqUWEwQlpHSi9jTDhJTm92SGVpaVVPVHhHdTNKOU5qenRjZVVyeWxm?=
 =?utf-8?B?bEp0Znc0VUd2M2FKdGRZY2NlN3FrdTZEelBnSDd2bXY2UGZZdU1SaEQ0Z3p1?=
 =?utf-8?B?aXNmRFR2ZTJpWkZ6c01LWHBIZnV4djg5Rzg4OE5Db05UbFlSaEZqTVV4dzQz?=
 =?utf-8?B?WFR3ZlJJUnpzRjcrVmdhSDdlK3U4dHpTcGUxSmZMSHFSalVQRnpFWnRldjJ4?=
 =?utf-8?B?ZWhkME8zbGJHQXBFc3V3MWdia0d2Ny96WVhlNVloeUdQZnV6QldrOUx0ZnI1?=
 =?utf-8?B?eXZzYUlkKzFoM0hCQ0gwaW4wYjNmU0xjcXNXOU1WcnFSa0d1TjU4L1M5VjVH?=
 =?utf-8?B?Zy9CZHVqVndoNFVpVGRlU3RRbFFBUzNIU0xySGNYN0ZzUzVCOEEwUDVvbzNr?=
 =?utf-8?B?VVpwZVpLekhkY05LM1I2RlJ1cWE2dThpM3FRUXhxRVhkUmpodjV0VzZSYTY1?=
 =?utf-8?B?L2FZa3UyTUNOUlhSQVZuMWtMU3JEUEQyNXNicGJNR081TkJDRjVLSkVFS2VK?=
 =?utf-8?B?K2t4QVFFcTB2VkNWdUxTUjVrNmo4VHkrRkU0Yzh3NFJ5VStMaVBpMHp0UzRI?=
 =?utf-8?B?L002ZlJZU1YrQk14aE0xaEVqRnEwRHhWTzVHNXpnb3M3NXR3dVROZnBXc2xC?=
 =?utf-8?B?dmpRL2FUc1JCbUhwaXpxTG8wYUUrL1BEcnp4aFNEZU5rK1daTktjMjNUUGNv?=
 =?utf-8?B?eFdiRDBwY0dUZ0F2V3dzSndrd1JrRWJGbjUzWTgrTGxyWHMwWVNINVlZS3B5?=
 =?utf-8?B?eXlFM2U1RnRaYWpoTGhQSDhvd0UxWlJobnhkRzkzMUVCSWJoc3gxSDUwUEFQ?=
 =?utf-8?B?bjFVa3QwUTlxUENyUkdCc1NweDZaQlZpV1NHejBmeVVSUFg3MlMrOHFaTnhI?=
 =?utf-8?B?dkFQZkU0MUphMGtPRWlPY2psZWlZZGZWdkdkOUU0c1NHSFEvTDBCd1d3SGp1?=
 =?utf-8?B?ZndFbDZWYXUvbnNZZUdialM1RmFSZU5Wb29rRFpIWGoxVDBBY0NaTXMyUHUw?=
 =?utf-8?B?dU9hQTNNK3Y5UUt5QjZFTDNQeUttL1A5Tkx0Y1RjWVpMWnZ0VnJvSHVnT3Qr?=
 =?utf-8?B?Nkw0RUkzU3VDQTMyZERVUnVLT3FuRFUzbGViem9qTk9kc0FSekFpVGJibDVT?=
 =?utf-8?B?UkI4WHFyelcwbDRXckdzQTF6NkFpOSs5NDA1T0kxcEZseG5IaG9UbDk0TFJj?=
 =?utf-8?B?dVp5Vk14NTFrNk9lUGJ4YXlINnBSZ3ZJSmpyUi9HaDM5V0ZvcFhaY1lQc0Fz?=
 =?utf-8?B?b2s2SHQ5elp5Y0RXY1dqdVVLblFtMTRrRlFkWjYrbjFBNHczcmFUVlErc0Vm?=
 =?utf-8?B?dkN1VkZyVzF5Qy9FRitBNkhyUzg0N3Mza1ZJOHViQlhMWEI3SGQyL0w0V0tp?=
 =?utf-8?B?Zy9pZ3d0Q3FLejU5QVIrKzBaZ1FkZnluZGdpWDFnUUhVYnpTc21TLzNpZ2dM?=
 =?utf-8?B?VElNV0h5bTRVcTJFMkIrVi9HWGtpSW5zbkQxTGZEeXBGVzN5K295eDJrT2VE?=
 =?utf-8?B?MUpHYXJybDZXZVVDWEkvbFVJVnhnMVdwemFrOGpUQkcralhsT1VVbVU0YTd1?=
 =?utf-8?B?ZXE0TnFpQ0RpMFdncEMwS2NWdm9yZDNsYVlwRXlROW9QeGZ5T1I2cnRLY0hD?=
 =?utf-8?Q?03w8VFU4/4c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW1ZWWl3NTdMdGh1T0hteXVmWGJpS1N0elFSUlBsV2FoSk11elNFUEJZMDdV?=
 =?utf-8?B?SDJzL3BsR1crN0QrTlJqb1RQY0lYalVsMC9CUklvbldlYStGWng4VFhKQ0ZD?=
 =?utf-8?B?TVhjZmdGZk5zUVZMUmpEU01hZGJEWW92WUVzL2NLYU5GQkh6QW9rekxLdFB4?=
 =?utf-8?B?Mi9xTktHek9NN3dobmlNSmZXZE1WNTA4ODJqZ21UenBVZXplMkthODdHcVRL?=
 =?utf-8?B?ZWZSaFppVDk4Y1Z5MWRFa1lxTzhUTnV0RGxvVGdCQUV0T3lWdUg2cVlyUWNC?=
 =?utf-8?B?OFVVMkovR1MrRnljZFlhZHpMOUVPelRXNDc2YWlIQlE0U3pDUlc4cVVrUWNa?=
 =?utf-8?B?NlN0UTVqT0x6K3l2dnR1RHk5dDYvVTlra1RaMngxMElxcVpQMmx5Ymc4dzQ3?=
 =?utf-8?B?ZmFmdVlBb1pCcG96STkvdEdTT0pWL3B6bW5VN0cxenBJbjVqYVRvZGgwSStZ?=
 =?utf-8?B?d1FQcDdjZ2x6Z2ZaMmdSa3ZPUG1EN1ZKWVc3N0ZYVnJCMlVQb3RHYUx0RXVk?=
 =?utf-8?B?by9XZmUrSkNPa21aSmhvU3BSWTdiVHZVN2pmTFhpeXhJVERtWEFHM05FRzdL?=
 =?utf-8?B?b0tKTVNUT2pEc0RaWFgrc2dHVEs0T3YrdE40Mkk3NFdVUWdCd3I1eWhFNzIx?=
 =?utf-8?B?cTJLamhXN0dYR3VhUmdjRzVJNzhubUo5UnZrRjJMZ0JCLzM5UlE4bXRoOHYv?=
 =?utf-8?B?L3FJVUtyZm9LbkRGZXpXZ05LV05VWEk4Z21JT0pyM2xYQmY0anFIYUhXelg4?=
 =?utf-8?B?WkpmdUpVbzZYbGdXTXdWcVdMSjh4d0xGbXdvalkxSDdJbXc3WkVKMXFEZFpR?=
 =?utf-8?B?djhHYkM5WHg3dnBUOVY3RVhrSms2bTF5YlBTVTlqWVkwUkRwZjZ3bk5QNFBY?=
 =?utf-8?B?aXVibjFOWkhhenQ0Ymd6WjlKM1NzWWR5SkxFT0NCWlZNQWdSOUY5TGY4MnY3?=
 =?utf-8?B?Zms5RUJTdkdTbkhJWXJDb0NPMm13QlZSQkp3ZGR5MXp0b1pXUXNQdDNQWVJl?=
 =?utf-8?B?STJ2ak1OeGZ3QzMrTWNOMmptK0ZWckV4Y2duK3hUWWxVTGlHZTlZdytCY3p6?=
 =?utf-8?B?QjVVaFVaSDJJNk83MXBGNnZSNUxMVm11K0hTWUJjcFVHWGEySloySlI0Wko4?=
 =?utf-8?B?UFdCRllGUHIxQUFnTGE4ZGdxMEVPbTdRZ25KQk9jVWN2VTZDOFdkR3p3ZjV5?=
 =?utf-8?B?ZVJIZkFzNkRxMGp6OTFwV0FWL2lpdEQySHZGOEFmWlZSbDIxTHRHQVJjRFBD?=
 =?utf-8?B?eVBML2pEdk9VdnVYQnRHTlVQNWVlVzExVGZDNUZBb3Foa3hydDNaVW44eGdC?=
 =?utf-8?B?akk1NEFPYWxmcWYvSk9uZ2F3elgyVnVjSndjL05DU2dwNnBYeXhJeklUMnlR?=
 =?utf-8?B?Z2tUTU9zc3MzTzU1R1JSdG16QW8xazhiMzRVbjMxVFB5ckptNW5Cc1dhaFhO?=
 =?utf-8?B?Q3VuYkM3TTdFZnVpbVVoZWdxUGlsYXVoODdZUlFGQmxaUmJySmVVTFpxYjNk?=
 =?utf-8?B?ZWxUWUpGdFNOTXFkdzc5SjlybmQrS3lYdXhCM3ZzTDgzZGd0ZXVOd1orUlFr?=
 =?utf-8?B?ZzlsWnNrTGFieU95a08wQk5EaEJWYXE3ZHNNZkY4ZWQxR0V4ZmdxVnlLaGRi?=
 =?utf-8?B?aitjV2VOa3VnOHo5SGR3RVVheXEzaXVDYVN4ODZ6LzYzTnV6YjRYdjUyS05S?=
 =?utf-8?B?eFdKSzBNaXlBUkxQQW85YVBRVmpKMWEzTTNSSmVOaisvSk1RNVhmdmRiaVV3?=
 =?utf-8?B?T3c0SWZja2NXbm55TzFoN283T1ZRdVVGUHZmckZScDM3ZVRXTE9ROGY0TXJ6?=
 =?utf-8?B?ckQ2V2phK2lKTjdWK016eG5POHByTlpjRzloeFZsVkVlYWp0U0k5Q2xMT09U?=
 =?utf-8?B?dGc3Q0FSL1ovVDZmaHQvVTR3N2Fkb1lWb05STm9qSXZSQjlxQUpTNlpMY2dE?=
 =?utf-8?B?SUZYRk5pNW9IVE8yN3FPTlRDUGRXSWNKcjFueVlUQ3JFVTJYakhBSW5iQ3M3?=
 =?utf-8?B?cUV5dzJURmpTbXR1SHQydUZ6VitKZFRuY0FuaW1WVXEwbEFNNmRIcmt4TVY2?=
 =?utf-8?B?c2RkYTFMcnJTeEd0N3FpM25mMEVkd1B5bC9TSVdIdXcxcEpGalJGblpOOENp?=
 =?utf-8?Q?O5zo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2426e351-49d9-4b6d-3591-08ddf2f9597a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 19:11:31.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NCEjlPoMebWj2lXlGfMGZrfRUujQS02VSx0kvVCmpBQpKZm3LdNkdui6cCIkqjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

On Fri, Sep 12, 2025 at 09:13:23AM -0700, Matthew Brost wrote:
> On Fri, Sep 12, 2025 at 09:49:56AM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 12, 2025 at 02:18:40PM +0200, Linus Walleij wrote:
> > > On Fri, Sep 12, 2025 at 2:07 PM Konstantin Sinyuk <sinyuk@gmail.com> wrote:
> > > 
> > > > Longer term, as UAL adoption grows and multiple vendors hook into the
> > > > framework, the natural home would be a dedicated drivers/ual/, just as
> > > > CXL evolved into its own subsystem.
> > > 
> > > If you already know there will be other things than accelerators there,
> > > so it's more like, i don't know, PCI or greybus, then put it into its own
> > > subsystem in drivers/ualink from day one, I think drivers/ual is a bit
> > > terse, the world is full och TLA:s already, also that is its actual name
> > > isn't it? Hard to miss if someone is looking for it.
> > > 
> > > Your merges can still go through some submaintainer like Greg, or
> > > DRM, if they need some shepherding to start out. After all that's how
> > > drivers/accel is managed, through DRM.
> > 
> > I agree it should be drivers/ualink from day 1.
> > 
> > I like the idea of the flow through drm.
> > 
> 
> +1 to both. I like the idea of creating a mini subsystem for ualink,
> going through DRM. With that, let's include dri-devel on all future
> ualink discussions.

Something like ualink has a lot less to do with DRM than it does with
networking and RDMA. These things are not "CPU buses" like PCI, they
are full multi-host network fabrics with switches, network addressing,
fabric management, and so on.

IMHO what principally distinguishes ualink from something like
classical RDMA is the expectation that the RMAs are triggered directly
in accelerator HW through load/store operations, and not from some
userspace CPU application in Linux.

But I would still expect to see the usual range of networky UAPIs
around link state, phy debugging, telemetry and general management
operations.

A normal subsystem seems like the right thing, but don't flow it
through DRM, just send it to Linus.

I think my main ask would be to have an intree user driver before
sending anything. Too much of this space relies on out of tree
accelerator drivers :(

Jason

