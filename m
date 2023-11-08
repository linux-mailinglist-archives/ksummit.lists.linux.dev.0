Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC67E5F99
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC95AB20E1C
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E02837173;
	Wed,  8 Nov 2023 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdvV8MpX"
X-Original-To: ksummit@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A5374C4
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 21:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699477398; x=1731013398;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cjymif0ujPbs2VuB7uAvekLy4hflqEs17qAW1YbUibM=;
  b=DdvV8MpXp7RrbhH5yOD22uhQutOT6mJdQ3E398mdDzdlXMfsWjLBBAnE
   gX80pchsv+gTnn/cas+sA5CsTidJG4+YtHpZ16XVP8ZsWgub6pDFNQyFF
   n6LAMKgsKkqTsZQgiaR6Bcy9MGUVfG9RsCX0GQWQKV5nPLBklvv3sQsa8
   6Nfvk4aepohpOlOhaW8CyMhNuOBmKnRI9djNec4rK8V20GOerq4hPq/6x
   a5nB6ssBJGJpcT5z4AT4VNkv0s7C4DyiRbfWmMtQJM3dp2SXbv1x3wZGv
   zFiW0zr3h6A1JAyKxgqbFOR4U3nuojud8CNLk3OvAxjO6N8VS1G9b/yuL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="420958904"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="420958904"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 13:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880344672"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="880344672"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2023 13:03:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 13:03:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 13:03:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 13:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CULgxlVC3yIF18g0Y2egjCcwWmfoLwEiXoUWYedD3qg8j9rweJ++CZYxu5759Qo5PNkh8WpNwgX/OpM0Q4BF0youjvjjyVYtR7LDuBLdlh+w/BlmcmELjC8eNiQM2N5OWX2R+Y81OunS+UuuxLY9hAzarumtyL+Qdw6mFZ/fr0WndgrIqpzaFor95vE4EyPvao6GSDRrrLRg7rILf95oBEcD64gKGOEACa7JSOKw/0zNJnfcnpyzqsMO5YvczWCggrjEqroiktoJH+EUAn+1G/Zz07vyiV1FxM3dylPpjCcudiqmxGckQKIdUN2MV6+3JA1wtQbje9nFxj5VSydLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjymif0ujPbs2VuB7uAvekLy4hflqEs17qAW1YbUibM=;
 b=i9nkIrHKU6O/wEK8usrmbF7H8AL73gwuT0ruBNxW6KRVotR+ZyJ8/a1xhzBpGNa0QyHRuh0RPRWjh6q+ErCodpUv/AmNX0RmYkt7OWq8M4za6iYHPXyC3B9FeLDi/Qp10JKqCIo0Vm9/o767L8/I86EUXKzZHJ2hS8fBpvmimwlnupksYlnmrahWIpIiaNU8s1WYgDLb097EEi35DoEuOcCgbQPbbgWvi1Y1F7w/UH4BsXTJHZxSIMkfjiVuZYpnIw9J6DvEGBFiTe/vn9pzqnelEYWICH60NXgHrToWovdbbviSht83sxBLlJvlop6O36y/QzVbhS4Hi9veWQCF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 21:03:15 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::2b58:930f:feba:8848]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::2b58:930f:feba:8848%5]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 21:03:15 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Bird, Tim" <Tim.Bird@sony.com>, Konstantin Ryabitsev
	<konstantin@linuxfoundation.org>, "users@linux.kernel.org"
	<users@linux.kernel.org>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: RE: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Thread-Topic: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Thread-Index: AQHaEMacxY/xcmASuUiTU6VtcLMqELBw2/cAgAAPunA=
