Return-Path: <ksummit+bounces-2126-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5CB229C1
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349AA2A24D3
	for <lists@lfdr.de>; Tue, 12 Aug 2025 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C92283FF4;
	Tue, 12 Aug 2025 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="aMcw1hoS"
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90BB283CBE
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006654; cv=fail; b=TS0DHbzI0t99Fh12rdbhqaAEqL8bMbhwXI9ULUcO/NS4Q8+rPSnG7x+qSwNRVVbic5LSx3qDWMcpLIYKiWCQJ2RQsbv3YSYyewh4xRLGuDt6q1GkUyGuXYM1VTLXk4WA0lwbSABmbcRNDQFKbJ7+uAzCn7IUCG+KfiBXpAHuoyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006654; c=relaxed/simple;
	bh=lEakBNIo6x9+EtGKC39O06Gc8+lAM+STTOYonVuBt8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WX1M4oN61PgzuGVPpTzxXWnvc9sMObA8gMsDnZr8qdKWmMpoc1DJYOPhEtqKOJi0EM/fUD06GJ4jy05psjk8Y+w4rGOnJBwLbjwiQ5v/ElNgIGm3ziv8crs49d3aGxM6eoCSqhtMqbXbf7TzmYcrcPRMrY0G82S8lWryCFUZEV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=aMcw1hoS; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCoMWM018686;
	Tue, 12 Aug 2025 13:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=lEakBNI
	o6x9+EtGKC39O06Gc8+lAM+STTOYonVuBt8g=; b=aMcw1hoSamJjYHEGgcb8DOB
	c5MdTqtCezqd+hKWtxzfYApRzQx41cztqWR2tkPDFh3klGYAnsr/WTGJuPuDe0cq
	oThBDvfGnuN3lLg+tr9sF59PH5cmUjpngFzZKOsmp37GNWsVOjuGfYBDWdju8zDz
	5kA87OqS6s2J5Yv//xDpXOoOCn3v55aBIF3qkuhw22kgSI4dzz01rYIIm/tSHD6z
	yHUdLVWwLq2hEoiKkMX/wiuYrZizMp26Yv6nCf6AqEPzYd9oiVDB0EDxbCnXC3xu
	ZMGqSDIrzPM1GIWxOSPwV/Vp13fvalyJPVs/lenqp0YPsQnqpcgNbadEFOKQPww=
	=
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 48dygntp6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 13:15:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPLv3FoWvZVZ2vS7bmMVE3mKzYvtZfL9yS5gtYxBWg2j1QuBOGYpyCW53x8dN6DkWkd9gVl2hzwclCbBW/0bXZvD9BK99lfBJehoKHgaZukYT2zKVs8Y7FyM5FobY9ZX3UjrGMuTFin3tffr74E3In2T7TjA4YA35+gzZeKcggYV7BpV3uJb/YN04++ZK2X9mVPQ17E2zTqwi7g4drWl/hsnkwZpAfDZpTjWRRkAlExsKlsCONH6GDiIVKwL5xNDEYFh/5+fO/iMAoo6HLpslYieKj0OWx2f6yJMlthObB7367XRpiy1PNkPpG9viMxPohw6C/LsxRl/y542NihSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEakBNIo6x9+EtGKC39O06Gc8+lAM+STTOYonVuBt8g=;
 b=A3KkeMXS7QPNiwS/Z+aqle/nmXUpHZnaAv9yhMkL+LGqppa2Brf5KEWSQEiTsS/RV0yFR4EHVbhWg/eSXXpM3AMTuCWTDnnQZvfrrJZTpkInhz9Mg4c0hTZT691cRaLkyL5Lq94T3TG/toNzk06bwU+ybe1/S3JcjwD5NwhUPr2IRZT2K3MQS7a9NLWiMNbl0y70a5bkdEk6r2VLxjVMpSGsP1FJoToJxmO28wh34aWpwwI/QuxzWfCZaGWu2vW+RzOJqfi5yCUdKrXXjZLi8vfL2M7NvQSWYFiRqpdSctGc4IwtMYTAmKWKIV/YWBQeO6gXUcde2RKKXhx+3Oilgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV3PR13MB6897.namprd13.prod.outlook.com (2603:10b6:408:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 13:15:34 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 13:15:33 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: RE: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Topic: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Thread-Index: AQHcBh8WUW8ajnuG0UOLJvZ8dsFWHrRUVsCAgAQaq4CABZULgIAAtiwAgAA92hA=
Date: Tue, 12 Aug 2025 13:15:33 +0000
Message-ID:
 <MW5PR13MB56323AC4400A7CC5A1880BE6FD2BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	 <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
In-Reply-To:
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV3PR13MB6897:EE_
x-ms-office365-filtering-correlation-id: 2453f7b0-780f-48a9-304a-08ddd9a25194
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFhzeTdMNDVLUHZJSGx5Vmp1L3hwMW9icG1qc3d2S3hhVENwWjRDVDhQdnVw?=
 =?utf-8?B?c1V0dlJybzJnMkYrdUxnbUNFSTdyOHRDZEdueDR1U29ZU0s1c09uWnFmbHB0?=
 =?utf-8?B?dFJGUFFJaEN3bmt4QnpZSUZQTGNzVHFrcDU4VHNPeWZmekkxNjErdEdkN3Nm?=
 =?utf-8?B?czZxWXJETFZXMFlGRmpSNHJlVlQwVUNLRTRwaVplaTkzTy95dXdlOVBRSXpt?=
 =?utf-8?B?b3VsTGpzWXZBdEQvMWU1cVMwelpwMkhxSitYVmpSOCtqYVVYMk5VUlppa2c5?=
 =?utf-8?B?U290Q0dNRWU5bnlHcUtpUTBzVGJTdUY1UXBGMEZsTW5CU0VSTnBkakhVeWFB?=
 =?utf-8?B?bFozL09vQTdZZXlpb2Nob0p4RE4rTTM5Y1I2UkZaclVFRUdTZ1ovZEx1SnQ5?=
 =?utf-8?B?YTNqemtPbFZOK0ZoZ3BpQklmU0FJWDQ0QVdlWHVoVkg2WkovalVUTUZWTGxC?=
 =?utf-8?B?WEQyYkM5U041b1prM3FGQkc1VTEvMlFlWEJzdis0Tnl4djlCbXYvdFptZjg5?=
 =?utf-8?B?ZTVtR1h4eFhlNlZDSk5oZGMyMmJ2RDYyZzFLOE9XdlMxajlFdXNUNEtDRHI2?=
 =?utf-8?B?Q1VMb25mVFpseit1Tmx0TWlNcEdkcTRUTUcxaUJ3MERoSHBOMm5lVlpMeWdr?=
 =?utf-8?B?cml4V0hFdWlpaFp5MmpTazlnRFFoajNOYWdiZDhQSWFURFczb3VqN0hnNWFp?=
 =?utf-8?B?ZnZvd05CVXcrV3pablNaQlZOL3lLNkRVOE4rOGtLcUFhcWdBTEJJdEpsQUlT?=
 =?utf-8?B?eXNvSjA2TlhPSEFUSDRFeHRra1JaQmJEeXJFYWxBZ1lSU1VDaHBKdUlWOHE3?=
 =?utf-8?B?UmdSbW94YVB2L2VPUE9RZzBYdGFwUXZxc1lQNmpFNG1xYUd1OG8ySWt5V1BG?=
 =?utf-8?B?SWtpQXZKNEZZa3JWQXRCZWZ0a2g5WFBRMmowdFBHN0lhTjdUWTlROFFqNExi?=
 =?utf-8?B?UzREdnpZaDVTaXZnczBwRWFLN0dnQXlKRnhlUFYzc3JrSXlrVC9LTmhUbk9z?=
 =?utf-8?B?VzZybllPL3NuWlc0Y1NQUStHUlN4aGdyZnc1L1cwYXZKdUZWNEZZZmEyMTRU?=
 =?utf-8?B?bG41QVVQRkM5eENZTC9wcVdOUVpGL3FieHlDVFo1Ti9kN080bVpBMW1jbk5M?=
 =?utf-8?B?YktGOGVJc04vMnFRcGV6a3BlU0kyU2hqNzRieU1TODBpc1p1SUdQd1EyTTB4?=
 =?utf-8?B?NnJtZnUzaDVQQ3Q5Ynlaa1hqYkJKM3huckJJUlVINThCb2pFSUpYNHVFbGUr?=
 =?utf-8?B?T0l5b284NDdyb1FSMHZVTStxRTdpMlpLL2ViVjZPTTNVUm1GaU5CdFFCVmds?=
 =?utf-8?B?RmdtZkhYL0d0STRHZ0VwM1d2L3M5TVBDMGlNRW1PWk0vSmF5U3o2dzlpSmt1?=
 =?utf-8?B?QVJpditjU0xvcnNxWUxORVRBdDBzWHdiYzgzcjg1WXFrNSs0NDhFbzl4aGUr?=
 =?utf-8?B?TlRGeERINlZ3L3hsZ2hZZTBhV1VFWUN6VzZLTWdwMFVUU2dYUTIrSURyNitE?=
 =?utf-8?B?ZkFhdXFzdGdlRkZ5MytZTjZkMFhpNDl3aG9URVZ1eEdBSm0yYW50UHN4L2dn?=
 =?utf-8?B?ZlRaT2ZlOEdIc2NROHNra21ORlFpVFprM1h4T3JPcmljemtqaFRJeTFOU2RD?=
 =?utf-8?B?ZUVKTG5MbmIyVHBmOHBNOStpV3FPOU1vaDVJY0c1WlFaMDVKakRON2l6Vmhq?=
 =?utf-8?B?SzZhVnRkTitCKzdwcXBHaW9OOTJlaU5vNVZPMEdBNEg5aHFYd1IxanNMaGx3?=
 =?utf-8?B?OTl1SVV4R2M1ekllTW03M2pLaGtiZU80SEZ3QzEwSGpoWE1ZMlFNcnFxR3hY?=
 =?utf-8?B?a2VSZGNjMFpYTnNvMXNKRlBaMmF2ZTdjbWc1Z1BabVdpNE80ZlZBSUIzanFk?=
 =?utf-8?B?TjF3S2xoYkw3UElmRUFHRmpIZXh3ZWJiQlN0RmUyeVdjalE3cVNCa1lQL0x3?=
 =?utf-8?Q?cNmYZxUQgUo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjBjdUxRNllONlFBcm95OVJrS0taalByQ0l6WVdyRnUzSWhRTXNONGNEenpO?=
 =?utf-8?B?Ni9xWVNwbFZ5OElUZmN3MEhEZEpzL0pxQXpBa3FxMllMaUxDYnNPdDhwZDFO?=
 =?utf-8?B?NHhGSS9XTXplOTAxZVd6TmtBYXlZNmQ5c3FCbHArTlExd1hCMkZybXVrYjNm?=
 =?utf-8?B?dXhSakJ6OC9tMmFGdytSKzZnK2lHKy9nL0VSL0Z6VitQK0ZIcFkxeDNUQVhC?=
 =?utf-8?B?ZU9OREhCVXJtQWlWVFRQdUpXcmxkcFd6U00wK0ltVXd5RXY4QWQ4N3cyTk1I?=
 =?utf-8?B?cHJGVXFCL1V1eldWWFV2R3NmZ0gwMW9yQUk0MnBhMU1HblVLR2QvU1gxVlRT?=
 =?utf-8?B?bU5JSElFbStsRTNJTnRhWEtYWTNJclpyUFpyUW4zd0E4UkY0Tk5HbTEvRSsx?=
 =?utf-8?B?ZmhpZFkxK0pZazRBb3lrS2RMMGJPUTdzaFVGZ3hJc1dBSE9YQzZYU2VzUWh1?=
 =?utf-8?B?OTJiSGE3VHYvWkREaXowT091Z3c5MXNyazdzUzArMmZDNmRmMWhSQ2xqUHNY?=
 =?utf-8?B?K0VEcEQ5ZkMvdGR6R0w1TlJjZEpPZU1IbmtxR1JNVkxjNnd6aTM1MlNhd2xK?=
 =?utf-8?B?THlYMFV1d2h1b094MnlPM09LQ0g1ckd6dWs4Ly9KdGlPZm5aY1hrb2NseUcy?=
 =?utf-8?B?MUxJc3J4MWZLTENidE9zRDkvT1FCckhmUkl5TkNVcnE1WjFuMDFmWnd4UFNX?=
 =?utf-8?B?UkZuYWFhenMxUGpVUzRFekk1NUFOYzdLMmlMZjBlaytOL1VjVllCOUJsUG5a?=
 =?utf-8?B?NWpma2pYY2tHQ1JhUXh6Q3VsV1JEckxLRTd4WnpaTUVmb3IzT1hmNGVjdTdx?=
 =?utf-8?B?NTdWNVg5dVpnamFYRWpodWt2SlAwMFovUEh5T1dtQ0lRdDU0UWNGWHJkTXM2?=
 =?utf-8?B?azJuZjA1ZFh5YWlXUnBZWVRzMldIcWNrYXVtdlJrRDNPbjM1dFZKeW4weXpM?=
 =?utf-8?B?dG1hajJST3hKaW8ya2JZa3RDOUp5T1huRER5M0pVMHlkTGFMOE0zWWJYMDhK?=
 =?utf-8?B?ejcvcGl2bjg3OUZ4S2ZXNjFoaVlFMzdCM1pvWVR4dkMxcWQ3OGlneVUzUER6?=
 =?utf-8?B?aXdKUXBBNFhjbko3NjFPMnd2Q1NkNmhsNTZQVmh2WDNMby8reEszOGlKdWZH?=
 =?utf-8?B?bGZySVhDVldsckRpUTVLalVoVHVPbExUZWhaRU9Ea2h6U0RCZGdoSEFZaVlL?=
 =?utf-8?B?cjlTTjY1WmYzQmttWERaeXRzMUZYR2ROOWppS2ozR05EVUpPMHp5b3N3WEsv?=
 =?utf-8?B?Q0xyT01oZ0hQVlFpZDJOK2hHN1FUWUNwQ0lpclhsanNLYURVMnRZWCs3ZUFu?=
 =?utf-8?B?bmJuMHJUZ1dHNkJ6TTBsQmJ6QkxBSXBYK2h5QjlHNktib2NXbHd5cXhMVURz?=
 =?utf-8?B?OGN5OGRTZjNjMHozWFdlQzlwd3ZxQVlyTlhOL0ZFMzZCQjVwd3ZwRnBwMWtJ?=
 =?utf-8?B?ZVBHdml0Zk4yYyt2WnBUUmg0R3YrQnZHbG5CdE1CMzNRTGVhN1R1NmtBcngv?=
 =?utf-8?B?ZGt3V2V5bFlTL3dTTDlST2tvU3dWZURwMzNzTVBsazV3Yjc1MWE1VHVvcCtS?=
 =?utf-8?B?bXRXckhEUmsxY2g0Y2tEUlJrZHo4ZHZ1RmYydEpaanMwREVVcDltYVMveVow?=
 =?utf-8?B?WkQ2R0pncHpkK1hqc25rL2ZjNERPcVh4NlJUb1ZOd2RlV3ZlcjRNUytKOStq?=
 =?utf-8?B?dyt0cXF3OUpQUnppcnNERndQNVdUVllTMDl6czRDYmxHQytUQ0NJTzErYmpR?=
 =?utf-8?B?OVp1QWdjbnZSQzE5M1FMZS9pN09semFmWURSb3NXRjAzUi9OanVTR2VkbWZF?=
 =?utf-8?B?NUdxL25vWWtLMG4wbm9FdS8wOUk5dXQraU9LeUdQYlBvL1hBbTBwb2tvWVRF?=
 =?utf-8?B?SVVLOWtNRlhERzdhQ0JNV0hVekhwTU0zOUs3cFkyVkpVb1RxZG1Cc3ROMmh1?=
 =?utf-8?B?UFBQd0VxdVFKemdtZjFiZjJNQlh0ano0NFlwWHhkT052alAyRFpJWWpiWk92?=
 =?utf-8?B?cG1yRFhRSTJ0V0FtZ3VlN3VWNjR1aUozcHg2dG9lR3ZxWHovYW5RcCtuelZ4?=
 =?utf-8?B?cisra1grVXNreWY3QUF2b203Z3ZBRXVpMVEvaDA2S1FETEtTUkFYTStpMGhO?=
 =?utf-8?Q?qZjY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NZfYOGULjcI1/sBsfRSb1uIRO91nXyIcmX/bKRUkj1PoyoSsS9wXdY5Sszw9d2kolsD3CXY1OnLquCA9LO5JOqnJWYfcUdsI4gMJWYfqKVEYT0t1NnYlpag6RbFIEmYTU32QOWl4qRFDlVKPf1O394P2AtPDEUFa1nWR3S0sh8ewZnqGyYD/ryAaI3cOTmpO3B+kBShsqUw46KOpbCU/TPp6uOX53qc3Z/RlAshhq+RyVmjQXB+B8153/2AU1RFfkOwXbDPND2QBwV25KHK06CSLBKj1Dy1ISUKEKPBgzAg4vs5O4WR/xN72aBKRFmawwwzXBAiMUS2PF24tK5eWMXwqzCtZzgw8r/3hn5uP8zAhot9Xo11STt1EvO4eol+yhfAl+3i09BbjN+dNuDeW2LJaoHmm1Pwerjz9r8Owetf7Gp8INjnCUM3miBo7xpwdhvBskr1BbX5WR8rioXtgNpzFEVrhg3JKN+sYmyuligHAh1ITOWCadfPJBuukZNHWd7IAi7YwzHyRMNF16fb3bXtNjvjbBs5iUC1fo2XEwlmJjn9vRBCAMNFH8UTqU2oRjAOR3dZZcArQNUZdo6alDWOmWlWMHf4FlQf3bzM7wS44YQ616Jq+S7Dkf7HN9ffW
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2453f7b0-780f-48a9-304a-08ddd9a25194
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 13:15:33.2761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RObMAr/1X2xGFWJf1eC1LMq24l4BV+WEZ1Y5B5m+pe7LUWBX2vwSgO4+6dgX3W214lZzWTFfuQA8EZhMHzSYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR13MB6897
X-Proofpoint-GUID: SmLf-3_9pWiOjEUSNzzhnKSnacGF-iNf
X-Authority-Analysis: v=2.4 cv=Vcj3PEp9 c=1 sm=1 tr=0 ts=689b3e7d cx=c_pps a=MeJw8Nb+dw95+su7xs73xA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=xR56lInIT_wA:10 a=D7HsTVxwAAAA:8 a=uherdBYGAAAA:8 a=YwcUnG_lAAAA:8 a=BJHmA3qXAAAA:8 a=bLk-5xynAAAA:8 a=xOek1qVTVpmkD6g89u0A:9 a=QEXdDO2ut3YA:10 a=wIIV_My00XUA:10 a=Bnt9-4sYNraFCGzfZGcU:22
 a=HbK07qFTVbWRI-0hREJl:22 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-ORIG-GUID: SmLf-3_9pWiOjEUSNzzhnKSnacGF-iNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDEyOCBTYWx0ZWRfXwHBHLge7gpvd iWbq1OPoOpSzoxRhf6d4+/lq+m7nVIqjDuI8jaULUUazwJ84qO5aDo7natJUdC4B057UfIYdsB3 kOTkG5xDXJAPT5yT0PRwqSlxMd5K7sa+0xkB8TyemFogddX87r6pSHPys1HWX9ylIYo3qYy/J5D
 Dp8QBQXoRMOEd0fq4EbqMf1fJQqWuSCpSKR/LiEC8gKf+MH1F3vCbpS8KMcWJzrAIdFYG/qg/yP 32C+BFhqZLqtKKN29vs7XV1Wjp6cG5CWc9GZ9aGAh9ZblIL4gWami13VEFCMtxrYWCLitQJRUqc L2nBn0DCWKdrk025qBWYv4/vrV9jE7qTDCeFKoH08yzR9pr60H2lJHGbFQz7THLo9S2RM8nb5cz
 AvT+EClvweIbagp9MWyFhLOFEraF+cV1mOKM/7nAjjnUVQOmjV3+MW59EX+jcIh+B2pGGv55
X-Sony-Outbound-GUID: SmLf-3_9pWiOjEUSNzzhnKSnacGF-iNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgQm90dG9tbGV5
IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPg0KPiBPbiBNb24sIDIwMjUt
MDgtMTEgYXQgMTQ6NDYgLTA3MDAsIFBhdWwgRS4gTWNLZW5uZXkgd3JvdGU6DQo+ID4gT24gRnJp
LCBBdWcgMDgsIDIwMjUgYXQgMTA6MzE6MjdBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gPiA+IE9uIDA1LzA4LzIwMjUgMTk6NTAsIFNhc2hhIExldmluIHdyb3RlOg0KPiA+
ID4gPiBPbiBUdWUsIEF1ZyAwNSwgMjAyNSBhdCAwNTozODozNlBNICswMjAwLCBKaXJpIEtvc2lu
YSB3cm90ZToNCj4gPiA+ID4gPiBUaGlzIHByb3Bvc2FsIGlzIHByZXR0eSBtdWNoIGZvbGxvd3Vw
L3NwaW5vZmYgb2YgdGhlIGRpc2N1c3Npb24NCj4gPiA+ID4gPiBjdXJyZW50bHkgaGFwcGVuaW5n
IG9uIExLTUwgaW4gb25lIG9mIHRoZSBzdWItdGhyZWFkcyBvZiBbMV0uDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBUaGlzIGlzIG5vdCByZWFsbHkgYWJvdXQgbGVnYWwgYXNwZWN0cyBvZiBBSS1nZW5l
cmF0ZWQgY29kZSBhbmQNCj4gPiA+ID4gPiBwYXRjaGVzLCBJIGJlbGlldmUgdGhhdCdkIGJlIGhh
bmRsZWQgd2VsbCBoYW5kbGVkIHdlbGwgYnkgTEYsDQo+ID4gPiA+ID4gRENPLCBldGMuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBNeSBjb25jZXJuIGhlcmUgaXMgbW9yZSAiaHVtYW4gdG8gaHVtYW4i
LCBhcyBpbiAiaWYgSSBuZWVkIHRvDQo+ID4gPiA+ID4gdGFsayB0byBhIGh1bWFuIHRoYXQgYWN0
dWFsbHkgZG9lcyB1bmRlcnN0YW5kIHRoZSBwYXRjaCBkZWVwbHkNCj4gPiA+ID4gPiBlbm91Z2gs
IGluIGNvbnRleHQsIGV0YyAuLiB3aG8gaXMgdGhhdD8iDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJ
IGJlbGlldmUgd2UgbmVlZCB0byBhdCBsZWFzdCBzZXR0bGUgb24gKGFuZCBkb2N1bWVudCkgdGhl
IHdheQ0KPiA+ID4gPiA+IGhvdyB0byBleHByZXNzIGluIHBhdGNoIChtZXRhKWRhdGE6DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiAtIHRoaXMgcGF0Y2ggaGFzIGJlZW4gYXNzaXN0ZWQgYnkgTExNICRY
DQo+ID4gPiA+ID4gLSB0aGUgaHVtYW4gdW5kZXJzdGFuZGluZyB0aGUgZ2VuZXJhdGVkIGNvZGUg
aXMgJFkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdlIG1pZ2h0IGp1c3QgaW1wbGljaXRseSBhc3N1
bWUgdGhpcyB0byBiZSB0aGUgZmlyc3QgcGVyc29uIGluDQo+ID4gPiA+ID4gdGhlIFMtTy1CIGNo
YWluICh3aGljaCBJIHBlcnNvbmFsbHkgZG9uJ3QgdGhpbmsgd29ya3MgZm9yIGFsbA0KPiA+ID4g
PiA+IHNjZW5hcmlvcywgeW91IGNhbiBoYXZlIG11bHRpcGxlIHBlb3BsZSB3b3JraW5nIG9uIGl0
LCBldGMpLA0KPiA+ID4gPiA+IGJ1dCBldmVuIGluIHN1Y2ggY2FzZSBJIGJlbGlldmUgdGhpcyBu
ZWVkcyB0byBiZSBjbGVhcmx5DQo+ID4gPiA+ID4gZG9jdW1lbnRlZC4NCj4gPiA+ID4NCj4gPiA+
ID4gVGhlIGFib3ZlIGlzbid0IHJlYWxseSBhbiBBSSBwcm9ibGVtIHRob3VnaC4NCj4gPiA+ID4N
Cj4gPiA+ID4gV2UgYWxyZWFkeSBoYXZlIGZvbGtzIHNlbmRpbmcgImNoZWNrcGF0Y2ggZml4ZXMi
IHdoaWNoIG9ubHkgbWFrZQ0KPiA+ID4gPiBjb2RlIGxlc3MgcmVhZGFibGUgb3IgInN5emJvdCBm
aXhlcyIgdGhhdCBzaHV0IHVwIHRoZSB3YXJuaW5ncw0KPiA+ID4gPiBidXQgYXJlIGNvbXBsZXRl
bHkgYm9ndXMgb3RoZXJ3aXNlLg0KPiA+ID4gPg0KPiA+ID4gPiBTdXJlLCBmb2xrcyBzZW5kaW5n
ICJBSSBmaXhlcyIgY291bGQgKHdpbGw/KSBiZSBhIGdyb3dpbmcNCj4gPiA+ID4gcHJvYmxlbSwg
YnV0IHRhY2tsaW5nIGp1c3QgdGhlIEFJIHNpZGUgb2YgaXQgaXMgYWRkcmVzc2luZyBvbmUgb2YN
Cj4gPiA+ID4gdGhlIHN5bXB0b21zLCBub3QgdGhlIHVuZGVybHlpbmcgaXNzdWUuDQo+ID4gPg0K
PiA+ID4gSSB0aGluayB0aGVyZSBpcyBhIGltcG9ydGFudCBkaWZmZXJlbmNlIGluIHByb2Nlc3Mg
YW5kIGluIHJlc3VsdA0KPiA+ID4gYmV0d2VlbiB1c2luZyBleGlzdGluZyB0b29scywgbGlrZSBj
b2NjaW5lbGxlLCBzcGFyc2Ugb3IgZXZlbg0KPiA+ID4gY2hlY2twYXRjaCwgYW5kIEFJLWFzc2lz
dGVkIGNvZGluZy4NCj4gPiA+DQo+ID4gPiBGb3IgdGhlIGZpcnN0IHlvdSBzdGlsbCBuZWVkIHRv
IHdyaXRlIGFjdHVhbCBjb2RlIGFuZCBzaW5jZSB5b3UgYXJlDQo+ID4gPiB3cml0aW5nIGl0LCBt
b3N0IGxpa2VseSB5b3Ugd2lsbCBjb21waWxlIGl0LiBFdmVuIGlmIHBlb3BsZSBmaXggdGhlDQo+
ID4gPiB3YXJuaW5ncywgbm90IHRoZSBwcm9ibGVtcywgdGhleSBzdGlsbCBhdCBsZWFzdCB3cml0
ZSB0aGUgY29kZSBhbmQNCj4gPiA+IHRodXMgdGhpcyBmaWx0ZXJzIGF0IGxlYXN0IHBlb3BsZSB3
aG8gbmV2ZXIgd3JvdGUgQy4NCj4gPiA+DQo+ID4gPiBXaXRoIEFJIHlvdSBkbyBub3QgaGF2ZSB0
byBldmVuIHdyaXRlIGl0LiBJdCB3aWxsIGhhbGx1Y2luYXRlLA0KPiA+ID4gY3JlYXRlIHNvbWUg
c29ydCBvZiBDIGNvZGUgYW5kIHlvdSBqdXN0IHNlbmQgaXQuIE5vIG5lZWQgdG8gY29tcGlsZQ0K
PiA+ID4gaXQgZXZlbiENCj4gPg0KPiA+IENvbXBsZXRlbHkgYWdyZWVkLCBhbmQgZnVydGhlcm1v
cmUsIGRlcGVuZGluZyBvbiBob3cgdGhhdCBBSSB3YXMNCj4gPiB0cmFpbmVkLCB0aG9zZSB1c2lu
ZyB0aGF0IEFJJ3Mgb3V0cHV0IG1pZ2h0IGhhdmUgc29tZSBkaWZmaWN1bHR5DQo+ID4gbWVldGlu
ZyB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBzZWNvbmQgcG9ydGlvbiBvZiBjbGF1c2UgKGEpIG9m
DQo+ID4gRGV2ZWxvcGVyJ3MgQ2VydGlmaWNhdGUgb2YgT3JpZ2luIChEQ08pIDEuMTogIkkgaGF2
ZSB0aGUgcmlnaHQgdG8NCj4gPiBzdWJtaXQgaXQgdW5kZXIgdGhlIG9wZW4gc291cmNlIGxpY2Vu
c2UgaW5kaWNhdGVkIGluIHRoZSBmaWxlIi4NCj4gDQo+IEp1c3Qgb24gdGhlIGxlZ2FsaXR5IG9m
IHRoaXMuICBVbmRlciBVUyBMYXcsIHByb3ZpZGVkIHRoZSBvdXRwdXQgaXNuJ3QNCj4gYSBkZXJp
dmF0aXZlIHdvcmsgKGFuZCBhbGwgdGhlIHN1aXRzIG92ZXIgdHJhaW5pbmcgZGF0YSBoYXZlIHNv
IGZhcg0KPiBmYWlsZWQgdG8gcHJvdmUgdGhhdCBpdCBpcyksDQoNClRoaXMgaXMgaW5kZWVkIHNv
LiAgSSBoYXZlIGZvbGxvd2VkIHRoZSBHaXRIdWIgY29waWxvdCBsaXRpZ2F0aW9uDQooc2VlIGh0
dHBzOi8vZ2l0aHViY29waWxvdGxpdGlnYXRpb24uY29tL2Nhc2UtdXBkYXRlcy5odG1sKSwgYW5k
IGEgZmV3DQpvdGhlciBjYXNlcyByZWxhdGVkIHRvIHdoZXRoZXIgQUkgb3V0cHV0IHZpb2xhdGVz
IHRoZSBjb3B5cmlnaHQgb2YgdGhlIHRyYWluaW5nDQpkYXRhICh0aGF0IGlzLCBpcyBhIGZvcm0g
b2YgZGVyaXZhdGl2ZSB3b3JrKS4gIEknbSBub3QgYSBsYXd5ZXIsIGJ1dCB0aGUgbGVnYWwNCnJl
YXNvbmluZyBmb3IganVkZ2VtZW50cyBwYXNzZWQgZG93biBzbyBmYXIgaGF2ZSBiZWVuLCBJTUhP
LCBhdHJvY2lvdXMuDQpTb21lIGNsYWltcyBoYXZlIGJlZW4gdGhyb3duIG91dCBiZWNhdXNlIHRo
ZSBvdXRwdXQgd2FzIG5vdCBpZGVudGljYWwNCnRvIHRoZSB0cmFpbmluZyBkYXRhIChldmVuIHdo
ZW4gdGhpbmdzIGxpa2UgY29tbWVudHMgZnJvbSB0aGUgY29kZSBpbg0KdGhlIHRyYWluaW5nIGRh
dGEgd2VyZSBjb3BpZWQgdmVyYmF0aW0gaW50byB0aGUgb3V0cHV0KS4gIENvbXBhbmllcyBkb2lu
Zw0KQUkgY29kZSBnZW5lcmF0aW9uIG5vdyBzY3J1YiB0aGVpciBvdXRwdXRzIHRvIG1ha2Ugc3Vy
ZSBub3RoaW5nDQppbiB0aGUgb3V0cHV0IGlzIGlkZW50aWNhbCB0byBtYXRlcmlhbCBpbiB0aGUg
dHJhaW5pbmcgZGF0YS4gIEhvd2V2ZXIsIEknbSBub3QNCnN1cmUgdGhpcyBpcyBlbm91Z2gsIGFu
ZCB0aGlzIHJlcXVpcmVtZW50IGZvciBpZGVudGljYWxpdHkgKHRvIHByb3ZlIGRlcml2YXRpdmUg
d29yaykNCmlzIHByb2JsZW1hdGljLCB3aGVuIGNvcHlyaWdodCBsYXcgb25seSByZXF1aXJlcyBw
cm9vZiBvZiBzdWJzdGFudGlhbCBzaW1pbGFyaXR5Lg0KDQpUaGUgY29waWxvdCBjYXNlIGlzIGdv
aW5nIHRocm91Z2ggYXBwZWFsIG5vdywgYW5kIEkgd291bGRuJ3QgYmV0IG9uIHdoaWNoDQp3YXkg
dGhlIG91dGNvbWUgd2lsbCBkcm9wLiAgSXQgY291bGQgdmVyeSB3ZWxsIHlldCByZXN1bHQgdGhh
dCBBSSBvdXRwdXQgaXMgZGVlbWVkDQp0byBiZSBkZXJpdmF0aXZlIHdvcmsgb2YgdGhlIHRyYWlu
aW5nIGRhdGEgaW4gc29tZSBjYXNlcy4gIElmIHRoYXQgb2NjdXJzLCB0aGVuIGV2ZW4gcmVzdHJp
Y3RpbmcNCnRyYWluaW5nIGRhdGEgdG8gR1BMIGNvZGUgd291bGRuJ3QgYmUgYSBzdWZmaWNpZW50
IHdvcmthcm91bmQgdG8gZW5hYmxlIHVzaW5nIHRoZSBBSSBvdXRwdXQNCmluIHRoZSBrZXJuZWwu
ICBBbmQsIGFzIGhhcyBiZWVuIHN0YXRlZCBlbHNld2hlcmUsIHRoZXJlIGFyZSBubyBjdXJyZW50
bHkgbm8gbWFqb3IgbW9kZWxzIHJlc3RyaWN0aW5nDQp0aGVpciBjb2RlIHRyYWluaW5nIGRhdGEg
dG8gcGVybWlzc2l2ZWx5IGxpY2Vuc2VkIGNvZGUuICBUaGlzIG1ha2VzIGl0IGluZmVhc2libGUg
dG8gdXNlDQphbnkgb2YgdGhlIHBvcHVsYXIgbW9kZWxzIHdpdGggYSBoaWdoIGRlZ3JlZSBvZiBj
ZXJ0YWludHkgdGhhdCB0aGUgb3V0cHV0IGlzIGxlZ2FsbHkgT0suDQoNCk5vIGxlZ2FsIHB1biBp
bnRlbmRlZCwgYnV0IEkgdGhpbmsgdGhlIGp1cnkgaXMgc3RpbGwgb3V0IG9uIHRoaXMgaXNzdWUs
IGFuZCBJIHRoaW5rIGl0DQp3b3VsZCBiZSB3aXNlIHRvIGJlIEVYVFJFTUVMWSBjYXV0aW91cyBp
bnRyb2R1Y2luZyBBSS1nZW5lcmF0ZWQgY29kZSBpbnRvIHRoZSBrZXJuZWwuDQpJIHBlcnNvbmFs
bHkgd291bGQgbm90IHN1Ym1pdCBzb21ldGhpbmcgZm9yIGluY2x1c2lvbiBpbnRvIHRoZSBrZXJu
ZWwgcHJvcGVyIHRoYXQNCndhcyBBSS1nZW5lcmF0ZWQuICBHZW5lcmF0aW9uIG9mIHRvb2xzIG9y
IHRlc3RzIGlzLCBJTU8sIGEgZGlmZmVyZW50IG1hdHRlciBhbmQgSSdtDQpsZXNzIGNvbmNlcm5l
ZCBhYm91dCB0aGF0Lg0KDQpHZXR0aW5nIGJhY2sgdG8gdGhlIGRpc2N1c3Npb24gYXQgaGFuZCwg
SSBiZWxpZXZlIHRoYXQgYW5ub3RhdGluZyB0aGF0IGEgY29udHJpYnV0aW9uIHdhcw0KQUktZ2Vu
ZXJhdGVkIChvciB0aGF0IEFJIHdhcyBpbnZvbHZlZCkgd2lsbCBhdCBsZWFzdCBnaXZlIHVzIHNv
bWUgYXNzaXN0YW5jZSB0byByZS1yZXZpZXcNCnRoZSBjb2RlIGFuZCBwb3NzaWJseSByZW1vdmUg
b3IgcmVwbGFjZSBpdCBzaG91bGQgdGhlIGxlZ2FsIHN0YXR1cyBvZiBBSS1nZW5lcmF0ZWQgY29k
ZQ0KYmVjb21lIHByb2JsZW1hdGljIGluIHRoZSBmdXR1cmUuDQoNClRoZXJlIGlzIGFsc28gdmFs
dWUgaW4gZmxhZ2dpbmcgdGhhdCBhZGRpdGlvbmFsIHNjcnV0aW55IG1heSBiZSB3YXJyYW50ZWQN
CmF0IHRoZSB0aW1lIG9mIHN1Ym1pc3Npb24uICBTbyBJIGxpa2UgdGhlIGlkZWEgaW4gcHJpbmNp
cGFsLg0KDQogLS0gVGltDQoNCj4gY29weXJpZ2h0IGluIGFuIEFJIGNyZWF0ZWQgcGllY2Ugb2Yg
Y29kZSwNCj4gYWN0dWFsbHkgZG9lc24ndCBleGlzdCBiZWNhdXNlIGEgbm9uIGh1bWFuIGVudGl0
eSBjYW4ndCBsZWdhbGx5IGhvbGQNCj4gY29weXJpZ2h0IG9mIGEgd29yay4gIFRoZSBVUyBjb3B5
cmlnaHQgb2ZmaWNlIGhhcyBhY3R1YWxseSBpc3N1ZWQgdGhpcw0KPiBvcGluaW9uIChodWdlIDMg
dm9sdW1lIHJlcG9ydCk6DQo+IA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly93d3cuY29weXJpZ2h0Lmdvdi9haS9fXzshIU83X1lTSGNtZDlqcDNoal80ZEVBY3lRITJWTWF4
TU9CSVlESG1hNDJON3pEZ201QW9KUjlNdTRsVDANCj4gXzNHNnFtMEFqU1djcU1EalFhN3lkVEZk
TERZVXZERTVkOWVKdGt3SVJBT19Lb2szZnEwS0ZuQ3RlMWpzMzZvZVEkDQo+IA0KPiBCdXQgYW1h
emluZ2x5IGVub3VnaCBjb25ncmVzcyBoYXMgYSBtb3JlIHN1Y2NpbmN0IHN1bW1hcnk6DQo+IA0K
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cuY29uZ3Jlc3MuZ292L2Ny
cy0NCj4gcHJvZHVjdC9MU0IxMDkyMl9fOyEhTzdfWVNIY21kOWpwM2hqXzRkRUFjeVEhMlZNYXhN
T0JJWURIbWE0Mk43ekRnbTVBb0pSOU11NGxUMF8zRzZxbTBBalNXY3FNRGpRYTd5ZFRGZExEWVV2
REU1DQo+IGQ5ZUp0a3dJUkFPX0tvazNmcTBLRm5DdGUxOEdLUVREcyQNCj4gDQo+IEJ1dCB0aGUg
Ym90dG9tIGxpbmUgaXMgdGhhdCBwdXJlIEFJIGdlbmVyYXRlZCBjb2RlIGlzIGVmZmVjdGl2ZWx5
DQo+IHVuY29weXJpZ2h0YWJsZSBhbmQgdGhlcmVmb3JlIHB1YmxpYyBkb21haW4gd2hpY2ggbWVh
bnMgYW55b25lDQo+IGRlZmluaXRlbHkgaGFzIHRoZSByaWdodCB0byBzdWJtaXQgaXQgdG8gdGhl
IGtlcm5lbCB1bmRlciB0aGUgRENPLg0KPiANCj4gSSBpbWFnaW5lIHRoaXMgc2l0dWF0aW9uIG1p
Z2h0IGJlIGNoYW5nZWQgYnkgbGVnaXNsYXRpb24gaW4gdGhlIGZ1dHVyZQ0KPiB3aGVuIHBlb3Bs
ZSB3YW50IHRvIG1vbmV0aXplIEFJIG91dHB1dCwgYnV0IHN1Y2ggYSBjaGFuZ2UgY2FuJ3QgYmUN
Cj4gcmV0cm9hY3RpdmUsIHNvIGZvciBub3cgd2UncmUgT0sgbGVnYWxseSB0byBhY2NlcHQgcHVy
ZSBBSSBjb2RlIHdpdGgNCj4gdGhlIHNpZ25vZmYgb2YgdGhlIHN1Ym1pdHRlciAoYW5kIHdoYXRl
dmVyIEFJIGFubm90YXRpb24gdGFncyB3ZSBjb21lDQo+IHVwIHdpdGgpLg0KPiANCj4gT2YgY291
cnNlIGlmIHlvdSB0YWtlIEFJIG91dHB1dCBhbmQgbW9kaWZ5IGl0IGJlZm9yZSBzdWJtaXR0aW5n
LCB0aGVuDQo+IHRoZSBtb2RpZmljYXRpb25zIGRvIGhhdmUgY29weXJpZ2h0IChwcm92aWRlZCBh
IGh1bWFuIG1hZGUgdGhlbSkuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSmFtZXMNCj4gDQoNCg==

