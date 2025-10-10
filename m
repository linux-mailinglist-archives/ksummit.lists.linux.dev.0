Return-Path: <ksummit+bounces-2481-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AEBCD744
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D61BA3C3DDD
	for <lists@lfdr.de>; Fri, 10 Oct 2025 14:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225092F7AB0;
	Fri, 10 Oct 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="QHYUuyDJ"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF32F5A0E
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105744; cv=fail; b=jRgJP2HmLq35Yabf6J7UbXZMOZ4cYzdMkA8sEzMJmjFxpvUwoMCd/7AeFJXFweDFvwE43IqYcsvx2uPHMp7czvsVwZCnF9xh7weSCZhkUcq66VhK2NvTBrZIT/aCfPQI6SYuhTmI3Hl51kyD8EtTYVJ6ZUyI2dS1W7nsul+m0FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105744; c=relaxed/simple;
	bh=iTakYrQo5xRiTmQ+gl0ULldiqbYce+PKbCj/LhrVmdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fY6UOzAygpON7wltoOTHlL+0KmNneaunExcXY9KO9F7xbkXsvn0whkE1livKIf9Jm/+TuPSgmCTXccCs1VpgMEjudZ5Y8nIUuGsScVi7npNyIzSHs7PnugP2r1hQyJPRDzG2lCUMtrBMo3Xv+ez3oe7Yvbqen42R9u3yqFnL4aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=QHYUuyDJ; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ADwpdf020074;
	Fri, 10 Oct 2025 14:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=iTakYrQ
	o5xRiTmQ+gl0ULldiqbYce+PKbCj/LhrVmdc=; b=QHYUuyDJOxpVwoEH7vPDx4d
	htZ7Uq0w3d8gacEiphN+D/NL1/sCfL5xuQkek9slXTudE3FBQHB0Wq4AFL8smgmE
	opU/hp3brvrXd6fW5qq4CdJU+OU3zUVCi0IqECGXxAA2/BrUymqsvosyhctyVX4b
	EfDLQWbKFRVwnBdve+OXH4aT/N96Lde8lNwoei5b051kLQXkdo+0ESBgyW4SfdRa
	hPws45t5AfrqDqCQx0xxLpay1IjDk7esCl9Yae3pl8vwr114FdKL9Kevq4MYsCU1
	b9d2Gki/rXoHKjdMkDVh9ZtZh4LEKlcezGkSFckX8GLnz6o3wM6/mA3idENdlow=
	=
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5rjmf7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Oct 2025 14:15:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTIzUO4Kkc8t4qbEFNIJb7gwljcp8SwtdFlclhO3P+VRXOIYHqnPyLkIyb61hJ3o80SL/qn8DDzEwo5EJ/Wn0zzzQMeuDsANLjjPJ0rPtgGOiQ5Zp9boQxTfYpkLVLnDitCMslbw8/L963h3Jy170qf+v6tuWo4AXu6ghkFnZkjmvLcgZoH36DwTve4sIf/fxVjWVeSE5r+5khRd6eofG3KG1kYlpXiMFRKdO1BZgaDRh0ZqALdOrgBt2MQF2oEf0g5gw5cQptc6IApiEqTBWRVedXneBdj337SziUtJk+ibfqAPxN74vXkvSaelYVXcsxXZtw/JHvyQ+GrJRZnL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTakYrQo5xRiTmQ+gl0ULldiqbYce+PKbCj/LhrVmdc=;
 b=KxUf/WrhKCoKmmzo8fHg3JeALP6IJgHkG/xmaj9Ecwxtrv7vaUgsrVXRaIjUlbL+/jQl7qnUq0nvJrJjp6oafLJaYxUeq7mxRpxitgyNOvOxU68sabJ4L/a+pzZFKCgTKqdqNVa5FUF+sSSop4XKrTyIemVqQeWnDl79aZW2TEqYTIT/od8osH47VJVhUf/fJCWNA7/YjM6essmor25UXlC9NHiw7sBIcmWlGS3Xkf5U5C6EEASW8jVf/KS6Ga8ooZuQ0LxUvjZREub74ypXQ/nts0btr+4cDmiEFXdwgBP6IjeEiuQUmtWalC6fRpg3DwPOk7ZZ51eW5TxUBsuclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA3PR13MB6491.namprd13.prod.outlook.com (2603:10b6:806:3a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:15:11 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 14:15:11 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        Andrew Lunn <andrew@lunn.ch>
CC: Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley
	<James.Bottomley@hansenpartnership.com>,
        Chris Mason <clm@meta.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Dan Carpenter
	<dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>, Rob Herring
	<robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Topic: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Index:
 AQHcOHXIPqH6JcPVFEqei/F1014v5LS4nPWAgAAF4ACAAAQLYIAADRAAgAAAdwCAANTMgIAAWFqAgAAF9oCAAR8VgIAAY08Q
Date: Fri, 10 Oct 2025 14:15:10 +0000
Message-ID:
 <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
 <20251009103019.632db002@gandalf.local.home>
 <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
 <20251010075909.GE29493@pendragon.ideasonboard.com>
In-Reply-To: <20251010075909.GE29493@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA3PR13MB6491:EE_
x-ms-office365-filtering-correlation-id: eede6953-adc8-41d5-2388-08de08076c6f
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXZVNE1YQVdWcDYvTHNaWXNGQ1RhN2o2K3VJbEVwY2JZeE5SUFlmeURuaVRy?=
 =?utf-8?B?NEoycFZORmcwRmhZa1hCVlFwcTRPREl4SUpGcHh4MzdzdlJUcGxUSzFFdHVS?=
 =?utf-8?B?UFZRMHNSbEp1K0UwVTNLZ1N6bEVqYWYvVGUrSU0vQXM5WXVJL2hVVVNRdUdF?=
 =?utf-8?B?VFc4L0R4NlU2Q3dwZ0RXOEVnTjZ2T1pBKzBNanI1R3FiaU5DMGdmeG81ZzNt?=
 =?utf-8?B?Z25pL1BBdzdManBmN2pLSGcyUEwzdmU2elRTWnBXRmZvZGVwV0FBTVBLcjZZ?=
 =?utf-8?B?dEUvTmplYzB3cmxyZjF0VldPUXdpNW5oSXV3WC9od1BRRFBybTBwR3hIRHV0?=
 =?utf-8?B?MGpTSzBCN2IwS082dFlWeU1wa2ZmVWhMMnZMcVFJYi9vQzg4dTlvdncvZzZo?=
 =?utf-8?B?dzRvZFl4Zkx4UHdKK2diMUlnT0tmZkU1Mk5sMktSY045aEdFVitrcXdkbCtm?=
 =?utf-8?B?QnpVSmd3VjVuU0x6RC9PV0ROUE9BeHZCaWM0dHVkMnk5U05QSVg2RlYwSzlU?=
 =?utf-8?B?Y0dvbDVLM09EcTd4WTB5RnNmc0IwUEVmWTFaZkxsdkZkK0o2V1E4eldteGJp?=
 =?utf-8?B?aHF5dERIY2pOWXBkQThZdG9XYUJZRUZkYXlldSt6YXBzcE1sZ2Q4WXNlQ2R1?=
 =?utf-8?B?NVo4OTBCUks3LzNGUjRaZ0VsQ1VzOHZxcDdtUXBaSjJ4RWxKL0F2bExMbEZX?=
 =?utf-8?B?MkZ0TlBuUDZ6TkRWRWUrNVV3VjBHem1jVnNTWllJSE9QQXJKRmZqYnU4L3cr?=
 =?utf-8?B?SU9zaVU0aGJRVmpmak1VaUpTdHFlMTRlUzhTVEp5R2lQUGZ5MkpyQnJqd2JG?=
 =?utf-8?B?R0EyV0RRRUZEdGcvOHEvQS9xbHpPVTA2d3JsSzdZRWVYWGhLbnhsL1QvSFhw?=
 =?utf-8?B?dnpsdXk3WUNOZlNRY3gvclRQVzUzY0Q5YjB4ckpPaE1YdjBiMFRiaWhMNkZZ?=
 =?utf-8?B?ZGZHR0p6VWI1S0xnbVBtOWVVVXo2emVGMnBCb2w3VDR4MjdvanhzcHFFWFd0?=
 =?utf-8?B?M3lielJGLzNKMS8wTHhDTnVEeHpFQ0RRaGJOcnVGVlBaYVQ4RWI1bW9rY3hO?=
 =?utf-8?B?Z0hlS3FWdXBheFhqbE9jbDkvSVVZSFlyK2J0UEwxb1kwMlpJa2hmL04xZHha?=
 =?utf-8?B?YTFEZC9BaFNMMzhrb0ZyWG9tWldTMWtKMjNqaFMra1BpS3p5UlZ0a0NsTUEy?=
 =?utf-8?B?V05Cb0NBQStqSHh4QW9MOUFXd1Zyb01ZSUdXQ0liMDkxTDVPSGVJTUU2OVcy?=
 =?utf-8?B?WkRtZEdRS0lRbFVhbU1VUWJIcGtCOXdWQ0N1bmpXMEdoZXFORTlGRDVXSkZi?=
 =?utf-8?B?S2tjcUtXR1MxR1dqaDJXcHhyWnVSK3VOU2VPSVoxOXBaTGxMSUExVVkyVGNm?=
 =?utf-8?B?SVZmTjhKNDVCZTR4U1VKV0szaGlydlIxRGNIZ21qbG05TnB4MW9xVmdZSDJO?=
 =?utf-8?B?T1FCT3FrTk5aVzR0MzdCbStEb1dKcDNGOWt1WjI1TjErcDRUdmZ4RlVnNWlC?=
 =?utf-8?B?cE5YNnVicHl0cHV0V0JWQ0k5ZnhJZWh2ZVN3bnRpZUVTUkx4ZkpCT2YvVnhB?=
 =?utf-8?B?bGtVNzNwT0ZVQWl4ZGJZYVNsam1ydnY2Rm5nNktSS2c0anFjak8zeklWRUZj?=
 =?utf-8?B?RUlmTEZPWjRIdzdQaDQ0UEQ3Qm1TcmdIU3h2Q1VUK0M3aVFnNlNHZDFGUDhv?=
 =?utf-8?B?OWhmVWIwamVWbGpSK2JlbFM3MXZRK2QwQ1pneG44WTU4NWZIRisxWWNueTRQ?=
 =?utf-8?B?eWpTa0lxMG1ReHRLTXp3OXgxME9UOHhxVU16UHNFRHZVS3dRZ2xFZHBUd2RO?=
 =?utf-8?B?QVJlb3Rtdmk2czJoUjIzNjFjYlRWeFpxcFlqUzJNSHNQK3NOVWZBbWZJSWhV?=
 =?utf-8?B?bTdnZkcwM3lRLzhvOXZscTd5N01BbzE1MVNndTJlOHdzeW9MMEtOb29aSHF3?=
 =?utf-8?B?WjhjNVJZMkpOL0V2T2dHYkNLb25xTnZTOFhKMW01NUJGdmZjUFh3cjJuQjB1?=
 =?utf-8?B?YkZnai90NDZ0U3Z1Mm8zcVZhMm9CRmo2N1RmQXIvRmxnaGg0Y1JXajlsYmJl?=
 =?utf-8?Q?GEW4PP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk1YQ2VTTWVyMnRUai93K25xTWc5TW5peEFCanQ0Q3kvR0xFTmpOeDlPTk9V?=
 =?utf-8?B?bHIyUU5IN3J4NHpUOUJneENicWlYU29vNXpBVmV5YVVCWldObzFTcldFVEUz?=
 =?utf-8?B?ck1RT21xa2RCY2x2b291OGU3ZUwzVHMrcndycGFwSndDZTNYekZEUHhBTW5o?=
 =?utf-8?B?QXFnbTFYd2ttSFhHU0tNUHljRFNLOVBodmQ5UTJIQlBRTXF3ZFZnY1NsWkJ2?=
 =?utf-8?B?YWRVVnRHeFJrZlpOaWl0b2lVaU9na0RWNHUrQTVSN081UzlzSGQ2V2dsQWZN?=
 =?utf-8?B?bGMvb09obGFRaTFXWkpkTUM3dEhmd0UydHA1YkdIdy9oVlh5ZjFjZytSWW0z?=
 =?utf-8?B?dU4wV05lZERxbDhlL0lOMXIxTkc0RVdnREt2TUo5TkZaK1A0SE5nbTB4VTUz?=
 =?utf-8?B?bWdmdDd3cXpGNytrUnJTM2Jwd0JNK1c0QWp6bHhJMHJjdHBMZ3puZ09maTRo?=
 =?utf-8?B?UVBzaDFQZFozOFUwUWdBM2pmcGlYMDBrdlhuQVg4VEhkelRhL1NlQVFmbDFY?=
 =?utf-8?B?bUlIaUdZc3U2NUNPeGMwdWN4c29BVkx2ZmRjWG0rSHIvOEhKUlNBbHRmWFRY?=
 =?utf-8?B?a3cxbHlWcjAxSTJDV28wYlcyVkFreEMxaFNvcTk2MjZkYWtoWDNpZG16bkly?=
 =?utf-8?B?bWxDZ2t0NFNUdGlqTWFNU2c3QVQwaFd2dnJUNTRXOXhMaGVXN05nd0tGZnhj?=
 =?utf-8?B?enl1OWVxcyt2MjZubzZPRSt4dXN0S2YzakgzR1VFc1JrandUNjAvZHRsdlll?=
 =?utf-8?B?cnQzcnQzbFY1UWdkeW43cXJYNGRqN09KdkdrbjBoUVhkay9lWTNYZmZkRU56?=
 =?utf-8?B?S2NKWklIRzVxdFM3WiswUE1ZMkdCWEhLQ2VJcXcveU15emJCUFg3Y0ZpUEtK?=
 =?utf-8?B?RkRyRm1ZZWR6L0xJT3NlS0dKQnBsaThwOFBDSmY5SEtwUGVZNDFpa2JhcWJX?=
 =?utf-8?B?N1FKSnV3UHdEc2VnT3crVW9GOE9sUjg0VFhKU3ljcTRNQUtKSmx4c2FHSEZH?=
 =?utf-8?B?Z3pIRFZwSFNEM1VLci9pS08yWkFLeHZVdkZWeThjQnMyaW5WZ0dQUWZWQXY3?=
 =?utf-8?B?Njk1M1Q1ckptcVNFN0Nmc0VLS05BekhLNWJuOHNrTWhUdm5IbzlncDIxUDg5?=
 =?utf-8?B?cTA3RlpsV00rU2FnTGJPMGxxN3FXL3NEVDVZNjRDc3k0ajljc2NwVHRENVph?=
 =?utf-8?B?KzJIRlFNNkorKzFQdTZycVlpRXcwMnNhTHZkeGlpNXZmTWlJVmU3WGdsWHp5?=
 =?utf-8?B?ZlpHNVZ5MUZkTnRVcW9pczJnbTg5aW9MdC9EWWlTUHhZcGFHSWVsK096NTk5?=
 =?utf-8?B?MXlOOGhoTGVWQWpack9ickNYYk02MkVMN1VzQ0hnV0N5UndRZGpkUVp2NWlv?=
 =?utf-8?B?L0VYMkc2SUpjMVN2U1ZzckZQSjJsK0V6RTZlUktnWHdDQzc0NE9HZVNiU0Jx?=
 =?utf-8?B?dy9kaUFvVHd1bXpWNUEzbGxJS0VabkpSNlJObGZ3SStVdllBajdvcFB6MktI?=
 =?utf-8?B?MVJhM05jeGlVZHZrUDFSVXAxVWFsODYwTFdwNGhoN3h3bXpTeVZGK28wZDhr?=
 =?utf-8?B?Q21Od29IRjVURjB6Yk85TndDR3JNM3l5bUJTOTI2ODQ5M0FvZnlrdlF3L0NU?=
 =?utf-8?B?NldLWndVZ05KL2ZMS2FNQURxVUl3YWZkeWptS2ZmMjNWV1VKTDgzQU53V2tq?=
 =?utf-8?B?QjZXNGNZYmhGLzdnSGtwVUlWYURDYWxxUldNajZGb2tpN3ZBdnZlWE9tMXJJ?=
 =?utf-8?B?dVQ5aDc4anpMcTZ6VzVHZlNTbkR2RERwTDRnSFNjZzJjVUorSXhpMXdYZEps?=
 =?utf-8?B?bkNNcjZHK2hmd0krWURiTkdjQlZCNWRnQnhCUldaOUlNSXc1a3RSQW42dlpE?=
 =?utf-8?B?SWY5QTRGSHcxMERWcHZvOFVhZldaTXFYZVc0SnU1Mk9hbnFSeUFvS01wMzRH?=
 =?utf-8?B?WEZtTkFkVlA3djZVZ2F0SnNNQVdNWG1BaEpkdVpNR0o2L1lDSDdVd0pMbDhj?=
 =?utf-8?B?Rm5PbGZwVm9lRTVpdTFHZHhrQzlRRVQ5YWxXaSt4WVVnNzJkU1ZyOVhFMEdI?=
 =?utf-8?B?bUt6TTlwV3Faa0NKRVVWajc5emVsVGp3WVAxNTBoQlZtaTcva3BZeWJ5R2dC?=
 =?utf-8?Q?i+Bc=3D?=
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
	diVtrKUlUE3mmqQHkBw4AlGJljiMe20p1+NYFBkj06OOU4oS5WltTXaMLALXqXpEl5CgTcoccDD5eMOQ3EwPqnK2UVolmwrmV6GZZkUrzRFfiaNVRTJevjp+CvnkFZ8ZIyMl5ArNTruPmy2V2GBi9tipmIW7k4We68G+7UziHrOxeXc4k3Fv5W4pj5hUJBjDgy6jmzv2oOKj5eQyySlBlOdLdLC1pExkzsOEsyJNaQKLckK9e6UVOC6GTU8wlHIMS3/oOgBhecDIli+8CHBVOtrRLNKoOAajdcdpS6mpApY7HS0NQtVwElVqBWcltLD0DJ69jEhm0QZ618DwY8lwjpDUMz8X6r3if7WGYmtQGsxrweTTeQysjI/mXbQDeomkSML+09y6tItlXGtwFm85HuEm7LldGDhSjIxaEYAJU+uAuZjIbAvdAwHCL/IFry0vyL+k5BSV4oAY+1STUMH07F7P/h8Dq+y5hQHUYFquXVLNbGhYMQOrWV5lLD+U0dpRfWYqDXb9hhbIUFIdCRyjoqQx+Wdm5oeUmYwktTotIonVDzWeAil92LMtB8rELNJqhneqWJZcEUl/Q54Jf3uECanvyqOcqtuy++5zvzh11QpX+xnnJGgGREvPAp40P30W
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eede6953-adc8-41d5-2388-08de08076c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 14:15:10.9720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8luh/qGMitQQJrk70okCGlOjSYCPnoJQv8MBuOhMQEm0JxxNOWTO+MV+E2E1I9ggkByr8Q1UftWJv0hdB5NUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB6491
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzj3xcVoeAaLj 3uN8hS/AlT+tVbDZiaqCslZpETzPIM4C3TpPKbyBzBpXYoUEj8DVVa39dQePZuOJB7MNiBj7t62 xp0ytTucF6epF7vu17WkW5KsP912pbOrOGUraExTORFkD9vnkN5ZUEJSY5PdPlvZ7oaRRx2j5O4
 SI4wyAxe95IM3E/RLx4xfhayJUlaxL0GLdYTve9ZaT5SyeK+dRNcEX6YZzl9ByE00D1adGTNOjZ y984fqwoR9cMyuHqGAwwNSRx3Jzax1lxV3lvTdAwLN9gCDVt45kKLZbCdSdlC5ZXktVeiHpQAQw X+Qvz03EIhlE35ZGWvfqkS+M9oTxshm+4+d8ApRStwawPThaN6vgYwKJyQuVqCSUPBguaS9NMUX
 +0qmEGI0LLCcHOV5MsuRaats5zBWGg==
X-Proofpoint-ORIG-GUID: cLgaNrlswbBLfVJw2tQBWkOpJrQVhtxH
X-Authority-Analysis: v=2.4 cv=DodbOW/+ c=1 sm=1 tr=0 ts=68e914f7 cx=c_pps a=QL/sESuk+SKO76CEZ3+3jA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=P1BnusSwAAAA:8 a=XCEclETbyj_t_qCHTyAA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: cLgaNrlswbBLfVJw2tQBWkOpJrQVhtxH
X-Sony-Outbound-GUID: cLgaNrlswbBLfVJw2tQBWkOpJrQVhtxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBPbiBUaHUsIE9jdCAwOSwg
MjAyNSBhdCAwNDrigIo1MTrigIozOVBNICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZTogPiBPbiBU
aHUsIE9jdCAwOSwgMjAyNSBhdCAxMDrigIozMDrigIoxOUFNIC0wNDAwLCBTdGV2ZW4gUm9zdGVk
dCB3cm90ZTogPiA+IE9uDQo+IFRodSwgOSBPY3QgMjAyNSAxMjrigIoxNDrigIowNSArMDMwMCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOiA+ID4gPiA+ID4gRm9yY2luZyBjb250cmlidXRvcnMNCj4g
T24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMDQ6NTE6MzlQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3Jv
dGU6DQo+ID4gT24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMTA6MzA6MTlBTSAtMDQwMCwgU3RldmVu
IFJvc3RlZHQgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDkgT2N0IDIwMjUgMTI6MTQ6MDUgKzAzMDAg
TGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+DQouLi4NCj4gVGhlIExpbnV4IG1lZGlhIHN1
YnN5c3RlbSBDSSBkb2VzIHByZXR0eSBtdWNoIHRoZSBzYW1lLiBJdCdzIGJlZW4NCj4gd29ya2lu
ZyBxdWl0ZSBPSywgYWx0aG91Z2ggZGVhbGluZyB3aXRoIGZhbHNlIHBvc2l0aXZlcyBpcyBub3Qg
ZWFzeS4NCj4gY2hlY2twYXRjaC5wbCBmb3IgaW5zdGFuY2UgcmV0dXJucyBsb3RzIG9mIGZhbHNl
IHBvc2l0aXZlcyAob3IgcmF0aGVyDQo+IHJlYWwgdmlvbGF0aW9ucyBvZiB0aGUgY29kaW5nIHN0
eWxlIHRoYXQgYXJlIGZpbmUgdG8gaWdub3JlKSwgYW5kDQo+IGNvbnRyaWJ1dG9ycyBnZXQgYW4g
YXV0b21hdGVkIGUtbWFpbCB0byB0ZWxsIHRoZW0gdG8gZml4IGFuZCByZXN1Ym1pdC4NCg0KRmFs
c2UgcG9zaXRpdmllcyBpcyBvbmUgb2YgdGhlIGlzc3VlcyB3ZSBzaG91bGQgYWRkcmVzcy4gIFNl
ZSBiZWxvdyBmb3INCnNvbWUgaWRlYXMgdG8gYWRkcmVzcyB0aGVtLg0KDQpJbiBteSB1bmRlcnN0
YW5kaW5nLCBpZiBkZXZlbG9wZXJzIGFyZSBub3QgcnVubmluZw0KY2hlY2twYXRjaC5wbCBiZWZv
cmUgc2VuZGluZyB0aGluZ3MgaW4sIGl0IGNyZWF0ZXMgc29tZSBjaHVybi4gIEkgdGhpbmsNCm91
ciBjdXJyZW50IHdheSBvZiBoYW5kbGluZyB0aGlzIGlzIGp1c3QgdG8gYXV0b21hdGUgaGFuZGxp
bmcgdGhlIGNodXJuDQppbnN0ZWFkIG9mIGFjdHVhbGx5IGFkZHJlc3NpbmcgdGhlIHByb2JsZW0g
YXQgdGhlIHRpbWUgb2YgZGV2ZWxvcG1lbnQuDQpPc3RlbnNpYmx5LCBwZW9wbGUgYXJlIG5vdCBp
Z25vcmluZyBlcnJvcnMgZnJvbSBnY2MgYmVmb3JlIHNlbmRpbmcgcGF0Y2hlcyBpbi4NCk1heWJl
IGlmIHNvbWUgb2YgdGhlIGNoZWNrcyB0aGF0IGNoZWNrcGF0Y2gucGwgZG9lcyAodGhlIG5vbi1m
YWxzZS1wb3NpdGl2ZSBvbmVzKQ0Kd2VyZSBpbnRlZ3JhdGVkIGludG8gdGhlIGJ1aWxkLCBpdCB3
b3VsZCByZXN1bHQgaW4gdGhvc2UgaXRlbXMgaGF2aW5nIGltbWVkaWF0ZQ0KdmlzaWJpbGl0eSB0
byB0aGUgZGV2ZWxvcGVyLCBhdCB0aGUgdGltZSBvZiBjb2RlIGNyZWF0aW9uLiAgQW5kIHRoZXkn
ZCBnZXQgZml4ZWQNCmJlZm9yZSB0aGUgcGF0Y2ggd2FzIGV2ZXIgY3JlYXRlZC4NCg0KT25lIGlz
c3VlIHdpdGggY2hlY2twYXRjaC5wbCBpcyB0aGF0IHNvbWUgaXRlbXMgaXQgY29tcGxhaW5zIGFi
b3V0IGFyZSBsb3cNCmltcG9ydGFuY2Ugb3IgZXZlbiBpZ25vcmFibGUsIGRlcGVuZGluZyBvbiB0
aGUgdGFzdGUgb2YgdGhlIG1haW50YWluZXIuDQpUaGlzIG1lYW5zIGRpZmZlcmVudCBtYWludGFp
bmVycyB3aWxsIGhhdmUgZGlmZmVyZW50IHZpZXdzIG9mIHdoYXQgY29uc3RpdHV0ZXMNCmEgZmFs
c2UgcG9zaXRpdmUuICBUaGlzIG1ha2VzIGl0IGRpZmZpY3VsdCB0byBiZSBzdHJpY3QgYWJvdXQg
cnVubmluZyB0aGUgdG9vbCBvcg0KYWRkcmVzc2luZyB0aGUgaXNzdWVzIGl0IHJhaXNlcy4gIEFs
c28sIGl0IGlzIHJ1biB0b28gbGF0ZSBpbiBkZXZlbG9wbWVudCwgSU1ITw0KKHNlZSBhYm92ZSku
DQoNCkkgaGF2ZSBpZGVhcyB0byBhZGRyZXNzIHRoZSBmYWxzZSBwb3NpdGl2ZSByYXRlLCBiYXNl
ZCBvbiBmZWF0dXJlcyB0aGF0IGNoZWNrcGF0Y2gucGwNCmFscmVhZHkgaGFzLCBhcyB3ZWxsIGFz
IGlkZWFzIGZvciBoYW5kbGluZyBzb21lIG9mIHRoZSBjb25jZXJucyB0aGF0IHJ1bm5pbmcNCmNo
ZWNrcGF0Y2gucGwgKG9yIGFuIGVxdWl2YWxlbnQpIGF0IGJ1aWxkIHRpbWUgd291bGQgcmFpc2Uu
ICBTb21lIG9mIHRoZXNlIG1pZ2h0DQphcHBseSB0byBBSSByZXZpZXcgYXMgd2VsbC4gIExldCBt
ZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvIGVsYWJvcmF0ZSwgb3IgaWYgd2UNCnNob3VsZCBqdXN0
IGRpc2N1c3MgaW4gVG9reW8uDQogLS0gVGltDQo=

