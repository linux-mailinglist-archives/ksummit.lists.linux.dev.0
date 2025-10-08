Return-Path: <ksummit+bounces-2442-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DABC688F
	for <lists@lfdr.de>; Wed, 08 Oct 2025 22:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 838334EE39A
	for <lists@lfdr.de>; Wed,  8 Oct 2025 20:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D1327B347;
	Wed,  8 Oct 2025 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dAXn8Xyq"
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B772773E3
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953907; cv=fail; b=VODLnBVpBt62S0UWWiT1RpRo222e+HjVfsxFJchSVUNqsMyIDh55bCBd/zXFmFg+A/jsBZe8KxB5OFSM6d1hShzdJqhs9YkkeLAW3IvJFQ7Y4+/X+007t7e1DCwr+9cNBxHHWNbFt7LLp7bk1uh6qkP839qNMAsK+Ve7IFlgLpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953907; c=relaxed/simple;
	bh=Nnp3FxM7qgsM5BLFTbxjDgaAYFHgFu1Pt0z9920l4ZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jh/Z08UY5y4EUSXTeGA1KSTEVChGGGx4QcJOqz9u0ia9vh6bziiWYbr5qxhClJGqpvtONjfUJoJ1roejV5q0m2wkRAzC1lmFXbovl8lggigSyGOETjBLgPMv1pujBi0BtfzbSPjBN7MeF5IyHr06kzzH7g9SkAqsmPQTpAs2rHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dAXn8Xyq; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598JbZG8022909;
	Wed, 8 Oct 2025 19:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=Nnp3FxM
	7qgsM5BLFTbxjDgaAYFHgFu1Pt0z9920l4ZA=; b=dAXn8XyqZkSewatojQj2MCP
	eVElQDndU8tFQbVd8ame85kV6IEX1Cc+IcQU7KttiBHgGKWFLjJ9EWo1Wbgh1I1C
	BnjxxCUtCLEskmYNmDcv0pq+H2B1fO6/r1BICrM/hAyVc6Wzqagbmx4WQZ1hRcpO
	SMXi7WFdyuXuwQ1XD7hlgSApohE5zueRVSZJEYMor7IHaxfmSQ5uuZJ0AiG4tOfM
	pvJfXgRFiGXav1N6ur3M9Mc2qYBVS02SW8nSfu0GLbxJFucBq/AwW/GPxLgWCCaL
	F9ai41kZG1FTaYMwPR6LnBaA62oW1Giz9vYsgrGb7WhnNO45E3wGYF45dzRRAPw=
	=
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5sr3g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Oct 2025 19:50:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFZ2dS59mvWhJR9I3UvTCWQ5s5evbV7zYdOIwAxxR7FljBkra6JekK82Vgmat7IEPvzs4dB8y1i93ny5F4NL6InuPC6Doy6yBjmyTV24+fWcwiuVFm6XZhtF5yzQfEzaiyYNwt9tUhacsyCvdYOXcAQxvHaQvoWjMd/EYERjWb5AkyfrvkxIm5hpcQh8O/IQLU1f8lGhUDIBQ6vpuDZ/MtIdQ+7lfUvrbCS+AfcmeFiDfNMYEKjN/5C7JUL2qUCWrOwixrGphmwoZk2Hg4eHYsDOLm4GMXJY3eiKtBA26JNL5FDrz9M7TXUyd/poGmXQ0HVa6Or21Gycv2skQcmL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnp3FxM7qgsM5BLFTbxjDgaAYFHgFu1Pt0z9920l4ZA=;
 b=VkgwkW6bnqCgbgMshYgoxz9m/ocgnVGBtUP+06jnCEsx2rt34rk/vxycXitTtAF4c82hI8IpN8tyOepcpPp3BeUQpk/PWXzaQ0WE+ml64drrj6uf6uVVwkw5ryUeS3biwaqxbCPV140cyDCgecx9FykT83SF6fxeyEEenzQno3ixvfwgGSQXqA6EHNZLdzkytxwymdYp0rzh38cMfa2YE7mu1OX/yoQAOd091UpnTBEbhn5IwhEDreqBhI9QFl98frQFbwAtQqLFFw6uCGWhP89ow549h2F3cJjEHbgHZ7CL3xbUlMVDNON2UJTP/e5XFe7iJM9aj7EBBshVBqqjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA3PR13MB7488.namprd13.prod.outlook.com (2603:10b6:806:466::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 19:50:32 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 19:50:32 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        Andrew Lunn <andrew@lunn.ch>
CC: Chris Mason <clm@meta.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei
 Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Topic: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Index: AQHcOHXIPqH6JcPVFEqei/F1014v5LS4nPWAgAAF4ACAAAQLYA==
Date: Wed, 8 Oct 2025 19:50:32 +0000
Message-ID:
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
In-Reply-To: <20251008192934.GH16422@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA3PR13MB7488:EE_
x-ms-office365-filtering-correlation-id: 99a04995-2474-4ced-4963-08de06a3f0b7
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VG1uNk9LNWRUdzB3UWFXSFNmdEErb25EMVh0MnhvYkU5UlRGd2tCU1UxaTlx?=
 =?utf-8?B?NkR2L0M1UDMrVy8rcHUxcW03WXFCTUhuTmtPbUtPZ1Vzb29rbFViTmI4bnA5?=
 =?utf-8?B?WjZyMWJuVDhHU2ZuVFlMNm1FVlNiUXNJNUhnKzJaREZVQW9aWTRLZ0xvNlVo?=
 =?utf-8?B?T1RleW1vcTlYWUQ3Z1U1Nkx0S1RRTFJTcjR5T21uZFBCQ2V0OHdEZ1Rxcnls?=
 =?utf-8?B?Yi9xbysrRThpYVJtOG9laWt1Z2dtdUhOU1pNQXJaSU5vWFRDdG5KRTJXYkpM?=
 =?utf-8?B?VURhUFd1SnE5ZjlsdUIyTWpITHRTK0VTQnJBdWhEUHdhd2s3WmEyQzB6OUs3?=
 =?utf-8?B?dkV2Ny84SlZpS1ozU0EzL2trUk9MK3k2V1Z4QW5CTE9mRXJEd1RNcG0vcWRW?=
 =?utf-8?B?SjBwSSsyMER5TmRzOVN1V3ppNHF5N0k0cHhObGtxOE1lVTBDZGNJT2dBaExS?=
 =?utf-8?B?U1NEeFloK3FVTGRkS3VCcjRJQVQzblZpMkY0WWo3YjV1bU9ObHBZbjNSL1dU?=
 =?utf-8?B?ems5bEtwRm9jMDRnUXhST1Jtdk9qa3BmRU04cDVwbXB0YU5rV3o2MkJJVTZG?=
 =?utf-8?B?cVJ3ZVREbGMyMk15ZzZZVkNPa0MvZ08xYVFZRjhUSFJmQUNESzRmelJZY1Mx?=
 =?utf-8?B?Z2pWbWVrVlF3Vy9CdnNPNVF4bHZnNmE1cktzU0p5Nzc0UGh3TTZFWDBMKzNN?=
 =?utf-8?B?UjN5NlFvMzNCUWtiY1JlWE1kWXFDdzdKVEVBQmdFZE45anFVdjlIM3duemln?=
 =?utf-8?B?TkdwNnJIUmRtM2lreFhLMXFEQXhlK2tKZWt3amJ2VTF2L0VSYW8vR084dmRl?=
 =?utf-8?B?MFRLeUVpS05rZnkxR3V3UXczSGM3YUQ4YVp5enpEcC9KMXNGckhQUEF5cWFm?=
 =?utf-8?B?NU9wSkRTb2lRbklpZXdwTDNWcndWaGZ0d1RxeEZmdjVmb0R4ekFzN0lBN3Jv?=
 =?utf-8?B?SzhWZkZDZjdaQ0VoYmZEd2F6cjA3Vk9FSEdZUW16YWdEUWt4ekgzOCtlek9C?=
 =?utf-8?B?NVBTT3dYZTRYcmFvSGt6OE5NbGxxck43azlGZ05YbG1tcjFtSGNMeFhUV1dN?=
 =?utf-8?B?ZGorRWhZRU91QkxRWm9LdWJQOGttZFByZFMxaTVlaTNVc2hBSlZ5YWZFdHVa?=
 =?utf-8?B?VmRjS0RpM29nZnlaYWp3VHhEeXg4TDNiVUZldkF1K0RjbFAyanZmbjBaMmdm?=
 =?utf-8?B?SHJhTTRRbENqR3k3ellMQjg4Y1dvVGV2WWpwSW9wdzJ4N2EzNHVyb3hhdmRT?=
 =?utf-8?B?dVlUdzlzOFdNT0wvd0hnOXp6RWpiUXpBR2VsQ3FNaisrYmNiQmNWamNiNEN0?=
 =?utf-8?B?QmpiU3dEVU84UmRudnZxRHhwZHBRNFB3ZU9zOFE4UVdmbFg0aEtDcHVLZEkw?=
 =?utf-8?B?ZTlxNGcrMnBtK3ZoUU04NXAzSzVpNUlJaTRTNUpYdFkxYnIvZW9ybVJCNXMr?=
 =?utf-8?B?RUdsbHBPYlVpQkxOKzBHV3RNQmVuQ2FKa1c3OGluYlNqNGdQQmdNcVc5WTFp?=
 =?utf-8?B?eDZJdUU2VjBONGFycmhZeVVXS2M5TGdKbjM2eGVkU25RcTQ3TmtPTk5tTjhj?=
 =?utf-8?B?K29XWFRXVUxvSDhkMlZzbTBpa0xPVWNmMnFUa0VKeVFpY0NqakY4VjQ0dVNK?=
 =?utf-8?B?KzVtUlhnSkZ4dG1xeUZHdDh4OVdvMXdsczlLUmt0Z1pkWXhHU2haTkwrNDhz?=
 =?utf-8?B?cVJsdmVnRGdpUmpoMTFuaVFSL1Q4UFd6eWxMWVI5VjQvWjB2VXB1bFNSalhq?=
 =?utf-8?B?RnV5d2pVaE93QmxFL1J4UlFLSVN1NjBoNUJEeWE3azdOWU9VTWNvcDhFdkE4?=
 =?utf-8?B?UzdoTEhlS1hhdUdyWS9tM3doczc5Y2t2UkFhN1lBRUJKOENEWllRbWFPMVZU?=
 =?utf-8?B?Wml3RTQwWm1KRjZ4cnhMR1duZkIrRjhYYlMxVzlOejd3akkrUzdEd1JXSGpw?=
 =?utf-8?B?dFNqWEJRdTR5ZUNTZGlCWXYwM2wxT0R6QWNiZ1g5cER2VzdPeTlkRlhiWVI1?=
 =?utf-8?B?SzZ2em9nS29oRnN1dlJtMVhLaGJvNVhZNnB0bGx5SzZDa0NhODMzaXRiTlRi?=
 =?utf-8?Q?XG8HCk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFFER1lEcmNGZW5kSUdqMUNKNFc3dkZmUFgxWGVpcWR4ZjRyQldDVi8wZjdz?=
 =?utf-8?B?cUF6RUNsZHdWZHQ4aXRuU1ExYXZ0VGgzaTVHZW1WcGg5ZXJmU2RTYjlUMnZT?=
 =?utf-8?B?dHdEWG9lYXVQSmlJWjN4d0pWckJ4Snhrb2lIRkFwZHdHNlU1Skk5NHdrWnpL?=
 =?utf-8?B?dkNYVXlEL2lJS3hhN1JGbG5mNmFFQnBFV3hheHlrek5ubG9vRkd3TkFUcEMv?=
 =?utf-8?B?a2o3RklySXlBZlE0cTZIb29HdjBmeGNLMFNJbXBkZDdqVytCK2ZsdS9tNU9V?=
 =?utf-8?B?VEhTN3FsMXBQeHgrMi9WMnhvblptL1NLUnRMWWVPempJZmNqSGpVbElsc0ph?=
 =?utf-8?B?ZElFMGdUVzdqUTVGb1RXaDZSakRmRWhnelFXK2VNQ1BSSmZQVUo4OWVrcjl2?=
 =?utf-8?B?Z1hUd09OYW1LeTNnMnJvak5iMjMzZjlNS3MzeExaVG5mVW04czJDR1RCem5l?=
 =?utf-8?B?emZBZUNVRjY2S01tOGlha2p0OUZmdkJpaWZzNmN3bVJGL2RCZjgvQTVhREhX?=
 =?utf-8?B?aDNYTlRFOFpXRWJDeDdmMGVSWU5hNks1Y3o5OHIzU3hib0ZkY3VQaGZ3ei9T?=
 =?utf-8?B?QlhSVFlKUUlQUG1Da1BWN0s4M2lVdStuMVEybFdpOHl4OTF4Q09zeGtBTTBt?=
 =?utf-8?B?cGN5VVhVbEg4V3k0a1c3MjhEUjk0OGpmWkM4TGc3cUNlRlREcVdpMUxJV25L?=
 =?utf-8?B?Q01NMDU2czFIdWRDYkRqbGNNWFRCaDkvMll5WUhZdTd3dkZzRHVWYjBQaW9o?=
 =?utf-8?B?dXFZSmMxRWZGQXVubmI4RVhRK1U4c0NhdXpKKzhwMG9LdUJ3L1BoUE9hU1k5?=
 =?utf-8?B?NUE1cnNndUMrOW9LZERwdXdvNngyYThEUmMrK0RwNlRNMi90ZHUvNWRrUTRQ?=
 =?utf-8?B?cmxWKzFYTnlUUGM3V0lxS2xBTnVqeENSMEs1d0tXUFJjZHRRcTVZdWR0OXVs?=
 =?utf-8?B?MzNvL1N5YXprZmNZVWFRVVRZR0RuV0JaMGREQ1J1MEN0RjJZaWRSQktWQW1G?=
 =?utf-8?B?QURsS01vaDRNWHpIZS9QV20rK2VIWUdUTHo3cU1OUFdhZEVUZ2VuTmE5U3Uv?=
 =?utf-8?B?SFhCSk9rbkdESVFkWlkxQVZ6TUwvZkMxSjBGV2FSTzlzSDluOC9aMitnRWFD?=
 =?utf-8?B?bGsrb0lBMlNjdUd1eHFxbVVETHFvbmdiMzZtbjltWms4WWhqOThsTlo5UkhE?=
 =?utf-8?B?RGllNnBMU25WN2FuNzFoQmdrTVMrRGVUaHVON1FGNERmL1gvT2R2OWJxS3hh?=
 =?utf-8?B?RmhEMHBTVnFRaE01aTArZm9yckpwK0haMVZLYnlzU3pJWjF2MjN0ZTYvb0Rr?=
 =?utf-8?B?b3FZRC9NOTNTNkIvdjBUZlNoeWFIS2Q3bzhkdnhKNUVGZWw2UzVFS1I1MzNH?=
 =?utf-8?B?bi9NV25seS8vOHBjV2UvZ1FLR2s4Z3hnS0lJZVBwdzZVM0piUzZnNVZKRVJX?=
 =?utf-8?B?bDdUV01GM08ydUgwc3FzaTM4ektIOXpCZmtUaTJ3Z1NnVzk1WFdCOTcrSmF6?=
 =?utf-8?B?SnRzTndzT3FCdWJSVytYR0lFeDdzbUlXM0xnQlRhV3BVaFRBNlBkS0VtWkww?=
 =?utf-8?B?NkM1TUxacHRYcDBseWEzYUNhTU11cDV5TExsNXpNbXovVmpQOFJJc01EZGdV?=
 =?utf-8?B?YU1MeUtVUUJjN0dLMEhxcmwvNEdjOVQ1QU8vZTJHd0FudWk5dHhaQm9LMVMr?=
 =?utf-8?B?bWZtQkQ1em0xS0ZGTUUyL1RkTkNQWW9NdmhCQ3pVRDd2K0d1ZmhTeTFRUGtk?=
 =?utf-8?B?TENXRERabUZSSWZYV2RRaXhFUGd4QmlyUEJNYTZycUNQU01iV3dKTFE0ZVNr?=
 =?utf-8?B?WnFEcks0cmtjQWZhems0ejhQUisweHRaUDF4YTJaVTV2R1g1QTlLQVFyWUR5?=
 =?utf-8?B?cTdEeUFndVc2QTB1bmtQUHkyL3ZpMkdQYW0yend5dnhDOWROT2EzQkVKRW9V?=
 =?utf-8?B?QldJeUZ3cm5hNytQbk8xODJQRlFJd0V4cC9MbEtENVdaaXB1aFU2VWRMUGMx?=
 =?utf-8?B?Tmc4WlBHUWJOQXZETzQ2VjhxZXduUmVRQnAzZ3J3eEQwZVNvNllqWjkwNmdR?=
 =?utf-8?B?bTVjN1hkTm9pMWI0cXFENUpUWXVJdjdnVjBWNS9od2tocHVKU1JsaTBCNWR6?=
 =?utf-8?Q?y9WU=3D?=
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
	1FnbyamIFQQ7pKbTcTSZpLQW9hRIRs6JMcmbEEYe0CZEn9rHcKHM39+VD1k/atxS33ONJdCloWldTWB35chSU0a+9cx0wTdvQ2045SHEmHRL9+3sR6TnQIZlI6OnZ9X3YPzWFUHD3zOgLpl3ZLDRd69IfJjDVLLrlsWXRxSGK3kYGpEmrcjpCAHj74BNkDi1u7aU8aQoqXdvG+NftSSuCkE4IBS12exPW9/8EoIZF8vyMai0ffVY/hknbp5ev5gpRWC97HTRvY9SlKMb9dZBYVALNv80MAaMKH7AKDmUyN/TKmnqXOIRTzSsvZ9g0OaB8I1FQCgXO8xNCuyOzTcX3KyEw0gDOOGPDVbRns0s8nysrq0X8/jvtx+hdcyV0ruCkGzp5uGHX0Hl2ezH4LD4zdOFGdpJm01ZOxJcBIOkhvywXdbYKf1NMz8ZiLJyydIRuqfIRB+hV+g2dC94tCb7H9HRzbLRNmDA9jKyxnaSghF92kNmsIj1vkvApEypJOg1SG8nKjo/pubO5bMTh0YFdyqtcs5ym+W/l5UGSVbsdDfBDc0O28lNASykPwWTfMq7uPDdp+SgtNmaGl6uofsI9ht9XbDolITSOk7moTi555x5P0ACyoTbI4l2vYhhj9UC
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a04995-2474-4ced-4963-08de06a3f0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 19:50:32.0626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RQzwhOeRDAUqvMehlwq9849bVuUHfOnUZbBL+/iChZsi8g+avSNJHqc2IBrk892GwM9bgL60YJCqPQ3pY0M8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB7488
X-Authority-Analysis: v=2.4 cv=Vuguwu2n c=1 sm=1 tr=0 ts=68e6c090 cx=c_pps a=QTU/OWcW2qKRxVucCLrmDQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=P1BnusSwAAAA:8 a=LVre36k8L68pV_9ps_AA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6EkPC6mDOpUa EwHHPqCkYidsPFES7yf1CjHl4huXWIkSodibaGCi+1/8wqkNuW8eVlqez1WgLk5HbpcfoiBOl+C E0Gqx7Gp4/YMH70jc37/I22l+RBvR9wt3GTTyWotgNJS97ytOGdAL5Zjy+hqAivog44N2OaQEBN
 he5MuB2psDgywtO2hZcP5CxwNhstbzwoDFtod6yj2ZGY3piLWO4edIkinP8p7VsFlQV+mZm8wXd XA4PScC3OeGPZ/P/oT7pEQ+sAsMhf1GUMCQTe4x8aMZFBEJei8xtJuLvbOa2Tw2fiZFkLvAlexR ZNgn85bqxpUomyRDnHmbF9/9suWmgD28B1MNHSsoHga7e07cWgtOE0N6ulV0rD0YO68AhEgwVPq
 xjYJQWJLu+MtcT0PJFKiK8uxXgyFKg==
X-Proofpoint-GUID: t34HqOTLJIcb7rQYgVkgx0LgKbQj6H_y
X-Proofpoint-ORIG-GUID: t34HqOTLJIcb7rQYgVkgx0LgKbQj6H_y
X-Sony-Outbound-GUID: t34HqOTLJIcb7rQYgVkgx0LgKbQj6H_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBPbiBXZWQsIE9jdCAwOCwg
MjAyNSBhdCAwOTowODozM1BNICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4gPiA+IE15IGdv
YWwgZm9yIEtTL01TIGlzIHRvIGRpc2N1c3MgaG93IHRvIGVuYWJsZSBtYWludGFpbmVycyB0byB1
c2UgcmV2aWV3DQo+ID4gPiBhdXRvbWF0aW9uIHRvb2xzIHRvIGxvd2VyIHRoZWlyIHdvcmtsb2Fk
Lg0KPiA+DQo+ID4gTWFpbnRhaW5lcnMgd2lsbCB3YW50IHRvIHVzZSB0aGVzZSB0b29scywgaWYg
dGhleSBwcm92ZSB0byBiZQ0KPiA+IHVzZWZ1bC4gQnV0IGlkZWFsbHksIHdlIHdhbnQgdGhlIGRl
dmVsb3BlcnMgdG8gdXNlIHRoZXNlIHRvb2xzIGFuZCBmaXgNCj4gPiB0aGUgaXNzdWVzIGJlZm9y
ZSB0aGV5IHBvc3QgY29kZSBmb3IgcmV2aWV3LiBUaGF0IHJlZHVjZXMgdGhlDQo+ID4gbWFpbnRh
aW5lcnMgd29ya2xvYWQgZXZlbiBtb3JlLiBTbyBNYWludGFpbmVycyBqdXN0IG5lZWQgdG8gcnVu
IHRoZQ0KPiA+IHRvb2xzIHRvIHByb3ZlIHRoYXQgdGhlIGRldmVsb3BlcnMgaGF2ZSBydW4gdGhl
IHRvb2xzIGFuZCBoYXZlIGFscmVhZHkNCj4gPiBmaXhlZCB0aGUgcHJvYmxlbXMuDQo+ID4NCj4g
PiBTbyBpJ20gbm90IHN1cmUgeW91ciBnb2FsIGlzIHRoZSBjb3JyZWN0IGxvbmcgdGVybSBnb2Fs
LiBJdCBzaG91bGQgYmUNCj4gPiBhIHRvb2wgZm9yIGV2ZXJ5Ym9keSwgbm90IGp1c3QgbWFpbnRh
aW5lcnMuDQo+IA0KPiBUaGlzIHJhaXNlcyB0aGUgaW50ZXJlc3RpbmcgYW5kIGltcG9ydGFudCBx
dWVzdGlvbiBvZiBob3cgdG8gZ2V0IHBhdGNoDQo+IHN1Ym1pdHRlcnMgdG8gZm9sbG93IGEgcmVj
b21tZW5kZWQgd29ya2Zsb3cuIFdlIHJvdXRpbmVseSBnZXQgcGF0Y2hlcw0KPiB0aGF0IHByb2R1
Y2UgY2hlY2twYXRjaCBlcnJvcnMgdGhhdCBhcmUgY2xlYXJseSBub3QgZmFsc2UgcG9zaXRpdmVz
Lg0KPiBSb2IgSGVycmluZyBpbXBsZW1lbnRlZCBhIGJvdCB0byBydW4gY2hlY2tzIG9uIGRldmlj
ZSB0cmVlIGJpbmRpbmdzIGFuZA0KPiBkZXZpY2UgdHJlZSBzb3VyY2VzIGJlY2F1c2UgbG90cyBv
ZiBwYXRjaGVzIGZhaWwgdGhvc2UgY2hlY2tzLiBJJ20gc3VyZQ0KPiB0aGVyZSBhcmUgbG90cyBv
ZiBvdGhlciBleGFtcGxlcyB0aGF0IGhhdmUgbGVkIG1haW50YWluZXJzIHRvIGF1dG9tYXRlDQo+
IGNoZWNrcyBvbiB0aGUgcmVjZWl2ZXIncyBzaWRlLCB0aHJvdWdoIHZhcmlvdXMgdHlwZXMgb2Yg
c3RhbmRhcmQgQ0lzIG9yDQo+IGhhbmQtbWFkZSBzb2x1dGlvbnMuIFN1Ym1pdHRlcnMgc2hvdWxk
IHJ1biBtb3JlIHRlc3RzLCBob3cgdG8gZ2V0IHRoZW0NCj4gdG8gZG8gc28gaXMgYSBicm9hZGVy
IHF1ZXN0aW9uLg0KDQpNYXliZSBpdCB3b3VsZCBiZSB3b3J0aHdoaWxlIHRvIGFubm90YXRlIHBh
dGNoIHN1Ym1pc3Npb25zIHdpdGggdGFncw0KaW5kaWNhdGluZyB3aGF0IHRvb2xzIGhhdmUgYmVl
biBydW4gb24gdGhlbS4gIEkga25vdyB3ZSdyZSB0cnlpbmcgdG8gYXZvaWQNCm92ZXJ1c2Ugb2Yg
Y29tbWl0IHRhZ3MsIGJ1dCBtYXliZSB3ZSBjb3VsZCBhdXRvbWF0ZSB0aGlzIGEgYml0LCBhbmQv
b3InDQpyZXVzZSB0aGUgJ1Jldmlld2VkLWJ5OicgdGFnIGluIHRoZSBjb21taXQgbWVzc2FnZS4g
IEkgY291bGQgZW52aXNpb24sIGluIHNvbWUNCmZ1dHVyZSB3b3JrZmxvdyB1dG9waWEsIHdoZXJl
IGEgbWlzc2luZyAnUmV2aWV3ZWQtYnk6IGNoZWNrcGF0Y2gucGwgQU5EIGNsYXVkZSBBSSByZXZp
ZXcnDQp3b3VsZCBiZSBncm91bmRzIGZvciByZXF1ZXN0aW5nIHRoZXNlIGJlZm9yZSBodW1hbiBy
ZXZpZXcuDQoNCiAtLSBUaW0NCg0K

