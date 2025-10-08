Return-Path: <ksummit+bounces-2449-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ED5BC6B41
	for <lists@lfdr.de>; Wed, 08 Oct 2025 23:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F61434B3BD
	for <lists@lfdr.de>; Wed,  8 Oct 2025 21:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E012C11F5;
	Wed,  8 Oct 2025 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="SfHAfAKL"
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9D26E6FD
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759960098; cv=fail; b=ppaXZw3CAYwCcLZLwKbvHklsZvvobm/WNFm0pTpWg8etYc4AQNFWO/k+dwSxwEz+QF3UPVcXeB/1C/sLRmDdTSw8iP/sLp8lDI5U+cnzOCSwJPCl33vEoaaBphJX1YrGHDJzR0+4uhK65ZcECfte04BXGR00zT3XBu+D3YNNlfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759960098; c=relaxed/simple;
	bh=Vu9+38je+sBs9IJiPpG/SkDBR1D0n5Rjh9wzFvLrMbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e/DS7KNfC/IQkGFrN9TQG6T7BfTjf+6aA0rJnSVhwrrwKaUQ36DR52sIgmHUiWT8fqHDjzemu6gpzAGtAe5a1U0b0gOsY+iUoDkFXhmHf1KnG8BGF51AJnVsnbo+mHGpjmuYBevE7PXaHT9EW1yFZKcPbFIt7Ye3O5teQDkqLJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=SfHAfAKL; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598KEBVN010589;
	Wed, 8 Oct 2025 20:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=Vu9+38j
	e+sBs9IJiPpG/SkDBR1D0n5Rjh9wzFvLrMbI=; b=SfHAfAKLWSsFp/xYjX3HKGv
	OhBRoecmEgVFqI/dceERdh/766wgHuAdhYKS48wva1drZaJn8N1rsPgTAjHiARIu
	lMohuj6vhJ+EZ1IxsDdMX0sArybSvT2sjeoOP3Pd3x3Jf9LPv+En4lDOuLLFNKvJ
	p4tRDmxzLJs3dDIsDMUA2QyHG4P0tqTFBY41DVjWkHARMybCLlAPlUBm1QdByrrW
	Whyi8Hk3B/3x40RQvUN0xKl97cmRzjRnaqkjVxtSGTjV8l9y9Jp6YC84kszTcpBx
	D4InJTJ3hgUFnm1UeUs44XRxOwtPd8Af3zclpRuzF5lsRcGNT2iev+MAT/4OFgg=
	=
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5qg4ty-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Oct 2025 20:38:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWDEGJoInwsWJTaC18cvV9eDnNvDu4OKkjDVRe5w1aN0s3zuFCXgXuMcROfUGx99qVUc/l3f32RtNRtI5+gonAVsNSoKi4GM9kK82DuXu0rKHqk9AI1YO0xe8xpnm0KzLXglR3aUY02JZhyluWLznEKBNXDamFMQRH0jSQ062RenKqtnhnoCtcTLtzz2woRh181Dx2pya3VR7yCvpjzspDldNIrhop2O1CzCHVBqnEJZ+XKg/JCVEMvEut4Kb5GaCJcIZfYlAB2dKjiMjMpMBqlvf9YIowHe7Nx0aNWaUglwELZ6FhJg8aqlstl21LG8RLBVDRkf5lEHs5kozURN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu9+38je+sBs9IJiPpG/SkDBR1D0n5Rjh9wzFvLrMbI=;
 b=J7BRGw17bItjE/FpuuLnARvyMkQaHW2/BNCTXWpCAs/PLe46Egis/Ti9VtUBbWXhI830QR1aGnQJ33GzCByjs8bI2q9DWN42BNGVq78Ep+Q/xf+cwMRcrV82NM4vDlQhnY+vJVwsiinHjE9u3zDe4vhUsvhN9nzvTX+tswKdfirgq3cBYO2CZQ2YUvbITN06qeGqZnN3arvDN4JcgCdGqmKmC4J/m8HNbiAfmF+P3ljp/OlkvhrJuO0B5dMjm4ciOwwgRMMNNQjNmcIl/Ab74S5fqiXbD5pzOT9L4LA769zXMpCMmgTdo8scXgViKFJHM0kEsdCASCFU81DZ5ygVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA3PR13MB7318.namprd13.prod.outlook.com (2603:10b6:806:460::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 20:38:45 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 20:38:45 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        Andrew Lunn <andrew@lunn.ch>
CC: Chris Mason <clm@meta.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei
 Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Topic: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Index: AQHcOHXIPqH6JcPVFEqei/F1014v5LS4nPWAgAAF4ACAAAQLYIAADRAAgAAAdwA=
Date: Wed, 8 Oct 2025 20:38:45 +0000
Message-ID:
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	 <20251008192934.GH16422@pendragon.ideasonboard.com>
	 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
In-Reply-To:
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA3PR13MB7318:EE_
x-ms-office365-filtering-correlation-id: 437d2900-25c9-42c0-b0c5-08de06aaad42
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VlNZZ0kwUXp3c2JWOTZ0eGJTc0hUeU1NOTQ4TTRxUjhrellBczJMb0JOVzJu?=
 =?utf-8?B?dVBXR0JqWUxDQWpndGNvZzBCWDhNQWJUUkpEemRXOUkrcGZEZFpFQ3dyMEdI?=
 =?utf-8?B?MWZTNStrTUxFWjNrdDJERXZYV2ZzdXJCOGlJTjZUb1VSUVc4bEZTem1vOFdh?=
 =?utf-8?B?RFB4cFlJakg5WG0rQXM4MnR6OVNCY0ZpekZvUDFkVkNia2xFSHZGdlZxNDY0?=
 =?utf-8?B?V3psN0hYNVc5ckl3dVBoQzhXaWd2T1loSkJodURNZEVoeUwvMFE0L0N4ZHgv?=
 =?utf-8?B?WkJtdUVBYTZZLzQreERRMzJxbk9JZ0huVmZHak1sYWJRS1dlWlNzUHIwaWRt?=
 =?utf-8?B?ZHZxaWVoWjFsUEJrT1NWZHJZbytjbEw0c3diZ1E2ZmVwVDJoQ0p2SEdnK283?=
 =?utf-8?B?Qit4RmwyQWJaTTdRdkR6eXoyd1MycDkycWdCMVVpeFEyZUo3TWs1QU1mUGxy?=
 =?utf-8?B?cXVDUEhQSlRLQXgxdG5TWkUzTUE1Q3IvU0JrblpIK2Y2dWJTaytvK1JoNlpK?=
 =?utf-8?B?aXJnRlVjc0dtajM1bWJJYW5udzRZOXlLekNiRGs3aU41RFJGSlFJRnhIc1Bz?=
 =?utf-8?B?bU9rb1AvaXhyN2RTY28rZlQxbHA0dkt4YWtZRHhHdk4zMTdlOVhJY1BXVE9v?=
 =?utf-8?B?NkxxbHFhbHpNcE9mRW5nMXNNY0V1TTdhMldNUllocm54YWNhSmJXbjVGMjFw?=
 =?utf-8?B?bVJyeWJWd2JWT3pTSUExSHVSZmc2ZU9relMvQTlNdHN2ak1EVGhFMS9uckpu?=
 =?utf-8?B?NDd6S0RERzJEclo0YmJ6RkZ3Y3ozS1owUlY4enkzME01dnllL1BnUGNXajB5?=
 =?utf-8?B?TzM4T2ZJdHNRRy9oUCtWbzdaN3JqUlNlaHlRRitZSWtNNUFia2Y5T1YrVFNV?=
 =?utf-8?B?YVZGU2tYc1VheEtUR2pVSzljRnUwSmdRREtSSkY0eFpvYUhEemVSTjluN3Jo?=
 =?utf-8?B?SXdveS9MRks2MjVIMGt6a3VLUDVZNEQvYzFsdTJXVWM3Q2Q3VngwNUlkMmZY?=
 =?utf-8?B?QnBwakhXc2t6dWl4VGZGSTZEVEVQY2sxQm5JU0FHRlJJVnJDWU9idWk3OERV?=
 =?utf-8?B?dUNKb0NaZ0lGZVlsY0dKQllmcnZENXJpRXl1ZTlwcHZrOFNYempJUFBBcGd2?=
 =?utf-8?B?Q2lENTB1cmlhY3VKTmhoMXJCbVlqYVNqbFI0aVQvS1VIa1RiNmdLQmdkNmJI?=
 =?utf-8?B?SjJPc3JGRTFtUmpUR1BCYTNJM1U2dGxQMEdPS2cwaWVWdERpOS8vK0graEJR?=
 =?utf-8?B?NVZmTU9JVGtsdDd6RC9hRlZ0blF2SlE2L1BibDkrT1FTUUV6NmkrNWttY051?=
 =?utf-8?B?bzBQZFBNOHNlMHhrOExweGd1MFhXMUM1c25wUEl5WmR0ZTlHanVsRUdSaXJn?=
 =?utf-8?B?eHRENTJQSXlDMXp2RGp2dXg1bDVxbEhlVklUd0hOZ2RtdG1EKzhSRTk0V1Vz?=
 =?utf-8?B?TVhkUzJUNG5vL3hxU2xXK2VvVnJIMWt6elVjM3lEaDdkQUh5em14dHhJQ3Z0?=
 =?utf-8?B?bG5zOTllMWQ3dUFOQk5ZRGZ6ZnU2dUJMM3VSREdJdC80dlZnNnRFblR1L2w1?=
 =?utf-8?B?R084SWdCdWxSbzJVakZHTWluendYUUFNVjhZTTFGL2gxbGFwNDBabXhzcFBQ?=
 =?utf-8?B?MndVN0tJb1ZuWW01ejEyMU1QMVA3eUxnaUh1MGZ5dFh0MnhQWmR3YmVGQjZ1?=
 =?utf-8?B?ZEdmaUFyeWV2YTdUd1B4clhHYlhrOWJSZXF5L3RuSUl6bTlObjRROWNHQWhy?=
 =?utf-8?B?alJ2ejRjdVJGNHg3dmVuWEtBcDFmR2ZSMEpHMmdCUHovaHdkSkhWUkJkS2NK?=
 =?utf-8?B?YUR2NzlJRUI1WGZvOTl2TFZKajRDSUhDNUNkSDJmNlBUbGN3K21KUGI2Q1NB?=
 =?utf-8?B?YURyZDYrUDVvMk9mUXJHV1d1SURsOEVPTkNWWjUxNjZGb1c5elhiMDRjQmpS?=
 =?utf-8?B?Skczc1hVQUFFSDZjTTFFakNSSE4xdE1RQ2o2aUdwc083OFZ2U1U0UCtxckts?=
 =?utf-8?B?N1NtNjF0cTRoV2lxTGdYOXZBRzB5b053NGR5ZFdlbVhZWHVtbTFNa3grbXNG?=
 =?utf-8?Q?a6LUhF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amxyNC9SNjA1VjBGQnZJRVdlZHZESDZQcTk4TXFWMCtJYkNwT1VLQ1lsRVJr?=
 =?utf-8?B?bjYrL1NwRzc3Y2NLeXpxaWs4dlZ1Q2RRNmovK0RDbW5OZ3hhUTg2VlZON3F6?=
 =?utf-8?B?YW9ORDNpaTFFU01SMG1yRCtrSEp6ZC9JYjBmR21mM2g2dlZDZEhHYnB2ckcy?=
 =?utf-8?B?NXRSK2dGNlhuZlowcW5USndaRVdVL0VETlM3dWVRMlhDRmhTWmgxRmpBWnJE?=
 =?utf-8?B?MXUyY1RPaUZGL0ZpcCt6dmhQY2ZRQWVKdXVBdS9kK2FUaHg0dTUxM2hTdzB5?=
 =?utf-8?B?aUJOY2lYM1lvYnhkYVI5RUVzUlNycEhRTGt2eEdEWm9RRUxSRXhkVHlCMnBR?=
 =?utf-8?B?MllNOUpOdlBWcEpqVERMVCtOZnlQbEpoVU1UMTJIaWdES3huVDdFQ1dDNUJh?=
 =?utf-8?B?eDlyR3JFekNqSmUwamhXU08rMW5JOFIvMkpJU21uRzVHcGlERWRsdWJVVVYr?=
 =?utf-8?B?UzlTM2RPT3dCTitEVk9BNXB3YnR2M0NlZnNodWRSK0ZIVmtoSXc5bjZvYzg5?=
 =?utf-8?B?bGp4MFdKbmVxQmJ6bWx6QzBVU2NVREEzQ2N5NmREdzA5T3VGaDJhQWdqdFp3?=
 =?utf-8?B?MnN5bzdsMC9qZ1g5RVlGbU9JaWcwd1BkVjFQZkZzZFBUcGM1UHE3WUhIUTEv?=
 =?utf-8?B?NXdmcGpVOUs0azdQMDBMdncrdlhhemM2dXFVLzc2VURJTWVqYzRvV0ZVcXpW?=
 =?utf-8?B?cDdPSlpZMFkySXNPTUFIV1RGRTVOTlR5UWxDMXFXNi9QZmRacldqN3kwWnI1?=
 =?utf-8?B?RjRlNWxOMTYwRnAvUjRsZzNDS3Y5ZmtxQ1oxOEhrRU1pYlN5VWFOQ0NXRjhN?=
 =?utf-8?B?TFhnTWdzMHpTTk83bXhrR051SlkvNVBxaGhaUzdFYjVZYmNkTzZpRHYyTGJT?=
 =?utf-8?B?UlQ4UFI1Qi9PUW5wMmR3dERtb0gyc3pVblZFV0NOU2RLcURrSjlnMVdHUm1T?=
 =?utf-8?B?ZzJ6TG1oWkFWWXBDQklFRGs2M3RIODNPVXBNdnplZkdvcWxTRXlsejZlQlVj?=
 =?utf-8?B?RzFRdUk4aEV0UXVWUXl6MGQxais4d1pKTXJ4UVZvcWtBWVhxdmtUZjdjSmNt?=
 =?utf-8?B?bTRiN3VLRDVROEhTT1dTcTdPdFhNeHRnYnFyZUkzd2xFWHloZEE0UytrNlhp?=
 =?utf-8?B?YSthMExQVEJVQVB4SUE5R05JVTNUV1BiblVYMmVCY2hqSENaREZNUXZpT3JO?=
 =?utf-8?B?NVdWTm1vbmtMelRLNWNoRVdPS25Va0hLVVBZVzlGRWNla1krSDJYUlNpMmtn?=
 =?utf-8?B?TmYzQXhNZmJyS2RCZGN3YTIvTkw2SS9OZ1JRelh6c1kyUUExSytPZ29QR3Ra?=
 =?utf-8?B?TXc4MWp3SkhkUmhreVN0RDNMalJ6NC9lYjY5VEVqRkVrVWdtZkNlNmpFV3pC?=
 =?utf-8?B?bXJIUElOM1grZlJ0bGlUanYvUE55Y2NubXJFa2MvYnFWYzVEQ1MrQkh6dmpn?=
 =?utf-8?B?UnhIelkyOURqYmQrV3MrNVJIQXhlWFNZQjdmVFlla2wxcnMxTCtuWnBjeUt1?=
 =?utf-8?B?TkljZnhqZjI2UEtjcGEzNnhWMnBQa2dxRklqUEhaL2RXckNqa0dRWSs5cElC?=
 =?utf-8?B?NWsvcGlkdm5QcEN5bGlJS2ViMU4ydUFod0Ivb0VOR3BNMnl3UVdFRm1yWEIr?=
 =?utf-8?B?QlY1bnZ5VHRlR2ljRjRYS0ZLWjFzRWVXYTBCeHByemFJT1BCckZtdGxJOTgz?=
 =?utf-8?B?amN0NmhObEptbUMra1BuU2h1d0pSQ053Y1drdzNCYUxPaSszVEhyZEhGdGNt?=
 =?utf-8?B?UndoTjBFb1FNRjgxem9ZbzJIWjJrajhlK2tkVHJ1TEo5b1QvMkJKMWZFL0ZQ?=
 =?utf-8?B?Q3lPNTRMeU9xVm1qRm03V3RSbmN1bDdndHNvdWlMb1A2K05HL2dxR1RHNzhK?=
 =?utf-8?B?Zy9Ed3JSU2dCY0ZGSTBFMUpTM0VreVpyand2TXB1ZkY2UVVkR1VvNHQzaUxx?=
 =?utf-8?B?R0hBbGxJTmljWUJtR0Q5QW9tRnRhUTZ0TmZVQW14di9BckZJY3hPOTYyQnJh?=
 =?utf-8?B?ZFBqcFRkMmZqWWpRT0V3ZzAxMzZSNFYyN0Qrc0s1VXZESG92MzF5b29FRXl4?=
 =?utf-8?B?UTdnbGFFTGxaN0dYa243QTRsUitIdlVTQ01HL09RTG1NVVRMM2ladG5oMDBV?=
 =?utf-8?Q?BUm0=3D?=
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
	36IquCXGDLbt8spMFMQMrTvJDK/RQci7gyuB9nAhePOAjsYJNJOErVxIYVfrEsuM+6TXtxFMEmbQu/CmNfqlk/C1g5wc+yk96U9QgQePPD56XNN1jsmN5cS9A5Pxh3gx90+5jkeJl7n0zdVsvDrX7avIZR0xP2XPDowMPi2fu413MU1Qkh0z3WRa6Xi3u+xsB8sZIh8iKerGEosYq0HGutOPhd3HofBDegI5wo5zXj1UOs69F8QaUwRwOH+yi+Qz44DVN9nCii+0N3RIP51gOwF3wsX1/bZ+x1AU1mSzribIKisT+d0nH/CBplC/CB3auSF1thXptPmTsc+nFfCdcDnew1NsaD+PqsTYyV7g+ojFp0BH3ZbI+SxWhwB4YWO+YK1g2dgNOhAdvuw24vqelm0+kbCdVN9TpOVEhVz8dKXvi6wXNhdeX2DpHlIKyhBkgu0AiD2be0bjKH7lh4cmABAYQn5D4ZctJBR79a/4L+y7qW1/FEToO79dYDRvwZ/7Gq7h7Tt6KPGCkjO0eOJmcmOCUQ+BFh2QQdbst5lO5uGxeZ6I2+ad+KCvHFs1ORhn3gKDqveJKVVH6mVzJB3RW34/Vk6/eQpDMgKp6dyLvQcSKiD/GOiaIt60IbyKud1F
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437d2900-25c9-42c0-b0c5-08de06aaad42
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 20:38:45.3661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBOiR/5gXB9mxuxmXbl3E1wwzMMj9q+haQ/pty/FssqluLBGThIanhOHXPoIrJ6zMFAxR3J+zudcZOzJfVfpRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR13MB7318
X-Proofpoint-ORIG-GUID: H2MDsVqin43WLAIPix5e2zrnafv9Nzhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9evEuJhul24L O+pzhCubsj71VziwJRN8AT01SqEWNVViDBELJXmrqLc+u3f9VFNIFl6+E03hphrg7Bgxt3ouuI1 s1B1leHvp02KiBEkyd115ZoOchUdI4oifMDOR4O9okurRD2+0US8sch9o2fJhF7DpigAcP6l0Wt
 ke5a/GsSHNZX/Vkjm9t4H+L85m0DVDcOtQdpz7qggt2wCmODmNXNSjfKtqtes39xlXhO88RxPPg b1OPEMpzyk/e9/lcD3yWJx0iGF2vBJquIERDl2y1JA4bC3Zfa8W+XvSq69cJvOHaQknq6Z8aV3S rR7/98AqbH79fpSOmNEFqW1zNQKbltq8Soz1d5sztgy3SIWIzSnTtYGAaYwY0i9BmzW+bP9WoYH
 cdp/ATXTfQGKTM4o4W8Cfn3/9TVk1A==
X-Proofpoint-GUID: H2MDsVqin43WLAIPix5e2zrnafv9Nzhh
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=68e6cbd9 cx=c_pps a=ZVLNonFp53krOPJecICuKg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=bLk-5xynAAAA:8 a=P1BnusSwAAAA:8 a=G7b5d3i3-62a6--D0jUA:9 a=QEXdDO2ut3YA:10 a=zSyb8xVVt2t83sZkrLMb:22 a=D0XLA9XvdZm18NrgonBM:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Sony-Outbound-GUID: H2MDsVqin43WLAIPix5e2zrnafv9Nzhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_07,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgQm90dG9tbGV5
IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPg0KPiBPbiBXZWQsIDIwMjUt
MTAtMDggYXQgMTk64oCKNTAgKzAwMDAsIEJpcmQsIFRpbSB3cm90ZTogPiA+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLSA+ID4gRnJvbTogTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVu
dC7igIpwaW5jaGFydEDigIppZGVhc29uYm9hcmQu4oCKY29tPiA+ID4gT24gV2VkLCBPY3QgMDgs
IDIwMjUgYXQgMDk64oCKMDg64oCKMzNQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU64oCKDQo+
IE9uIFdlZCwgMjAyNS0xMC0wOCBhdCAxOTo1MCArMDAwMCwgQmlyZCwgVGltIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiBP
biBXZWQsIE9jdCAwOCwgMjAyNSBhdCAwOTowODozM1BNICswMjAwLCBBbmRyZXcgTHVubiB3cm90
ZToNCj4gPiA+ID4gPiBNeSBnb2FsIGZvciBLUy9NUyBpcyB0byBkaXNjdXNzIGhvdyB0byBlbmFi
bGUgbWFpbnRhaW5lcnMgdG8NCj4gPiA+ID4gPiB1c2UgcmV2aWV3IGF1dG9tYXRpb24gdG9vbHMg
dG8gbG93ZXIgdGhlaXIgd29ya2xvYWQuDQo+ID4gPiA+DQo+ID4gPiA+IE1haW50YWluZXJzIHdp
bGwgd2FudCB0byB1c2UgdGhlc2UgdG9vbHMsIGlmIHRoZXkgcHJvdmUgdG8gYmUNCj4gPiA+ID4g
dXNlZnVsLiBCdXQgaWRlYWxseSwgd2Ugd2FudCB0aGUgZGV2ZWxvcGVycyB0byB1c2UgdGhlc2Ug
dG9vbHMNCj4gPiA+ID4gYW5kIGZpeCB0aGUgaXNzdWVzIGJlZm9yZSB0aGV5IHBvc3QgY29kZSBm
b3IgcmV2aWV3LiBUaGF0IHJlZHVjZXMNCj4gPiA+ID4gdGhlIG1haW50YWluZXJzIHdvcmtsb2Fk
IGV2ZW4gbW9yZS4gU28gTWFpbnRhaW5lcnMganVzdCBuZWVkIHRvDQo+ID4gPiA+IHJ1biB0aGUg
dG9vbHMgdG8gcHJvdmUgdGhhdCB0aGUgZGV2ZWxvcGVycyBoYXZlIHJ1biB0aGUgdG9vbHMgYW5k
DQo+ID4gPiA+IGhhdmUgYWxyZWFkeSBmaXhlZCB0aGUgcHJvYmxlbXMuDQo+ID4gPiA+DQo+ID4g
PiA+IFNvIGknbSBub3Qgc3VyZSB5b3VyIGdvYWwgaXMgdGhlIGNvcnJlY3QgbG9uZyB0ZXJtIGdv
YWwuIEl0DQo+ID4gPiA+IHNob3VsZCBiZSBhIHRvb2wgZm9yIGV2ZXJ5Ym9keSwgbm90IGp1c3Qg
bWFpbnRhaW5lcnMuDQo+ID4gPg0KPiA+ID4gVGhpcyByYWlzZXMgdGhlIGludGVyZXN0aW5nIGFu
ZCBpbXBvcnRhbnQgcXVlc3Rpb24gb2YgaG93IHRvIGdldA0KPiA+ID4gcGF0Y2ggc3VibWl0dGVy
cyB0byBmb2xsb3cgYSByZWNvbW1lbmRlZCB3b3JrZmxvdy4gV2Ugcm91dGluZWx5IGdldA0KPiA+
ID4gcGF0Y2hlcyB0aGF0IHByb2R1Y2UgY2hlY2twYXRjaCBlcnJvcnMgdGhhdCBhcmUgY2xlYXJs
eSBub3QgZmFsc2UNCj4gPiA+IHBvc2l0aXZlcy4gUm9iIEhlcnJpbmcgaW1wbGVtZW50ZWQgYSBi
b3QgdG8gcnVuIGNoZWNrcyBvbiBkZXZpY2UNCj4gPiA+IHRyZWUgYmluZGluZ3MgYW5kIGRldmlj
ZSB0cmVlIHNvdXJjZXMgYmVjYXVzZSBsb3RzIG9mIHBhdGNoZXMgZmFpbA0KPiA+ID4gdGhvc2Ug
Y2hlY2tzLiBJJ20gc3VyZSB0aGVyZSBhcmUgbG90cyBvZiBvdGhlciBleGFtcGxlcyB0aGF0IGhh
dmUNCj4gPiA+IGxlZCBtYWludGFpbmVycyB0byBhdXRvbWF0ZSBjaGVja3Mgb24gdGhlIHJlY2Vp
dmVyJ3Mgc2lkZSwgdGhyb3VnaA0KPiA+ID4gdmFyaW91cyB0eXBlcyBvZiBzdGFuZGFyZCBDSXMg
b3IgaGFuZC1tYWRlIHNvbHV0aW9ucy4gU3VibWl0dGVycw0KPiA+ID4gc2hvdWxkIHJ1biBtb3Jl
IHRlc3RzLCBob3cgdG8gZ2V0IHRoZW0gdG8gZG8gc28gaXMgYSBicm9hZGVyDQo+ID4gPiBxdWVz
dGlvbi4NCj4gPg0KPiA+IE1heWJlIGl0IHdvdWxkIGJlIHdvcnRod2hpbGUgdG8gYW5ub3RhdGUg
cGF0Y2ggc3VibWlzc2lvbnMgd2l0aCB0YWdzDQo+ID4gaW5kaWNhdGluZyB3aGF0IHRvb2xzIGhh
dmUgYmVlbiBydW4gb24gdGhlbS4gIEkga25vdyB3ZSdyZSB0cnlpbmcgdG8NCj4gPiBhdm9pZCBv
dmVydXNlIG9mIGNvbW1pdCB0YWdzLCBidXQgbWF5YmUgd2UgY291bGQgYXV0b21hdGUgdGhpcyBh
IGJpdCwNCj4gPiBhbmQvb3InIHJldXNlIHRoZSAnUmV2aWV3ZWQtYnk6JyB0YWcgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLiAgSSBjb3VsZA0KPiA+IGVudmlzaW9uLCBpbiBzb21lIGZ1dHVyZSB3b3Jr
ZmxvdyB1dG9waWEsIHdoZXJlIGEgbWlzc2luZyAnUmV2aWV3ZWQtDQo+ID4gYnk6IGNoZWNrcGF0
Y2gucGwgQU5EIGNsYXVkZSBBSSByZXZpZXcnIHdvdWxkIGJlIGdyb3VuZHMgZm9yDQo+ID4gcmVx
dWVzdGluZyB0aGVzZSBiZWZvcmUgaHVtYW4gcmV2aWV3Lg0KPiANCj4gUmVhbGlzdGljYWxseSwg
d2UgY2FuJ3QgZXZlbiBnZXQgc29tZSBzdWJtaXR0ZXJzIHRvIHJ1biBjaGVja3BhdGNoLCBzbw0K
PiBJIGRvbid0IHRoaW5rIHRoZSBhZGRpdGlvbmFsIHRhZyB3b3VsZCBoZWxwLiBXaGF0IGRvZXMg
aGVscCBpcyBoYXZpbmcNCj4gdGhlIDBkYXkgYm90IHRha2UgYSBmZWVkIG9mIHRoZSBtYWlsaW5n
IGxpc3QsIHNlbGVjdCB0aGUgW1BBVENIXSB0YWcNCj4gYW5kIHJ1biBjaGVja3BhdGNoLnBsIGFz
IHBhcnQgb2YgdGhlIHRlc3RzLCBzbyBzb21lb25lIGNvdWxkIGRvIHRoZQ0KPiBzYW1lIHdpdGgg
d2hhdGV2ZXIgQUkgYWNjZXB0YW5jZSB0ZXN0cyBhcmUgYWdyZWVkLg0KDQpUaGVyZSdzIG5vIHF1
ZXN0aW9uIHRoYXQgMGRheSBhdXRvbWF0aW9uIG9mIGNoZWNrcGF0Y2gucGwgZmVlZGJhY2sNCmhh
cyBiZWVuIGEgZ3JlYXQgdGhpbmcuICBJIHN1c3BlY3QgdGhhdCBtb3JlIHN1Ym1pdHRlcnMgd291
bGQgcnVuDQpjaGVja3BhdGNoIGJlZm9yZSBzZW5kaW5nIHRoZWlyIHBhdGNoZXMsIGlmIGZhaWx1
cmUgdG8gZG8gc28gcmVzdWx0ZWQNCmluIGF1dG9tYXRpYyByZWplY3Rpb24gb2YgdGhlIHBhdGNo
LiAgVGhpcyBpcyBtb3JlIG9mIGEgcHJvY2VzcyBiYWNrYm9uZQ0KaXNzdWUgdGhhbiBhbnl0aGlu
ZyBlbHNlLg0KDQo+IA0KPiBBbHRob3VnaCB0aGUgcHJvYmxlbSB3aXRoIEFJIGFjY2VwdGFuY2Ug
dGVzdGluZyBpcyB0aGF0IHRoZXNlIG1vZGVscw0KPiBhbmQgdGhlIGluZmVyZW5jaW5nIHJlcXVp
cmVkIHRvIHJ1biB0aGVtIGRvZXNuJ3QgY29tZSBmb3IgZnJlZSBzbw0KPiBzb21lb25lIGlzIGdv
aW5nIHRvIGVuZCB1cCBwYXlpbmcgZm9yIGFsbCB0aGlzIEFJIC4uLiB1bmxlc3Mgd2UgY2FuIGdl
dA0KPiBzb21lIGNsb3VkIGNvbXBhbnkgdG8gZG9uYXRlIGl0LCBvZiBjb3Vyc2UgLi4uDQpJbmRl
ZWQuICBBbGwgdGhlIG1vcmUgcmVhc29uIHRvIGVuZm9yY2UgaXQgYXQgdGhlIHNvdXJjZS4gIEl0
IHRoZW4gYmVjb21lcw0KYSBjb3N0IGZvciB0aGUgY29udHJpYnV0b3IgaW5zdGVhZCBvZiB0aGUg
dXBzdHJlYW0gY29tbXVuaXR5LCB3aGljaCBpcw0KZ29pbmcgdG8gc2NhbGUgYmV0dGVyLg0KICAg
LS0gVGltDQoNCg==

