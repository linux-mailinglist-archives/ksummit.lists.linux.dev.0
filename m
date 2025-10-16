Return-Path: <ksummit+bounces-2556-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA6BE3830
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2DA03588EB
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AE5335BB6;
	Thu, 16 Oct 2025 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="AMWAwAOl"
Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021096.outbound.protection.outlook.com [40.107.192.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB933438B
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619251; cv=fail; b=pXEsZlj6NjZZeak3T9oe13g1URTWbNIiVlG4bSTev3cujKC9J8MuU7e+b4zO9mVTaveNX1TdSMhdEaX2vPRyFO2+30ZldID0eRoHoU+UBMX3jLjLjVJC+PK0WkjDHZriGrnD1nxkbHHx835e99gAW6egCzJ5gxmO1eWTrdGnMog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619251; c=relaxed/simple;
	bh=abMW7/OAgnt6AwabZKm7010LMdZySxVVTOMLBPk57Q0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NvIRMaaYtYEv3cO4PzThN1/7irii37+4ce/gRQsjSYTdKTkINw+cIWBIeycC3sq5AGmBUA3Be0EndNi6DnDQrNLtQWLnapa66qbeYUxexR7zQ+gzOpKnOlVtbWMXHREAbopMcylgVtxlsCmZ3TH2N4lgBjf1EZDKNyeaodvpb7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=AMWAwAOl; arc=fail smtp.client-ip=40.107.192.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrf4STZ+k9RlYScBkb7DK1yc3Ui7QjDYIXWh4j+8FxCfmH07tsP/glZi7wzaP/BBwvXeX0/1fyqZVN7bMTMSJ/LbAEcsx3Zz24u5Jp0/DxLdYNv95Agkrjj5dOVqc+qM4bTrmJ7KwvIlM/An5nFZP1ILIxO5bifF8M3UI/AlqbmYVXOANEkOqf7VLMf0VFSAI4Ocy8WvLexQ7Qk06EOJYucG4CM+BAHffn6wu0Kk/BvM18tD2kW+Q5ClV6UJ4fVgT7KeTY1lnvaqMlfQkuvMDd5gF3qeNfhcclGu8oWlGxtUiyGTLy/kusDqSX//X0Jn3cFA3KigHVDwDjhCA73fTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70FgUX9PjILowG2byd4eE0HsHSE2M9McNAiFTLDh8fo=;
 b=Tej7SXDnzuLRbYlCnWOBIAJlPKgNzlnsFPLKEDY4rJBNi2WDO8Ep1OtcymOmMVuMAE/RETB3O6IdMfPmBIl3pUNRvkmKI/3R6U6vZ7Fa2HZTXYbiRJpxslpSyKKamVscYZfP+CoSjIVtWM4/Wq2qe4PryoDosllrGKIvPrAdXFUfr05m+ZYaAoJLK/u0B9qF58FtLqk4+gf1mpJPvWfhnk9u0ykmCVCLpnj4sFYt9F1zxA3Qy/DOSS5AUW/LGDsKeXyoBPxAJ5FGFfWUMSKMJQX0rOrzuHVW5A5ZQEfQaD3J8bJBT/AR0rP2MfPxsHfo2L0dcuYm0FuGdR8i67HdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70FgUX9PjILowG2byd4eE0HsHSE2M9McNAiFTLDh8fo=;
 b=AMWAwAOlh5/LXutbi8/MCL+0VUT5fZlLCaI+Zrw3wDfInt2/fsjBlMJRdEgKJ9i1X9a884E7yoW01l+UTTd3Y56tYdp4grlORHD9qM3HApd4FDMPBArQrMti+Vub13OieHjiD6wHjl3dEWNKyxniCfwtflh5VzW9I73DZoUKoVw7oqIerg5IR1yhT1jQKyGvAz1muaoLHmOWsbmKPStxzwwnpjGyJd1AC5RxsN8Ij0a7M/KJbJZLS57Wep7VUAEpguFwajqMOhfcrTVMVhGtVZy7qT+8BcuCTUir1ByVRCw3svBfYAA3YBLnxDeEiV2njfPzJN8LSdiePXduK4tKwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by TO1PPF9CF16A047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::66d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 16 Oct
 2025 12:54:03 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 12:54:03 +0000
Message-ID: <981e4252-6adb-4214-a8b2-e6411a19eb4b@efficios.com>
Date: Thu, 16 Oct 2025 08:54:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh>
 <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
 <CAMuHMdWi4wtSUpq-GUv0ggHtC1ZESkuHwRc3Y905nUzi0=juEQ@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdWi4wtSUpq-GUv0ggHtC1ZESkuHwRc3Y905nUzi0=juEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0289.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::9) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|TO1PPF9CF16A047:EE_
