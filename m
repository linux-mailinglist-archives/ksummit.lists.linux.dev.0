Return-Path: <ksummit+bounces-1449-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0653937757
	for <lists@lfdr.de>; Fri, 19 Jul 2024 13:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6BF28227D
	for <lists@lfdr.de>; Fri, 19 Jul 2024 11:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87BA127B62;
	Fri, 19 Jul 2024 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P5eaeHZ7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q5HQ93AF"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B18286A
	for <ksummit@lists.linux.dev>; Fri, 19 Jul 2024 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390167; cv=fail; b=oJ7ddVXsKJ+k7Hs1d+zbU8AwYZ3JldtXHCwsfP/KKFKKaDUfTJD2oIf4PGXVSZfxZoI0SrrLa0wygeFctGyiGuwSnjcwR2zEkGqKuoV0C1PoWWkW8TTclARuXNf9pbRXzP68CouIi/v4XMxlIZ3x1eDYPUkQF3Dj8U0S9Z9opY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390167; c=relaxed/simple;
	bh=FH7ge7Al9O6dmQnDs7SP2E9E87oSOT6DxLBX1IAI4Sk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yk+dKruKeRO3kF9Ed80JKUsr8wsbjZYpHiBSQvm93Pl1TxEdG7hwS4uxfe1iqAaIIX+KWNaHuAGvzcxKs8+z1+D6cKRq1t2SLCBl//U8MAWIlKCiETFUEwAihOukctJxE0B95ZeeI5OIR+CSBs0f3MwPqsEhj1UphA2Gr/hPu+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P5eaeHZ7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q5HQ93AF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JBp8I4006275;
	Fri, 19 Jul 2024 11:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=FsnklzUQKsdDkYWzR0ITkfNd7OucL0Xeq63W0zI+xPw=; b=
	P5eaeHZ72duwjrbSLD9fsN36t1yiK/1Er6DPW1gfG5wRwz965+/x3mdxnieJnP8y
	woCW8qjVlClQNhXTRG0JpRGkJB9W1vImiWypAroS0R57JsBITc5PymZuztp9mqOS
	fRyjFqXjf7NQPkTatDhDNv4WxS29eQPOuGVMistd6yvAbfG900LKzfcQDrjE2WAE
	NfpI/1Cr+H1F/ANrokebN3p8FzqXbqJ59jnCIDs0OPGqRZ9EkLzULEhFG9X1uwWt
	zG/BTS4xgHeD80db1VDqTEQAiSjrvNFDwb9AleuyDTJp8qe5jIsVuyLgwLYkeprZ
	IUliaDsFOAWWj/ZsI9r60Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fqmc00bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jul 2024 11:55:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JBpje7039533;
	Fri, 19 Jul 2024 11:55:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwexjrhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jul 2024 11:55:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWaFn3Nwlyc0TjiwuD1OooZ0mAF4O6iuXZm2vtMqaE4liZ74U9BfY/dJomlKFSUipFOnogsnOZ2vhGpWsWEZCwuWyIhWh6QTluPrR7qg9EOjDu7Rxv+X7ysqBFrEsYp5ODNHC9VN5aM7Miz+lnRIauP26vOuqds+7qKlIj3ZdTtApJONN3huzUQ5V73XCT2Sp/CLOC1hy87jsb0qDEefyTunA305vj8EmgbuydlM1KLO5Q0T5TkOLfE9LVIp7eWLmfnKmtRnOn1iOsHSaEXtSSkidFpwx2s/Cm6ujffnZY335HPBWc3gAnxbGFlt/OFUvbADzxyMqZ8E2r+fbaupzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsnklzUQKsdDkYWzR0ITkfNd7OucL0Xeq63W0zI+xPw=;
 b=xF7bjW0e3ITeObIAJIYcx2rXbkaNbJIFuxZ25+RDVKSVkKvW7KM1wq1Nz55eQXZfVfc80Nr48OZ9Kg3PDdLIJz/awRNoHfeCXY6G2ZUryi6qA3gdI9Ia9u2rWUIjQDsgHzJBYej5Gn7Ots6ew9VOmxVllnUDH5SWsMkbsrTOd0rpr2AtNoGNZvq6DYNe/7KTx7DhOa1RwTzK5jqw1AYR1SoZEToxpqXjYSmq7WWsyDPgIv6O86L4qg3/UGxQwgzkcgB94jreZWsK3w0P7HmUPcbjSsPd6F5QPUenzxZfQMYpG0NOzsPCZGv5vVkRKLD65i8DV07ORJG1MQW1sBO3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsnklzUQKsdDkYWzR0ITkfNd7OucL0Xeq63W0zI+xPw=;
 b=q5HQ93AFlN8MbjHnAscQ9KZKPPmDJVHnFoVbOJZVaVqFQI4dZOFrld0Nt/TcVVwaBtYokVRP956MOIKAmkRSR+6LeaFwNkcYAqKwLlL6VGwfMqW6Xp/M0hTOKePwSl+1pn0+2dpBgM8HLj2JPBEqkOeMRmA7dK2yg1apJpMW5j4=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DM6PR10MB4364.namprd10.prod.outlook.com (2603:10b6:5:223::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 11:55:53 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%5]) with mapi id 15.20.7741.033; Fri, 19 Jul 2024
 11:55:53 +0000
