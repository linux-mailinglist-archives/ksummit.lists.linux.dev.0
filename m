Return-Path: <ksummit+bounces-2178-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7237B30133
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35D467BDD25
	for <lists@lfdr.de>; Thu, 21 Aug 2025 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98842E7BA2;
	Thu, 21 Aug 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlI6Gz3+"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3262E1F17
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797819; cv=fail; b=lpFI4ahkYXAmHNOgZ6Z2x79rdvq/VkEQiUCdSTQlvV9nZQniAHGj8YucjwfJczcqfO9IJ6EiGlI/iuDqg65/gObFKcHKquRRllSl9nglWoiIvjQgduDQFldperQ907fePFVtW2cpi+ZNSZJj0hFDzTM8koz+lCV6hw6w2i21+RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797819; c=relaxed/simple;
	bh=+/9cF59TBg1uu2HWks6erSWK3X6mbC9OjxlyDuLJc8I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dwr72m8UBhRKDlbZ3+dYb1wz5rTuW3IjxqUU89q4Q5hG/EvkjV1hg2QtrEVom8LXfT0orDwR6BY/++oDHLF5D2/mkRpVfldPhHY0BUNG+d+jdr5rrj2Ss/gAG8wF1ZxFkH/qOR5yGuXFY4u6CTAP/ySWYcJqnW0DoWuovWo8TZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlI6Gz3+; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755797818; x=1787333818;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+/9cF59TBg1uu2HWks6erSWK3X6mbC9OjxlyDuLJc8I=;
  b=hlI6Gz3+T4Pr3N0ojjploEz+6g2fjNkSagpE1fVaqfz3JH8Z14F9ZYYG
   3rAoD/aJM50QDx8+PXQTMQ3lI7CMYiqcd1wL2RMcu0cbvIrcU1q6R1yx1
   vPEK51Be6kHk8I2o3GbfKXv/3KrKtroQQQBdqe1PTnXIYE10bKZUa8v+E
   oomoFsiDpgEu9dVOMZA/s2ghIemey5QXi6o10dW9l3Wm+gQzoeK7emv/1
   CoXAPMzfr0uHKMVWPX32Z3ifrCNoV5YjQJ147x+VVjsErLx9Fx5iPLI6B
   iMafNWnWxFHX1+QvrDgxMfx3AX6TUdLT7w6uZ4nJIQ386xQj9hw/XomOz
   Q==;
X-CSE-ConnectionGUID: Fr4IFDfSTyucCUT7Ko1VFA==
X-CSE-MsgGUID: /JXOS6xcRa2i9JyL+z287w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68697685"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68697685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 10:36:57 -0700
X-CSE-ConnectionGUID: J+iBwKEvSCaJwk5yx6MGIw==
X-CSE-MsgGUID: +bCxBCtORRqGlMFhBIY4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168094024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 10:36:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 10:36:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 10:36:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 10:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE2Sw4SGw1xNxsXbkRVz6CaPKNYgCePlyD1/4o3kncztebEyYxy3woR10NizdovsOpJTb48b6BJC86RtEO4jS+r+6yh+PzUytw5ImcBX3YQK2qWNRQaLy69NpcKgb1zF2vWSzhF/ZOb51WhEeVg81OrufLIipXcr3xqafC3Dc4td/LqLvGSKmflACseiOY2UNU7uOOAagXikxTZT6ogQFIJE9Knp9IS+NZuBWwEzRg4arkOwRdsdp5uzqbqpZO66hHBWn5+PpUGdvhGUbZLxTiQKp3dR3ODazDp8PzuO/N/g7drtbgAK43n+IO1B0zIskc2SVV93NIMf/VzViJ/Z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/9cF59TBg1uu2HWks6erSWK3X6mbC9OjxlyDuLJc8I=;
 b=EUV2PU4KoqDEFnDMyuD7YAtWw3nW1JDBWw4rPzrE8+mxyAEvCt91gjo/F5Wl4506+swUQj+muXh5JWAyH+XYf4Kse48H1LWYaiVbDSDuvHIqQL4PQTfAwhxHNDe0Givx74sVgO8LUCoFU7628OKjiHQBocP9/kwailUKJt65uMNpdYhnUtUQRl+Qmk7b5nkdGKkG7sMVi6JC4hMbZaiot/sMxtJ3bl8wIOFpTM1QiNOoOxuI4/ASgpKsFhJc8DhPSCtGeN7QvTKhBOGiIPZaKBm7m6j/A5AZxf0F5QUxrU/b/LgbduZJgLovEYOCf+2G+u0dNxYyfpyBPyGvrwCdTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Thu, 21 Aug 2025 17:36:54 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec%6]) with mapi id 15.20.9031.026; Thu, 21 Aug 2025
 17:36:54 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: RE: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Topic: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Index: AQHcBh8j2Yf/oYRBKUKYJ9hmSFdlQLRUVr+AgAQarICABZULgIAAtisAgABlv4CACdmXgIABMk0AgAAOpACAAe3tAIAA1DKAgABsKoCAAAsygIAAAWwA