Date: Wed, 8 Nov 2023 21:03:15 +0000
Message-ID: <SJ1PR11MB608322E77E30D5DB3169430EFCA8A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
In-Reply-To: <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB7298:EE_
x-ms-office365-filtering-correlation-id: 9f666291-a447-4890-0e16-08dbe09e2031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tTCfHgbi3f3xwG4sei4XP290NEkuLF6SDoY+0LgdpzuB6qIxZ6+u0LCgCzLo5MMzyRVQIlLVs4gTin+SA4yeTfoZBZZNs3ogViklXq7H9BsgN3ssgTiDHd+PAG/3H9JOlbKgoiPv3EvcSHu3KOBNjl4qdtMfxhXEcIKIHal0wZdO7A/2xaYeJEe88YIYkeB563G+S0T6Gz5mHC6dHEKyoo+mT4fJhfC1Y6dpD5ObOPFpWcGQMa6PDL7FH62K65een/sbhSZ7LeoePURtuRBO5Xr/dsxihILtQOi80Ma7BGZtZz0fL83w+fB7owjuWn6jyVcwfwoNKsdUWN9mvAqSaPY5RxXzMGWtbr4/T4Yhkun+xPMeKWh+eWTLgldmqYnadFovo12wG1n1I/brcqdsvm8b1NWJy/6X5WsL5qMlhB405IxVTr+0J48K+8HU1lkg9/4gytByZk+TgRcg4aWxbfbIO3vzVjg+MfJvEDpeNuYE6Ce3PnpZ1UWaUl8V2zqj26Mzq+jzyTeAVDaomvtUxU2297NQRZtfNX4P/ow9wT4CwDZpRqA8xgMvFyDnwmMfBEAG9MAuJxhyFGf2qkzlSylbuD+ihwV5Pt0bya8ntAxwxQwFUqVO7P8EOgysO1QG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(55016003)(122000001)(82960400001)(86362001)(38070700009)(558084003)(33656002)(71200400001)(2906002)(478600001)(6506007)(7696005)(5660300002)(26005)(64756008)(9686003)(52536014)(8676002)(8936002)(316002)(66446008)(76116006)(66556008)(41300700001)(110136005)(66946007)(66476007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1E2WGhFM3cveW5qdXprS1oxc0o5OFdiMEV5VWMyS3lxSG5OeERLK0xyenVT?=
 =?utf-8?B?SWhMZEdISWpRWkRyNjNIcWZpVUJibHYrQXZ5ZktaTkJRdFlobHYzUWRESFpZ?=
 =?utf-8?B?ZjU2SlZQaXo4b3lkZ2l0VkxiZnZPb1k0bStKY1BQVkIvK2p2NDA5blNEUlI0?=
 =?utf-8?B?aVI3ZXdPMHhxbVpoNmY3TFpYU1Ntc1RvMjhZajRuMzdJVFJJRlpJd0RoT3pN?=
 =?utf-8?B?ZGNEMjVEZnA2VjNJWWRlR3hrVFI3TWFRN0pjNGhRRFBzQ3RMZHdKdmF2UDFr?=
 =?utf-8?B?VDRpdXNxLzdwVTdyM3J0b2hoR2ZFb2pwbkp0OURmMThzUmJZVlArb3Z2ZWlx?=
 =?utf-8?B?cDNwdU5hbjFZbUV2K1M0SENXbWxmYnU3QUthNzlsaXJjNkFjZE9XY2oxaFZ1?=
 =?utf-8?B?dVRyZE94aHppVFZvQzZtRGhaK1ROWW1oaWlha2xqUUpqNCtUVHkzbG9oYTRk?=
 =?utf-8?B?RVg3MmgvNXIyeVhIRWtJd3EzcnJONEZ2bDJwZmRMeDlNeG1ONkNvdlZxRDY2?=
 =?utf-8?B?REx0eE9WWXV0MWpQcTQ0aVdyTjQxUEFDbHdUbUlPUWhKcVZFNm11YlZGdUor?=
 =?utf-8?B?VEFpSmllN1R4VFBOWkdXMTNjSm1OTk9zbXVCS0tqVFlPRk82NEt5REp3a1Jq?=
 =?utf-8?B?azZtd0hla1RxV2ZvdXJrSUt3MUZLRzNvTEw2SzRadnV2Z3JOMEh4bmZVM0lS?=
 =?utf-8?B?ekRXbmxQOXJFTTJLWXV4bXlzR1RvTVpaQzhqQmJLKzduWmxkYmVYbm1hYUo3?=
 =?utf-8?B?cytTU1N4VFpyd05TQlF4cTNkN1BVbkU5UUZLUEpBYzNzZ3Z2Ui9tOTNrejBS?=
 =?utf-8?B?d21WMDVPd3pJSjA3c055aVE0NmJkZ0ZxSU94Slg3dUd2S2pNeG9ISnJJbkk5?=
 =?utf-8?B?cTN6QmE3TDZzOUdDWkZTVTFGT3RYeEhEbXpwbkhUZWtXMUJBSVl5RHBIKzRK?=
 =?utf-8?B?bXRoWFFMYUpYMWJoSWJZVkM5MjF1cng3d1k5MEhYRDRRMFIyLzhYclR3WHBO?=
 =?utf-8?B?Ly9BMEg0bldEZncwVktOYzBPRFQ3eVJHdVdLb3B6UkMrQ3loNDZ2alNtdzZQ?=
 =?utf-8?B?clU2djRRblpWdEtjejZzM2Z5Q0xZTjZTUDc1SkszdFlNVlV3TEtBOURSaVc4?=
 =?utf-8?B?ZUQyVWYrUzVjQUNQdGVGT3VzWDArRXI0clhOVkRRR3REbjZ4K2pLTTV6aEY3?=
 =?utf-8?B?TXVSRUU4TlpkOE41N3dkak1nUmVKSmtvQnlKY3lNV1VlV3FYYjUydXRnQ2FX?=
 =?utf-8?B?SEo5ZUc3YlVRVmM3VnhjYWdrS1hHRk5rcVRVTTBXL3ZxRlRjLzgxdE5DeEgy?=
 =?utf-8?B?NmZIRXpoR0ttb0s4WWpwYy9RckVRVDhpcnU4L1hvdFE2TjlZT21ERkkxUkFv?=
 =?utf-8?B?N0xUbTZpNlFRMDJqUWdMWGt0S0loSDY5N3dLMkRjS3ZmRTFKK3JaaklSZno3?=
 =?utf-8?B?ckVocXhScndFVGVwcTFGWDQ5U3I0eTFTbVB4UkNqSml6WVA0ZWJrMTFYR0xM?=
 =?utf-8?B?M2JsNlpqRm5hdVNHVW1vbTlLNUx0bnRYVWNpWFhrbzBZSmUzenJhenAyL1pN?=
 =?utf-8?B?ejBrQTFQMzhDQW5ZbDlJem5jTnpLMjRoTzlkWXVpL28yMFlqTjRRQWlYOUZF?=
 =?utf-8?B?R3g5S1RUTGo0TVBaZW95RzFzdUZWa0ZXcFloZjNFZ0p0enJvSUVFNzI0QlZy?=
 =?utf-8?B?QXRZMWd3SEdPaTB6czNza1RpNEY3dndXY0VnYVdIWEpXT3oxS1ZDNGpiK09l?=
 =?utf-8?B?UWRHT1FkMU4yZ3VJU3ZCUndFTjFEZlJ4clQ5VGxBb3p6ZTN2NTZFSDRSYmg1?=
 =?utf-8?B?dmMyUzFZWEZoZC9MSHpCcnUrbVA3d1UrcWY0U3dlcjRHWkQyclJoaGRKZlJV?=
 =?utf-8?B?OXErbG1jWElYRTV0V0RIbWNNdGVIQXJUZlpRaUttK0tNTjBSOHo4c1lLRDB1?=
 =?utf-8?B?MHhxT0ZjN1N2WFFrWldsRldDanJrcytKZS9HYUpMTm1URUdicUtNUjdqaTVl?=
 =?utf-8?B?N1BOL1Q4eTNpL2NrQ3VFZjluSW90bEt0dFM0SGdSM21DYUlRUmZRWVIwd010?=
 =?utf-8?B?WTF5ZC83dTZNdHVPbnhXdE9iL3lBdmR0VXplbUY2bWptN3lOQjdXejAycHBB?=
 =?utf-8?Q?anHK51vMkjmvWRk1Zr3rDfaAb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f666291-a447-4890-0e16-08dbe09e2031
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 21:03:15.2228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vS0vKB1olSxjn7ibdVXxBBXJ3FQNYHZsl3Rey/zEGb77HRzxPxuqUQ/omnAV+Trkz6mFgRFdyHR6L8T7+b+RJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-OriginatorOrg: intel.com

PiBJcyB0aGVyZSBhIHdheSB0byB1c2UgYjQsIGxlaSwgbG9yZSwgZXRjLiBmb3IgcmVzcG9uZGlu
ZyB0byBtYWlsIG9uIGEgbGlzdCBvbmUgaXMNCj4gbm90IHN1YnNjcmliZWQgdG8/DQoNCkkgdXNl
Og0KDQokIGI0IG1ib3gge21lc3NhZ2UtaWQtb2YtYW55LW1lc3NhZ2UtaW4tdGhlLXRocmVhZH0N
CiAuLi4gYjQgZG93bmxvYWRzIHRocmVhZCBpbiBtYm94IGZvcm1hdA0KJCBtdXR0IC1mIHt0aGF0
fS5tYngNCi4uLiBmaW5kIHNwZWNpZmljIG1lc3NhZ2UgYW5kIHJlcGx5DQoNCi1Ub255DQogDQo=

