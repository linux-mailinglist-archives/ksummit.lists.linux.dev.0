Return-Path: <ksummit+bounces-2461-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA9BC99FB
	for <lists@lfdr.de>; Thu, 09 Oct 2025 16:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 532EF4FCBD9
	for <lists@lfdr.de>; Thu,  9 Oct 2025 14:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AD32EAB85;
	Thu,  9 Oct 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VOjz32AL"
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50B2E7185
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021294; cv=fail; b=ARNtnaZDXDNBr+XJIgAXIlYcdNTajGxw59yG5BamojVbZ5i/vfyuQ9Pay4fxUpqfBVOy0SRWC8Fo/WzevR0xBHDHH/h7zYM1pj5h7rqjffNmulD2NsXA9rYJUSzBbObPh3g4Id+XPhKAs8OLrTpeVy1x0TTy9J7x4KkueFe5OnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021294; c=relaxed/simple;
	bh=vM3LHC+c79LnHdbwog4CPKRV82rknlsliJvAW6MLMEM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SG/lUKS/FD4WSUU6Xcksxx2WJx3PQsp7ZlL9TugOIs5XpEhulP3A3A1kk7cLiZVK0Lb0lqv5qhuznOKRt2P9P4TSVleakC/E4GoC95MigJ5ftS7DIDazCjkIGA9MCtYeHzoZQRcJjb4HezDF0sezLgoP7k2DV/sHaI3gAgSN4yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VOjz32AL; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5993Nbrj028097;
	Thu, 9 Oct 2025 14:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=vM3LHC+
	c79LnHdbwog4CPKRV82rknlsliJvAW6MLMEM=; b=VOjz32ALdxQWuVxI+A5CUeD
	xAgbkvwxRqkn7axQ25flJByZQFST34kBX5ge2Q/8gC5CMMSn7AOyAygdE/M1D3Ns
	fhrO+N9fW9Kfpz/bJ5uQCI3x9KNRk2WyzPUaNMNDuoqM0EYDjmG9cQUekDGL3NiY
	elI+h60I1hbSdKXc5SIp7j1MIixywqMbgJs4UHRk2IxCXhj0FnqgvZSsLBlwuJg0
	h7BWejC0KwiCpZg8q4bMlFZMNH+TfdFUYj7uWNvTNaIKJbEi4hGHo6nnN9vp1gPn
	ZPfWFT+J+CnTRXcjw/Jc6GRIDED26/XKnIQPQPOTZ6nOmFh86qHAg06hQbRXZyg=
	=
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49nv5xsarb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Oct 2025 14:47:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTamXJjUDuUUWYRR/sN6WruQrEvh0IYzgRkybT1jzuy795DyBjQQ3u9O2drkW6COApe6Xgo2eiO2LHPOigGwDvrPNg7y2tvI23VhmpC2BNRugyy7nY5JOlIqfFj1QjcXupUiw/9JuaFOrI3NQ8A1+rcB+IJEFgRfpil4HsY0OcfQ+VGd4XKupzPqVm3CnxImwsLzb8s958LwJvUMMXaykew8BjdSpfpITbhqYUSiJy6uDLcTeUmPAkYfcYTUOHl6wAop+w3q/CWhIQvrbNtDhsrBtwNgpUsbQCJcmtX9l/z8zM1wMgy98ONeyXBHlNgLCNcofzijfEOHNStskvWYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vM3LHC+c79LnHdbwog4CPKRV82rknlsliJvAW6MLMEM=;
 b=AtQDmZR2tyFekc7FsNRKbfvkxxoqw/ywyWrUVa6ITMfHq2X89xWc2RSj8NGwFBGxYeqjSgeAmhTCbUS7zQARrYG8Ia7rkmz1GGenKI8IlgR36UHC772X1cKXLe43tVBKfkpD6KsyahXbQDywaQoEWpNybbJJG9mC1ZAX/7ECGPi+5vlVG1wnfqvmS0OdNsaeOncFjwCBferRwe2gvWMGI5FxGYRzyn8TK0dJLMdDdJBwpNCXOo5309mVvfNXyi6UcWia2bRJr/Nwky4M2DUAie70b3FO7set4802NPPjgZVaChaQIM9Jf45saTuqgjMhjQ7xwCKiBKXLyicQSmu/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB6710.namprd13.prod.outlook.com (2603:10b6:806:3df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:47:52 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:47:52 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Andrew Lunn
	<andrew@lunn.ch>, Chris Mason <clm@meta.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Alexei
 Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Topic: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Thread-Index:
 AQHcOHXIPqH6JcPVFEqei/F1014v5LS4nPWAgAAF4ACAAAQLYIAADRAAgAAAdwCAANTMgIAAV+3g
Date: Thu, 9 Oct 2025 14:47:52 +0000
Message-ID:
 <MW5PR13MB56323B06E265F10136A1A2B2FDEEA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
 <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
 <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <20251009091405.GD12674@pendragon.ideasonboard.com>
In-Reply-To: <20251009091405.GD12674@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB6710:EE_
x-ms-office365-filtering-correlation-id: 9a4e4db6-26c1-4cee-8f5e-08de0742d2f7
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVFXWXlucW5wU3RRRGJFZ0w0WkgyaXdXQW5tejNWNWo4STcxZWJ0eVdldHV1?=
 =?utf-8?B?N1RpRkkwZU5pdHAwYmNmUjlKRVJNTzNyNHVBczZrZVdzMEdnWlUrY2w3a29q?=
 =?utf-8?B?MFVGb0FUZ1Z1ME5EV0ZrRGZvc3NrRVVFaFRuZm15WERxSUxJM0hmYnNxaGdT?=
 =?utf-8?B?dGk5aU1hN3dUSkQrUWJ6RTlmb2wvT0VzYzR6ZnhnaUNkdGtGSGFqTkEvbDZ6?=
 =?utf-8?B?TklocVNuVnVIQTVCTzRTeDdjbVZwMVZYeWFHNUk5VzM0TERhQmtzaGJLK25K?=
 =?utf-8?B?MTN1ZmdwMzA2OUVGNlBPdVVxZ0s0eXVPcmlTcjV5c2VvZDBFWVBqR2E2b25U?=
 =?utf-8?B?UXd0QnlickI0SCtUYk5HR1NpWTNFTjhGOWcwWmRLd09lb0ZES2o4aFFrVUMx?=
 =?utf-8?B?d0xMV0xqUStRNFYwM2I1cEgwU09qdGNOYUpYYVR2NDIrMzNTK0JmdXhWSXpz?=
 =?utf-8?B?clVadFlTajg4SkdtWkVZVDhSU05qWnNmZjYycEw3Wmwzc2V5aERiSkwzMis4?=
 =?utf-8?B?WCtuS3g0K2JBdktZbVFxaUNFcTdDYytpY0xLc0ljaXJ2MktKQVU5amkyUEFT?=
 =?utf-8?B?Q21SZ1BKU2RZREc4UlVMNWd4dHQ0Z0dEdG53M08xeEZsNVIxRHJKM1krTEV0?=
 =?utf-8?B?bmpJYlNkN20yN1lNbkF1bEhJQkowQ1k3YmV2T1ZrVHNKQ3prdklNYUZYUnlX?=
 =?utf-8?B?d25vSWN4MkN1R3hxVFZUSWorQXNpZkxEZzk4NVQ0Z0YwWlk2eVc3cnM5Mlda?=
 =?utf-8?B?S29vU25hS3BKWE90dGRUanFkdjNna0xqTW55eDNtbjZ0V0k5cU12d0hxQXRr?=
 =?utf-8?B?VTFZL3p0QXdGclVvbnI5akFqMDl3bFE1c0NjSUhDazBkSmtVL21qeWFLUy82?=
 =?utf-8?B?YVh3Tk1YNmU4c2ZnMno3K09uTDBUa29rd2RXa0FqanJpOUlkVExVakdTM2tq?=
 =?utf-8?B?eGxPaU9TR3FHeW45eXJvYURhUFEwN09UUk1nS3hMM2grRXFyc3FnKzFJK2M5?=
 =?utf-8?B?WUp4cUtyZ1dJSngzV0JrVldURFhMVjJzQmxBYlpLUk12bDBVNElNeFhBcm9Q?=
 =?utf-8?B?SDA0WFBPcm4ySWZzUGFLN25SWCtnc2xpaUtFeUxsZ2l1eFdUbndyd3Z3aGdU?=
 =?utf-8?B?SFhBYjhlTEVWQ2ZzN0VRVlNCeW1CK0dLblgvU0JDdldjTlVEUkkxTXN6bFJV?=
 =?utf-8?B?ZlN1S0Zyemh4UnJDQ0NnZzBxaC9ucjJ2Q1gvZ3ZMUHNTOXFqU0JhQzNrQzgv?=
 =?utf-8?B?UHUyQzYvblJvYm5QdHI2NWF4NHdWSnZlMjlYblI0TmtJbTdjVE5SaTE2N3ps?=
 =?utf-8?B?ZEtLMDV1ZThnZ1NtZ2kzVzhzTmJ5Z2dlVlNhMG84MU5ONUZ5VHBkMjVJeDZC?=
 =?utf-8?B?UHRwRXpWdDV1NFpxUUQvbUYyc2w3SUxSQVcrOEZtNUJ3VDdZUTR2b080NTgz?=
 =?utf-8?B?MVZQY3daVjJINEExcmdOcHFPUWQ1TGdCaG96SWZPSnpUelZpMnZOa2tLL21q?=
 =?utf-8?B?UFdtLzIvclIxK2VLZGgzbWhKM1BKTUUyY2l0UGhVekYwb284WndROHh0OHZR?=
 =?utf-8?B?Ni9zSzZhMlNWZTVmV1JUTWE0RUJzYlFZYXJCQWhiSkhuV3R5aHJUN0FhTDIy?=
 =?utf-8?B?Y1VMOWtIdjFVaTY5allHQUdQVlZlYmErRkpuNnhMbllLcTJSdyt1cEZBRVhv?=
 =?utf-8?B?WVI5UVkxQnFtZjJ0eTdDSlArYVpPeFp6ekh2S0VsVktUTG01aHlWd1lHVFNk?=
 =?utf-8?B?Unl0TE90bytoalFXcTYwaVlERzEzdjVnenJpckMyWVlua0o4L1lseDNtV0lW?=
 =?utf-8?B?NlM5NGkvT0JGdmR1dWJ2L2dZRkFrSlJabm9ZRkp4NjRCR1JFakxVaFYxMk5o?=
 =?utf-8?B?Z0o2ZjdJMm9ZdkhMMVMvOTlJUThCbzZjUWpIcDNkZ2hEUFFFRUpDT0JkQXFL?=
 =?utf-8?B?VXVuK0RVSUorWDBqaGRWS1lPalV5UFdCUDkvL1JOUGVkNDBoZEY3RCtVUnVh?=
 =?utf-8?B?aHYvb1YySUhQRS8rd2F0dlBPTkRldXkxUDdsSkFKcXp5cSs3SWp4NWZsM29u?=
 =?utf-8?Q?q7worv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zy9RMVpCc0ZxMlZNUitXczBVQ2lsV1kwSlhVTjByaUttOTc1bVV4MEFxWkw0?=
 =?utf-8?B?SGlhQXJMdU1oY0FvUWlJa2FBVEk2dWpqWk9NSHFLdVdabXMwRTR6QWduVkhT?=
 =?utf-8?B?UnMraVI2Q1BqeUVkRVFXZUhVYU1qaXdMaUNzOUl1QnFIUWY0bE1Jam1OTnVG?=
 =?utf-8?B?ZlJYN1ZxN2ZSVm5OYWdCcVJXZnlDdTlJTEVmMmZwK3RCSkJBbTdncko5RVl3?=
 =?utf-8?B?NXk4WkFsaGtJdC9oN1ppRjRCSmwzY1I5VVdKRGtUdjAyTDNkSEpoMnFmRldy?=
 =?utf-8?B?b1JNUDdXSjNOMlJNTzVGS0RBbnBnMm5RWXdyK0lRVnFuL2RmdHJyMXozZ3VF?=
 =?utf-8?B?Mm5Pc3d0MWtQVWZrSEhZZktGQXVucjRKeDAvS01QYXUwcU5sYy85cWNYZ1Fz?=
 =?utf-8?B?T2NTRVdIaFA3TnpvUUlhdHhwQjZ1NHI5U3lhTGFIOFUwRHRWU29IVHFkN0tG?=
 =?utf-8?B?ZkN2ODBLUEVZZEY3UmpsWkNiNmtucHh6OHhFblNIc3lVcUVER1drZERVQ2N5?=
 =?utf-8?B?cmV1Q0VnR0o1YjJ2VStUeC9xaFpLWE5lTTBHY1dVanhXVDAzRVhiY0UzM0tE?=
 =?utf-8?B?YStwSHA4WUZvYnUwTEtGakh5RXJTYzllTUV2Q0k2RHRvcklmRTFXdXNCa2NR?=
 =?utf-8?B?SC84M2ZDRkJGU0FDSjI2M3F2WE02UG5xMlFWYVdIK1E4Z05uKzdHa3RkbFds?=
 =?utf-8?B?ckNwRTBFSWkvUXBvSzN2dGNQYWFIdXRRekxDM3ZNNWFLb1FmV0MvZk5sWVhZ?=
 =?utf-8?B?aDZ4YUpISVNvSjEydzZOUkRPeS9mKzl3YS9EaUUwaGI2VmxnaXB3SGVXZ0lT?=
 =?utf-8?B?RlVqOVdVUU5EQXlsU3A1MS9DSVdNK29pQ1A3d1BuN1hLSUhndWFSUUU4b3Nv?=
 =?utf-8?B?cUsxSG5nVWxXMlFTTUpUZm5LNzRTZEdZb2JydEpzU3o4NnFNa1RqTjNXV2V3?=
 =?utf-8?B?NnpZcmp3SUVtS0JicVp6WHFsUWZka3FPcnBzOHBCSy9LYTFtdmtGUTJNaHRq?=
 =?utf-8?B?WG10bnVWcFc2NVNhRWRKVGlIWDFaQ1NOMVdFbndXaERjbU9saFRKNEJ0bU1Z?=
 =?utf-8?B?NmJpdlJ2anlSYlhQd2F3ckVPQ1dESlJmR2lEeTdWV2pjV2N5MjBJUHJkTll5?=
 =?utf-8?B?S2YydDg4cXF2V2R0OENwZFZldUtSK1FMelNoNlJLOEhZQTBrZTN6bGNzVDJ6?=
 =?utf-8?B?V3k2V3Y4cDQwV0FWVkt3dzZUZndhQmMyYWFQTGNhQXBWYXpUcGV4bXVuTUxl?=
 =?utf-8?B?VEpFV3pJclFIK3IwOXFZMGp5dnNDTlF0N2xtR3J5U2VwK1A1THZycEpsc1dC?=
 =?utf-8?B?UVYrK1FRbkVYeWExeVg2azJTelhrRzFhYWp1WTFwTmp4WnkySXJwbWZwTmVD?=
 =?utf-8?B?ZjYzdXJpRS8xcnM5L3c1b3gwODRob1g5QWZuek9obkg4d0crNnVBcGhCcWtS?=
 =?utf-8?B?RCtXUHZnUTJabTJYQldkSGpLeU1vQWI0VTFtZFM5QWZPWTJGNmVrOXFsa1BV?=
 =?utf-8?B?ZUJkMGExUUtvMGZpakFiVExDMzF1bTUrUmcyclZyQW1CSnpBcGk4K1VMaXRR?=
 =?utf-8?B?OXZ3dldMUzBjYnFwRjlubmhsMTdsSEh6dUd4WEowc1NOakdwOHVOeWE2bENR?=
 =?utf-8?B?eXJrNTdXR3M5U2h6aU1MM3k4Q3RxU21ERExkSld3b0lqeWg1SGFpMzRodTdh?=
 =?utf-8?B?YWdULzhwWVhmQ1VSNXZ4Qm41elErZ3gyTkhmUHRwNUhzR3lkbkI4bU8yaW4v?=
 =?utf-8?B?ZUd1UGs2TFVudU8xb25IdDlHellIUURtOFlwTi9QTEtsdUxpQm1OSjZpLzVu?=
 =?utf-8?B?Rll4cGdqaHloT2llMDVITHhZeXhVMFRzV1BsbmVvUk8wQWRMZFI1WjlvTmZn?=
 =?utf-8?B?eDRhQUJlSVRJQjhYYURaZkZoSHVnem8ybjM0TmY4aiswZitHbWtiVHllRnJv?=
 =?utf-8?B?bUNrTENYeS95SGpkTE4rTGNrUkdLSzVONVp1dTY2cmMvRHpvTHgzNnhGMmRl?=
 =?utf-8?B?YXFCQitzS1M0NS84MUVqTVF4SXZpQThxRmthdXI1WHJBMTgvRkord0M4dWZN?=
 =?utf-8?B?REpEeFdDbzdDWUZnbWZBbEM1b09MNG5vcS82SWc0TGlmN2ZSUmh2VGhRRk10?=
 =?utf-8?Q?vmgg=3D?=
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
	VfGoR0M+kEq23v7JcTtyR0AzD0qu8F1fzKAJFi41Li6l2FigEe4gEofctIydSbms5Mt0OQSbCpSE+3xc6EdGAy+5h54GEit8SBEZ64m1MaLFrPJUS456wFeL4wun9KV5D+6nARX5DXuhTqxHlKwlKnkVgSWg5s745DwiyPtHHYIIiTuqhHByr4Dh8GA4PNRU6X9aUWyui1ceYndZDDGFTc/zu+KO/vByrV/eM5PpA3pxbNcyqpxuFK6sImratH8VnNAYtqhyrDyYu/g88qivff5H9AGkdwOyxzKNvFysFfOpOOqpbNPlcFj3u/dUL5qlmkBDhxk3wMaGlTfA6qTohSIrnqfu2PFcxMOfX8K0S4NGgbOzTheR+V0Hoh36z7JWcPRMexw0Zc08A+ZwReUwt7M90PlGw7dQZ6wGPpY3LXuRgsE4o2pm2wBb1bTC9jUV5+MdnG1ensbfj8bqlAQN+K/18TzD5iCo3nHjK9zXhdveIrkBEqa96EO6d+27pxDOytAjvMQaiPpStFzG4W15Hs9U7ewKHORTUwniWqMursNGKTZiNmH8MUdDPr5kZ1VV1/NTrQDKJ12tsQqD9Y+kHuyDK/G6IbtfNnMxux+pIEdgcJGOnWPZAD8y4GTT1AlR
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4e4db6-26c1-4cee-8f5e-08de0742d2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2025 14:47:52.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gr0IV9sVHoA48RAkrZZaE8mF0HDIsjuBpuKYQc10eZV3JLd0n7NLtNSyHQDgj2qfdi5tg8bx8lIYOz7CSX2jfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6710
X-Proofpoint-ORIG-GUID: 0-PYKfHK1UcELvUf7saM51hJ-kAk5ESu
X-Authority-Analysis: v=2.4 cv=RMq+3oi+ c=1 sm=1 tr=0 ts=68e7cb1e cx=c_pps a=RV/m/49WaDJDQ/P4gGxFUg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=P1BnusSwAAAA:8 a=bLk-5xynAAAA:8 a=lGTHirPqDNXEKj_PeqwA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22 a=zSyb8xVVt2t83sZkrLMb:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 0-PYKfHK1UcELvUf7saM51hJ-kAk5ESu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX56UQSEm7IDps T4HIFoYVzwxlV9lROT8k0GUVUrxq0U1PwLGi11TRwYvhrFwaVL2+BT2rqdPtppoPUpmIb7180hO 5Y4RbtcUyO33mgbTfkgu+Ec5Pc6bL4gk6iQCGKQIsrwPE1D17kUB34rjIt3CXyJb/lpMr8e2wn8
 F59IOL+ABeVJsMkgpi+w8wcpX+cVK334FJQeiaCQbdMyPfKilTZP8G9i+crfx2hTx2rBtmnYvW9 SPLdTBdqIPOlYiupP0M/02o6qZJesPoQJpdpHN1zl/qGNbEoafsp73tsTt3+Ft4wedlzosIFsvs zyIIOozL82PEBMEr1IFdXL6htYZ3MElkZOjDwU7pjyMui8dND9I5iuoWPSXeqTWzHouhm7wTq+M
 4BV4m3ZMgq12V57nPgZKv593zBXfxw==
X-Sony-Outbound-GUID: 0-PYKfHK1UcELvUf7saM51hJ-kAk5ESu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gT24gV2VkLCBPY3Qg
MDgsIDIwMjUgYXQgMDg64oCKMzg64oCKNDVQTSArMDAwMCwgQmlyZCwgVGltIHdyb3RlOiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0gPiA+IEZyb206IEphbWVzIEJvdHRvbWxleQ0KPiA8
SmFtZXMu4oCKQm90dG9tbGV5QOKAikhhbnNlblBhcnRuZXJzaGlwLuKAimNvbT4gPiA+IE9uIFdl
ZCwgMjAyNS0xMC0wOCBhdCAxOTogNTAgKzAwMDAsIEJpcmQsIFRpbSB3cm90ZTogPg0KPiBPbiBX
ZWQsIE9jdCAwOCwgMjAyNSBhdCAwODozODo0NVBNICswMDAwLCBCaXJkLCBUaW0gd3JvdGU6DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSmFtZXMgQm90dG9t
bGV5IDxKYW1lcy5Cb3R0b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPg0KPiA+ID4gT24gV2Vk
LCAyMDI1LTEwLTA4IGF0IDE5OuKAijUwICswMDAwLCBCaXJkLCBUaW0gd3JvdGU6DQo+ID4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQu4oCKcGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IE9uIFdlZCwg
MjAyNS0xMC0wOCBhdCAxOTo1MCArMDAwMCwgQmlyZCwgVGltIHdyb3RlOg0KPiA+ID4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gPiA+IE9uIFdlZCwg
T2N0IDA4LCAyMDI1IGF0IDA5OjA4OjMzUE0gKzAyMDAsIEFuZHJldyBMdW5uIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBNeSBnb2FsIGZvciBLUy9NUyBpcyB0byBkaXNjdXNzIGhvdyB0byBlbmFibGUg
bWFpbnRhaW5lcnMgdG8NCj4gPiA+ID4gPiA+ID4gdXNlIHJldmlldyBhdXRvbWF0aW9uIHRvb2xz
IHRvIGxvd2VyIHRoZWlyIHdvcmtsb2FkLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IE1haW50
YWluZXJzIHdpbGwgd2FudCB0byB1c2UgdGhlc2UgdG9vbHMsIGlmIHRoZXkgcHJvdmUgdG8gYmUN
Cj4gPiA+ID4gPiA+IHVzZWZ1bC4gQnV0IGlkZWFsbHksIHdlIHdhbnQgdGhlIGRldmVsb3BlcnMg
dG8gdXNlIHRoZXNlIHRvb2xzDQo+ID4gPiA+ID4gPiBhbmQgZml4IHRoZSBpc3N1ZXMgYmVmb3Jl
IHRoZXkgcG9zdCBjb2RlIGZvciByZXZpZXcuIFRoYXQgcmVkdWNlcw0KPiA+ID4gPiA+ID4gdGhl
IG1haW50YWluZXJzIHdvcmtsb2FkIGV2ZW4gbW9yZS4gU28gTWFpbnRhaW5lcnMganVzdCBuZWVk
IHRvDQo+ID4gPiA+ID4gPiBydW4gdGhlIHRvb2xzIHRvIHByb3ZlIHRoYXQgdGhlIGRldmVsb3Bl
cnMgaGF2ZSBydW4gdGhlIHRvb2xzIGFuZA0KPiA+ID4gPiA+ID4gaGF2ZSBhbHJlYWR5IGZpeGVk
IHRoZSBwcm9ibGVtcy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTbyBpJ20gbm90IHN1cmUg
eW91ciBnb2FsIGlzIHRoZSBjb3JyZWN0IGxvbmcgdGVybSBnb2FsLiBJdA0KPiA+ID4gPiA+ID4g
c2hvdWxkIGJlIGEgdG9vbCBmb3IgZXZlcnlib2R5LCBub3QganVzdCBtYWludGFpbmVycy4NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgcmFpc2VzIHRoZSBpbnRlcmVzdGluZyBhbmQgaW1wb3J0
YW50IHF1ZXN0aW9uIG9mIGhvdyB0byBnZXQNCj4gPiA+ID4gPiBwYXRjaCBzdWJtaXR0ZXJzIHRv
IGZvbGxvdyBhIHJlY29tbWVuZGVkIHdvcmtmbG93LiBXZSByb3V0aW5lbHkgZ2V0DQo+ID4gPiA+
ID4gcGF0Y2hlcyB0aGF0IHByb2R1Y2UgY2hlY2twYXRjaCBlcnJvcnMgdGhhdCBhcmUgY2xlYXJs
eSBub3QgZmFsc2UNCj4gPiA+ID4gPiBwb3NpdGl2ZXMuIFJvYiBIZXJyaW5nIGltcGxlbWVudGVk
IGEgYm90IHRvIHJ1biBjaGVja3Mgb24gZGV2aWNlDQo+ID4gPiA+ID4gdHJlZSBiaW5kaW5ncyBh
bmQgZGV2aWNlIHRyZWUgc291cmNlcyBiZWNhdXNlIGxvdHMgb2YgcGF0Y2hlcyBmYWlsDQo+ID4g
PiA+ID4gdGhvc2UgY2hlY2tzLiBJJ20gc3VyZSB0aGVyZSBhcmUgbG90cyBvZiBvdGhlciBleGFt
cGxlcyB0aGF0IGhhdmUNCj4gPiA+ID4gPiBsZWQgbWFpbnRhaW5lcnMgdG8gYXV0b21hdGUgY2hl
Y2tzIG9uIHRoZSByZWNlaXZlcidzIHNpZGUsIHRocm91Z2gNCj4gPiA+ID4gPiB2YXJpb3VzIHR5
cGVzIG9mIHN0YW5kYXJkIENJcyBvciBoYW5kLW1hZGUgc29sdXRpb25zLiBTdWJtaXR0ZXJzDQo+
ID4gPiA+ID4gc2hvdWxkIHJ1biBtb3JlIHRlc3RzLCBob3cgdG8gZ2V0IHRoZW0gdG8gZG8gc28g
aXMgYSBicm9hZGVyDQo+ID4gPiA+ID4gcXVlc3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+IE1heWJl
IGl0IHdvdWxkIGJlIHdvcnRod2hpbGUgdG8gYW5ub3RhdGUgcGF0Y2ggc3VibWlzc2lvbnMgd2l0
aCB0YWdzDQo+ID4gPiA+IGluZGljYXRpbmcgd2hhdCB0b29scyBoYXZlIGJlZW4gcnVuIG9uIHRo
ZW0uICBJIGtub3cgd2UncmUgdHJ5aW5nIHRvDQo+ID4gPiA+IGF2b2lkIG92ZXJ1c2Ugb2YgY29t
bWl0IHRhZ3MsIGJ1dCBtYXliZSB3ZSBjb3VsZCBhdXRvbWF0ZSB0aGlzIGEgYml0LA0KPiA+ID4g
PiBhbmQvb3InIHJldXNlIHRoZSAnUmV2aWV3ZWQtYnk6JyB0YWcgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLiAgSSBjb3VsZA0KPiA+ID4gPiBlbnZpc2lvbiwgaW4gc29tZSBmdXR1cmUgd29ya2Zsb3cg
dXRvcGlhLCB3aGVyZSBhIG1pc3NpbmcgJ1Jldmlld2VkLQ0KPiA+ID4gPiBieTogY2hlY2twYXRj
aC5wbCBBTkQgY2xhdWRlIEFJIHJldmlldycgd291bGQgYmUgZ3JvdW5kcyBmb3INCj4gPiA+ID4g
cmVxdWVzdGluZyB0aGVzZSBiZWZvcmUgaHVtYW4gcmV2aWV3Lg0KPiA+ID4NCj4gPiA+IFJlYWxp
c3RpY2FsbHksIHdlIGNhbid0IGV2ZW4gZ2V0IHNvbWUgc3VibWl0dGVycyB0byBydW4gY2hlY2tw
YXRjaCwgc28NCj4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIGFkZGl0aW9uYWwgdGFnIHdvdWxkIGhl
bHAuIFdoYXQgZG9lcyBoZWxwIGlzIGhhdmluZw0KPiA+ID4gdGhlIDBkYXkgYm90IHRha2UgYSBm
ZWVkIG9mIHRoZSBtYWlsaW5nIGxpc3QsIHNlbGVjdCB0aGUgW1BBVENIXSB0YWcNCj4gPiA+IGFu
ZCBydW4gY2hlY2twYXRjaC5wbCBhcyBwYXJ0IG9mIHRoZSB0ZXN0cywgc28gc29tZW9uZSBjb3Vs
ZCBkbyB0aGUNCj4gPiA+IHNhbWUgd2l0aCB3aGF0ZXZlciBBSSBhY2NlcHRhbmNlIHRlc3RzIGFy
ZSBhZ3JlZWQuDQo+ID4NCj4gPiBUaGVyZSdzIG5vIHF1ZXN0aW9uIHRoYXQgMGRheSBhdXRvbWF0
aW9uIG9mIGNoZWNrcGF0Y2gucGwgZmVlZGJhY2sNCj4gPiBoYXMgYmVlbiBhIGdyZWF0IHRoaW5n
LiAgSSBzdXNwZWN0IHRoYXQgbW9yZSBzdWJtaXR0ZXJzIHdvdWxkIHJ1bg0KPiA+IGNoZWNrcGF0
Y2ggYmVmb3JlIHNlbmRpbmcgdGhlaXIgcGF0Y2hlcywgaWYgZmFpbHVyZSB0byBkbyBzbyByZXN1
bHRlZA0KPiA+IGluIGF1dG9tYXRpYyByZWplY3Rpb24gb2YgdGhlIHBhdGNoLiAgVGhpcyBpcyBt
b3JlIG9mIGEgcHJvY2VzcyBiYWNrYm9uZQ0KPiA+IGlzc3VlIHRoYW4gYW55dGhpbmcgZWxzZS4N
Cj4gPg0KPiA+ID4gQWx0aG91Z2ggdGhlIHByb2JsZW0gd2l0aCBBSSBhY2NlcHRhbmNlIHRlc3Rp
bmcgaXMgdGhhdCB0aGVzZSBtb2RlbHMNCj4gPiA+IGFuZCB0aGUgaW5mZXJlbmNpbmcgcmVxdWly
ZWQgdG8gcnVuIHRoZW0gZG9lc24ndCBjb21lIGZvciBmcmVlIHNvDQo+ID4gPiBzb21lb25lIGlz
IGdvaW5nIHRvIGVuZCB1cCBwYXlpbmcgZm9yIGFsbCB0aGlzIEFJIC4uLiB1bmxlc3Mgd2UgY2Fu
IGdldA0KPiA+ID4gc29tZSBjbG91ZCBjb21wYW55IHRvIGRvbmF0ZSBpdCwgb2YgY291cnNlIC4u
Lg0KPiA+DQo+ID4gSW5kZWVkLiAgQWxsIHRoZSBtb3JlIHJlYXNvbiB0byBlbmZvcmNlIGl0IGF0
IHRoZSBzb3VyY2UuICBJdCB0aGVuIGJlY29tZXMNCj4gPiBhIGNvc3QgZm9yIHRoZSBjb250cmli
dXRvciBpbnN0ZWFkIG9mIHRoZSB1cHN0cmVhbSBjb21tdW5pdHksIHdoaWNoIGlzDQo+ID4gZ29p
bmcgdG8gc2NhbGUgYmV0dGVyLg0KPiANCj4gRm9yY2luZyBjb250cmlidXRvcnMgdG8gcGF5IGZv
ciBhY2Nlc3MgdG8gcHJvcHJpZXRhcnkgdG9vbHMgaXMgbm90DQo+IGFjY2VwdGFibGUuIEZvcmNp
bmcgY29udHJpYnV0b3JzIHRvIGV2ZW4gcnVuIHByb3ByaWV0YXJ5IHRvb2xzIGlzIG5vdA0KPiBh
Y2NlcHRhYmxlLiBJZiBtYWludGFpbmVycyB3YW50IGNvbnRyaWJ1dGlvbnMgdG8gZ28gdGhyb3Vn
aCBhbnkNCj4gcHJvcHJpZXRhcnkgdG9vbGluZyBiZWZvcmUgc3VibWlzc2lvbiwgdGhlbiB0aGlz
IGhhcyB0byBydW4gb24gdGhlDQo+IG1haW50YWluZXIgc2lkZSAoYmUgaXQgb24gYSBtYWludGFp
bmVyJ3MgbWFjaGluZSwgaW4gc29tZSBmb3JtIG9mIENJLCBvcg0KPiBzb21ld2hlcmUgZWxzZSku
DQoNCkkgYWdyZWUuDQpXZSBkb24ndCBldmVuIGhhdmUgdGhlIHJlc29sdmUgdG8gZ2V0IGNvbnRy
aWJ1dG9ycyB0byBydW4gY2hlY2twYXRjaC5wbA0KKGEgZnJlZWx5IGF2YWlsYWJsZSBhbmQgaW1t
aW5lbnRseSBhY2Nlc3NpYmxlIHRvb2wpLg0KSSB0aGluayBpdCB3b3VsZCBiZSBpbGx1c3RyYXRp
dmUgdG8gZmlndXJlIG91dCB3aGF0IHRoZSBiYXJyaWVycyBhcmUgdG8gdGhhdCwgb3Igd2hhdCBh
IHByb3Blcg0KaW5jZW50aXZlIHN0cnVjdHVyZSB3b3VsZCBiZSAoYW5kIHdoeSB3ZSdyZSBtaXNz
aW5nIGl0KSwgYmVmb3JlIHRhY2tsaW5nIHRoZSBBSSByZXZpZXcgaXNzdWUuDQpUaGVuIHdlIGhh
dmUgdG8gZGVhbCB3aXRoIHRoZSBjb3N0L3Byb3ByaWV0YXJ5IHRvb2wgaXNzdWUgZm9yIEFJIHJl
dmlldy4NCg0KVGhlcmUgYXJlIG9wZW4tc291cmNlLCBsb2NhbGx5IHJ1bm5hYmxlIG1vZGVscyBv
dXQgdGhlcmUuICBUaGV5IGN1cnJlbnRseSBkb24ndCB5aWVsZA0KcmVzdWx0cyB0aGF0IGFyZSBh
cyBnb29kIGFzIHRoZSBsYXJnZSBwcm9wcmlldGFyeSBtb2RlbHMsIGJ1dCB0aGV5J2xsIGdldCBi
ZXR0ZXIgb3ZlciB0aW1lLg0KDQpJIGRpZCBzYXkgdGhhdCB0aGlzIHdhcyBpbiB0aGUgY29udGV4
dCBvZiBhIGZ1dHVyZSB2aXNpb24gb2YgYSB1dG9waWFuIHdvcmtmbG93Lg0KDQpXaGF0IGJ1Z3Mg
bWUgYWJvdXQgdGhlIGN1cnJlbnQgZGlzY3Vzc2lvbiBpcyB0aGUgaW1wbGljYXRpb24gdGhhdCB3
ZSdyZSB3aWxsaW5nIHRvIGp1c3QNCmFkZCBtb3JlIGNvc3QgdG8gbWFpbnRhaW5lcnMgb3IgdGhl
IHdvcmtmbG93IGluZnJhc3RydWN0dXJlLCB3aGVuIHRoZSBjb3N0IHNob3VsZA0KSU1ITywgYmUg
Ym9ybiBieSBjb250cmlidXRvcnMuDQoNCj4gDQo+IFlvdSdyZSByaWdodCB0aGF0IGNvc3Qgd291
bGQgdGhlbiBiZSBhIHByb2JsZW0uIEkgY2FuIGNlcnRhaW5seSBpbWFnaW5lDQo+ICRwb3B1bGFy
X2FpX2NvbXBhbnkgc3BvbnNvcmluZyB0aGlzIHNob3J0IHRlcm0sIHVudGlsIHdlJ3JlDQo+IHZl
bmRvci1sb2NrZWQgYW5kIHRoZXkgc3RvcCBzcG9uc29yc2hpcC4gSSBkb24ndCB0aGluayBydXNo
aW5nIGluIHRoYXQNCj4gZGlyZWN0aW9uIGlzIGEgZ29vZCBpZGVhLg0KR29vZCBwb2ludCBhYm91
dCBuZWVkaW5nIHRvIGF2b2lkIGxvY2tpbi4NCiAtLSBUaW0NCg0K

