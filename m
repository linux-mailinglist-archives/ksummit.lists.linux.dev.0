Return-Path: <ksummit+bounces-2328-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7952B524D9
	for <lists@lfdr.de>; Thu, 11 Sep 2025 01:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D963A05B1D
	for <lists@lfdr.de>; Wed, 10 Sep 2025 23:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9E1278E71;
	Wed, 10 Sep 2025 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGZ7kS5L"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96525C83A
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757548740; cv=fail; b=muQOU8TfqK0Oq8+floPAuBP1UV2yGcjgqrPtwP7WD9HRzTX541P3qLecuzcvU50/YH4a93D06sPz7XjvhVmmWHbezF55x2sHE1QU/5N+ZtkW4BkpOP3vdtGA8RhbVGlWdW1+gUKNeTBRoJyLwoerbsTXsCXraVfDFexgiQMm4T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757548740; c=relaxed/simple;
	bh=cHV7zacvG1Ou1UgDw6vfU4wuQKXonFJlC899HKQ490o=;
	h=From:Date:To:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=hDC68x1DP1hrDFSKCZFvR+GZqy4gI/2Lm6bn3lE5J9+AX5ZySDgFd7Bkdh31rQy//cgYyxmeYN/6JmiignOooOlLDjzgwid0BNofv1bEcxQsUBl7f3GqTT6D+I2Alr82uX2MtfrucsA24jd1TcGECHz7a2M75g2tW2xiLhHhLtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGZ7kS5L; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757548738; x=1789084738;
  h=from:date:to:message-id:in-reply-to:references:subject:
   content-transfer-encoding:mime-version;
  bh=cHV7zacvG1Ou1UgDw6vfU4wuQKXonFJlC899HKQ490o=;
  b=jGZ7kS5LCxpNpxwVZo2De9A6gKrrbbZ0epCekZNAZYmIn39N1lAW5Bl7
   IhnQ46Ck3CRJ12IBIB1/RYfjRXD1CarDyo7FbJrW12gswH+buwKZnIKQu
   ooDcQiIMlT83lAcyG3UmabIiar9GvIgr7QLkc7EeYF///G0vRtTxpflkv
   a8ysQhvnXn1oSZrCPnhqiP8BjOhkJLhZ559U0IPjFHAmGUmpA2GvlpvGj
   lqbKSrjxr/O64RyLRdDgeMXGIpyZhirJg1HlWNkSuPMDgf2dqWr99VDN6
   EDkKGmZARDuoCgoq38KQyp//JyPUGo+envuI8JaBsWgVkcr8sgntlHtaI
   w==;
X-CSE-ConnectionGUID: 9mFcdCrEQTiL3s7U+dbkWw==
X-CSE-MsgGUID: 7L5BQc4wRVmKb9QV1kfb0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="62504449"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="62504449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:58:57 -0700
X-CSE-ConnectionGUID: Z/fDRQU8TxaMj39bI4nd4g==
X-CSE-MsgGUID: CVXUwiDEQgCIAT5WOC5eYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="172819343"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:58:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 16:58:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 16:58:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.65)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 16:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJxoPa/fMR93wSy2kEoQD2/P/ZTnqf/pu8vhZ0G3tcoqT6tqGH1tBgNjk3IRxcJyC0S3HwhhaGWDV4Moh9OZ/KVnRbFvzJJyQttvyGf+7LXBViWIkuXl0waNURQr5CqADysQ5IbV7qJo0hm2SjDQxm1WofnCvbctaEbCwexqUrVfeH/vwa3mqgIeu7OCPb9CsTvLuFS4OdfG/hgpZfW2AZhaRv/QQmq+lyaql6i1GP+CBMgME3oUHti8qOuHKBokj/4n8rvuLVvy3RbwTmtAL4WwnXNwcBdmwUOz8R6lKacbRSl7ZrGhLs/zZUs0Z5ZQX9pRUO7t/AOXZ1h2r1aP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHV7zacvG1Ou1UgDw6vfU4wuQKXonFJlC899HKQ490o=;
 b=PO2KwEGCWRYBx00OOI5NBtaScCX+ygkdfbRUcFjDNGXuUnguZPHTcwFVHMkDVRA8Mw6nmtvL/70+Fz63lKF80bc2WEZtGiyl+/i7aPbO9LqDUcn9/cTniv4kvh5H0DHqvFilFKlpT3D5MXA3YAmZE5GTKUB9l3oNjQ0larkFCdmLea0ufwWOtBAwei3NFliKE1IapEgqsxyOanAwLDJXPWkoQ5OWoEHeAP3DatNqZhIfL8Ec7Rg9OxHGuEw0bi/25ibN+zgV2ef0viZRtXwpW9VWwrsfrVIPodGNEcCKUQ1nmuGT9lGGHOULelCs+Dhfa5MDeziuAEPXIT29VnYmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:58:51 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%2]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 23:58:51 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 10 Sep 2025 16:58:50 -0700
