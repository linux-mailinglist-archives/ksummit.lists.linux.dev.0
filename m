Return-Path: <ksummit+bounces-2324-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF6B52137
	for <lists@lfdr.de>; Wed, 10 Sep 2025 21:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5192D5E0A18
	for <lists@lfdr.de>; Wed, 10 Sep 2025 19:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693282D8791;
	Wed, 10 Sep 2025 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVDwfLU2"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC41A3178
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533037; cv=fail; b=aHmf6s/eYJxoXgGEJ9FT8YkEcH1T8LmF3Eef/XnDHfKfMWLZmU0xT1Lj8Xchw8dnWsEnSp4PVZQGzZBzSNCsNFRL7Q9Rd8x8NLK07/Orewg3C+VhJ0ZkQes+TjpGJUpsHwF71Yk0zsvghNlQKUmqGBF76HsS5WsWGt0HeTB87gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533037; c=relaxed/simple;
	bh=eBEdbeVt8iHKHq9Td/Y2Xz/0+uyb7sLdhjqEy9Gwd0U=;
	h=Message-ID:Date:To:From:Subject:MIME-Version:Content-Type; b=CLJ20yUqrfEAuKU5JNXcieg5L+KUSfuYJn1t7ozGCIRmTx/cq5iQL2PGNFlVR8IPt7Gh0+tyGeu1Iy1exxND3U1Yvmh3G+iIhZb6RIMJvmW8PwaVOk3H1VEeeTUVKch/JCI8uaZ5IJnAsfIZNb7KqmDKmKMdFh5yWAMqs5tiu6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVDwfLU2; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757533036; x=1789069036;
  h=message-id:date:to:from:subject:mime-version:
   content-transfer-encoding;
  bh=eBEdbeVt8iHKHq9Td/Y2Xz/0+uyb7sLdhjqEy9Gwd0U=;
  b=BVDwfLU23qYye9BL8V0cMTTc2tpe4+gnaz7KZh5jwe8oWtWNnzVrsPlC
   ffGOSJyxZba/RGD00fsICQqqzp1m2emR3eRe2dlzp9M4ophNKKMQcaTJN
   x+CLxBTMKwcZz8smjUHi1j+RXdi16vNjk9qQq0eMHRh3kB/yfmxPrXyMI
   YXLES/Tb5sUJfLQlQaJx/Dj/pYTJ4L+dHIo0MaDa3V10ojS3iDCHttCI3
   RoDykaOrXopcKMb7RsbysQv7P1Ttm1oJ0l3ft9GRxRP5IW01hZ9tozISa
   xmuMPyEEzQnULOBgQw+Doy1qh2y7iHR3CPrVpU+wz8AKa7qSfgAF85/YC
   g==;
X-CSE-ConnectionGUID: Sr2HZMu5Se6IMq6hb2ocfA==
X-CSE-MsgGUID: qBACNaPuQAmmB2ksNbOSkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47428544"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="47428544"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 12:37:15 -0700
X-CSE-ConnectionGUID: gPrtSr2dSEelQb/v5h0E1w==
X-CSE-MsgGUID: KVcWPNC7Qji7nN8UKWMGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="177783539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 12:37:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 12:37:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 12:37:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 12:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om3w48TUUeiQooSSIzR2l4IHoEHr/ajhUC+LX0N+oAA8ipAzJWgffdOWrCkHDt+er61/z6ZETl4ap09/V71bM1jMATiUVj2WGva6DTlpbyLBl+qignkg96lk/zKoznCKUOzw2SjlsUkD13PNpGuHdP7dK3/s+jiBdxPK1EkG5zL3ZINkJwEktwqa5eWvuUg7rZLP/yJtgBtgfic1dYWz+TQ21XPZVh2oPjGBmqN058LEgu0zReODUlokXjdjTHRPqiIpcJM/9HDYLU/UI4YWJahrDjPZXLxl6MPDXeajtQPJRKcllDv8ouE5jY4o9xJLOy54FkzUDJckksEQut84GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXrOQl2fpYcuDnKvXy1uoWwbro1yga5Smy19Iec8BC4=;
 b=sbWVnNg67zcHvhe3piNJqlFILNAMd7DDjJpHf4RLK81tszmXlHKGvay4DNyvml/m3NL0sH1smfUYzARfAhTmlO08MOUDB2N8cUPkARMlG0ClzFpMtp3XhVDujCINecftxjBBPK7rYqWASse+LDPYuM+pvilHsjsu9Or0z9soSPDzd0ELcpHK1zrZBlifo6zd1pPhQLkVzg00KlTAUPIu+bCWG5il1s14hnA18Cn8ZqFfDq8Stt4s+rdTpYZ2EI3yVxkZsvzn0Hqgvj+ePITHEd217soCKnxQN7XQ8Jz9PE2sYoGHNoAmXPq8JOoAIIAwh8/GmljTfzZwlpUJl9AODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:37:07 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 19:37:06 +0000
