Return-Path: <ksummit+bounces-2398-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D7B59D2B
	for <lists@lfdr.de>; Tue, 16 Sep 2025 18:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671234600FF
	for <lists@lfdr.de>; Tue, 16 Sep 2025 16:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F80328597;
	Tue, 16 Sep 2025 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTginY1v"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A9328584
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038769; cv=fail; b=jGJLdtz1Qjj5kSnVV/cqNR14q/d4DVDQByFdZq3bdWa4GaOFrMZFzOnbExmtbBZof0nI/UoJg2npzGi3yUkhlwmAOkImoMsgG+7zKCqVtFhZuUGlLRTN/lhLvQBBFw5HExto6foPBryy6k5O673PUwZSGsv8zEX2bWDg4qXHdls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038769; c=relaxed/simple;
	bh=ZM3zlYRQomxo7UIFDvbPcMnFiMKuq5OsrbnGfg1akxg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R0t7WbiF7SdInsZukwnst2cc+h39ORks5XcfN+Hw54SiVwJQ0lF+svT3NwBtN8s2FTPWfBbWw7bQwc9jjks9u/27ugyGxezjhJF8djbbOyg4eBQv96m5dVL+YYh8Cg/UOpIkcZp7CUq/22nynbVR3sk3cdjhX4+tDkCbA4wNLdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTginY1v; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758038768; x=1789574768;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZM3zlYRQomxo7UIFDvbPcMnFiMKuq5OsrbnGfg1akxg=;
  b=lTginY1vxFrae7TJqxwr9fXVbiZc/K9QmeGUTSw79TSmCL0TPi9WM+Ho
   7G3oaGI3IXTQx+I9vnFTv88GEb/vsrNqgyEaJBBDMAD+cSHqicYiTnbfB
   bZl54a4HUAmFnYHcbpcjBabO/KT2hz8f+JPO+F+/fP8TIDJj0J4a5aSf+
   tvg9YAnYpQoT4Ph65SXEyAwfdCkuDCIDR9ecEl6fw0M8/pxS9R9UhUcIe
   dTSVdRJmhPaZTbMb7rJyj23QXpGzuOSn4rRHyWRJFcNPltXDf6C4MtrrV
   LY3D4SGLVDCunEh92yp2lMiT+1BWBf3dqh4rSgmYqQDTyqYPeC/Cn7LtR
   Q==;
X-CSE-ConnectionGUID: SsYOJXSLSvuiEmKvopXkiw==
X-CSE-MsgGUID: AD+nh6GhTzimwSuxqe5PuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71424305"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="71424305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:06:07 -0700
X-CSE-ConnectionGUID: 47nnTProQe+6QW+chFaXoQ==
X-CSE-MsgGUID: O9yWSFElTwKn7R0Z8J3DGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174546148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:06:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 09:06:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 09:06:06 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 09:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ5u7nVsFESlJJH9++zD9aqVr/mFKdqzC32B8nw9O2yjK9rzXWXGghhbDCgw2VpZcVLDWJLl/GYFN/yJ8obyB4ibvqzS8O4aGxfnVoZSxcIiokOUrhjB8PSdajSfBaBNFo6BzSKE9qoiJ72zT6NrEycq0xYSKWXLmFc3vKXsIdDGJDT243lvUPPLvrKvBIlKSfKpUSdjo0ck4gaVGBq/0kYsiVq/t7wjl8xEQ559uajdKB0oIID5XTG96c3BCztx31eRVjBPj/0UTVs4Y8RrngBhS4DHE/Ldom7sQuI9fCe+1AiyzwKMqOtfJqo4Heog+PkQYrxcKRmmeCl4nOogeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM3zlYRQomxo7UIFDvbPcMnFiMKuq5OsrbnGfg1akxg=;
 b=Q+LNoswhw2CZDkhRvctZj/kfzjnQpIKtgJBHAUaYTxkOMNRi3MSX7pJSjMfQKmv8M+zttvd7fwgFoxnkIvSfUzV+3jv+2bz6UkrH8ePWDtjDOV5uEmLavBd86WRtuMDR1VnplO9a1J2A4Cq0hyL6Vk8vv6vhz8oXTZq5K5/zZmtKrTwpsEc6FygCrj5yNvPnxwg+PFvup3HICtF/qyYo8LBYeK28tKSWXWj3l0gcOh7Vhr0dfWuLFy9fJabzCXoRtIeK1kTtwLRmG0XQKDBLOxl6du4JpfIFisd4V+TBfs8O5C814x+toocubk/EOjWrKreC4j1jurSYQuWDKfn5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 16:06:01 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 16:06:01 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