Message-ID: <676be898-56c2-4d26-a64b-5e25b7390899@oracle.com>
Date: Fri, 19 Jul 2024 13:55:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
To: Dan Carpenter <dan.carpenter@linaro.org>, NeilBrown <neilb@suse.de>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        ksummit@lists.linux.dev
References: <> <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain>
 <172135015702.18529.2525570382769472437@noble.neil.brown.name>
 <3b661b6b-3236-45ed-8dfb-a1f1f1a38847@suswa.mountain>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <3b661b6b-3236-45ed-8dfb-a1f1f1a38847@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0440.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::7) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DM6PR10MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd9a5ad-af8c-44c4-d647-08dca7e9bdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnlWd0FQNUFEamdzUFY2NHFRdmxYeVBMaGgvWHAwQzMzSWYzdnNrTFNZUjdW?=
 =?utf-8?B?S0NBdVA5UExlN2Ewb3N0M2N1WWt3SFZTUDVUYTFQT2kwSFZZeUFIKzd6N3lJ?=
 =?utf-8?B?VThDMSs3NVBoOGZsWnV5UVlXN0xTbktROGs5U1oxR1J6OVNkSDExY3gramxD?=
 =?utf-8?B?dDNwRzNYWVRlcTdmVEJNS0RLNkRDWTVUVld3R2dadTV5aVBMZjVFelRlck5z?=
 =?utf-8?B?Y1NvU09SQnE1RkhQbnp4MFl2VHRNam83aU5xaDFvZEZHM1lKRmhhYmVFS0pR?=
 =?utf-8?B?V3RlNktyVXBmNGlQb21WaG9SRVVCbGxNem03UTBncjdhOHZWaDJrK3laeFAy?=
 =?utf-8?B?cEFOK3ZGa01BYisvK2FMREp6NUN6VjBRdEIxOGV3OElyaTQ1RkNEMVYyYTRF?=
 =?utf-8?B?SjVETXY1eHZaaEg2cXB5cGtXaFBlUjRrSDJTcUtzaXlmQlhjT2RaRXB0YUp1?=
 =?utf-8?B?dUFraEhkb0xOakkzaSs0K3RweENZZWRPN1RjRzFZNGh6dDA4aTBpWmM2TXNT?=
 =?utf-8?B?ZlRNSzI5REhwOURTcnJPZXptajAwS1hVSlA4MkRqUDNPY21jc3BlSnhPWW9s?=
 =?utf-8?B?akF5Z2cweTFyS0xjRlhvaUtCbDNlZjh4SkhhdHJxZXE0ZFFZdDJ1NGo5UGRM?=
 =?utf-8?B?Zm5ZMGhwYVNxb3pSM0hFZ205N21yQlN0OXJyUDFxcDBHdXJTSWJORm5NZXZR?=
 =?utf-8?B?MnBaVnI1alU3MFoxSW9MRU1IajBYTzZPSlhRU003R2tJd3A5bXhIUlRjMFRK?=
 =?utf-8?B?YUJJd0l6T0JoRWQrRm1lMkVtSnVGcDVsTVEvcUlqZW5MMkw1WjZLOUxKY3dr?=
 =?utf-8?B?bnRxbjJEblRkOVNxRDhiTmk0bUQzR1phZ1VJUnltTUpHcUppREtlUHhBRUVt?=
 =?utf-8?B?blB0aEVDcGl4T0w3RHUrZVJocHBQK2I4VFNGWXJCRWl3eFpCaCt6OEpCaHVt?=
 =?utf-8?B?T3VlQkZNQjhETkdsNTJDaU1XOFVxLzF6OXpjVlZaUUNBbzVPZWxnbEVCaXhm?=
 =?utf-8?B?dyt4eGVwK3pHalRMZjFmN3laWnpBaUZuSFpORjFPSVZmQWZVL29ndlJSaXV4?=
 =?utf-8?B?SjQ5dVBCaDdYM1dxTWxRKzV6S3pQSC9WVVJ6QkxWTUk5N3gydW5TSUhVTHB5?=
 =?utf-8?B?Si9RTmhZRVRHN3RtSEdhWis1U2xrdEdveDdSeXBSUlhkWHdkVWdLWFBjVFVr?=
 =?utf-8?B?M1J3ZnBLUzVqa1QwMkNVU25uVFhMN0pYSkZTR0FBR0kwUmpTUGh5MzdzVEx1?=
 =?utf-8?B?cFZ5TlQ1LzhyNHVVa3d3WlFUYVZyS3FqeEF3YTdqcDV6TlhicUlPVVFmK2dM?=
 =?utf-8?B?dlNwS3NmdXRxRlJmdENBRlFJbmp0RmVyNUdUTlNFOGJwYlI5WlBqTTkvelIx?=
 =?utf-8?B?UFFQMmZSYm5lejE4YzZoenlDVXhJcTNBbmN0U3I2bFpMaVR2c1MvdkVIWTQ5?=
 =?utf-8?B?dkI1OXg2aDZCalBkN1JIL0pFR3VxeXNKNWY2cHoxNzFuU3FDa3h3T24yRkpW?=
 =?utf-8?B?UmJRTy8vbW55NFRhRzNMVE93Y3E0azFmVGZQUHVreTc5NEczRjVTZ2Y3eFVh?=
 =?utf-8?B?NzZyTy9wTUU1bG94b2xmUGdldGptQUhNWS9GSUlNUEIzaXlEVjkxODFlQVJh?=
 =?utf-8?B?Q1J3bGhRWG1hdERLbk4yWWxyMDdFQlZNMmhBTFpIcGxieFdYcVMxNWhDL21P?=
 =?utf-8?B?RTVzcmx6aTAzdmVsdG1NbDNqRE9HTy9pZ2JJVkdSN3BBcW43YkxFSk9mS2hz?=
 =?utf-8?B?alY4VkhoWEFJYVlMdkkvTUFmaGNZN2VBOEFxdHhETUcvRnB6c3hBWUF3WEIz?=
 =?utf-8?B?Z2x3QnpNRVNJaUtEZVRpWmJXRjdHS0EwbnhEQzU2QW1DVjdXK0hxOS9YSm91?=
 =?utf-8?B?aWNhTXVsYUdTbG5UU1UvbmRjS3ZyUUVHYm9wL1gwWmt3RWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVhNQXN3L2lTd1R4YWpoVXNNK3NaTEJDWDNXeWpTMTFudy9PU1duUjhnSlNT?=
 =?utf-8?B?ODVKakNybXY4akVKQVV5eFE0eXh2Y3NJSUdmK3Fid0hkQVR0WWNONUYxSm4y?=
 =?utf-8?B?SXgxbGh1WDZGYnBqOFVuWlUzSVgxeVhKTkNvZ0VjMmFDUkw2azY4RFZjWWpS?=
 =?utf-8?B?MFJQZ2gzQ1pTZmhXNnhONFlSSzdyNWM3ZlgrbVBLSkhGTHBscm1yS3gwa3A1?=
 =?utf-8?B?T3BHU0dzY3VkT3hSTHlwVDkyVkRUcmw3dVJ0dTIyd0dBekFRL0xtTXBMNjRG?=
 =?utf-8?B?NzZKNlZEamhkNWEyaWZYSjJucE1uRmFXYk9kZzhISkd3NWQzd1dqclhoSU1x?=
 =?utf-8?B?aXFzWWhOaVkxd29CNjYxOXNVNXFUU1Y1MktsVEZMZU50aW9XVFo5QW5ZZ0I2?=
 =?utf-8?B?NHoxK2VwNjJIeFc4RTVNNUlKNFQwL25xT0lrN3VIMFFyejR0OVF0QWpzbGJh?=
 =?utf-8?B?U21oR0xXeE5hTGUrN203NzFpUzRaeXNWZWJtSWFXazRCNFAzZHdLY0NPTFBF?=
 =?utf-8?B?eURBQVN6eDVwTjkrYkYzWjhxUVdNTStYd2pXSjlFWTRkT0hzQlZCelFBdERm?=
 =?utf-8?B?dThTaGlBUm9DR2poZ3FZSU1jclZvWmRwbXVRSFlhKzVndnNpSjV5TE9iVkgx?=
 =?utf-8?B?TlZPSGxzNHZwZTVKRVBHLzRXK2toQkNTaDFEbUw0Y1RDREdoVW5yODZ6OEZM?=
 =?utf-8?B?YmY3VGdrT29vM3N2NjFWcEcxQjFhdnF1TFNyZEhFeWhTN2lxak5DbjZaL1BC?=
 =?utf-8?B?eGxoVlZQRXFKTXhzRWlnNTViNGdEd3VRQktVTVFpb3pnUDBpb3picUx2V1NJ?=
 =?utf-8?B?czFEZ09nZC9ZUjVvbndoMUxGaXV4dEUzeDF4NDJnNjdRL3J0K3hYaDd0a3VG?=
 =?utf-8?B?VXNqKzdWVE9DTm02dytpdUV0cXVDa0JjS21wTHJicW1Va1BPdlg0dEUzQ013?=
 =?utf-8?B?VHlpb2FSMklYNW1VWEM2aElrTDBNZnR1YnE1OTNHalU1YjhUaVFXK1RJc2Ja?=
 =?utf-8?B?K2pLL0Z0a3VwVlY3U212QmlyQkxjdDlPcE13MVJkRHdrZ1J1ZFFaYVJtTkd0?=
 =?utf-8?B?NjlQMUpJRFpwTFIzd3plU1kwVEFzVFo5aXlpRFJpKzdsL01DMFdOblo4RE1T?=
 =?utf-8?B?N3Z3NUtkdVJQQThqSUdQUGc5S09xelhIUE9ucDJNYTh1ckdqNjBHWjA3a3Nw?=
 =?utf-8?B?TEdFUmYzN3NzRFFDenNNWWtKUXpyOHZkYXd2Tm16d1AyN2RzS3lZZ0Jmc3BR?=
 =?utf-8?B?STRDbzBqa3BSR1BLZm92eVNLa3dLUm93SFFCRHI1WjV2aTNYZXhJWjJzUWFv?=
 =?utf-8?B?T1ArTGYrUllUSnhNZk1CZUF0S0pnb3VkNVJuWWN3MkZ2ZzIxSHZqbDdIRmU0?=
 =?utf-8?B?L0F4bHMwMlFQdDZUK2UvbG4xak11MlRFaXlvUldSVXlLaWVGWHBFU0FjZjRo?=
 =?utf-8?B?eWh4bnVSVFZWbUZ0S0NWRzRiMElhNjZQamNPQ1g2cURmRGVxUmc4NitSSHFw?=
 =?utf-8?B?anZNaEpwbnkyeG5yVTlBVXBZcEt2M0NOczR6d01odnZtRzZPbXREc3pKZzdq?=
 =?utf-8?B?OUZoaFZBaG4wTEJzNjd2bUdOeWI2cVhpeGQ4bXlicmc3dmVEbmRKMXBJRHM1?=
 =?utf-8?B?cXovcUdYdGNJRUs5cnVVL1pMNlJWb0UwYjlCbG5nWENzWHJDRU1aN3AzOE9p?=
 =?utf-8?B?TzR4OU9xQUFMRWtaT2VxWEt4bDlleDh4c1cwd1FIRmQ0N0xlR0J5MW9kSzRv?=
 =?utf-8?B?N2cxVFVoaERuOVRKK2NTYmUyWTV5VGQzYVhoVFlsZXl3RDN4QVFna1RubmRL?=
 =?utf-8?B?YndlU2JOd1gyT1hWdE94NVE1Q3d0aEd1bGd5eXp6RVp2eTVna29MMTVTLzVs?=
 =?utf-8?B?NkhBa1o4UWVncnZaTnhWdEVrRnFJaDVjazFxTml3Wmh2UXl1dW5xMCtPODMr?=
 =?utf-8?B?aTFvQUFtTUI0YXJraW9QdGwvU0FudWZLZm1QVFdnUm9Fb1ZQRGt6bzhIb3NK?=
 =?utf-8?B?amFKWHQvdytXanpEV0pDUzdkUFFla0t2NS80YXZxdFFISjhISFQyU0tFak1U?=
 =?utf-8?B?WFdteVNCeWMycWtkVy9qMHBwVHhsOU1oRVdFcDROcDhKaG83ODZPMFdBR2lW?=
 =?utf-8?B?T0JFeG5HdVR4RytVZE55N0ZIT0ZRR1NmR2dQYlg1NWJCQWdJTzZlLy9jYUVk?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8p/Ts+Yuc6Dbh+8223tySBU5mWaOECFVd4e7KJRTFB7U+76Cmzo2nPA6WmTDOW/J82zVeO1G+TOiCEXTDetijnBPjiIn/KbkWvqThdhr0XRH6jDNpYqPTIUrlKGxcbrTdMN654YwjadZ2IpRTziRWOJ/zcigDJhL5XnzyBP6tfRSK3SozMc0C8UWwL9CEU0PTW1fWtbT2y92AHcaqvq0oo2pXn1GFhE7L6N7mJ4PDU6rNG9YxdqSGYzAJuR95OZ8Zyd37XJVTU1k5qAB4Kl2/2k6a7sHEKwKT3kGwjviyINAtC7wH0EP6UJvqV8u0ra81hMrU5H7xqZuqiVpvPf4u9+PUZY0VgMwJdZvJAQ6yp0ruqr8KreC7gAfYs/upUxQQQWUt+uOjKE53tOzcO+4nsFyUPzHagc6yO7qgygVTJey8OANFWKn/2dA3kj/9xyBwrMAXuho/D8fnVENPhAHAoGihm21di73X3c5+yL1q/Cxah/wPfO2IdUfGQg2O0BFHe1Ij8GgxC6zMDMmPAQln36OWH+M5zVAq4Wn6l4w+dftcItDrJhuE6Ml1HMXfGoqdWt1YPZcTZJ61ZeXnVMnP7d4vl6rcmAtpGzqeY1MRyM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd9a5ad-af8c-44c4-d647-08dca7e9bdac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 11:55:53.4579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k35wfZ6X2tsL/RN4CabaM757UtIaHEcplhOQzk0HrZIQickzH17Kzo1f4oqcvJfbvsIhpLKjAmUbJbXsOrJlcPmihEnxS5xOJ+qUv7Puj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4364
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_06,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190092
X-Proofpoint-GUID: RR97P-kzsprSf9ZzvKORW1EdbI2UnOTA
X-Proofpoint-ORIG-GUID: RR97P-kzsprSf9ZzvKORW1EdbI2UnOTA


