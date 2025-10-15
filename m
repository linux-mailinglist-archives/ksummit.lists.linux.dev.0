Return-Path: <ksummit+bounces-2531-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EED81BDFFB4
	for <lists@lfdr.de>; Wed, 15 Oct 2025 20:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFA3B4E946E
	for <lists@lfdr.de>; Wed, 15 Oct 2025 18:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164FF2FF66A;
	Wed, 15 Oct 2025 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTctq060"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E521B1BC
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 18:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551476; cv=fail; b=rMw/xMgqXtNoY+GNM8zfXnnMyFVCshTahimoz9gSpiBLcDDj5NzfTZXe62j+xt9wE2+H+V8JgJc0EuKvz6TApRd/dy/I/5+WSQIh6LU4k/41YmI4+SznVaw4OIwfGameMp1TmySUmv8RGj+9y/tKS3CcRwXjAid4jYGe5ZT70f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551476; c=relaxed/simple;
	bh=JcXWdqS0dnXbPIMNU2k355FdO3FO14/vUv23P7oBXAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uj5JXjh7Fto5gUMZzxarnjKkY4hT91RsUX8TEjm1fne9xJeS1NgWboQ2Ydz8Tfdk5SbNMxNAP4kGZFVRhuQ7YdCjaKXJ/amuNZzukjxSKbTsDyQSEuuiI7kaA2HmuxpNOvl0hHoDdkHOkSlxxg5/SfcfBo0vvkLWuAwDsCjNzKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTctq060; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760551474; x=1792087474;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JcXWdqS0dnXbPIMNU2k355FdO3FO14/vUv23P7oBXAw=;
  b=NTctq060BXD3fG66e0yGPlldzTdUqbE/P/ITpqPGhjbmWtnNCKQUGY5L
   fXtyVFD2tz8JCVDae8TzzP0pr4HpyDmVEk8jAqxlMx5aTLLbL1EMkBRqp
   EzmKKLLuyBNi6SYQsi6u4WNqPtwHXVW1FpDQngbCaH59+NFvWcSPTVDTX
   wda+b499dyx8kqmgQyDedcSsXZTxA1eCuz45fcMHJStCk4tTNr4ZigGHz
   hLvAdZ3FQcVwDefc6U8r1z9ZLtpp1FFMiYMP62btEOCytVGkFbDav6Uvx
   qD22i6hzRzrIEhjvsY1m7tfeMinRGL1n0u+mBYWSHCCazb6RXI+vjI+0m
   A==;