To: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>,
	<ksummit@lists.linux.dev>
Message-ID: <68c210baeff65_75db10043@dwillia2-mobl4.notmuch>
In-Reply-To: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
References: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b6d011-67ab-4ece-4d5a-08ddf0c5fda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OThQVlNNQk9WZ3c4Y2NJaXdpcVNjdzJuSmRmU3hlNG1YRjdFY294Q1lVMS92?=
 =?utf-8?B?dTVXVTE0NklyQktBODc2c1Jwd1NHcWxhajFwZThvZjVXM0JZUEROMHBaZnMz?=
 =?utf-8?B?RE5sZ1NzdHV3emJtK2E5enB2ZGNMaDF6MW5mQTJ0eG8zeVVpbi91anFvRitZ?=
 =?utf-8?B?ZFdKU0tMTEx1M3BWY3JKcnM2dGJBeUtoYUxYbi9BcGZIMFdKcnBZTXR1NEhs?=
 =?utf-8?B?SncrWlc0Sk9sWEJNTElqdlJZSm9PL2pNRFA3cXJ3clEySlh3YXF2c0tDTC9D?=
 =?utf-8?B?Q1lLMmhJNkh1c2lkakhvMk9pYmlGRlI0VG05bkZvQThWL1BiSFQ0MHFkd0xL?=
 =?utf-8?B?bHlacWJ0VWRhN3VHaFFIZi9BYWRZSTBrVDR0U21saHVsUW5pOEc0U1VGam1G?=
 =?utf-8?B?WkM1cTVoM0EvS1p5a1dzem1xT3JsYkdqMlpSa3d0WE84V0tSTHgySE5NcG5E?=
 =?utf-8?B?azdQdjd1dnk2V05UOTg0NlQ2RlExbEhSZzJVQ2k4QUxVTzhUelJGMkJPRUpB?=
 =?utf-8?B?S3BFQ1ZaNmdKeHJKcmVrWmdLYTNDbmxVOUFCbVFOaUp0Q1dNRnF6dHVFOVRk?=
 =?utf-8?B?YUpuL0RIcldwamhMYVFIOElOQlNkNmNSWjB0NXVhV0pFVzNlN0FvcjVhYVRu?=
 =?utf-8?B?TE8xR2pwakZDdDhJMnpUdmFqRXQ5L3Q2LzJvTzlaQkxvdXB3WFFocFhoTy9p?=
 =?utf-8?B?K1pwZXJETCtzWU5YZUVSQlhOTU5HNjgxSFB6Szc2NUI4VHB4U213aFNzcHRt?=
 =?utf-8?B?MUZNdkxMQkFXc2ZtK01kakErUzJ4MW0xeWhXOVJQRldFeXdHV002VTl6TjMz?=
 =?utf-8?B?eHZRR2ZlMjBYUjdoWi8yL3k1di9HdzJMUGtlZmdRWDBzeFp3c1pvNFdjc3A5?=
 =?utf-8?B?WjlMVzlxcS8waEcwWUlvZmRJTzRUWHdnSlFaVEh1OTFvS0RMek53SGxuMVBh?=
 =?utf-8?B?ZXNxUmZMK2hMcU5xdmdXTnRna25wUnZDakN0RzQyZ21rSEJwZ2xiZCtiMGp4?=
 =?utf-8?B?THBtM3VjdXRRUEZSZkRMNy9xbFF3bFB4VWgyT2wyc3J0bEo4Z3I1ZjdteDBl?=
 =?utf-8?B?Rll3em5MclpTcEsraVgzSHcyUlBTTC93ZGQzREdyenp1Z1VCRDc1UmdNMm1J?=
 =?utf-8?B?eGRRc3IwcnVEbUhDZGkzZFNudXZQQWJkeG8wWFRCV0t0USsvRzFRSDBSUzJX?=
 =?utf-8?B?T3puVXplZk16TnhvNHFrVGo0N1BjVUJxbW5JSE5CTDlWcWxoT3MwUDBuVlNP?=
 =?utf-8?B?MHpMQ1BoYzFMNnRTZ3JJeFM1T0p1WE1NSFJHTitBcG5yQ0lRQ1hQU3lkQTg3?=
 =?utf-8?B?MVYxL0JVRHlVYUg2eThHWlVFN1k1Z3lJTTBPSHU4V05vbDhkUm1kbWJ0VkJy?=
 =?utf-8?B?TllWZmhCRkJPYVZIV2dGWEZ1NGxGYkttYzlzNnJKZCtrbU11RldyTVNaa2lN?=
 =?utf-8?B?aS9yOGkrdWMxQ0hZcDM3Q210aVpSdm5pUlhFcFBBd1kzUi9sYS9Ubi9DWG85?=
 =?utf-8?B?ajRueUVpb215V1ljSElmZnJUZTVESS9zeUdwV1B3aXNWUXRXbFB4VlFjSUVM?=
 =?utf-8?B?OWpUdGg3aEhsQjZyd1ErR2tUWGNiTWprY2RuaUg5T21DblZvVEZLbGlFNzVq?=
 =?utf-8?B?MFlyU1k4c2tuNTVwVk1GMkZMTEdZam9uTVNaN2w2MmtkcEp2TURZYlFGb1RL?=
 =?utf-8?B?YmZHb3dNcEZUMmdNSVgvd0U3V1pKaXZnQzluYnd4L1BvMlJ6YVYvK3ZxU2ZX?=
 =?utf-8?B?MDVtbFRzWVNybDR2VlZ4UU9uMHZ6K0lnaG5BWmg2Um1Cb1pBQ2dCNmxScmUz?=
 =?utf-8?B?MGlPMHA4Si92eUtaWWxlZHhIYzJkcDU5UG1BRmttUGhqTGVIKzBsREVRTmxr?=
 =?utf-8?Q?KA5jaThJQERJz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCtqaUgwVWR2N29HWlpPNUtxVWtPZTFRakJ6MFZ4ei9JelhBemNRTmRMWHps?=
 =?utf-8?B?M3I2eFhDa0U5S1U1NFBsbzFtMHhOMVJBVHRHaU85OG1HS3hwSS9NRjl2V2pj?=
 =?utf-8?B?Y0JiRjJzY0dKaVBRd0VmZi9ZN0pZK2t3cExoTkpOV1lWWnEvYU8wTTl2RFhF?=
 =?utf-8?B?RDl0Z044UjNFM0V5ZHAzVWtDRU05TStETWwvUnJYSXcyQjVobFQ2UkZaMWR2?=
 =?utf-8?B?STFxaU1Wa0J5dk0yTTNsY3NiS2FYdmhGRkpBTXZnT0EvSG0xOTlKakZrdDRx?=
 =?utf-8?B?VWtONFQyQVFMQmV3N2xwdm1UNFlsMFQ5MGd0dHR6cWFlUkpqOS9kUWs5UWFz?=
 =?utf-8?B?OHM2NXNEUml6NVpMQ092THNqalF4NXVXd0gvZFRmdDVXNmtkOE9kZ3hLOVZB?=
 =?utf-8?B?Wnh4UnRteXAxK0lidnVuS3Q1MDVTK0dwVjF4SEZyb25pVDVyenBzeS8vL3lj?=
 =?utf-8?B?U1pDR0xnV2sxZ3Q3WnhjRGxlOFpYb3hKNHBXeVhmcEdGQXdWb2FBOE4rMG9W?=
 =?utf-8?B?LzVZTTh3RUNNMVBweWRQS2lja0pZZy9KL2hVYXFoVG5La3pqZ1RyelJ1azQ2?=
 =?utf-8?B?SHdFNVFmbkpJdjdUbW5udHhubDBEazVWbVU5UG9tcXpFZG0wMXlrZTYzcGdp?=
 =?utf-8?B?SytXNk9GMFhKbzlJOVpNQ1dkOWRwbWZCNkhXbHJlNFY0ejk3RTd0TE9SVnBX?=
 =?utf-8?B?OWptMUdrb2tsUktlckYyUTdIUTJqZVNjNXE1cE5FVHYyeEROdCtGYUtiUUY4?=
 =?utf-8?B?YkljTFBKMUpDSWovYW40QmQvZENaT1AzaktiQmxlMGkwaEVScWl4UGVPZjdV?=
 =?utf-8?B?emxEeDFkWGRrNVBCNGpXcFJQbWczR2ZWOC80cTh2VUZ5QzREMnVreTZYd1p6?=
 =?utf-8?B?TWtBVXZuTnhFZlVQWnZ4aTZjd2hFalRYaXM3TTdRMTF0SEdOck1WbEozZGRr?=
 =?utf-8?B?NFVldThqZFpobjRKRldMUVF1OW1nSmFqeVFCTk81YUpYQXRwd1UyR3VJWG5v?=
 =?utf-8?B?d1kveUtTZ2tGU2pZczNtTjZzdldRMmZqdXZXanpkdlVNem4yUmJwOS8yTWwr?=
 =?utf-8?B?UXhFQ1NxZTJWWk4wQUVTOXhkUmVScFNLS05TSU9SV2ZBZzZ2TUs1YlNaUi9P?=
 =?utf-8?B?dVpBWW9VcmlFdlYyTnlaUkNHL3ZxYzJpUjZscVl6bkxWaGtIalZObUFkMEpP?=
 =?utf-8?B?bjRybERCYjdQT2ZlS04ydGg3MGljcVRjNkNHaGdLM3NOMklKTXVDdWtHb0Z5?=
 =?utf-8?B?RUV4akpJcEhiZ0RsMDgxcFNIeXVScGlDaTFqc09Id0FsQk1MV0ZwNHhyNTBG?=
 =?utf-8?B?MEtIQ044bVBLdndqVlM1TjdKMnlqRlpUSWdUcW9SenlNanBBWWZhdzdYU3Vy?=
 =?utf-8?B?bEJGNW5TUUUxRC9raWhiRzlWU0VuNFRLbldQWlFMSEJpejduckdISTdqVWFi?=
 =?utf-8?B?MUZLdWNhbS9WSTVhYVVaZlQxMWdDQXozcUpqV2ZHVkxZWkNWVUZQNUV6cDZh?=
 =?utf-8?B?SzBTdXhEQ1JhVkZNd0VNSVE1VVZCOUZ4RUJrVUZNRFpoeVZsMzZodHNWWHZz?=
 =?utf-8?B?NVZNVTVaZkN1T2xOVXdQdDg4MTVlUmNqOHFxNXVOYUs3b1VxNWxid2I1cG1k?=
 =?utf-8?B?cTZMbFJjQkZBRHlaYzJTYUkwRGdQaWlUc3JhN2hQdi9xZFRqSDNRY2RxZGtS?=
 =?utf-8?B?WVZib2ZKK0Vta2JoTzhLSXNDTmhIa3JOcVZtS1pJaXVzRGx2eWRRYzYreHM0?=
 =?utf-8?B?R1BjNWEyekR3aXBuZS92WXJBWHNRd0V4S3E4V2dBc2tSYnkrSDJSU0pSc1RL?=
 =?utf-8?B?NTNpbGoxU0t6dUtyZFRhWnc1R0drbFFBOXc1bGFyMzZmL1lWMHdjTDBMM3Y0?=
 =?utf-8?B?aW5VeTQwZVg0TnV5cUlQdDRiMU40TDJLcktsbHhxMU5MTzUwYUZvU0tydyti?=
 =?utf-8?B?bXB6ZWFjN2V0UzRCV0txOFZPRjk5OTZYa2NpRWZIbTBvaGVxd0xMLyt5R0hD?=
 =?utf-8?B?MnB1Q2pUSS9uTm1raFZnallsN25wdGJoYUNQOXhmZU4vOWtDRWtQY1FqRCsw?=
 =?utf-8?B?ZVhybDdUMXVMYUhmNWpmS0dKbXU3a3EyVk5vL3JTMEY3YjFQSDlaTmJoQkpa?=
 =?utf-8?B?SHQ3TEZ0MTlQaDd5QVlXTnAzazVqc09Zc0hiYXkvS0VNQlB2aXZVcEVNMkJY?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b6d011-67ab-4ece-4d5a-08ddf0c5fda4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:58:51.2738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJeA6sbAdibZk4PfygHQJM8v1t3kzUofvOdL07lF54ROdmqROeJSuJwCRsRLR/qOrp22QPs2o7+foCAQXajkKh0/HoJVYdX6ssuMPfNujPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
