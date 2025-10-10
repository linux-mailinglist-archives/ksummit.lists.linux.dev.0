Return-Path: <ksummit+bounces-2483-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD03BCD8BF
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E163AB185
	for <lists@lfdr.de>; Fri, 10 Oct 2025 14:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BCB20E334;
	Fri, 10 Oct 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="WdKlFRwq"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3C2F1FE9
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106927; cv=fail; b=ngh8vSca3CZHqHcpYYAqpIeHe4ch9x5n3IdasJeSdc6fCtuNtgR4C0s2FguNpaY3NxrzJbuXhK4pN2O54H6xrbbtz4XPd0uZv2uECjEHfjNJknrznOrwxqO6n8uRjMihf7o1g4AW3aC3C+NM3AhTFVRvy0OoYYP13CtGZXfsgjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106927; c=relaxed/simple;
	bh=zNKb9fOXXDYbUxVaA/9dXGKppEwxY52RfJgvYP54nZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U9SLYGWjEJQhZlJChNlrxYNhRgQzEZ+I7+k36w0st2GWC+X8/vQQUhW6zRuBI0pkUO2vSJeeuemJM5DkF3T4ficM2d0PeCIk06VzA6oGxx8rg73jwcBbKjSYeXbqfoUJmVp0YU4Y0NHKsR7v6/PGzdtwFd/8zN/LeGQfnmfjFrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=WdKlFRwq; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A3esjQ011729;
	Fri, 10 Oct 2025 14:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=zNKb9fO
	XXDYbUxVaA/9dXGKppEwxY52RfJgvYP54nZc=; b=WdKlFRwq9Za0rOR0Ic4o0mp
	UwX89w85wBCoz1KCXVejtYOD+CB4I9bDXZxTOozchbVOaNbN00rIUtVvWrl28yFQ
	HPHlQu/WyvDF9MfA2HpWI0OhWaYrvFeai98xaxKAk7stxLrdCHQGKypoLFQRzfcj
	/DVNv7pr1a0Y8iRUzEiNFHMWSfRSeGwHlsw4R/jrOn7Mw4pOm12PsEf4r1VzhFaF
	4/tE2fcXTycXkazGj2lpvkBIrhpYZXigJ+5QTrOR2AkAruw7ocwwyvspI5j8l080
	+Tw8ISOsGMphmJb/R5PXDS9ED4Tes8G7HbKwym2zBDROGtfOt9qUyd9jfbD/lRQ=
	=
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5rjmxs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Oct 2025 14:35:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdXeUQBmDFXtc0QAjSKRTnLFBoAmo01ADs+UdOQaucjtNLSAEazkD+DQ4JyUmmUJ5Toqq0puFSsUopji44PSh2KNcxo0QtSw5UuwaY8sR2zMFnWuq00Uk/cBFo+OUFzBo861lC9sAdqtWLWghoUF8ToAUiVJngQRtadTMclh/8A8jYsHw/hbXTVmCFoDzthLs7uy1WotX5cFq8OO7rLvhS6WVOxHXZaCzdKnPyZ3TJT4k8fVn9vjDKJRb839BXCWC3FGTC0cYhnotKjE148+S3YEJVI42/vNgIH5ld/fXz5coCHkuMxqNEhTyT87AKQpCusIhK95pio0tudZZq8kAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNKb9fOXXDYbUxVaA/9dXGKppEwxY52RfJgvYP54nZc=;
 b=lDsduCwEzP7uabDQ+yhrLz/fCrDh3+QfPI0LiadvAEHN39XkjLwlzTSj39CW1MLuP2WXeYVwsY0yyDr2bUI86Up9Ogsr0hmUabkR/MuZz3da/SmN59ezCAzlj4no+Tep2Grr0DjFNBpFlKyJgHvtc3sn50MGN17Nw6Ng3IL5K3SEBjgX4+3hvr+bbsFrmhY7Ywzrkqj7EVEUApI39qeT24D09ow6i906+Ai1ts78i+KYiOfkxrD2OSVwoqtojAIqLW31gUhDjZCNHgsLaLJBmmi1jcsPVQ0u+C448dqW2Z91dSgs+/HZxUSNenei+3Y+1ucSfbsC+PAmCLfTOhLQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA6PR13MB7037.namprd13.prod.outlook.com (2603:10b6:806:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 14:35:10 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 14:35:09 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        Chris Mason <clm@meta.com>
CC: Andrew Lunn <andrew@lunn.ch>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei
 Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Topic: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Index:
 AQHcOHXIPqH6JcPVFEqei/F1014v5LS4nPWAgAAF4ACAAAQLYIAADRAAgAAAdwCAANTMgIAADeCAgAFuJICAAD9LgIAAKxhQ
Date: Fri, 10 Oct 2025 14:35:09 +0000
Message-ID:
 <MW5PR13MB56323A65FE6578E281801B55FDEFA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	 <20251008192934.GH16422@pendragon.ideasonboard.com>
	 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	 <20251009091405.GD12674@pendragon.ideasonboard.com>
	 <d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>
	 <20251010075413.GD29493@pendragon.ideasonboard.com>
 <3996fd684c497c7bcb4ad406ff3cec99df7180df.camel@HansenPartnership.com>
In-Reply-To:
 <3996fd684c497c7bcb4ad406ff3cec99df7180df.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA6PR13MB7037:EE_
x-ms-office365-filtering-correlation-id: a2a3157c-95f4-45bf-c2b4-08de080a370a
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vi83T0tCV1k3TG5wTEJFT1N6NjVqaHlvNWpZZHhVQnJzVzVZSHpoQUhxYVhV?=
 =?utf-8?B?OHJGVjA0eXBPTjZTVU1QT0JicnU2VWVDbysxRXd1eWl6S0RWRlNwbUI3RmlC?=
 =?utf-8?B?SmRzaHZMVjNIS3RzSFZZOG9TQUhFeHBTNEhXTThNWGFvZDI2V0NNeFZqNzVJ?=
 =?utf-8?B?VEl4cExSTUtOSWtzK1o3bDJjLzBab0s0UzlTZmZ1Uy9JV0Q4ZzVjNzF0d0F2?=
 =?utf-8?B?dmJGTkNiMnFsaWJ5V3NWcFF3VitNSTd2RzkxVUpjU3FTRUZ5aFgyUlBYd0xX?=
 =?utf-8?B?UGgrSndMTUZuR2RNZFVRTHowLytHd0hqRHYxMXhWWGFmRFZ2YUJwck1mbmM3?=
 =?utf-8?B?a0FyS2JWa3N5NHZWS09SdW11bnZVWHlJWGlZc0F3QVVlcE80MzhVZXd5SGtw?=
 =?utf-8?B?MFk1THhqL2U3dGkrN3FzTWZUYzhSQVpGa25rYnlwQmtuc1ZJYUw2R0ZaNW5U?=
 =?utf-8?B?KzFpWU0ra1NFZ3ArajNUVFc5MUcydXFBekZRb2Q0cFh1a1lsdTNZZGU4enNE?=
 =?utf-8?B?UzJSVkRjZkcxaE1IanIxUy9LYUY1YjRtTi9qQUY5ZGZTV25OTCtmdE5iK2oz?=
 =?utf-8?B?bHZkY0VZZHBqMFJMSnpxMEkrSmE0V1p0amdzeEVRc2cxRVBEOWhsL2lKNHlL?=
 =?utf-8?B?cStpcXViUjZ3Vm40QnRtbndhcnNsUUJLbFhKeXJLQk5SZmY2ZXFwaCtSNk83?=
 =?utf-8?B?NER5UTIxUFBDd3lwVENXdC9nanlOK2ZRbmJ0bjkweHZsRkVNUk1EVnlWTHlm?=
 =?utf-8?B?bUxtYjA0clA4UzlPR2pJS1pkY3JaYXhJUFZPMWpFalk1MGJwODFYeWhNRVBM?=
 =?utf-8?B?TlYzY2pnc2I3blBOMFp0QkM1NjJ4dlgrNkNxdnFON00zTWlYZXNMK1RPL0xJ?=
 =?utf-8?B?T1p5MDd3ZDkxdkxSei9TNmhzZjlCL3ZvVWx2U2Q1MS9TOXd2NXR0Q3J1MHFN?=
 =?utf-8?B?N0RJTm4vVVM2bXRKVm1kKzdTNkFYUGFjUGVUbGg0YnFQT1Z4c1hQaDBtcU5u?=
 =?utf-8?B?dDh0cnBVemlQWU9mbnJnaHNESmREZE1PMWU5NUVqTUJRYXRZQjErVVhoY0xJ?=
 =?utf-8?B?RVVVRkhPSUdEdm15WExYVVFDMzNkRWdxcmhqZEJ3S28xL29OVGhoSlZPSTQ3?=
 =?utf-8?B?WU85eXZmbzBBMTJQM1lOeitOUlJza2tOZXRyWkQ1Q2NzZnJPWXZsejJ6UEM3?=
 =?utf-8?B?dktIc21DcnZwYmV0RkIzRHFzVTNyYktLSjh3RE1HTXU1NmFaMVNKVXN5b2tD?=
 =?utf-8?B?VlZ3WU9sNWd5Z0x5cHVCQjYvWEVxM0VkVjY1NlhGbjcvRkl0aldNdkZtODVF?=
 =?utf-8?B?TUZublpQTXlleG53VmRyTGJSMU8wTEhiT21vRjdxRWNVR1FCb0hxZjRieTVE?=
 =?utf-8?B?Rm5nTWJVK1E4RFBJNzE1Z25UZzVIdGM5OGVzTzE1WUV0ZldnSzJ2M2pmdUN2?=
 =?utf-8?B?N1J2WGJKbDc5WHRmZWhtU2IrM21lR2dxU1hmbTZTNkVFd0wvSXh2OVQ1UVBR?=
 =?utf-8?B?ekRaUzRxMUNqTWQzbWNycloveTgyaHBDWEtkOGtIQTNwQ2ltbmVaZXpsUE1u?=
 =?utf-8?B?UGhYNHdDaFRreXZZbEJqa3RGOGNRQzNObTVsUmpsRUY0ZzRhdzgwdVpnaTlJ?=
 =?utf-8?B?d1l3MC9DVSs1eVl4WDdhMEpmREtZbVIwZ0l2SDhPRk5zTitoZ2VKQlNMUzY2?=
 =?utf-8?B?QjBQbVhLMDJwVmUrSUUxd1RINjU5VGpGVGZneG1RZy9jTXYxdldHbktJRk9Y?=
 =?utf-8?B?T2JCT2preEVIRXNubUVVK2N4eC9iZUFnQURUclNCNFdpVkVndW51ZHpuTWtJ?=
 =?utf-8?B?eHJsMmFjRWRQQ2QwRWNmMTV1alhrd2ZnNDN5dGtiVXB3ZUp1bkJaVGVvVGVW?=
 =?utf-8?B?SU1LVVNFSGh6Y1JlODNRcVMzMlVnTzJNbW94a2JVWG0xenpuem8zeWFRZWNP?=
 =?utf-8?B?SzA3K2NCWmlwZ3M2Skhpb1lUUStOMDA0dlZGT2JmaS8xQUdoSWhsNStibWl5?=
 =?utf-8?B?VWhQVzhZSU92Ti9pMkpONXRKRUlpTjRPc2NNckkvVzJJUkJpTStsQUZrSEph?=
 =?utf-8?Q?RzGkgM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3I3ZDhzbjRvTXI1dkF5aHBpeGVNZXdqbmhXbFRXUmdSc1B0Q0lXTytGYjNW?=
 =?utf-8?B?R0lpRUNiM3BkSmNFNTM0a1QyWkhtZzhsMUdOZHNhMFdFT2RKaWVqbG5iMEhX?=
 =?utf-8?B?dU5jbCtpK0tveWJVbVlmbnZtOHlrSnU4NlhYNzRISFZKTjM1ak1lSS9xbTM5?=
 =?utf-8?B?VVlLd1czWThHcklrWG1Ha1h4NHhYSU9NUVQyTmI0SUhqeXVLZENaUkpDUjVB?=
 =?utf-8?B?OUVXK2IyYXBaQnUzemo3VUNPOFA1c0JJTi9xNHlZTXpVT2FpdUl4TFMxZDU3?=
 =?utf-8?B?QTJrYWdNcGtWeWgvM1VuVHpMMkFxRHNiRVhHSVBObDhYZWd1WEVDQXl0cTJl?=
 =?utf-8?B?NU01S3hwckF1L1NvR2l2bmF6eStMOWcvcFhjRmxHMTJQTCswdm93UytrYTBM?=
 =?utf-8?B?N1BnZzdCY1F3dWZWK3Z4My9saG9pQVowSGJmRGdwVE1vdmJkdnAxT3duci9T?=
 =?utf-8?B?bHBTL3VSdWpZOXA3eWpGNDJlUWZqUGlJU2Z0MnNvY0R3ZTkycE51TEdOb0NX?=
 =?utf-8?B?am5KTUs1QysxWnE4RURhYjRpWXhjZXk2UDZyQU91cVBQODVPVDVjVDREbUhG?=
 =?utf-8?B?ZE1QRk5vQkhSOFNOY1d6SUYrcGFGc0NuNnBPMkRLQ1NBcnRNcUgvU3B5Y2FU?=
 =?utf-8?B?UUZaUENzOVM3T1JHTmEvMmNzcEp2YW5TcVIrRDgzM1lodlBjT3FaYTVFckZT?=
 =?utf-8?B?QTNiemk0U243QUlld25nRldnS1lpZzByOFExVExkSlh2SUxlOGRaRm9pcURT?=
 =?utf-8?B?T2thUUhqOXd4dGQvOEx1S3d4S2Fxc2lCQUthY3NBWnlydDFIczRYa3hNQTJ6?=
 =?utf-8?B?NExmaUR4djFKVWNKUjNwemd3djd5RnZ0cG1RZzRQdVpLVXY2VG9jNjJEYkJx?=
 =?utf-8?B?WTNua0xycFhkZjNUVTErdmVoMnJnQjhsODRHaXpxQ1YraVhEckFselNlMUN6?=
 =?utf-8?B?ZlFlZk1HdDRaTkF6bXRiR3hQNmo0Wnd1NUg1VkZNbGJ2T3htYXg1bXVES053?=
 =?utf-8?B?ZEVyeVp1SDRRZmxEWi9kOC9iQnIzN1B0Tms3WXBSZi84V1FiOUtNVHUyMjI0?=
 =?utf-8?B?dVRDWmRqaiszVnBpaXgxRFpWVW1PVWNsY1gxVSs1L1VxYkZoQlcvRC9EcnZS?=
 =?utf-8?B?ZURNSEhRY3pTMUsreGFzSEN0WU1OVG1aV3dxMGFmOUV1SzhEVHh5Vm9lMWw5?=
 =?utf-8?B?d3BKNTRuR0lqRmtBMWU5V3FUbHArREUvRHhCS05sc1hCRmlaVllQYTdhVVQ5?=
 =?utf-8?B?SDVPQTNiNGdzRjB2WlBpY3VMWTdQVkFxeTAxT29XaGxuOWt2bFZDellIaUcv?=
 =?utf-8?B?UFJLb1M5UHJYdDFwdUxLK0YzQlQ1SGp1L3g4UUxJRTV6Mmp2TE5yUjVKcGNE?=
 =?utf-8?B?RFQ5OEpodDUxZis4STJqRVhVbmhYRVRqVWswTGprdWxHNUhTVFZiM0tlZDJT?=
 =?utf-8?B?aTRUVUJhckRMaUNVSWQzWDZBQmRCU2RqUFVTZDd5cWczMjdYZVVtR042eXlJ?=
 =?utf-8?B?eVFORXMwdkxVdnJic3EyaXNwYW0yRGwvNUNTekVJdGxJY1lUNW1ab2VjUExI?=
 =?utf-8?B?ZVQ0RUtWdWtNTzhUZFNMN1I4ck9hVnRya3pTV1ZSenpwYzY4blppNldpSktu?=
 =?utf-8?B?N2V5YTNUelZzM0grVEJFdVppbVdDeTJ6bE15d1FSSEZwaDBNWkZTaVJ0SDQw?=
 =?utf-8?B?UVg0akdmaWloOVY5eTlFT0N3S2Y4SE5YY1REVzAzNDIvWi9HRnhsVHdYOUtN?=
 =?utf-8?B?U2dzNm1pTG5GZWZ1RHhmQVd0RW9vdWMxQ1NqR1g1WE5WQjc1Um45bWFsQWUr?=
 =?utf-8?B?MU1EQytPWDBiZ2RzZXNQNzdRZUFIU01TQ3hqNUMrMjREdGlLVm1JQkdISGQ4?=
 =?utf-8?B?SVFDazhWbms0TUwvbExRd3BGTTV2azdlUklPdTRYa2xxS1RtUzhoVDFaNEhR?=
 =?utf-8?B?ZkVCNk1vYzQ5Nnc2a1Bvb0VjN2J0dXA1RTlxUURHUUpxQW1zMEN4dzNpcW9F?=
 =?utf-8?B?eUhIekJIOVNTcFJlVkUwZnA1Ni9XVWMyQWZNZEpLeUxodW1EY3FNWk1wVUY0?=
 =?utf-8?B?M2NJbDRNNkdvZnBqSndtTEE5bTNWUTJybDBmYU9Ea0w5T2xnVDh6VXh1eERI?=
 =?utf-8?Q?8qNI=3D?=
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
	gmLTbPsupmlBQBbikAK/Qfj/k9n+ZiwTSvtAskoJMsPFu3OVsDFHiNZ3R0AP3lW7j07+J8uXBP+ao9cfXQgkzpISLJPYjlDAM4m1SSAsdCJL6dWg3Iis5Wd4/2HFPyZzhqUyZ6ZAD1rshURcCfl4P04rTuHi9lvmF1zbp1x43E1YItfknRen/uPBHIP6o0SrILjwTwbm7bM+w+xw/AUpt1lJAltW7JDmDCVdoxzL2K+6O7g62jpcB0b0PFZGQ4jFrIQi+7vgFkaaytwdG6B3hSVcPz8wgvjVQ1b7rYylUKdQZejWqDnSlfyKjr5WT+LLCnz8t2h8vhSXjrfrxpaI30PgxHqDJolUBQbd2Ooq8ODSbufH+nBXK7jb1qA7XZbJc0ubTEWux4uS8NoQUO8bY4dniBd5Xp7mvORgFPADB7P4yzVxloYPhnJL9s3Rsu2Ko19iZFovtJ62YfSIB6bZxVcwLkjEAfMxChClV1cgHI3kw3JpyjC2eQABgQVmGB98gKb41/iIPjOZmBjBBWfYCybV4xFul1/cQz4e5GezUuSiwcWfJK0bHSc59z1MMtClYi+s+z115l6SEvSEsx3OqrWI/u9f/g7JTaMpjHFGcc1dwrDcRTRs1rC5F+EpZohn
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a3157c-95f4-45bf-c2b4-08de080a370a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 14:35:09.9028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lb3mgXFKghNYWF469PxBzXp7rXE+0coe71zGQstK21F9ytumnKsbF7/hi8rQ6BMwVUTP52Ta/KfpsagdNwH9kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR13MB7037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+hcu9lK0NzzR /OeL7cKAvFAOJZS+cm92lXYK1s1VKyN12ugDLwL0w++yy+jLJNzT3eoFpD9Ol1SyflQMtZ2g6cn siiwsuzGyLff0SEmn0FLOwBBww36vyFY1FA2UKPiZ/NbjrA8GAu0A2o5lOeSD6j2VxRRL3atFF2
 jjJ40i63NmWlI2Z8YIyF2Hdlg0kTqeq0TNXzuFoPifnZsH6Ke+Ct6RD7j0e9HIpc3/kLhyJ6ZEs f9Arx5cThDHkmNhkQToX9OcWF5VAhUzKmKgqivOTjy2p12ESHFusx7XmwycuKFuYX4+FghpOt7g Dt0kBe2tghQ0UbXQmLBPil9tdjmL0S83JEvUa4lJ5Nxis9A05KtUSqQtIctqIQKIH/WCXYy3GhC
 rNBxQf20VfBJPVdePrFezzLinUS7tw==
X-Proofpoint-ORIG-GUID: iV84Xy9b59Yodz_0sx7GKR2PSs9SkOFh
X-Authority-Analysis: v=2.4 cv=DodbOW/+ c=1 sm=1 tr=0 ts=68e919a4 cx=c_pps a=4uekZJdLSFpbpqOwIdQ1dA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=bLk-5xynAAAA:8 a=fC8d1XEdiLYxjej60CsA:9 a=QEXdDO2ut3YA:10 a=zSyb8xVVt2t83sZkrLMb:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: iV84Xy9b59Yodz_0sx7GKR2PSs9SkOFh
X-Sony-Outbound-GUID: iV84Xy9b59Yodz_0sx7GKR2PSs9SkOFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgQm90dG9tbGV5
IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPg0KPiANCj4gT24gRnJpLCAy
MDI1LTEwLTEwIGF0IDEwOuKAijU0ICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOiA+IE9u
IFRodSwgT2N0IDA5LCAyMDI1IGF0IDA2OuKAijAzOuKAijQ1QU0gLTA0MDAsIENocmlzIE1hc29u
IHdyb3RlOiBbLuKAii7igIou4oCKXSA+IEknbSBub3QNCj4gdGhhdCBjb25jZXJuZWQgYWJvdXQg
YmVpbmcgbG9ja2VkIHRvIGEgc3BlY2lmaWMgdmVuZG9yLCBidXQgPiBtb3JlIGFib3V0IGJlaW5n
IGxvY2tlZCB0byBhIHByb3ByaWV0b3J5DQo+IE9uIEZyaSwgMjAyNS0xMC0xMCBhdCAxMDo1NCAr
MDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiBPbiBUaHUsIE9jdCAwOSwgMjAyNSBh
dCAwNjowMzo0NUFNIC0wNDAwLCBDaHJpcyBNYXNvbiB3cm90ZToNCj4gWy4uLl0NClsuLi5dDQo+
ID4gSWYgd2Ugd2VyZSB0byBwdXNoIHRoZSBidXJkZW4gb2YgcnVubmluZyBMTE0tYmFzZWQgcmV2
aWV3IHRvDQo+ID4gY29udHJpYnV0b3JzIHRoaXMgd291bGRuJ3QgYWZmZWN0IHVzIHRoYXQgbXVj
aCwgYnV0IGlmIHdlIHJ1biBpdCBvbg0KPiA+IHRoZSBtYWludGFpbmVycycgc2lkZSAoYmUgaXQg
b24gdGhlIHNlcnZlciBzaWRlIHdpdGggYm90cyB0aGF0IGdldA0KPiA+IHBhdGNoZXMgZnJvbSBt
YWlsaW5nIGxpc3RzLCBDSSBzeXN0ZW1zIHRoYXQgZmVlZCBmcm9tIHBhdGNod29yaywgb3INCj4g
PiBvbiB0aGUgY2xpZW50IHNpZGUpIHRoZSByaXNrIG9mIHZlbmRvciBsb2NrLWluIGlzIGhpZ2hl
ci4NCj4gDQo+IFB1c2hpbmcgdGhlIGJ1cmRlbiBvbiB0byBjb250cmlidXRvcnMgYWx3YXlzIGNh
dXNlcyBtb3JlIGZyaWN0aW9uIHRoYW4NCj4gYnVpbGRpbmcgaXQgaW50byB0aGUgQ0kuDQpUaGlz
IGlzIHRydWUsIGJ1dCB1bmZvcnR1bmF0ZWx5IHRoaXMgZG9lc24ndCBkbyBhbnl0aGluZyB0byBo
ZWxwIGNvbnRyaWJ1dG9ycw0KcGVyZm9ybSB0aGlzIHN0ZXAgdGhlbXNlbHZlcy4gIEl0IGFjdHVh
bGx5LCBJTU8sIGRpc2luY2VudGl2ZXMgdGhpcyBmcm9tIGhhcHBlbmluZy4NCg0KPiAgUGx1cyBp
ZiB0aGVyZSdzIGEgY29zdCBpbnZvbHZlZCB5b3UncmUgbWFraW5nDQo+IGNvbnRyaWJ1dGlvbiBw
YXkgZm9yIHBsYXkgd2hpY2ggcmVhbGx5IGRvZXNuJ3Qgd29yayBvdXQgd2VsbC4NCj4gDQo+ID4g
IE1heWJlIHByb3ByaWV0YXJ5IHRlY2hub2xvZ3kgbG9jay1pbiB3b3VsZCBiZSBhIGJldHRlciBk
ZXNjcmlwdGlvbg0KPiA+IGFzIHRoaXMgaXNuJ3QgYWJvdXQgYSBzaW5nbGUgdmVuZG9yLg0KPiAN
Cj4gV2VsbCwgZmlyc3RseSB3ZSd2ZSBoYWQgdGhpcyBiZWZvcmU6IHVzIHdpdGggYml0a2VlcGVy
IGFuZCBtb3N0DQo+IHJlY2VudGx5IEt1YmVybmV0ZXMgd2l0aCBTbGFjayBhbmQgZXZlcnlvbmUg
aGFzIHN1cnZpdmVkLiBCdXQgc2Vjb25kbHkNCj4gdGhlIGZhciBtb3JlIGxpa2VseSBzY2VuYXJp
byBpcyB0aGF0IHRoZSBBSSBzdG9jayBidWJibGUgYnVyc3RzIGFuZCB0aGUNCj4gaW52ZXN0bWVu
dCBkcmllcyB1cCBjaGFuZ2luZyB0aGUgd2F5IEFJIGlzIGRvbmUgKGRlZmluaXRlbHkga2lsbGlu
ZyB0aGUNCj4gd2hvIGNhbiBieSBwb3dlcnN0YXRpb25zIGFuZCBodWdlIGhhcmR3YXJlIGluc3Rh
bGxhdGlvbnMgbW9kZWwgb2YNCj4gdG9kYXkpIGFuZCB3aG8gdGhlIHBsYXllcnMgYXJlIChwcm9i
YWJseSB0aGUgcG9pbnQgYXQgd2hpY2ggb3BlbiBzb3VyY2UNCj4gYmVjb21lcyBtb3JlIHByZXZh
bGVudCkuDQo+IA0KPiBIb3dldmVyLCByZWdhcmRsZXNzIG9mIHdoYXQgaGFwcGVucyBpbiBmdXR1
cmUsIGl0IHdpbGwgYmUgd2F5IGVhc2llciB0bw0KPiBjb3BlIHdpdGggaWYgd2UndmUgZ290IEFJ
IGluIHRoZSBDSSByYXRoZXIgdGhhbiB0cnlpbmcgdG8gcHVzaCBpdCBpbnRvDQo+IGNvbnRyaWJ1
dG9yIHRvb2xpbmcuDQoNCkkgdGhpbmsgaWYgeW91IHB1dCBBSSByZXZpZXcgaW50byBjb250cmli
dXRvciB0b29saW5nIChsaWtlIEI0LCBvciBhcyBhIHRhcmdldCBpbg0KdGhlIGtlcm5lbCBidWls
ZCksIGl0IHN0aWxsIGFsbG93cyBmb3IgY2VudHJhbCBjb250cm9sIG92ZXIgdGhlIG1lY2hhbmlz
bXMgYW5kDQpwb2xpY2llcyBmb3IgQUkgcmV2aWV3LCB0byBiZSBhYmxlIHRvIGFkYXB0IHRvIGNo
YW5naW5nIEFJIGNvbnNpZGVyYXRpb25zLg0KSXQgc2hvdWxkIGFsc28gbWFrZSBpbnRlZ3JhdGlv
biBpbnRvIENJIGVhc2llci4NCg0KQnV0IGl0IGxvd2VycyB0aGUgYmFycmllcnMgKGUuZy4gQUkg
bGVhcm5pbmcgY3VydmUpIGZvciBjb250cmlidXRvcnMgdG8gbW9yZSBlYXNpbHkNCmRvIGl0IHRo
ZW1zZWx2ZXMsIGFuZCBtaWdyYXRlIHRvIGEgbW9kZWwgd2hlcmUgdGhlc2UgYnVncyBhcmUgY2F1
Z2h0IGVhcmxpZXINCmluIHRoZSBkZXZlbG9wbWVudCBjeWNsZSwgYmVmb3JlIHRoZSBwYXRjaGVz
IGFyZSBjcmVhdGVkLCAgYW5kIHVsdGltYXRlbHkgcmVkdWNlDQp0aGUgInN1Ym1pdC1mZWVkYmFj
ay1maXgiIGNodXJuIEkgbWVudGlvbiBlbHNld2hlcmUuDQoNCldlIHVzZSBhICJidWlsZC1mZWVk
YmFjay1maXgiIGN5Y2xlIGZvciBjb21waWxhdGlvbiBlcnJvcnMuICBJdCB3b3VsZCBiZSBuaWNl
IGlmIHdlIGNvdWxkDQptb3ZlIHRvIGEgc2ltaWxhciBtb2RlbCAoaW5zdGVhZCBvZiAic3VibWl0
LWZlZWRiYWNrLWZpeCIgY3ljbGUpIGZvciBjb2Rpbmcgc3R5bGUNCmFuZCBzZW1hbnRpYyBlcnJv
cnMgYXMgd2VsbC4NCg0KUmVnYXJkcywNCiAgLS0gVGltDQoNCg==