X-MS-Office365-Filtering-Correlation-Id: d1da4205-b8b8-4d86-df26-08de0cb31530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEgvTHhJNkNOVWxDNEVnNmRMNEM0Ty9uYXFsN3BrYzQrMDh3ekZsdGhVdkVn?=
 =?utf-8?B?ZlFkRHRYSHdaY29lV0pzWnpINzJrbXQ0UWtySTh1U0s0d2pTWVhHNHBNWVgx?=
 =?utf-8?B?SzlaWWtKUTVnRTljYkhNZnlSL21SMDNYZFA5aCt6OGpadXhKZGhNdS9wSElC?=
 =?utf-8?B?cGl0NTNVZDJTZFZzK3kza3g0S2VJT0VJN0NBejl3SmVjcFBTRk56N0VKVkNS?=
 =?utf-8?B?MHBQVStSRFZ3NTJnRFBDUFpnNGplNHlQNmZPS2l3cElTeWprZGdTeVgrbThC?=
 =?utf-8?B?MG1iSFFOaXdPc2pDcCtJZktXMVlpd01mcXNuekc0dUZFQ3E3cmlwZkNKRSsw?=
 =?utf-8?B?SFVheXQ1a3lwREUyZjk2bzAycmtQTlJiSi91bk01am9ZOUFqdnMyaHNIa01C?=
 =?utf-8?B?SnVuR05TU3l4MlQ3alhyMnRrdnVQdVZReDFrc0JpQmViY2w5V3hXM2xxTk9R?=
 =?utf-8?B?NjdVUStIbVNEVmtmcXJhaUkvOEQ3bmx3WnpYSnJ0QkYwQUNxUzRha3dockRX?=
 =?utf-8?B?ZE8rV2MrT1p4YmlJZ3dSVjc5OXVnZnJybGFCb3JsVnFYaStKNWQ5MEpIY1d3?=
 =?utf-8?B?amhrTHpzbDNxcnViaEQ3b0NXNFdlN0FyUG5IUEJyNkQ1Yk5NYUJLUHFJMFkz?=
 =?utf-8?B?NWVwQjNPdy9WMEl1NW1SYlJ2a0Y3MzVwSk9YN3Rqbk9qUTBVOUxqT1NXa3lM?=
 =?utf-8?B?SFgwRDFxZFJsMFJ6UWkyOVVwdm12SEVBa1U4eXFHT3R5VG43ei83UUk4RHBV?=
 =?utf-8?B?ZDNrL0xQbmRHMk4xOWxQcXd2d3RWa2MrVXEwcGVxT2Rwdk1keEs4RHZWWms3?=
 =?utf-8?B?UXJKNDY0ZUE1NXY3U2gwTGJPRFM1dkpWYnQ3RGNPdnB6WVI2ZFRzZWRQT1l0?=
 =?utf-8?B?R1ZnVDlDcitobjdTbFF3T2JPaXZPWlhvOVM5TGQ4U2NOdSs0WHAzaFExZjRQ?=
 =?utf-8?B?b3Y5K0R2TmJqSE41M3hHeTJoV082K0JhdzJmaEViMVlYNDdrNmlUQllHbzRF?=
 =?utf-8?B?WERxa1hvcVAycWVWUTlEVitOODlSQ3kyT2hPazR1WGZwb282cVhjZ3A0cXd6?=
 =?utf-8?B?SUtUbWducnBsSUdOUDBPbjZNTS9mWExXMUxhSkhnN2phc1NkVlpXdmtMSDhE?=
 =?utf-8?B?WkVhNG1oMFRqWUlpUVliRkpYemRyTkVLYStJbVlCUk9TYmZ6NStabXIrN3JI?=
 =?utf-8?B?YWVmdlJUMVUvV0dCNklVKzdoUGhReCsrY1J5NThxMVhCQXZiMGh1bTdFN1BI?=
 =?utf-8?B?NXpIZkRQTWxYSVJyMDEvWEhLNDBWZzFqWGkrRkFGeGFGcVNJeGoxRkZFWjlm?=
 =?utf-8?B?UDhBM1JTd2pmNXZMUzY3Ui9nRjRTUEVEZE1Ob29Xb0tReXorL0o5R3Y0RGtG?=
 =?utf-8?B?VDQvZmw3citVOHp2YzFWNGJBNm1iOG83aVZWM3ZLaDBtbllMY2h0M3pGOW5s?=
 =?utf-8?B?dTltT1R4TkpWMTA4OERGeWtSUG56RSsvLysrY0c0a2huOHNEemNEMUZKM3pN?=
 =?utf-8?B?YVYxZ3Yra1dYNUlsdW0rUXJ2S1NUWGRWUEdXbmhjdkFRak02UFh6ZmJaVlVM?=
 =?utf-8?B?dGlWVUlPdGtRSkJSc1k0S1U4bzV1dHl4VFQwSVZhZEMzZTBId3hkNlNSdWov?=
 =?utf-8?B?YmRESTVTOTlYd255NDByQWNYeTZ5SFI2NkkrVm1KaFRrWXN0Q0V3Ky8wWUFa?=
 =?utf-8?B?alMyd3h5cFEyYmZKUFVPbnJUclZRdEJ0OVhtZm9QaUlxenY5YmRMZkNONHBt?=
 =?utf-8?B?UWloTjZpdUhxTk9lYndhajNOdXE3TkgwbkhYZkd5UXZpd0ZGMUtwLzV3eExS?=
 =?utf-8?B?UUhncjJmdFdVRy9sNTZSd2U0UzQwekx0QTZvSFdOMzV2OGdLVC90TW1xc3lP?=
 =?utf-8?B?Zzd4SFBVa0NCakhIV1drZWtDTmxZV2VvcFRPSVZnZ3p5RFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjlZR0lwSVZyK0lRQkdUZFBqOVE4ZnFWVURRWCtxa1pSYVlzTVo2T2V1ZXFM?=
 =?utf-8?B?emFZWUJZTmM4b2JpUkhhQ0FPbjBvVlhydVpydUF2TlFGZ0FBQnpjdFAxbm1y?=
 =?utf-8?B?NCszNlFaN3h1ZzlQQzUweTVDbDhVb1k0K0Myc2c0cTgvZThYaXJ2MUpMTVFC?=
 =?utf-8?B?bzZVNklpNFZrbGxpTFY4QmJ1Q1JYVWFWRUFDZW11ZWFhTHpaU0dWVnJtS0Q5?=
 =?utf-8?B?d25NT0JDaFlsV3kyMlN5MjFwVnVZTHY2VXZ2dVBpc3lZbTZXcVVNdk1CaDlG?=
 =?utf-8?B?R2xwV3BpdGJKaVBIOEtvS0NQM0owSkpJNGVkRWNnOVV0T0lyTWtmTUQ0c2Nu?=
 =?utf-8?B?NE51amF1WktTSWtSdDdKRGtVRGJLL0Z3S3V0ZkZiUFYrSUU4YkNYOU5vYVVL?=
 =?utf-8?B?dmRtMkYrNXkwR0kyYmQ5V3hBVEIxOEgvcFZpSnFJMFJQdk1aakpaUWR4SFFF?=
 =?utf-8?B?TC9UUnJoWElZZDhuMVFNWUtMTWhJd0s1OW5IM3JBZUFFNjhPUkpmb0lnNDNC?=
 =?utf-8?B?V1drbkxhWmhxVk8xbFNrcUFJb0pMTkYxdm9oWXE0aFMxc3V4RU91clpyeHd6?=
 =?utf-8?B?bzFYOHppekxNanFLd0JvckxLcW5ER0pFZmY5WGVhbmdUaXduZDk5ZUZZWHNt?=
 =?utf-8?B?WTE2bnRoTy9IMjYzK2Y3dkY3V042TDhrVFdQMkgrL0tud3p5Z0FjbmJFTzhj?=
 =?utf-8?B?NDByLy9YcUdYbUNjdVRHZzhWdjE2UGRjYlJ4d29tcmhuNzZuRzhjNjliS1c1?=
 =?utf-8?B?RGdaakxMWVloOVRNSFNRQWRwU0ZMTmI5SVZETGxkdzJVNlFxdEVaeEMzamVF?=
 =?utf-8?B?c29ndEprajBqa3hGdUhBRjArVkt4QmF3ZlBHVEJvZ2xHZTFmYVV1eG93c2U5?=
 =?utf-8?B?YWRZT3lxSXI4aW85NkZnNFIraC93bGxiRGVveTBSc1cxZGJGc2xVT2RrR1p3?=
 =?utf-8?B?bG5QcVY4YmtDeCt4QnZudVp1K1RjWjFybFJqQWdzczQxcmRLcWRnK01DaGVq?=
 =?utf-8?B?YzQzV3ZVekJ4WE15ZWNpOGloQXhFc0t1cEVTZVR3a1F2Q1dmVFRLUDNwUlor?=
 =?utf-8?B?ZUg3SWVxMGNxcjVLdi9xWUZsdVZFTm1sVS9QRVBNck5jUFVld2RUZzQrTnJ4?=
 =?utf-8?B?cERYb2RyWit3OHhoQklPZFlQMlRvZjRmMTY0aldwU01SNjMyVWdYRVRFT29X?=
 =?utf-8?B?M2tnU3NNU0JhbWNIMHk4U1NuZWdxeWhlSWhURVZlNmlZTXV3Q1BKK0x6WVFs?=
 =?utf-8?B?c292SjhOeGh0eStRM1ZHUWlNRWZ2MUF5VjdIajBRK29WNzZDb2U5aFpKUWVO?=
 =?utf-8?B?UE9KY2d1RWdLQXNOeHVRcC9RMlFCbXVoamdwNmk1NHhQQXdKUFBVME1pMWZr?=
 =?utf-8?B?L3lkOU5YWVVUSkRWc2lkUElNb1pJMURXR29MN0lxeVB2R2JyaVcxQ0RaS3k5?=
 =?utf-8?B?dlF3SHlPQUdSdy9RaUhkN1lkaTV4SW91TFd6eEs1b1ZZcnlva0lZMXBIQmx6?=
 =?utf-8?B?eUZGSmdWOEFPdFJHdm1xOSt0QVJEMU1valpsY3Z5eFJLZnF5akl3ZVAwWVJY?=
 =?utf-8?B?ZDh6QlJidjF2b01jRndKNXZOeUFGWC9IYUtkQitzc21hcnJCNitkclJlaGxh?=
 =?utf-8?B?N21FR1pkanVGbjFROW8vOUVCN2JIOFZNTTlVdkpXRStwYkIvbit0YUtnbGtC?=
 =?utf-8?B?cktWWWxxM3Qza3ZrUGxERHd4K25OamZxVG1EbzdkbFdRUkRvT3djd1NXSk1M?=
 =?utf-8?B?NEtqTTJ6SHZCdWFSMk40L29pL25rS2NzZVI4MFd3djV3bVlpRktTM0tzVmU5?=
 =?utf-8?B?YW5WZ1UveEg5K0F1QjR1YlppNFBnbDFURUVXYTFVVHMxZEY1YWFHay9OS0lC?=
 =?utf-8?B?REh3ZnNsM0ZUMlMvMTQ4QXJGcDAyNEwybkU5RWNDNHIrekQ0SlFLRXVzeUdy?=
 =?utf-8?B?ak9NZG1yaXh1UFNCQ1dha0lXVkZ6eTh4eU8rVlhPOVBOVWdPTkg0My9oQ1pa?=
 =?utf-8?B?aWJBWGR4NTF3bndDMmNjbnpwdm9Gdi82L0lTZ0RJd1dnYzcxRGZKTzNTS0JR?=
 =?utf-8?B?QXIwWVpneUM4b3RHMHViOFhSYUpZOU5PenIwczhjQkNFQVpaN0NIdTJXMlJQ?=
 =?utf-8?B?TGovbkNiSWJMVHJIL0VyVUtrcDhWN2o5MnJNTk5qMHJxbXF4djVySGZ3TWRm?=
 =?utf-8?Q?Kr+1mL81Dzc/s1YogZajQbM=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1da4205-b8b8-4d86-df26-08de0cb31530
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:54:03.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arUNYESCZEQcRVTsUVuXg4Hvx/y/6h/9StPmG14DZJlKhJcpojCiFiFjoU5cvA5lGsEZpxz3Nd0qbdEw2lPqKJPUzuZ53kyb6KMC4iUjBT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPF9CF16A047