On 19/07/2024 03:35, Dan Carpenter wrote:
> On Fri, Jul 19, 2024 at 10:49:17AM +1000, NeilBrown wrote:
>> On Fri, 19 Jul 2024, Dan Carpenter wrote:
>>> On Thu, Jul 18, 2024 at 10:56:14AM -0400, James Bottomley wrote:
>>> The majority opinion is that Fixes is only for bugs.
>>
>> First you said "regressions".  Then you said "bugs".  Which is it?
>>
>> If I add a new feature that doesn't work as documented, it is clearly a
>> bug.  I don't think it is a regression.  I think the patch that corrects
>> the bug (either the code or the documentation or both) is a fix and
>> should be marked as such.
> 
> Yeah.  I said that badly.  It should be for bugs.  Fixes tags mostly
> point to "Add <support> for something".  They mostly aren't regressions.

With my distro hat on, I definitely think Fixes: should be used for
anything that fixes a bug, regardless of whether it was a bug introduced
with a new feature or it was a regression.

Fixes: is incredibly useful in the following way: You can check whether
you need to apply/cherry-pick a patch simply by checking whether you
have the commit it fixes (or a backport of it) in your branch. As a
distro (or even as a user), if you have a buggy commit in your branch
and there's a known fix for it, you almost always want the fix.

I don't really like the "Cc: stable # version+" tag for the exact same
reason: Authors/maintainers may be looking at when the bug was
introduced and decide not to put that "Cc: stable" tag since the patch
that introduced the problem was in an earlier -rc of the same release or
never appeared in a stable kernel _at that point in time_. But that's
the wrong approach, as the fixed commit may be backported to stable (or
a distro kernel) many years after it was merged into mainline (just look
at all the commits with Stable-dep-of: in stable), and without the
Fixes: tag we have no way to know that the fixed commit has a bug and
needs to have subsequent patches applied.

IOW, for any patch that fixes an issue, the full determination of
whether something should go into stable can and should NOT be made by
the patch author/maintainer when the patch is authored/merged to
mainline; that decision is guaranteed to go stale very quickly.

 From my point of view, ensuring that people accurately annotate Fixes:
in all cases (bugs in new features, regressions, whatever it is) should
be the top priority in terms of working out and documenting the rules,
and also makes the rules simpler; "Cc: stable" can be reserved for all
the other categories of stable patches like new device IDs, improved
driver support, or whatever. And downstream forks (like stable and most
distro kernels) can then make the determination of whether they need a
patch simply by looking at Fixes: tags and whether those commits appear
in their branches.

Thanks,


Vegard