Message-ID: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
Date: Wed, 10 Sep 2025 22:37:03 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <ksummit@lists.linux.dev>
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: [TECH TOPIC] UALink driver upstreaming
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfccb49-5797-4cb6-b1d3-08ddf0a16cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHZ4VllMUE1mL1lLK2czZUVmTTh4OHFrR3ZEazlBNjJWcnlpSEZXc3dVK1JR?=
 =?utf-8?B?RnZ4c1pyRDZwVDI0aytjTWZndm4xdzRLQmx3K0RXakpEc0pFTFBxQ0lacitI?=
 =?utf-8?B?aGRmVkNHUW5lRHdlRFZDekZHV205MERzQm14dnZWMzgxdXNhMllJTkJRWm9m?=
 =?utf-8?B?aERuZEdPaGFBeTZoY2hnQnZJeU1ocklIYkRtMWdhS20xWEp0UXNkVWtORnor?=
 =?utf-8?B?MzNTa3RUOG5pZ2RwdVArVnFPejJzQndBU0MwMVBCcit2VEhaNkhJcFN6T3lh?=
 =?utf-8?B?VlZNU2l3dVV6bmhzRHpkQUVDQXMrMkkrNnJsRm1ZdDVvTkhvYlhYSTduVXdL?=
 =?utf-8?B?ejN0LzZITGRSUGZkMEYvSnUrL0JrKzdQZFVqR0JtUFZvRWFxMUFZeCtpdW1w?=
 =?utf-8?B?RFpsMzZOOXlPZHVhV080VDJUbUFuZFNTV0VuWldPdVp5YXpOWUthQ21hN3N3?=
 =?utf-8?B?TXY5dnAyelNPckNlZFZ5N3lBOTdDUFRzNU9kbVVzQmhQT3JyOGlrUE5TdlQz?=
 =?utf-8?B?L1ZPUGlCY1YwVDBUZVc2L2JFOXRMYVdUQmNpb2lTUnV2Sml0bjNWMWRabmpa?=
 =?utf-8?B?ZzBBeWxWUlE0WWZHSDRjeHp4T1FYeGkvL2hTc0pRYUdnQnh0OXZ1THZGR2d2?=
 =?utf-8?B?aCswRGMwR0htNnByWFRoTVFyYXRSQUNOSDZTeFZJMWxqVzUvU21oRGtZMGRx?=
 =?utf-8?B?RWVBcloyM0RBMVgyVHBrYm9GaXp1bnZ0K1JEbEtmbmtRTDJWVlA2UTlEUGQr?=
 =?utf-8?B?dzA0NCtHbFVCdFdRdkh6NS80VnFYRUJvRTljNW4xSVdreXBRN0NCcUhqdTRh?=
 =?utf-8?B?dmJNKzRBaFJ5Z0E2dktxcUE2dndxa3BiYzhOMDFyODY0VWZoN3NBMTZRRlJB?=
 =?utf-8?B?QWVUR0NQK000SFR0SktSeFcxeDRqem5SaWJPOXBIZmhwVC9BK2hWTXJ3TjZC?=
 =?utf-8?B?NFFKcWNQdDFqZjUwSS9KRWZOMmdMTmV4UnFsQTNhb2VaNVo0Ymk0b3I4ckhz?=
 =?utf-8?B?Z09sQy9lNnRDSE1HWExwMU1vc1RSeUM5SGFFYTlZekhNZFdvelJiYXNXNDEv?=
 =?utf-8?B?YlVKbERCRHdSZERmcm5WQUJndnRWR2NmbEpQdTJVWUdFUDdIYkdLYzBxbW5V?=
 =?utf-8?B?WEJWWm9ralUzZlREZS9pUk1qVjk5N2JXd3ViR1BjaTJYWWg5OWpPV0NrbVAw?=
 =?utf-8?B?RElNeS9wdWZXYmw0OEtoUy9MZDNnSmhBOEpvSVA4UmkxRXg2aEhWUzAzcUpl?=
 =?utf-8?B?MUduMnBCUGh6Z1pjMWFuUis0akpZS0lPRmQzV2haRWJZU3JXNXJFblVsR0JD?=
 =?utf-8?B?V0ErK0VtdWEyekREWkFhOW5DVU1peHV3UkVTSVVjVVVha21CcEhlZWxsV1RQ?=
 =?utf-8?B?bnhIT1JhbVZXYkNyeVFvdVdPRVRiUDlyRWd1OHB2c1VjUFVVTm1xY0JqUVdX?=
 =?utf-8?B?QlA5UnpyOXdhL1BTUngyTWowS1V4VW13NlFzWng4VDkraDBnTk9SRk12UkR0?=
 =?utf-8?B?cnQzQlpuYjBNMXdXckJGUDdpTzc2M1VBWkZ6R0d5aXlKL0g4ZGdVcHlHaEdK?=
 =?utf-8?B?aFl2WHIxREFpanZVRHJBc3FIc0tIOWZrMzZEK2hEQUxwaHVWTXNEaG1WREV6?=
 =?utf-8?B?elFERGx0UWVlczg4THN0dXpCZmQ1S2dFS3htd2NPZUk5VlRSRjR3Y0gvY3Zu?=
 =?utf-8?B?NEh0enNRa0xMSzdNVFduWXZBVTNQd3kvdGVuSm5HSWs5SmZMVDZVa3R1TS9T?=
 =?utf-8?B?L0kwMDdKWi94YTk2TUhSV0tKK1JRLzgzV3RRRGUzeXlqaTcrUHhneG5BRnlk?=
 =?utf-8?B?azlBTEwxTWpBemZwQ3BuaDFUQTVENHl1ZFdCQ0dESDMrZkF3VnZQMjVtc1d4?=
 =?utf-8?B?dzZHYVFmZ0hYY2djSmZqYVNCVUZFL3MzZU0vWExETjFsME1QWWVxVUtpemFy?=
 =?utf-8?Q?ybtJE/N8KsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8683.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bng1QkxaZDFWOGtCZWx1bldZQTlFdUFHTVFScWMxWUdLMGFOUlIzdVBObURF?=
 =?utf-8?B?Mm1yMnZ4cU1nR3JZYW9FOTVIZ0xXbGFKSWFUVm43cXlQTlZFdUw4OGxyR0tF?=
 =?utf-8?B?OEYwNFhRcWhDdkQzRkdISjFpeEtvYVhDV2ZWZDlPZHdEUkZsTTIya05FWU1i?=
 =?utf-8?B?ZlpncTNubVhUcENZNFpPRC83YkIzQ09vOGFacksyUWhtbXlEd2lvUHBZaElQ?=
 =?utf-8?B?NHhKandzQUluRHladkxYZGF3aDN0VGZzU05XRnZSd3ZVS0lseGQza2duTFRS?=
 =?utf-8?B?UjBrRnRPbDF1Q2tDT2J3UDFPVHJwZVQwNDl4Q1dDeElpZjF0VEhpVzV3WVA4?=
 =?utf-8?B?MlVkN2lhUUtjcFZDOVFGVjF3Q0VOTSsxdUluajNNVUg3cUlwcU5ERFZVYmxW?=
 =?utf-8?B?MUMydnpZSmhpNkpvOEhzYlcwU3FsOWhmNVlINlJrVitZWU96d2lOcCtZWm1H?=
 =?utf-8?B?VWxCS01CdTZoc0tWbFg4bEpHZEpndDM4cjhXK1VhdW1WQk9xdVU0ZldURlA1?=
 =?utf-8?B?YzhoWjk0Z0c1ekp4SXNUZ1JHd2U1ek1IU0h0ckNVc3hUbm5OM05iR1BXTVpK?=
 =?utf-8?B?Tjc0eS9IcE95UnZCZ01wcWRhSTJra0ZrRFNweXI3Vlo4d3gzK3pKcDdxR083?=
 =?utf-8?B?YnFNUUNUQlIyNW93Rmg4QS9UNjdWTnNmdWZSb0pCblEzaWpNVGliWnZHbVhN?=
 =?utf-8?B?K3YvbDdRVFVockFEMTk2aUtETFpJMG9aWit1VDdETFN0Y1BpOXM4ZSswdHdI?=
 =?utf-8?B?YzlBdzNTdjRYQWN1YkhXdG9JemlWYXpZU1pkVDdCamFrKzU5OEZxZ3JmTS8x?=
 =?utf-8?B?cTlxeXpiRDRlTWFTRXBFUDQvSEN4YmJGTWZJVVhhUGIwKzVxR0hLM0NjeXJC?=
 =?utf-8?B?d21CYnNIZFVTRUpGUktnWTFCQzloWHN5V3NvTVliblZrVlJidGpkdWxvNHNh?=
 =?utf-8?B?TEJEY0pxYUtXNTFZZDhIdFM1U0JJMWRHemcvRTVHY2J2Qnd5RGF5U2hkaHl0?=
 =?utf-8?B?K1QzVFNuV091aVJsc0x4ZkE3MzdPdmw0dzNXcnh0ZWFKV1c5a1E3MDRiQ1No?=
 =?utf-8?B?Qkt5aXZZM3U5TUFDd1VvWkNBcndrT1pqUmlYSkNSSnN4QnJqcUZOamZZMG5v?=
 =?utf-8?B?Tk50U0lVMFhYKzVNRGNOTHlPVjc1eFRGbjJOMFpWTVV2Vzg5SFY4RjVMV2pG?=
 =?utf-8?B?eTBRTW5NWjBxS1c0eHVXUFlTLzJjWUVnTDJuUHFjZXNDeHJoamtibW0vRkQz?=
 =?utf-8?B?aEFXNnMrTDJTYm9nZlpMeFBpS1pQQnhiWjJROU9ibHhYV01oNVQrMm1KTEVR?=
 =?utf-8?B?ZVl4VXkxMVNlM01iTkxxS08zeEgyZDNhOG1RdE1GNXZoYkRrZ01jQnhybnJK?=
 =?utf-8?B?eDJSSWgzWFV6Q3RtcGJKZU1TK1pnQnIzalZZNWxoTmFzMUVqMndDUVZoY1pv?=
 =?utf-8?B?UXdhZ0lWWXNLdEMvM2psN1BJaGd0MUVFK0YzVHlsZ2R1YS9HcmpEUHoySk4w?=
 =?utf-8?B?cnpQNzVWazRCQ2RyTU9ROFVvWldWVnJBUHhxSStBaVhoY1pOSmFaMXQzdzdT?=
 =?utf-8?B?aVIzYTU0ZUpLQ0lyRzRGOTVYcVpiRjdkQUVEUVprazVVL1F0UkJ5eHoxdzkx?=
 =?utf-8?B?UDhMYUVaMzRRNThXVFV5NDBEN2dkZnBkT09sdm1RN2J0OW12ZHhacjlXenF5?=
 =?utf-8?B?dUYzTExaS2lXcmVqOGduUUFvNkJ5VjY3aWYxbGxuV1I5NmE1Wlo0dlBNTGRV?=
 =?utf-8?B?ODRmVnQwQnJZeUQzUjc2QXJmYWFJUCtuVUNYQXdTNzlFYmFnNHh2Q0JRV1V2?=
 =?utf-8?B?bG1aZWdkeVA2SXBidVVMRStrVkZidlAyV1I1elY1Z3JKRzIycVZWSzV0em9I?=
 =?utf-8?B?NHJwWHJmb2ljSHBwMHZGeURadTdNVStpUGV2bS9BZGt0akd3QmwybjZSMTA3?=
 =?utf-8?B?ZnAwbEJyYUNTSXpFdlo5R24vOFg3eGFNN1VvRnpiNmluMjJiT3hrKyt6TzNI?=
 =?utf-8?B?WFhIcUVLK2Rab2N2Q2hYRWR6b3BYOUUrVy9JamlGWktNK2tWSkRPYUZZM2Qr?=
 =?utf-8?B?bjRQQXNMOHVHRk52YUlzTVROeFN2MWc1MDhEOTg5dWFwV1lUNXB2b3V3WWxJ?=
 =?utf-8?B?WXJSaTZHVlBVcTg5Snd0NFNNaVd2UjFkME55cDg1SzB0Z0ZBVEZUYWl3L0I2?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfccb49-5797-4cb6-b1d3-08ddf0a16cf8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:37:06.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XL7YT2a3iqkzLp1dIBq38qeKxJDB92PN856T2i2kcYKX31WlGyzZwMPQtF7PVLEjD4KIw/FH0cr4YjJ3ycDdlM0dQ4bND7sTjvtQGWXcuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLAoKVGhlIFVBTGluayBDb25zb3J0aXVtIGlzIGRlZmluaW5nIGFuIG9wZW4sIHZlbmRv