On 2025-10-16 08:49, Geert Uytterhoeven wrote:
> Hi Matthieu,
> 
> On Thu, 16 Oct 2025 at 14:35, Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>> On 2025-10-16 08:18, Greg KH wrote:
>> [...]
>>> Be it a link: or a message-id, or something else that I
>>> can "set and forget" in my git hooks and so can all other maintainers.
>>
>> I can't help but keep thinking that we are trying to solve a problem
>> that is fundamentally just about namespacing with needlessly complex
>> technical solutions that will degrade the workflow of many maintainers
>> across the span of the entire Linux software development process.
>>
>> The "Link:" tag is unfortunately a bag of holding for all sorts of
>> links. So if Linus interprets the "Link:" tag as a link to relevant
>> URLs with an implied meaning "see also" or "more relevant info
>> here", then whatever else gets added under "Link:" with a different
>> purpose is seen as noise.
>>
>> One possible solution would be to introduce a new tag such as
>> "Link-Origin: https://..." or just "Origin: https://..." or
>> whatever better name we can collectively come up with.
>>
>> That way the semantic should be obvious to everyone.
> 
> We already have a way to distinguish:
>    - "Link: https://patch.msgid.link/... " for the original patch email,
>    - "Link: https://lore.kernel.org/..." for e.g. the big upfront design
>      discussion.

What I'm trying to figure out here is whether Linus is aware of this
implied namespacing within the URL, and if we can improve the
situation by lifting the namespacing to the level of the "Link:"
tag rather than hide it under an implied semantic within the URL.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