X-OriginatorOrg: intel.com

Sinyuk, Konstantin wrote:
> Hi All,
>=20
> The UALink Consortium is defining an open, vendor=E2=80=91neutral interco=
nnect aimed
> at scaling AI workloads with low=E2=80=91latency, memory=E2=80=91semantic=
 communication
> beyond PCIe. Unlike proprietary solutions such as NVLink (NVIDIA) or
> Infinity Fabric (AMD), UALink is a cross=E2=80=91vendor standard and was =
recently
> recognized at FMS 2025.
>=20
> I would like to present a proposal on what UALink support could look like=
 in
> the upstream Linux kernel.
>=20
> Key areas for discussion:
> - Core driver design: proposed start under drivers/misc/ual/ for discover=
y,
> =C2=A0 topology, and resource management.
> - Memory semantics: same=E2=80=91OS and multi=E2=80=91OS rack scenarios, =
leveraging dma_buf,
> =C2=A0 HMM, and NUMA.
> - Control path: AUX bus for vendor extensions, offloading real=E2=80=91ti=
me sequences
> =C2=A0 to device microcontrollers, generic UALink interface.
> - Security: confidential compute support and a userspace daemon for topol=
ogy
> =C2=A0 and authentication.
> - Upstreaming strategy: begin with a minimal core driver, then incrementa=
lly
> =C2=A0 extend toward MM integration, dma_buf support, security, and
> =C2=A0 cross=E2=80=91subsystem work.
>=20
> The goal is to decide how UALink should be represented as a first=E2=80=
=91class
> interconnect in Linux, complementing CXL while remaining vendor=E2=80=91n=
eutral,
> ABI=E2=80=91stable, and maintainable.

Hi Konstantin,

Please do also consider submitting this as a topic for the Device Memory
Microconference (https://lpc.events/event/19/contributions/2009/).

Many of folks with experience with CXL, NVLink, Infinity Fabric, RDMA,
HMM, NUMA, dma_buf, Confidential Computing etc... will also be in the
room for a focused topic like this.=