CC: Jiri Kosina <jkosina@suse.com>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Subject: RE: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Topic: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Index: AQHcBh8j2Yf/oYRBKUKYJ9hmSFdlQLSUyVsAgAFUeQCAAAs/gIAADVUAgAAECnA=
Date: Tue, 16 Sep 2025 16:06:01 +0000
Message-ID: <SJ1PR11MB6083E6C14032E7F2FBA7B654FC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<202509151019.CD7AA0C0BE@keescook>
	<20250916102022.5bc75a36@gandalf.local.home>
	<n3w52sm6d2gvbdhk34lamj52ihnspz5d2wgh4ojycr47rpvio5@ilamyahjnlmz>
 <20250916114820.45623213@batman.local.home>
In-Reply-To: <20250916114820.45623213@batman.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MN0PR11MB6057:EE_
x-ms-office365-filtering-correlation-id: 4f2f38d0-395f-4c39-042e-08ddf53aee69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?j4jcCpOJQ5gpSfRTiFV8jhXMKqAF640idqc8tMNW+ephteA+LTDoIjFOENN+?=
 =?us-ascii?Q?a8lkWq6PNqcXHOqX8d7KrkWLM1PQSVw3ezCHj/nMEb7KYAyHAm9v40I0Ohw9?=
 =?us-ascii?Q?WUzM1gAf+ab2qcFceKJcq0yG0FXIoJuTT4gGZEnYcXdo8P4hPNioFtRARwvl?=
 =?us-ascii?Q?2ZiHdrzj31mVmBXjJ2q5wMFUjMExjF4+c0W8z/QA1WIVis0JY5nny8S2Vzp8?=
 =?us-ascii?Q?8AoLCpdpdi/gLXcsPnHffT/hc5A7hQBDgAeYQS0VNskuRFdjOyGHhfEjC8Wi?=
 =?us-ascii?Q?ey9TiHwENvbVd9igc3yF2tAU4b3Wmog6HBYsj7QZv3yGQx4cc6ekFtjY3MbM?=
 =?us-ascii?Q?8SuSUdDX3/xc1Ciq5y1sh/CrQicugsFjmezapx4ZyVV+sGZT0mAOqrkxbqYv?=
 =?us-ascii?Q?OXQWWIyhGdm/yusM5MXOzLpsyJ4JVTqXMed8uw2FFpVDu68HuAVbXn7pvp9d?=
 =?us-ascii?Q?DOJFYYspKT5W3gbpiMeTqeUAufVITWNE9PEdQTc+WG6p1WTkMo1hoFJYdowC?=
 =?us-ascii?Q?yW8NKwOZwSN2GXrxfGODr5N0xf/ox2DPT8PA4lueXloLDoUsG3s3WwXHlaBU?=
 =?us-ascii?Q?7UT02j0Ljvo+snaqJkBoqy39nEx1KEaNmzZ+IzWVPyYbhayr0Zoam42vmsqO?=
 =?us-ascii?Q?pYMMwuT8040vfktpKexzdAgX9+C/gPMowFaIS4MiWHuDFU6Yja/XEcIjOuJR?=
 =?us-ascii?Q?e4eweR5+N1vUKKLTGlp58tQguAdJv+PtxySpk3HwzjapaG+T1JB4vjkqf+IP?=
 =?us-ascii?Q?w3vAuJ29EtRfVkcAwDPam4mop6P7fkaiEP5UIawFG8t70U8I8CxvAZwvDXxZ?=
 =?us-ascii?Q?FNhwkP07A5cKy/cR8PuHGZXAMrp4N7KdWq/es8u6GAKrIQEig03XC3yKbPIQ?=
 =?us-ascii?Q?ydU5nKQVm2ZoQjgk+wopMfXch5lLjByavS2QZJWXhZJNb+AQ06hppKwaiKz0?=
 =?us-ascii?Q?R9K2SMmyYS3+q67ED3eH8zdZCUsKdiO2wQZnHPB8NQvRln8qTiXstDDNNhf2?=
 =?us-ascii?Q?pHPTio94s1ZEqbIceBXbR9rgFVU1aGeVT7ph0dtap3YYN+vwOnh44Ob10wax?=
 =?us-ascii?Q?PWWCtfsOt7dGJgXp4sGdB6RQGVV1FFn3bidylzA3FggWl+47cN+O/t/en0TW?=
 =?us-ascii?Q?emJhrB+pmSh+Yyn90WPf2Ka7F3ZB5fXO2xE0AYn2vLZsT8M27cUfT5aMTlIl?=
 =?us-ascii?Q?BSb4a99AFOOPsVfUTt2mLErBjbywBxv23tPyq7A/3vohMtZj0r4j+s4kmaxF?=
 =?us-ascii?Q?atL2RQiFFrmavNav0/kW0waZLRBPe3Mxuy3Gj10alS/Rrti/dcpVlXpPvLJK?=
 =?us-ascii?Q?3C1B5b/eIZYf6ElrSsJr1TpGPuqRZljmmVlpMJkP4Q+T3m4mAWYL3f3NHZKh?=
 =?us-ascii?Q?mc1jNI0BS84nthUlb7+fYLKJdpcHLFZJOOfInBVUq5fomoXMVAaAS6eDAuG7?=
 =?us-ascii?Q?zrhJU2CeMnkXxHqsUd9gYyIxoiAqKw1ZjnQknY4oFdqG61jyHnfcow=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fnZLI6Vyvrl+ruAw8TGFXoD8lKlm+cSJBHZt4LwLPrwkOXkscflURc+3zoop?=
 =?us-ascii?Q?UdLBjAEB6Aq6sfL9j1ZjA7qm9BxvMGMXjM9jhEf3250sN5eOciRujWc6Bi1b?=
 =?us-ascii?Q?sUnC/lUs/KP+6vYt5KWiEZvs22gJEpVHUtRZed+/gtFZgE3oQyfNBokPJIBs?=
 =?us-ascii?Q?UYoJjoJUj5NX3+Q6hXyfWgrdqXPTA38NGV2uOrLKyepeqMS+hWYZQF9SoWof?=
 =?us-ascii?Q?ofm9oRS9QqC+MpfY8AU7BgyIlYRxtr5zYF1VeA7Xtsc8xNpgEpQC1kOTvRx/?=
 =?us-ascii?Q?tKCNwDXw3TvIK89cxXfo/+YpXeeFSdr9dsZ/zk+xT6+uSccGrWHlWhO3C71Q?=
 =?us-ascii?Q?E2sQFVbwWiTInIN0fQpCkFYE/MKE9TBwjoOVYOvrWyHHmCS0ZPfseWfPMVMW?=
 =?us-ascii?Q?19L3SuSCYg0HSyaTlVVeK5mg07842lHaB0p3+Sbn1VMZUcC45SfORmG47U06?=
 =?us-ascii?Q?LAm58jdJMiO0Kz6hi8xE42SmQiN5fp1WmsuGeYAiUUNO+4odOF1uPy0FnaGE?=
 =?us-ascii?Q?uF+JFbiSZP+u+D6g78f9fCI9UdnIGEm0JO8f6zH0VdEj8Hic4siqjTlpWy2R?=
 =?us-ascii?Q?eJfO4ZdLL4Ekqm4F9+A7NYsR6Ht8JaJTR0Fq8Kc7l4NQmIbzAIWwl8oCsdec?=
 =?us-ascii?Q?I7YdCy7hOIs97YX5pThuA+LNSWAHzUX46y4OaY9SZzBIvWZ5cpX22k+LDo74?=
 =?us-ascii?Q?glj3HraImSmWm+jTjDkOsa81eoivG4gVlHYtN7XC9780zhLgz8Bfx4ObmJoN?=
 =?us-ascii?Q?M0wdWB4HOUASkdssjzptKRf6yqZfaGqI8jHTBbgHZUNUDu3GHQ5tBhJ2/ygY?=
 =?us-ascii?Q?lfKA+dU1LhKcAXuAP3R7GbtLZx9o+KiZspGRlrUTUjLNzxBp0UkTuNg0C0B+?=
 =?us-ascii?Q?ZmNOqXse7efNegBPo2VpEcAErK+S+b8+V0qsPM6pBM84xd5v4/xU2BhfFW6Y?=
 =?us-ascii?Q?RIOlE+tCYbB9eY2lm2NxFGqXyHOaMJD0CJTzGEVF20rBh5iA47I4fB/LFC9P?=
 =?us-ascii?Q?0DlgNUGMmdlxDvugHp0FfCTlu75l4KQUo5lbJ0jMI3aRGOvdDtzEZOXp4LZu?=
 =?us-ascii?Q?FP3iJe7Bo9l13yOH03GSlu5FA3WuL6Onsjc6xpNtSflPIT6+n8ixjjrxEJvP?=
 =?us-ascii?Q?1dCKOSRzhOpbU/nLS3PZ21aBF1zkRUv9cWMXlXMeQHC2TsFp7+g0LVWVTTtv?=
 =?us-ascii?Q?8atDI3/Goy7DBiZekFgRi5PB+YtJAQr/Ljfl0HAZu1qQGhH5zdvpe61ztblu?=
 =?us-ascii?Q?X2urhpqn1vqnXFw8x4W2EZFZ8HfpGljt3gmGoGFjihW3x8Kx/LgrgcLL1kxy?=
 =?us-ascii?Q?dKZBHid48+2l9DK5N4SuWhA9gRiLYntq03lz2IkA1XKjCQbPF9jQjUFLtCMX?=
 =?us-ascii?Q?OkIHQieXRzbbq2iVPXnE43j6hbGqw+RMOtjRYS/+kHx2v20awRgA7Ap+0Bz1?=
 =?us-ascii?Q?Z8jYRUmSS063iHgLDygdu+qkdCwpphMpAiEXGN+eeycjER2+tObt/4uJkqZX?=
 =?us-ascii?Q?iJKhySdIYSkAt9pFL8ZiR4/gTsb/+gSNBOuavBqFwNkdqeEIZYqgvAhfTjxi?=
 =?us-ascii?Q?3KUkQIfwoA/Cn08uz68wbXHEsieOU+oN5XHRk28F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2f38d0-395f-4c39-042e-08ddf53aee69
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 16:06:01.2225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iE2bx3qjowSScbBlpWUFsIINb9qfn25B1KylJreaM06e36aLQ726mmcFtm1P72tueVsJvsqHkJs3Z4J2g+CAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

> Perhaps we need a way to say "Hey, AI, give me a sort routine that is
> compatible with the GPLv2 license" and then hope that it actually gives
> you that! ;-)

Current generation AI just gives output that looks like an answer to the
prompt. So, in this case it might just slap

// SPDX-License-Identifier: GPL-2.0-only

on the output and call itself successful.

If you want to be sure, you'd have to pay to train an AI model
specifically on just GPL code and use that rather than some
generic AI model trained on everything that could be scraped.

-Tony