Date: Thu, 21 Aug 2025 17:36:54 +0000
Message-ID: <DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
 <20250821193041.398ed30b@foz.lan>
In-Reply-To: <20250821193041.398ed30b@foz.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6077:EE_|SA0PR11MB4719:EE_
x-ms-office365-filtering-correlation-id: 4d04ac02-3755-47e7-ec16-08dde0d951f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ggEfup24H2ajpQMM8f5mQM9OjlVDhsj8TS7m1PNG9ZuJLm93kABjDy8sLT/C?=
 =?us-ascii?Q?83+VtgBHyTEaw7tcPEDygBLMKxGN4tKo4zj2ueOb+6IqsB9ze2JHkfQRnDG8?=
 =?us-ascii?Q?x3KW59/fybzdZSvKtH/ou1SCvgSzyhMOFqWuLkT9JBdD8CPpS5sAfT2YB0od?=
 =?us-ascii?Q?vPzvb7IKe2W7gN3mGCiD5KxvKZJDO0fIrNUQ/4HtWewCa9BAJoGO6Jex8fC9?=
 =?us-ascii?Q?OrDc41Qsf+tXrJIxlEwPT43kNNcUlNISydJ8HJDXaKiX9S2RS00cc0FPbGHC?=
 =?us-ascii?Q?0andQs2mGatbgPIWsNQ8OP3BgQaRtHguMoiaROcl5d+nK+5jdM/jDCzN/GW4?=
 =?us-ascii?Q?H+oQzFSUebsVhMUjZO2LubkQXQ1XUjwCPvEBoGAdvMNd+9YeukkNPCOsKIhK?=
 =?us-ascii?Q?FAnhJXcw6wjCm28FZSRT4/LrIP8/qnPXYz9IcEYDIlcnyZmPjGiYbL3J2qoJ?=
 =?us-ascii?Q?yUrDVqrp3anBsRb8I3zqeGqjPUtA3WLG8vkNONuP1i0G7FaB/qchvDic921F?=
 =?us-ascii?Q?xmBjSLWTXvq+5wGO7vqDeEfD3TBEUr6GtWUq1JhDrz84hrP+NRC92fLUzp9o?=
 =?us-ascii?Q?S1gIxvlasC9c8c7xiPUUDiknLBe7qFV0Ym4l/7KsLSZbfh1FsBA55bgYXe8Q?=
 =?us-ascii?Q?FtvE00m5mJsQjQTbNiYnO8M2DjUd3vArIa4cXKktJSqeS1YzGev2jI5eb1sU?=
 =?us-ascii?Q?HBnBqtzipYJAcsa+mJMaLgRsbnYNg/3t1E4L/AWgAlf/iJ6xr3oyq5/Qw7YZ?=
 =?us-ascii?Q?6dCCWck/bg8VssYbpNGt/h3+Uu7eGXqdRrN0gwBMRzf5BLInqQ7Agvp1oeAS?=
 =?us-ascii?Q?uJ/8kTkM2AP9fnh+6qLGD3WKPamWPMFJxsZWmP7maFiohCr1gJlWiEdoZhth?=
 =?us-ascii?Q?wfNlOwEWslfXXsyyNgOGD4gYjJy0ESewy7zTOvESdz8RZPCR+uh4FiZVgHKm?=
 =?us-ascii?Q?d3ZipH5D/umqhhl8wrhkGuKyv4q70G7On78sA3gY++2nRXr5YdJOsXtyOEY/?=
 =?us-ascii?Q?LrhsOF23+aPRYkdhO2t2/wSfXH8JgZD0sbZubhboncKMCA/2PYUBph4zejIN?=
 =?us-ascii?Q?XGp1d2zMhZpfqUIJNNZwdHL3tfxGkZyBdw7abfgkY/2pUJLbGEqo92WDNNwd?=
 =?us-ascii?Q?e/P87u4AHpicU4NJwDwzdLNCaH5Yr+vmPStkwJLqUQHtTWdGaXoc4A8EV+lh?=
 =?us-ascii?Q?5PJAELSnL17xEbb6T0mMX+Z4/mPDMPG63VFX4TWyMb4MfQydXz6MneG6AOd1?=
 =?us-ascii?Q?Jf+INr//4HBns2sCaQC/Dudlh4rakMkhw44MS0YnNxQ8jBGT3aaMy+YmA7Pm?=
 =?us-ascii?Q?MaK+7zQLXobmWBisQiDL1BHUpkuvWEz5HF559PCt5vmoo+WCRZ+r4v9SZv4E?=
 =?us-ascii?Q?YV6KQBJLuD2L4K2YDZTZaMaDEenvLPWTJbFToisi0o0hima5aNSjCG7vm4oh?=
 =?us-ascii?Q?udwIuI1TorzY509peggyCb0VkfTtuvWefO/zkiW3SoOTKMjeaf1GFg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9gv/u4EXmY0gQgoh/2WVj+E1TuxRWEnDpp6U+ZwJxemhZfA66RNklmsFuCfn?=
 =?us-ascii?Q?z1CjrOs6y1MqkXxb7NDXVIes/wzTlXWNqXwwsCvBMCsW7GHClDqqTPDD92UM?=
 =?us-ascii?Q?0GYS4GS9N4cuox+SoXsWWulQk4BQ31JxT7rSCVD1QP3nAZi/14Sssnp+XN2z?=
 =?us-ascii?Q?UkQOS4qeK9ZqRIDJzOnVvwv9cDD5+AZZsIEjolky8k0wW50cItMsH5F8b74M?=
 =?us-ascii?Q?B9HpYb8vMFZ+vXwq9iIEv0XVAePdwCfTKxW4r1q7lqEmcbt5qj37PIkyu6b3?=
 =?us-ascii?Q?NeA605xoYPHDTPfJCP+nvPPSot5HrjrpXK4k32T4ThS6GGulywmde2Aa9ZNv?=
 =?us-ascii?Q?bm70icd4yUKJF/OosgkNk/F5G00WAs7eVCVRIpqfUqQHFWgjqrPdZpWPqnCm?=
 =?us-ascii?Q?6lJS7v+YSO/sG9fSsru2t+50VCHxIBSdXjna+Ki31p31ukxgbJ0kjgdaH4MF?=
 =?us-ascii?Q?wxHDaNhPswRhi+9bzFQC52DXeQJMnFx9tdLG9MocQfa+J6FgLo2S55qlnvEQ?=
 =?us-ascii?Q?ZZtacTikN/w7QNaxBV2H9Ltlg1fTo+FNRPikGmBy1xILuL+uwZH8NtrpWyoX?=
 =?us-ascii?Q?q/PFlhfvkYoEgbJiww65M8xSFwMrj4dSedWbK9f4xAT3LW5zRlokgS6uo3JQ?=
 =?us-ascii?Q?T+/PL7pK7HlVoCt00s7cEwVEa0TSFeTVCj9QYosMs1LkD2t1ZMIK1nQDB6zC?=
 =?us-ascii?Q?Htpn+7vs9Ghy+EOFowGmsIq3WZAjTFulfi3yz+J9ChRMZ3WB6Sjhe/V6KVUB?=
 =?us-ascii?Q?Z8q/eWNDHsFt/peshcXJEqYN9DPOJXNbT/Fs4M++Ijp9VMdTu25k5mkLtdGc?=
 =?us-ascii?Q?KoQ/UfaEH8rss6EzJdQ7MSDtp1TvRBktikYDTXui4WLEgIP+IntBbVQ29w1u?=
 =?us-ascii?Q?A3YlYaUkbcNCBj0nJNPh179c163dcrfLPo4NeISN0xDApOi2Hvcq8MDUFPZN?=
 =?us-ascii?Q?8/dzJuoP+Y9Qn/9iuylLBgVlMQfNtJnMdo35RoPzAoDe6Gpknzoyvi8jnsqM?=
 =?us-ascii?Q?D5MIzprdPtP5tOhwgXpqPa8g8muylslVwVDvHZa8ooZSx/QMQGlLZJ5+s1pV?=
 =?us-ascii?Q?IiAv4A7cE+D3njPRgqrz+F6GM4X8Wd9D8MuAQzRxOn120FbSOLHr1HwpnjbC?=
 =?us-ascii?Q?h6cAoSNMi+4769rA/rVPX2IA13TRfD9hQ8oitQWWxMr++qbqycBu4CVAYEla?=
 =?us-ascii?Q?q3MlKGqTiZzYvSx3DzHAlNXd/v2CUaOwBJ2vGeyyLHefKh5hYZ6HpZIz3W8Y?=
 =?us-ascii?Q?RZShodKx3iAaemZt14D3ZVK9SqUJXb5F32NveqjZ61uJhwG60C33uQrKYE7y?=
 =?us-ascii?Q?wu+G/IcPIXnuElQY78LNkyTYfyWes8O4TPKhzozCZkRwOeKlZgUjqNS1VTKG?=
 =?us-ascii?Q?tpt3yKf8nmDM4RvUFiPCKT1EhBX9foNjCwKq3iiAYzOFwSIs3nWsKQFNqslC?=
 =?us-ascii?Q?T0zZrN9cIw37b1+RmZW8Q3Z5jVVyoVfdodMSv7fDWsNvCSDVwVPak4XVYz9B?=
 =?us-ascii?Q?2woJuS/BpFw1HArKkZQ5MORk6G5VAZiqaUTBOb+geUUJOIk73ETZ7e9enoHr?=
 =?us-ascii?Q?V7SoRyho3krXE4k61fUCs1k7FJqAsBJ0zCYhU3Mf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d04ac02-3755-47e7-ec16-08dde0d951f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 17:36:54.4197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1iGIrzprEQO298UN4pbYn3ejGaHzejlrA4lWflBlOGXUvaM/GoKl0QLx3TRsO94NiVFs4rqUeaKU1h7aH0LZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com

> Do you remember the first time you saw that, and what copyrights
> were there? :-)

Kernighan and Ritche "The C programming language" - First edition.

-Tony