X-CSE-ConnectionGUID: /QBNOQdARmmKmH5cBDplOA==
X-CSE-MsgGUID: N2MiifDsQey0gMoG72nY8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66387970"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="66387970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:04:34 -0700
X-CSE-ConnectionGUID: i0a1apqqS+qOVYph6kyTZg==
X-CSE-MsgGUID: XMZYhHNNTqyTJVg2cUj04A==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:04:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:04:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:04:33 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHr9gN7jbsdn8S1hcIDhstcATyxe+ueMomsnYZj89kxVQEDT87nqDpWynlwLOyY84tyv2IvjK+OKj0VjY3CSAjI4JFXrP0grBA0QaQjrtk33V5LW0y03Ew+BBvR0hmQmEZ/Jhtrmy8OVHdyNgzXPl28kgLd64mNDRhn6MeICCWYPK74jQdw7ibBRO9eSUAeHSTn/Int5JrpgPEcwWzu7dHFqgLboq5/hzmtDiNL5yrLAAhgeQJHXHDsjAn/1zmBZj7/hjvLYKRqlPc0zOpKlFzo1RoiD3Zhojp+MCyeAQU0/uMWm0wq4no8rL7bNTUGxqx6JLi9zG9AUYSSY6/ebsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcXWdqS0dnXbPIMNU2k355FdO3FO14/vUv23P7oBXAw=;
 b=Aua4IMolGI0z5tkKrXwdUxq6pkDXuNmwGik5uLDBSiqGtJ9kca3+ySZLL4NvoOsrUAmHd8XqZnu6+zCAxinkVgjEewAV6RmCQzmjYpiCr9f32AlusUwCsXwhVnQj/Z0b05tHJ2OaMrXd2dIRPH8O/0c6iMuHGBCN7iIzLrIOM1ZLxnX0HgHalZD4QnTVktVd5gVX5z+dTJt3x1dVVPGDl/nA2LpMQbdaiOr+fQ0p63V9XXD4kLpzjW3fPh9llZ17rLDIziOisitlkgCgIXIxAoDB426MhSWDDjfpLk+rNItaIky8APE9tEpMtTZgg/OwbrGBOO0M/R3k9N5ceXnOJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH3PPFCF54B2894.namprd11.prod.outlook.com (2603:10b6:518:1::d4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 15 Oct
 2025 18:04:30 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 18:04:30 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Williams, Dan J"
	<dan.j.williams@intel.com>, Greg KH <gregkh@linuxfoundation.org>
CC: Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Subject: RE: Replacing Link trailers
Thread-Topic: Replacing Link trailers
Thread-Index: AQHcPDgGKbmAgSLKrUCfUDaxnm8Am7TANwiAgAGYJQCAAB13gIABh9+AgAAMuYCAAAG9QA==
Date: Wed, 15 Oct 2025 18:04:30 +0000
Message-ID: <SJ1PR11MB608325DDB1FF6E86E184A50BFCE8A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
	 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
	 <2025101448-overtake-mortality-99c8@gregkh>
	 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <146639e2bc8b5327f57e4297f5a0fcfd3c86d95c.camel@HansenPartnership.com>
In-Reply-To: <146639e2bc8b5327f57e4297f5a0fcfd3c86d95c.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH3PPFCF54B2894:EE_
x-ms-office365-filtering-correlation-id: b4f7a031-b1dd-47b3-8234-08de0c1549e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bHl4SVNDdm5xcENVTk9GMmNnKzNEVGdzcHhNZ3dwMy9VOW0zUWtQc0xEOW1X?=
 =?utf-8?B?NEVwSW5hVWpzQzFuSklHdCtoL0xxd1Q2UXJIM2NFbm1yVCtZOXNMWm5QQ0Nr?=
 =?utf-8?B?WldhV0hDVS90RU1pUnRiZVU2a1hhK3pqZXg5RW83UjJ4RUdhL3ZLcVpDaHd1?=
 =?utf-8?B?RkRBemFvdHpyUlUwV3FzcnltaFg3cENHWC81a3ZDUk0rN0hMYjVrcld1M1Nw?=
 =?utf-8?B?OTczY2JhWFBQZU5pWi9pN3NQZmMzV2R4czZCRjNzOXo1bjlFOEV5V3BaUnJo?=
 =?utf-8?B?QkN6alBkVXRMYWI5d2cyeUR4SFRnTDhNSEJxRzl2UXFmckJ3bEd4QzBtWldw?=
 =?utf-8?B?VHlURnkydm5scDFxd0pUVU40T0RxZlhxbUcxMkIxTG9uTnhzQXBCbVhPYWlu?=
 =?utf-8?B?UEhhYmhYSTdBNFlaSUJPV21wM3gxK1lib2J4SlhJUHRXVWpHdS9tL1BPQTND?=
 =?utf-8?B?YzBRbUo2MEgwUkJYNURVelJIOUhweWFlazA5NGZxcDBIVGdZY1Ivd2JTeFpo?=
 =?utf-8?B?bUpuT0dzOGFOeVk1VmlaOUZTdzNlWHIwSXpvUkxFeHZOYmRuY2ExQVlIWS9x?=
 =?utf-8?B?SXFqRUFWUG55WnNqdGw3SFdFekdHWTI0bkJqY1dmVHRxRW5NWk1kZmdKUVNy?=
 =?utf-8?B?WUV3K1NaSnRGSlBrYU8rTVppRGR2UEEzMzhYbkNWeE84NEFMNmhvQWVZZCtu?=
 =?utf-8?B?MTkvYWExSkdBVnJaNGFReEN2OExCaUtvbDNpQlRsV04xOW1IancyZDNNTU5W?=
 =?utf-8?B?QWMyeHk2MkswRVArNlJUZm9EVVRZVjBCMnZCenJaOVIxaUlNczFudnlpeUdV?=
 =?utf-8?B?RUUzYmhyUGtuV2N1T25ocHhuRmVDTVdBMEcrMlRsQWhrS3VLazNiOU9vSTZ2?=
 =?utf-8?B?N0JCcS9McUZ4TW1ZNXB6M2I5YXBHU2g1ZGhodmlqNndRUG9EVXlZSlVieE5l?=
 =?utf-8?B?eGFPdDI2WU5wNm9TcW1EeVZBZFUzU1FsazNaM1hNU1dsdXB5cFh1c0Z1d2JL?=
 =?utf-8?B?emZMYm1UeXdWT3E0NEVYZjBIMTdKUUJxcWJUczdWdmQwcUJDV1lvNTNXTDA2?=
 =?utf-8?B?aUhIUmJRVWViT09ZNTNlOUdKR1VENlU5VHRhM0EwTTZYY04vSkdlNTc4N2VL?=
 =?utf-8?B?TzBBelRFTHN3VGhDMUhkb3k1TzVpdkcyN1RiVzhZdHZRaGU4aHhnVmN1S2E0?=
 =?utf-8?B?cE45VUN1RGlaVDRWOGxaY2ltQ0g2YUFrOHVnbzE0bXNuWVR6dytTQ1BsM01T?=
 =?utf-8?B?TWRjNE43VzZlUXh2MzlkbER6enpxQkpmT1VNaHNYUjl3NXpTMWFOOGNpMDlw?=
 =?utf-8?B?RXVvTVBNTWxtYkx1VmU3VHdTOEhCeTY4Y0toK1V3d1grMm1MWENQUEtQazR5?=
 =?utf-8?B?TG1ld3lZS3A2SU1hZGdnMTUwUkdKNWlETFJQeXM0L0ZBSzYyUDNKajFSNmhB?=
 =?utf-8?B?WEdDUDhhQ0xmT3pSdjl1a1hpdHNBYVJkUm9wbS9sT0tQdG8vcG43NHZwR1k3?=
 =?utf-8?B?Q2xUNGFwTWNmMFNpZzZTS0p5ZkkvYUVYcG1zb3ZObDBBanZMVzBUNjhnWDZr?=
 =?utf-8?B?OUxDRlVGRjlKbEc3QllzOTJQZm5IOUxzSGpIYmZPYmFnOWxjTFd1cDlsZzRK?=
 =?utf-8?B?U0dhZXBWVHhyT05mTlUzV0ZoUThpUFc3VndrTDlZWHA1SEVUbUhobXlidFU3?=
 =?utf-8?B?SmhWY3NVUEV5UTJUejd5OUEvZVlFU3pUREl2VWp2UGVFWTVOcnZvbW83VW43?=
 =?utf-8?B?VXNjZEkvSGRQczduckU1ZXFNUG5vWUlBM0d3UjFFdk8zaWNkT1ZnWmRnQ3hN?=
 =?utf-8?B?LzIzamoramRMUmF6c0RpcTRGRzBJZ2s2aWIxbGtjOGk5UGJRVUpMYlhqUkZB?=
 =?utf-8?B?Q0pNd2RtRGZwWmNCTWJGQXBTa29TaTdTRmdZUlNVaXp6UW80Rlk0aHFSSkpy?=
 =?utf-8?B?ZzlYQmZlMzR0K01SUzBBandQOHUreldacDArdDlPbFcxYVhmQXVCekRVU0dm?=
 =?utf-8?B?MFVBcXg1SStNL3dxTkszbm85d1p1d0t4VzMrOWVKUGZJM0xodGloanp3cDIz?=
 =?utf-8?Q?Z1KPpp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elpVZWxvdUxCSXZWTmVCejlHc1NEUHByNG9aczRGOGdHdlNsWXdobnBtOXlJ?=
 =?utf-8?B?YllvS2l0MEJkNjVnWmtWRmxsOFM4M2RwSmRXRXN1eU1Qb3hiSzEyanRadDRQ?=
 =?utf-8?B?U1pKTDZxYjFYemVZamRTdWsrRUtZbForOU5QMVMrQjhtaWdzaUpHZ2RzVFgx?=
 =?utf-8?B?SkJ4dGNGS1hlekc3WTJ2eEdweTVhM1JvTW9mK3JMQS9rdkp0Zm0zU2c5Ky9F?=
 =?utf-8?B?K0ZiSmxtNnpnN3pQbEZzREdPYzA2aEIra3psem1LU0xKc01ZSzk5dm5LNlYz?=
 =?utf-8?B?NW9EVHdSVXpJMWhzSFQ4QzZIbFpkeE4yYmUraFRPZDdWRll2VEFWNnUzSUxz?=
 =?utf-8?B?UHZCK2E4VUJuYVZPMlptYlpkVy9zQUZ2NWluK0ZjcFZNRFpncnk4dENncVBE?=
 =?utf-8?B?a1JzU3Yxa1RSUVpCS1JzOU1LdHZNWXdWcWhBcXNGTFBHMUpRZm9tVVRjSGVW?=
 =?utf-8?B?c25KK0VGSU1relhPTG4wZmc5Z0wxSFRUU29WZjR0Sm03YUJxeFg3TmlaNWNh?=
 =?utf-8?B?RmQvSkExNlBJTU40OVYvM3dmMzlTeTVxZzMreDl1NGVISUkvUms0UUNqc3B5?=
 =?utf-8?B?YkNqSkJ6NDBWVXJIUzBYSFlMMkRPU09iaDVrNUNmL0hCVGRjKzRicHdUOEVh?=
 =?utf-8?B?OWpKVVRvM040VVc1RDliWXFQSGxHNmM2RnB3UzVqN0VocCtaOWZtZE10UE1X?=
 =?utf-8?B?Q1NrUWRGbmtrWDh5RFRWeW43K3lwVjhlRGVwdkhzYmRNVFZZazc0WlNJWFNw?=
 =?utf-8?B?RStKeU5FdHBSZHhMVFFDbSttODJjSVA2R0ZReitCYVpJUUR3RHdHNlcrY281?=
 =?utf-8?B?eDdRb3FEanRjUTdNMFQ4cjYzbzh5V2l3aVhUVGVrVW9xV0c4R3ZsSjVWNjdh?=
 =?utf-8?B?OFcyVGlyYUVjVEZhYTNVTjRCL2hjaXZRL1R1MFRmc3ovMGc4MjFIY1IvQ3d4?=
 =?utf-8?B?WjNLVzdERmR4QjkyUnFjQnE1c2VhVEVUOVZnb1MrRXBNS1Y1MW1hRnNRckp6?=
 =?utf-8?B?NTFJd0VOTlBOK3ZKR21BSDBYTWY1MVM2YU5oNjJGOXQ0aWY4Nk0vSytPc3VH?=
 =?utf-8?B?UzhZUGwzUVZXUEFLeFhUWkJ6aFRPeCtBanlLRkVYaUlIejRkUnBvNnRvWFBv?=
 =?utf-8?B?d1hVNmxRTjJxd0dvTEd6YkEvSmFMVk9jbXpMa1FJVmlNOHljQnZIY3VDdE5r?=
 =?utf-8?B?UHJ5OGtQbS8yTkM3L09mWVdvVmxzVnVPM3EzZHBIeFFEVnlxQlc5ZHE5Nk13?=
 =?utf-8?B?Nnh1S0NuZkdZcnVsZEpheU1ZUFduVWRsN0Uwek5uUy9idHJ5a1JkSEFZMGZT?=
 =?utf-8?B?T21tYnhnWW5Gb1BiWUhwbk83NHhqYWhwOGVvRmc0a0w1VjhmMjJRcUFhSCtq?=
 =?utf-8?B?UndBRk9tMFQxYlMxcHNvd1AzR3NVVGt3S0lwT0pTcC9XcWwvR3N2RUZrUlVv?=
 =?utf-8?B?TXJRV0V2UkwrcGxERm9tMjFDenZIM28xNmpWbVRSN0xveVJiSm9DNnBhWml4?=
 =?utf-8?B?RGFJbWFEc24xWlljRjlDWWVLYzNZU3RsVlR2b2tHK3pjaU10WmM5aXpJVkxD?=
 =?utf-8?B?WEJzMWxSYmZaM21kS1FWdy8wWEoxZnp6RGEwanU3OWtZTWlJNWN1ZGdPU2Vj?=
 =?utf-8?B?TFpFOFlYUVg5Undjbll5U0hOTG1FVG10N2RSa2NkaDBBN1U2czNjZTRTMFJK?=
 =?utf-8?B?cmNCaWtLVkFPdU9ScWpPb1ZIdW5pYU5vVFhpSCt0WWVBT1U1dGhsSVhTaW1p?=
 =?utf-8?B?c0dJZFpnOTY3WGk2cDJmUDdJQ1lSZlBpK1VMc3A3VFBZVERZU1ovdWJvbHFo?=
 =?utf-8?B?ZUhseGxHMVl1ZEZNR3hHZkJVNm4xd25mZWdFYnBjSTRhZ2JWcEhDbHlFOE9q?=
 =?utf-8?B?VWxDR1hlcUJLaHdKRHFpL2syYVZnS1JGc21zSlFpTy9iRVFxVjNKV0hidkxa?=
 =?utf-8?B?VktIMGVEbzU0UUwveXBSZi85Y2JRWTdUend6d0E5ZnVkdGxTMzNlVnJJTDRK?=
 =?utf-8?B?Nzd5UVRLdHQ1VW9LRzhvMHFxUWpHN1FVRmF5Ui9hTTlMMFY3bklaNGFGcHF6?=
 =?utf-8?B?azNzSjAwNXd1L0JIVFMwaFhwYkEvdnJKaHZHY0grK2czdXUwWURKU3JFL0VJ?=
 =?utf-8?Q?6FgJPTca83QyW1d9sEx6qiUIJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f7a031-b1dd-47b3-8234-08de0c1549e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 18:04:30.6746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAMZF0JEoBdHo0ZPgwuUfXMVc+jxG0J5NpCvpNumHPo+YmdeXVjKVkNMuaJUlwUR8seoBLCLErkvyS4yESx0jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCF54B2894
X-OriginatorOrg: intel.com

PiBZZXMsIGJ1dCBub3QgYWxsIHN1YnN5c3RlbXMgd291bGQgY2FyZSBhYm91dCBldmVyeXRoaW5n
IGV2ZW4gaW4gdGhpcw0KPiBub3RlcyBkcml2ZW4gYW5ub3RhdGlvbnMgbW9kZWwgLi4uIHNvIHlv
dSBlaXRoZXIgaGF2ZSB0byBoYXZlIGZpbHRlciBvbg0KPiBwdWxsIG9yIHN0cmljdCBydWxlcyBh
Ym91dCB3aGF0IGdvZXMgaW4sIHdoaWNoIHRoZW4gY2F1c2VzIGlzc3VlcyB3aXRoDQo+IGxvY2Fs
IG5vdGVzIHVzZXMuDQo+DQo+IFRoYXQncyBub3QgdG8gc2F5IHdlIGNhbid0IG1ha2UgaXQgd29y
aywgYnV0IEkgdGhpbmsgaWYgc29tZXRoaW5nIGlzDQo+IGltcG9ydGFudCBlbm91Z2ggdG8gYmUg
Z2xvYmFsIGl0IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBjb21taXQgdHJlZSBpbg0KPiBzb21lIGZv
cm0uDQoNCktvbnN0YW50aW4gY291bGQgcnVuIGEgYm90IGV2ZXJ5IHRpbWUgTGludXMgcHVzaGVz
IGEgdHJlZSB0byAiYjQgZGlnIg0KYWxsIHRoZSBuZXcgbm9uIG1lcmdlIGNvbW1pdHMgdG8gYnVp
bGQgYSBwdWJsaWMgbWFwIG9mIGNvbW1pdC0+ZS1tYWlsLg0KDQpEb2luZyB0aGlzIHdvdWxkIGFs
c28gcHJvdmlkZSBhIHBvdGVudGlhbGx5IHVzZWZ1bCBhdWRpdCB0byBmaW5kIGFueSBjb21taXRz
DQp0aGF0IGRvbid0IGhhdmUgYW55IG9idmlvdXMgZS1tYWlsIGRpc2N1c3Npb24uDQoNCi1Ub255
DQo=