cuKAkW5ldXRyYWwgaW50ZXJjb25uZWN0IGFpbWVkCmF0IHNjYWxpbmcgQUkgd29ya2xvYWRzIHdp
dGggbG934oCRbGF0ZW5jeSwgbWVtb3J54oCRc2VtYW50aWMgY29tbXVuaWNhdGlvbgpiZXlvbmQg
UENJZS4gVW5saWtlIHByb3ByaWV0YXJ5IHNvbHV0aW9ucyBzdWNoIGFzIE5WTGluayAoTlZJRElB
KSBvcgpJbmZpbml0eSBGYWJyaWMgKEFNRCksIFVBTGluayBpcyBhIGNyb3Nz4oCRdmVuZG9yIHN0
YW5kYXJkIGFuZCB3YXMgcmVjZW50bHkKcmVjb2duaXplZCBhdCBGTVMgMjAyNS4KCkkgd291bGQg
bGlrZSB0byBwcmVzZW50IGEgcHJvcG9zYWwgb24gd2hhdCBVQUxpbmsgc3VwcG9ydCBjb3VsZCBs
b29rIGxpa2UgaW4KdGhlIHVwc3RyZWFtIExpbnV4IGtlcm5lbC4KCktleSBhcmVhcyBmb3IgZGlz
Y3Vzc2lvbjoKLSBDb3JlIGRyaXZlciBkZXNpZ246IHByb3Bvc2VkIHN0YXJ0IHVuZGVyIGRyaXZl
cnMvbWlzYy91YWwvIGZvciBkaXNjb3ZlcnksCsKgIHRvcG9sb2d5LCBhbmQgcmVzb3VyY2UgbWFu
YWdlbWVudC4KLSBNZW1vcnkgc2VtYW50aWNzOiBzYW1l4oCRT1MgYW5kIG11bHRp4oCRT1MgcmFj
ayBzY2VuYXJpb3MsIGxldmVyYWdpbmcgZG1hX2J1ZiwKwqAgSE1NLCBhbmQgTlVNQS4KLSBDb250
cm9sIHBhdGg6IEFVWCBidXMgZm9yIHZlbmRvciBleHRlbnNpb25zLCBvZmZsb2FkaW5nIHJlYWzi
gJF0aW1lIHNlcXVlbmNlcwrCoCB0byBkZXZpY2UgbWljcm9jb250cm9sbGVycywgZ2VuZXJpYyBV
QUxpbmsgaW50ZXJmYWNlLgotIFNlY3VyaXR5OiBjb25maWRlbnRpYWwgY29tcHV0ZSBzdXBwb3J0
IGFuZCBhIHVzZXJzcGFjZSBkYWVtb24gZm9yIHRvcG9sb2d5CsKgIGFuZCBhdXRoZW50aWNhdGlv
bi4KLSBVcHN0cmVhbWluZyBzdHJhdGVneTogYmVnaW4gd2l0aCBhIG1pbmltYWwgY29yZSBkcml2
ZXIsIHRoZW4gaW5jcmVtZW50YWxseQrCoCBleHRlbmQgdG93YXJkIE1NIGludGVncmF0aW9uLCBk
bWFfYnVmIHN1cHBvcnQsIHNlY3VyaXR5LCBhbmQKwqAgY3Jvc3PigJFzdWJzeXN0ZW0gd29yay4K
ClRoZSBnb2FsIGlzIHRvIGRlY2lkZSBob3cgVUFMaW5rIHNob3VsZCBiZSByZXByZXNlbnRlZCBh
cyBhIGZpcnN04oCRY2xhc3MKaW50ZXJjb25uZWN0IGluIExpbnV4LCBjb21wbGVtZW50aW5nIENY
TCB3aGlsZSByZW1haW5pbmcgdmVuZG9y4oCRbmV1dHJhbCwKQUJJ4oCRc3RhYmxlLCBhbmQgbWFp
bnRhaW5hYmxlLgoKQmVzdCBSZWdhcmRzLApLb25zdGFudGluIFNpbnl1awpIYWJhbmEgTGFicyBH
YXVkaSBkcml2ZXIgbWFpbnRhaW5lcgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIElzcmFlbCAoNzQpIExp
bWl0ZWQKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlk
ZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVu
dChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBj
b250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


