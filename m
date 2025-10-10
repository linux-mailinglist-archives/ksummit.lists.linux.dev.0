Return-Path: <ksummit+bounces-2486-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38861BCDEA0
	for <lists@lfdr.de>; Fri, 10 Oct 2025 18:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE1F1896BC7
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653532FB967;
	Fri, 10 Oct 2025 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dQyrdIjg"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D72F60D6
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760112123; cv=fail; b=tCvuShl2S2+vvgBvPodpJbQRFoHv9PXaZDiGTwapS7x6i/HtBOy/uv61DIkv6WiBXQXrq3A3187e8cLprv8SxG8hGG1vSl6Tkxc68d+w7FArYOiWECsxjK6SopS1TdCLjbLYqeccIin50NXuYZP/eXrpLhnTkhWb+qe544yTPtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760112123; c=relaxed/simple;
	bh=LGdG5h+OePkqNcpnraIExw3gbUf4scBhGZDBRTps+LY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ASwkcuxJvnf3T7BIBANyOGgQd/XgOpCg+XitYZ+ylQ+FOVKW84dDU+m7zvZXByKwUbhJ3puBGCApoEdMknCDBaNAodHeFoEQ2xlKnbf6KXfDEyFAQA2izf6OkHPNoYy58KsE/P7DYmDt6SGQg6BCqfL47Sbud0eWROtmLnAio0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dQyrdIjg; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AEiJRS008678;
	Fri, 10 Oct 2025 16:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=LGdG5h+
	OePkqNcpnraIExw3gbUf4scBhGZDBRTps+LY=; b=dQyrdIjgbrrVt6EH94NPB/a
	bK/Mfd5vI03GvR9QDuYGOi+B8ZC/Z39M2JwEyGiUvML9VVF23d7qxpLq446uQpTZ
	eMwM7+i5ryes2/vUaCDQ+ZjSkHcfFBJj8nvpClkmsaSPDDvxmWEa+GtA2p/MFJIs
	VNypH67++0mAxM4fMj2fHiP4tFdAc1wNk8q9YVhLC3bGpnSlI5NKLcktUcThh2Na
	1HJBmlDZIbz6P3mSxjSzs1G8r0TuJW3qhcvQJkNhWfRzsN79wjwdyrVegqV+8z6B
	cTG7ri+OcJosUhvxmCmILmzsqgE2ySO7HsOl78QF4bD8Q8UFb7GpRYznKGFETFw=
	=
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5stqfy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Oct 2025 16:01:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGakaaOVwxm2M6GQ6Lemovm6BEAFfzABSNSAaIKqXWb6h1emSf/1D4lah3u2RUx5FrfSs+r2+u/8w+VG9HhVrrpxUVSGznNrLRgl9PALthxsxwl+Id9MT6GTZdI/ljqiJVl1z0reSG7V335ZIFPHDoG4w/6hHEmWSEoYytzg1FCLwtkbHCr5yxAUKDZBJsaPgF6HGdUFnR9ol+QMJbNCt+y/koXRFNANITbTStSoR8cyQzuavQTzQVoPAAcG08yLdBW6wk4CXQx3/guC8ISd6aM9zLGVoFd2jTUxtKTFBCj9bX2Dh1XoYPs7uz7pU5lm/sR/c4zy8L8q4WZiEb8Ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGdG5h+OePkqNcpnraIExw3gbUf4scBhGZDBRTps+LY=;
 b=eue2+CLF15oGQfBNal/z9wRIi8v2kIiD3XKaUbNYdMDMhyNTwGTAo+GLdOqXQ67ms0VGIhKEANIFii5TlWvmP1DpWSPXUTQhHoR93yY/dUu1b1wO8HHWPtd/b/eqkQWO0cB/ZW5NLB4I/WtIcns5U3yZ/FeQMGXo/IAEFbeqX50hI2R5zT8rV72ux3r041uuV7j8gAyKz6YeET4Adcx/WSiQWb3lz51/NpYN7NSYp2nYqmk8Eywnesrlchz65kb53WbZRI+U6hsvm7aNrsTwLp0O0rXo4/w0x0u3tyau2JswFvQ2YNCFO5bbEbNuRoS1pXnm0tuuIA2nN8kILPWFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH2PR13MB4555.namprd13.prod.outlook.com (2603:10b6:610:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 16:01:31 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 16:01:31 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Joe Perches <joe@perches.com>,
        "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
        Andrew Lunn <andrew@lunn.ch>
CC: Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley
	<James.Bottomley@hansenpartnership.com>,
        Chris Mason <clm@meta.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Dan Carpenter
	<dan.carpenter@linaro.org>,
        Alexei Starovoitov <ast@kernel.org>, Rob Herring
	<robh@kernel.org>,
        "Knut.omang@oracle.com" <Knut.omang@oracle.com>
Subject: checkpatch encouragement improvements (was RE: [MAINTAINERS / KERNEL
 SUMMIT] AI patch review tools)
Thread-Topic: checkpatch encouragement improvements (was RE: [MAINTAINERS /
 KERNEL SUMMIT] AI patch review tools)
Thread-Index: AQHcOf8kKcjDBQbOi0mhec9vitXjDQ==
Date: Fri, 10 Oct 2025 16:01:31 +0000
Message-ID:
 <MW5PR13MB56325771E2CB01118E02F6D1FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
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
	 <MW5PR13MB5632C7D79221CF57565DEEF2FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
 <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
In-Reply-To: <739c7a03558c3c8642fc6a51de4d679ecd389365.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH2PR13MB4555:EE_
x-ms-office365-filtering-correlation-id: 5b4a0810-918e-4d85-4009-08de08164748
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VWpGalF4QUhsa2ZManhUR0xkUm5WNDJDc1ZGQmpmemNnVjEwbmpzYXIvVlJX?=
 =?utf-8?B?dFMvMjAxQUc1LzhsVkx2QVB5V1F1UFNSNzQ1QUo1WkhTY3U1K2thSjNsbnRu?=
 =?utf-8?B?Tmg3UHFJQ3V0VkRKVGJEWWlmRU1RMWY0NXZsWnowejNiK2FjcUtYSDJqTFF6?=
 =?utf-8?B?NStoUG9wTndDUHpvQ0dJc0pQZEQxK2Y3ZmRPRXZQelpYNU5DQnlqSXovMlJv?=
 =?utf-8?B?Mm5xME9WK2wxUWN1UThCQ2MyWm1OODFwQVppZlpxWU10ZnNxS0NPYU5ENWgv?=
 =?utf-8?B?dXNxZExQWW54ODg0cW9vTjdVeXJHd0NhRjdnNzFhNGpIZjR3YjJTNUxzQzVJ?=
 =?utf-8?B?UXJNNEx0MDluZWk3SnF2bU9tcHJ1UENrUW1lNXRIQmZnMjUrbjYvVzdYdmhD?=
 =?utf-8?B?c1JWNTQxbS9Ebi9ocnZoTUNJdktzN1RwTStVeFBGVkZQRW5KMjlNekpiV2ha?=
 =?utf-8?B?UFJ5TkNnQzdNKy83OTF5bWxCelFwb1BiaDJEUjJQWGFIRjRId2lnYWF6aGZl?=
 =?utf-8?B?ZitYRmNrM1AyaTNmNGdzVDAyRTVES2VSZWlWbHR4Y0xlNkNqWFhmSTRWZURk?=
 =?utf-8?B?K1E1YW9ROC84YkZLbkFjbkZUVDNOeGU1OHplNGZHeGNZcDN0VUtxR0tpN2Z2?=
 =?utf-8?B?TklBa2kxV0crWXdkSUhlUUVLWDBOTlRkcDNNWXdUbURidFo1VHplZG1RRmlF?=
 =?utf-8?B?U3pod0pXUlMvTGVTdnpaaCt4R2ZGZm5RMUtvek1Oa1lTK3NZNlY5UWhnOVdv?=
 =?utf-8?B?c3hrYmphaVpNdTA5QkxVZkZWcmhhR3pqVTNtSGl2ZGN6czJPeUZWS1o4OHhI?=
 =?utf-8?B?ZzJRZ1IyQlA0Y1BWTXJyN004UHp6Q0FzZ09OSDgzWk5qTWROcWRwd2NKcGYz?=
 =?utf-8?B?aDVJNlVVWktDOHpOZ20xRTJLWVI5Nzdhai9JLzVja3R6TmpJZXppaU0zYndv?=
 =?utf-8?B?ZnYzNEdkM2wxWXVEQWdVYU9mMEhQMk1WeEYyTTNOOEw0dElFTkxuTUVrbTQ3?=
 =?utf-8?B?SmRYVFE2ZFdmc2p0RGg0M3NxdUlEVSt0VnM0WFdmWDZUd3JoNWl1amRnRmUx?=
 =?utf-8?B?TVZHK0ZBZE1oRnFLS0F5QVNvdEtuQURodU41emxobjQxNzBlR21JWUUyaHBz?=
 =?utf-8?B?T1N2MWtpd01BUjk5blc4OWZEdlNhR3czak80MUpTWGgvaTg1ei9wdU4vUm84?=
 =?utf-8?B?YkRyWHVHdDhNNTF0THN0LzI0emxyZTdIazZIWUxWWkRkRWI4cnpLWnYxbndN?=
 =?utf-8?B?QzdmMldrVTBIbVdUV21FaGRSckFjY0M1eVhicVVIUWFZTHkxd01DL0dKVWNa?=
 =?utf-8?B?Q0hBcTloTDFhdUZTbWFTcVZRMTMwZndORW4wUUdWSGJVcEc5TWRMZmhtL3Jk?=
 =?utf-8?B?R2l1MjdDWEk3a2RwN2xzZ0FqS1dRMDBKQW45bXlxNS9yVHBpTEdTWVJqOUhD?=
 =?utf-8?B?dlVEcGsxdWl5WnlxYWR3ZFl4TEk2ZEltMEJxVDRVQmZxRHQ3REhxL0RpUEFv?=
 =?utf-8?B?Um84UXo5QmR4OWZyOFdhMCtoYTBOSzZYeEFaQnEwNjVnVWhzaEw3bk9kS01y?=
 =?utf-8?B?NzZMMDJuMlpxUVR0bURLbkRrYjJlbnhBTWErWFRZdEpNUFZ2ejVTU1dWVFpq?=
 =?utf-8?B?ZzE3Qithdkh1cE9weUhsS0owenlMSTcvMWIwMXhScGFWUURNejdLVk1DWDN2?=
 =?utf-8?B?UTlQYTVGaTdDazI3UjBBMUg2cDJwSmdZNlg1R0pKUVdYTzkvbTQrcngzcVIr?=
 =?utf-8?B?WGkwT2JrNkVLQ05oRVM4bGVLamhNRHc5cjRRZ0g3dGhQMVdaeDd6bFphdk9s?=
 =?utf-8?B?d2FxSXJyMnEwZlc2RERIQjlweGFPdlFoMTRDRThkRjBNeHIrRlhPY1ZIcVhM?=
 =?utf-8?B?ZWFNK0VRRkxnc3FZaDBueUpXbEdvRXJRU0g1QWpaU1hXU3lHcTRLOVFkSmhQ?=
 =?utf-8?B?SzhtcjZBWTdLRDJsUFZWNXR4V01welBJWDVJb2NlUGs1WDh4Wjdxbmh2a1NU?=
 =?utf-8?B?Y0d3OXFYUkJTRzNWc05vTndFNDlvQlpUelJ6QnpqeHJId0dPdXpwV3VUdjVD?=
 =?utf-8?Q?MOgPiv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3RLR1ExbWpBK3NvKzBJb0ZHUm43bkh3MC9OVE5aTkFobkl6MFk1dnZwTFl0?=
 =?utf-8?B?VitoS3BHVUpEeVNJSDN3ZWU2SUI1RjAySmlYaC9Rdy9uSE12cEI5b0lQbzZ0?=
 =?utf-8?B?aVkveUUydXFnbkdaaWVNUGdxdFpOZlVSbmNKSHRya0M2cVVZNFZ0U2EzdFVs?=
 =?utf-8?B?Z1BQSytmMG5sYytOOURsYWVmOVAyT1pxM2ZoQlRWbTNuRGY3cVdoeVFWV3kr?=
 =?utf-8?B?ampITXRacFNvQlZsZWtieC9OUVd5NElBRTRZL3l6R2xSODhQZWV6cFE1UWFF?=
 =?utf-8?B?aU9jaWx3YzR4K1ROYXFUcnFCZFZpS1cvV3lrUVhHdDYwWTVaaFQ5MkdVMHR5?=
 =?utf-8?B?Y2dXS0dUVGxoci9rY3BIT05zNFZtVGlNWVUyWVJldkFISCszazBDYWJ0emUr?=
 =?utf-8?B?VXh5bFFtZHZic2x2YTlNbHJQS0RMWDNQdDVDSDUrS1ZDdDdKZ09OQ0UwYndK?=
 =?utf-8?B?cHUzcmhURU9UNlgyazZKQVlIWk15UUh5QnJlNVJYY3AwQktqME1DZGN4Y01J?=
 =?utf-8?B?QlhnSjk5QTBpRGlMQTY3bnR1UDgvUHl4NmtxektTSXZzTUpyVlQ5bCtuVFpC?=
 =?utf-8?B?RmtrSUIvVzlTRTR6bHRlQXFBSzV4cHpqVzYvclU1eWpZVGU5UUFZaW5KZ2R3?=
 =?utf-8?B?SW5lcGluMmZnbHZuZGpKRko1QWFWQ3V0VnZ6c1BkamNGa0lJWS9aYThQOU4z?=
 =?utf-8?B?YTdPTlBMOHgzU0Foalkvc205WFUrZmFabWZka3FRa09FT1AzRzdXMFcxNUVr?=
 =?utf-8?B?TlJRVGYyRlllb29wVlpBN0l1RDFCNHBKTGxJZVBPTCtYbzhua3VCOVBhN1Jo?=
 =?utf-8?B?c2J1WlBqVUdOVDF3TXcwY3R1dFVLYVpRaWJ6czkvTjBpZjN6Q3NLNHptSUJF?=
 =?utf-8?B?cGhDV0VkSEV5eWZZYkI2aDdoaGk3NmF1UWJWUjJGelZrbFFDak9CaHg5U0lp?=
 =?utf-8?B?OUUwNDl0WFZPclBGdndjcEdEZ0tvalcyNS80Z0tRS3dFS0RHeE1HS1JGN2xq?=
 =?utf-8?B?NW1xUmRQTkRRL3dhVzRRMmx6TmVBakZVY0laM2hHTDJGcWQxV3Q0VnFUQkZh?=
 =?utf-8?B?QzUwcE9vaU5mb1R1SEhYVWIvS0N3TVY4TUFPdW5XZXhiK0RRUkovbWtHTSt0?=
 =?utf-8?B?TXhvYUc4ek5mRnJIN01JNXJLUU0wbFBzNjBWdjZydTNDbFFnbTF0bWFtS1di?=
 =?utf-8?B?cUV6cExwZnplTFJxY04yT3JjSUU3RHI4T2FkT0tFcmRBalUwWFBhYzZaUTQ1?=
 =?utf-8?B?a2xMdHJVRUpXS2o1c1NYdE5WR2NkL21PSVRMMWFZQlJCVXJINmdoNFVSbHYx?=
 =?utf-8?B?ejNqMXMwQ3hlYlBQclJPN015QUw0cDdsZkFFeEdtQjFlUjVSbVp3TTVXYVhu?=
 =?utf-8?B?VXorb2RMOFM0blJNdlNiSGhGSmJUTTh5WlhvSS9GM1YwUE0zcVRIaTIrcDBs?=
 =?utf-8?B?ekF3MVhkVVJVTzZqN1VNUGZMdDJpenhlcWtQNUxOQy9zRG8xSnlwNTA1b3Ju?=
 =?utf-8?B?THhLZWowWEtHdEZpcGUvY3FTSkJkcHJuWUVBYXFiOC9LU3duUkJ2OUdLVjZF?=
 =?utf-8?B?S2g3dEw1cmF4YXZSUnFhSFZrcVBBSEVBcjhXaWl4NnRPOVV2OEVJRWR3UmNT?=
 =?utf-8?B?bEw3MFIxTTZVQ0Zla0ZIM21HQzdYMW9BSEJLdkpjNyttOUdscjNlRGJrSkJm?=
 =?utf-8?B?OFBSZE5NSlhxTThqc0xUNEFqSUlkVGliRDBpakpzbk4zTnduZ3lNMkZEL0xv?=
 =?utf-8?B?ZTdKL3cvbHVtQ1VSckFibzNJR05OalEyTnNxSENBMFVHRzBxVC9aQ3N3VjNV?=
 =?utf-8?B?THhFTkR5RFp1T051ZE83ank0d3kzVE1VUlJvSDJtRXQyaTJuUWNVbnU0VkZp?=
 =?utf-8?B?ekw2cmtmUlBDaVZ4N0JIV3Z3WUpJQWFpdDRLa2lZeUk1dU9wYXdWeUVJWkN5?=
 =?utf-8?B?Zy8wNVUwdUdUT0NIMzNpZXU3VXZXSHBIMytwNTNxeTJua3FubnVGYmxlL3NV?=
 =?utf-8?B?NVRTajVTZXVHalIvZ01VNnNtU3BncjRDcm5GaG53NFBPWlVDa0Z0ZldsUVVn?=
 =?utf-8?B?aGd4S2M0blc4ZzJTRThlanBEUm1hbTNYYmtHa1psYnpYQnMwVjJYcWpvVzdC?=
 =?utf-8?Q?DSI8=3D?=
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
	mRcvMfN8vMkyziGuNGJPUI4av4Q8LZrW6kf1V6ZYIZkDjd0Jfn9NyND7ZPv4CIVqqGk6qrW9L76Khw1aRFuZNjkC7QI0wV8dMccqyKSJUzXhTEglevoDLoJ2GUN9YkWXzVW4qLSjUa5et1NxkeS+AZuIPPdCokVhqO2Z/FNo6ZW8HG4ivmzfziJNE71DoDO1Sb+yIKpCNEQ4NtLqWwX93NWXQakUrlbfjJF56NhP+oEOxElIU1iXjkf/AzKJyAGLsHrhDupLrUiVR13NLzAzfUSFp+PrjZiFtK7SzI7y9H14y3Wbjd/9uKGkMgVrApBOW1LHFrr42jf+caNlicQ1nqBWj9AMto8zT9yGhdV7vbay6JgXYizReJeFpa1nqJVy/KOIYGCvWhaInrsdMFJc0Nnf+LiVh+CxplZJeP7rWqrRBwIOb+mTPxZHrvmJfcMpFu5E9OfY1LtcMhyZpqsyjvODFzyDq+czLattc7VEEdTMkR3ahMhNXm/DiGM3Y3xKnujEtM8t58tN2OuxXHHQesBq8X72WsDqYzTKeYI9boZXr7U+qriV5WN020xkd1Iki+moKJvu3AuHzTREmBpsCdqMcfO/i7TUU128GmPjynNhWhLUida6FOECBNEa+mDL
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4a0810-918e-4d85-4009-08de08164748
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 16:01:31.1160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7Ph+WaoH81hSuaHOu22Hj5gB7aFkYBEK3aXQIgv/JaA1mZ77NLIllY+GA3bae8F4PNAWeknK4tjNGk7T0VQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB4555
X-Authority-Analysis: v=2.4 cv=Vuguwu2n c=1 sm=1 tr=0 ts=68e92ded cx=c_pps a=pRydOQwFKDU45SaoCSWz9A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=IJv9LcIfAAAA:8 a=v6hrLXizrL6l5v9g5QIA:9 a=QEXdDO2ut3YA:10 a=cmr4hm9N53k6aw-X_--Q:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2AorbwWji7B2 D7B1yEVwuDMecADSebct9I0TZiGshQbJYj9FnHMlwAhAWS56HoO9RO5eZQdVFhhOY9BIcQuRa0X /uUIfBKgjJNVz9HMbzRi5lV8+uSnt8rM+laVJY/hCaWvUiJe87P5tABWA4T5/THrdvYsydV5fjr
 fSoWUCEWyBrzcN/wJxHHgWNW9oXKTxwse+ce4abELxOGyUc45orkv2YA3Sh0f6u4DaCSBF+3/hB upqn3pyswmBw8vhuSD8O0kdfU1B0+aF5YUFe904gyGTEpKurD+hjbkEEBXblJrtamwiPqmIQ1KF b9Ynr8bi5FaRa2FQWNYTceiiHWf7/eLwTsxesqQNIkapU2i0oT607+KqdMMQvMfX16f493uUSwK
 u9C2sZNkLXhe0kQLT9cenxNoG7ch3w==
X-Proofpoint-GUID: GOpeudLOTEUyMrnRV04pRnJ3CiqMQWj7
X-Proofpoint-ORIG-GUID: GOpeudLOTEUyMrnRV04pRnJ3CiqMQWj7
X-Sony-Outbound-GUID: GOpeudLOTEUyMrnRV04pRnJ3CiqMQWj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lIFBlcmNoZXMgPGpv
ZUBwZXJjaGVzLmNvbT4NCj4gT24gRnJpLCAyMDI1LTEwLTEwIGF0IDE0OuKAijE1ICswMDAwLCBC
aXJkLCBUaW0gd3JvdGU6ID4gSSBoYXZlIGlkZWFzIHRvIGFkZHJlc3MgdGhlIGZhbHNlIHBvc2l0
aXZlIHJhdGUsIGJhc2VkIG9uIGZlYXR1cmVzIHRoYXQgY2hlY2twYXRjaC7igIpwbCA+DQo+IGFs
cmVhZHkgaGFzLCBhcyB3ZWxsIGFzIGlkZWFzIGZvciBoYW5kbGluZyBzb21lIG9mIHRoZSBjb25j
ZXJucyB0aGF0IHJ1bm5pbmcgPiBjaGVja3BhdGNoLuKAinBsDQo+IE9uIEZyaSwgMjAyNS0xMC0x
MCBhdCAxNDoxNSArMDAwMCwgQmlyZCwgVGltIHdyb3RlOg0KPiA+IEkgaGF2ZSBpZGVhcyB0byBh
ZGRyZXNzIHRoZSBmYWxzZSBwb3NpdGl2ZSByYXRlLCBiYXNlZCBvbiBmZWF0dXJlcyB0aGF0IGNo
ZWNrcGF0Y2gucGwNCj4gPiBhbHJlYWR5IGhhcywgYXMgd2VsbCBhcyBpZGVhcyBmb3IgaGFuZGxp
bmcgc29tZSBvZiB0aGUgY29uY2VybnMgdGhhdCBydW5uaW5nDQo+ID4gY2hlY2twYXRjaC5wbCAo
b3IgYW4gZXF1aXZhbGVudCkgYXQgYnVpbGQgdGltZSB3b3VsZCByYWlzZS4gIFNvbWUgb2YgdGhl
c2UgbWlnaHQNCj4gPiBhcHBseSB0byBBSSByZXZpZXcgYXMgd2VsbC4gIExldCBtZSBrbm93IGlm
IHlvdSB3YW50IG1lIHRvIGVsYWJvcmF0ZSwgb3IgaWYgd2UNCj4gPiBzaG91bGQganVzdCBkaXNj
dXNzIGluIFRva3lvLg0KPiANCj4gUGxlYXNlIGVsYWJvcmF0ZS4NCg0KQmVmb3JlIEkgcmF0dGxl
ZCBvZmYgbXkgaWRlYXMsIEkgZGlkIGEgcXVpY2sgY2hlY2sgdG8gc2VlIGlmIGFueXRoaW5nIGxp
a2Ugd2hhdCBJIGhhZA0KaW4gbWluZCBoYWQgYWxyZWFkeSBiZWVuIHN1Z2dlc3RlZCwgYW5kIEkg
Zm91bmQgdGhpczoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4zZGQxZDBjMWYx
NWE3YTdjNDE4ZjIwZWJhZmM5NzE5YWZjMWMyNzA0LjE1MTA4NDA3ODcuZ2l0LXNlcmllcy5rbnV0
Lm9tYW5nQG9yYWNsZS5jb20vDQoNClRoYXQncyBhIHN1Ym1pc3Npb24gYnkgS251dCBPbWFuZyBm
cm9tIDIwMTcgdGhhdCBhZGRzIHN1cHBvcnQgZm9yIHJ1bm5pbmcNCmNoZWNrcGF0Y2gucGwgb24g
dGhlIHdob2xlIGtlcm5lbCBzb3VyY2UsIGludGVncmF0ZWQgaW50byBrYnVpbGQuDQoNCkl0IGxv
b2tzIGxpa2UgaXQgd2FzIG5vdCBhZG9wdGVkLg0KDQpUaGF0IHBhdGNoc2V0IGFsbG93czoNCjEp
IGZpbmUtdHVuaW5nIHRoZSBzZXQgb2YgaXRlbXMgdGhhdCBjaGVja3BhdGNoIGNoZWNrcyBmb3IN
CjIpIHVzaW5nIGEgY29uZmlnIGZpbGUgdG8gY29udHJvbCB0aGUgZmluZSB0dW5pbmcNCjMpIGFs
bG93aW5nIHNlbGVjdGlvbiBvZiB0aGUgZ3JvdXBzIG9mIGNoZWNrcyAoc28gdGhhdCBwcmVmZXJl
bmNlcyBvZg0KaW5kaXZpZHVhbCBtYWludGFpbmVycyBvciBzdWItc3lzdGVtcyBjb3VsZCBiZSBh
ZGhlcmVkIHRvKQ0KDQpNeSBpZGVhcyBmb3IgdGFja2xpbmcgZmFsc2UtcG9zaXRpdmVzIHdhcyBh
bG9uZyB0aG9zZSBzYW1lIGxpbmVzLg0KMSkgZGV0ZXJtaW5lIGEgbGlzdCBvZiAibXVzdC1oYXZl
IiBpdGVtcywgdGhhdCBldmVyeW9uZSBzdXBwb3J0cyBhcyB0cnVlLXBvc2l0aXZlcw0KMikgaGF2
aW5nIGEgd2F5IHRvIGRlc2lnbmF0ZSBncm91cHMgb2YgaXRlbXMgdGhhdCB3ZXJlIGRlZW1lZCBh
cyB0cnVlLXBvc2l0aXZlcw0KICAgICAtIGJ5IGNyZWF0aW5nIGEgcHJvZmlsZSBvZiBpdGVtcywg
c3BlY2lmaWMgdG8gYSBzdWJzeXN0ZW0gb3IgbWFpbnRhaW5lcg0KICAgICAtIGhhdmluZyB0aGUg
J3RydWUtcG9zaXRpdmVzJyBwcm9maWxlIHVuZGVyIHRoZSBjb250cm9sIG9mIHRoZSBtYWludGFp
bmVyIG9yIHN1YnN5c3RlbQ0KMykgY3JlYXRpbmcgYSBtZWNoYW5pc20gdG8gdGVsbCBjaGVja3Bh
dGNoIHdoaWNoIHByb2ZpbGUgdG8gdXNlDQoNCkluIHRlcm1zIG9mIHJ1bnRpbWUgaXNzdWVzLCB0
aGVyZSBhcmUgdHdvIHdheXMgdG8gImVuY291cmFnZSAoL2ZvcmNlPykiIHVzZXJzDQp0byBydW4g
dGhlIGNoZWNrcywgd2hpbGUgc3RpbGwgbWFuYWdpbmcgb3ZlcmhlYWQ6DQoxKSBhZGQgYSBjaGVj
a3BhdGNoLnBsIGludm9jYXRpb24gc29tZXRpbWUgZHVyaW5nIGEgcmVndWxhciBidWlsZCAoZWl0
aGVyDQpiZWZvcmUgb3IgYWZ0ZXIgdGhlIGNvbXBpbGVyIGludm9jYXRpb24pDQogICAgIC0gTXkg
aWRlYSB0byBhdm9pZCBvdmVyaGVhZCBoZXJlIGlzIHRvIGFkZCBhIGNvbW1hbmQtbGluZSBvcHRp
b24gdG8gdGhlIGtlcm5lbA0KICAgICAgIGJ1aWxkLCB0byBpbmRpY2F0ZSB0aGUgbnVtYmVyIG9m
IGNvbW1pdHMgdG8gaW5jbHVkZSBpbiBwYXRjaCByZXZpZXcgKGRlZmF1bHQgdG8gMSksIGFuZCBv
bmx5DQogICAgICAgcnVuIGNoZWNrcGF0Y2ggb24gZWl0aGVyIGEpIGVhY2ggY29tbWl0IGl0c2Vs
Ziwgb3IgYikgdGhlIGZpbGVzIHRvdWNoZWQgYnkgZWFjaCBjb21taXQuDQogICAgICAgLSBPUiwg
IG9ubHkgcnVuIGNoZWNrcGF0Y2ggb24gc291cmNlIGZpbGVzIHRoYXQgZGlmZmVyIGZyb20gdGhl
IGdpdCBpbmRleC4NCjIpIGFsdGVybmF0aXZlbHksIGFkZCBhIGdjYyBwbHVnaW4gdGhhdCBwZXJm
b3JtcyBzb21lIHNldCBvZiBjaGVja3Mgc2ltaWxhciB0byBjaGVja3BhdGNoLnBsLA0KICAgIG1h
eWJlIGNhbGxpbmcgY2hlY2twYXRjaCBpdHNlbGYsIGJ1dCBtYXliZSBqdXN0IGRpcmVjdGx5IGNo
ZWNraW5nIGZvciBkZWZpbml0ZSB0cnVlLXBvc2l0aXZlcw0KICAgIGl0c2VsZi4gIFRoaXMgd291
bGQgaW52b2x2ZSBtaWdyYXRpbmcgdGhlIHRydWUtcG9zaXRpdmVzIGNoZWNrIGZyb20gY2hlY2tw
YXRjaCBpbnRvIGEgZ2NjIHBsdWdpbi4NCiAgICAtIHRoZW4gZGVhbGluZyB3aXRoIGNsYW5nIGJ1
aWxkcw0KDQpJIHRoaW5rIHRoZXJlIHdvdWxkIGJlIHRvbyBtdWNoIG5vaXNlLCBhbmQgdG9vIG11
Y2ggbGF0ZW5jeSwgdG8gcnVuDQpjaGVja3BhdGNoIG9uIHRoZSBlbnRpcmUga2VybmVsIHNvdXJj
ZSBvbiBldmVyeSBidWlsZC4NCg0KQnV0IG15IGdvYWwgaGVyZSBpcyB0byBoYXZlIGNoZWNrcGF0
Y2ggaXNzdWVzIHNob3cgdXAgbGlrZSBnY2MgZXJyb3JzIC0gZWFybHkgaW4gZGV2ZWxvcG1lbnQs
DQphcyB0aGUgZXJyb3JzIGFyZSBtYWRlLCBzbyB0aGV5IG5ldmVyIG1ha2UgaXQgaW50byBwYXRj
aCBlbWFpbHMuDQoNCkkndmUgYmVlbiB3b3JraW5nIHJlY2VudGx5IHdpdGggZ2NjIHBsdWdpbnMs
IGFuZCB0aGV5IGFyZW4ndCBhcyBzY2FyeSB0byB3cml0ZQ0KYXMgSSBpbml0aWFsbHkgdGhvdWdo
dC4gIEJ1dCBjb252ZXJ0aW5nIGFsbCB0aGUgY2hlY2twYXRjaCBjaGVja3MgdG8gQyBjb2RlIHdv
dWxkIHN0aWxsDQpiZSBxdWl0ZSBhIGJpdCBvZiB3b3JrLg0KDQogLS0gVGltDQoNCg0K

