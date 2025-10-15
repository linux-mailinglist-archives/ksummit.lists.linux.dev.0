Return-Path: <ksummit+bounces-2529-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7290BDFCFE
	for <lists@lfdr.de>; Wed, 15 Oct 2025 19:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8891883E8D
	for <lists@lfdr.de>; Wed, 15 Oct 2025 17:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF44296BA2;
	Wed, 15 Oct 2025 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0B6RxCy"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEA86342
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760548181; cv=fail; b=SUHWKx+7t3Oli2+JHpgPFx9b59fLzs7/U6U8NVQ1+oLsKSINu3mjZje/LZl0RcA2H9C8suHs9LQBacjYLmAkF2G6O/5bSp++2QvSLAFOk+hyFa/MCV3ud6v1v1S1M06KjG4/K7ddg+dAMUGyncnP0nT4ziAul0Qy13PGRVc8xts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760548181; c=relaxed/simple;
	bh=Y+t9K70bxCqr4wIN54jZWFL6TB74w1NJDH7IVL3n7W4=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=ZATW1GUuLhijBzBhR69RlWiq4udP7Q137NTLeX9ZdOyVru/tc2tnoCUicEX9bykouZ4dJkQ1zP/8KYdKUDNlqaq+mcHIltbXn01blhJhcamtLc93q0Wq2YPlecKRa+c1UOqeK1r0D9EC3rOTHFXFOqXN7teGXwYvPcli4Ayn5Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0B6RxCy; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760548180; x=1792084180;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=Y+t9K70bxCqr4wIN54jZWFL6TB74w1NJDH7IVL3n7W4=;
  b=W0B6RxCyPBpE6+7Zt56pylzukHKV+a5ztwvyBnwlWC5d0Y01ZYgKVW7P
   WjQci4TUz3bhpl81svOZh5zpjNv+1qCSV331AdRKqYzp0+J8/BTcXMMr2
   bOv4drQCxN1fBqttNgRP59XcSo0WMBeKVzCgPf74m9B1ENPWVQ5KEQSni
   AxjSnIckUXwYgX0GFis4mKvc89bWLkqFO9JmR7nFmGwjV/NgrkzEBAEr+
   e+vV2A/ifznQvgWG46jlsBydFWVM8nSpPWeQXfTx+bfy3C4A/+dstPDIU
   xGqLfGnWnFOUYYUiiyoOHUiO+LTMYZroG+wwnaf0peV82j0HBkwt5EWWu
   Q==;
X-CSE-ConnectionGUID: Y8nzGXKBTMewrgXWQl/Zmw==
X-CSE-MsgGUID: tb1W11hPRvSPI+lelciN2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62660018"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62660018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 10:09:39 -0700
X-CSE-ConnectionGUID: F/mJVQ+vTcKmMcM/Kubaog==
X-CSE-MsgGUID: pAzsNErlQzukHYDQwM4C3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="182690826"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 10:09:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:09:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 10:09:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RO3GtbdD6hk9q+ZLL8Gy8x7WO5H3mZrTq/ebw5iOruOEArBL4hAzVPokTFUUiK8Sqo3RsWfs/fk8wQ+jgsu43FTr1I1NUeMhNjnn3BmTrZBtW0WY+dFhOOa7fD3pPNrD7KjoX3XQo3lWzkWQu/DISoUCQUEm/I9uTgjpofUXGUj7WvfAeP5PUcp9hDtmsNkfTaljl/dpVapmrQcCmIC1kq96clMC8Ay94EJp8hi5ViEZSMxquI7IBEimv+WNBIDQ7gSOPf2FCGgZdxSXLxnE51zU/qeCrAsTDQFMNvHBwRJCIyRenC+YCgRJw/Q8emo9sOanV3bqQAZlpnhUYNk8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5P+KHUp3+e/TScWhYEi4+cLKu6wXesJBtxI/cApYzE0=;
 b=HHk7AmfBXZcQCHAt3KqZFY3TrqYNrm0SmvqJ+70O3ouwOiNIVY9tDP1XfZaXMnzSWELSzzKQXRC/VLfATt4IelJhAdydBRn1jK0cXr9TEp3oXEbokLP4sY9AWKPsaEMDpyx2HvsnotRWmZXTMFZkD39qdiHbjdg6L0Pl7pmdBjJlY5OFeDYb4qE8toFygMwhzAfcB9tjADc56oSdF86rbSI+lnR+Hwbm1BgflDHC/DT8XjK9sk90lBgFZHG5FB2eV4OJpxs1mrRqiNxE/xIPTsLBjqL1BLJMj3l39CbVltOLSDUeD0j2/4hDeZ2pXnIqvUmtHtcA10UuEsBsYQRXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA4PR11MB9154.namprd11.prod.outlook.com (2603:10b6:208:55e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 17:09:36 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 17:09:35 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 15 Oct 2025 10:09:33 -0700
To: Greg KH <gregkh@linuxfoundation.org>, <dan.j.williams@intel.com>
CC: Doug Anderson <dianders@chromium.org>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Message-ID: <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
In-Reply-To: <2025101448-overtake-mortality-99c8@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
Subject: Re: Replacing Link trailers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA4PR11MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 03673647-8d5c-42c9-8911-08de0c0d9dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVd4MnFTUllsM1p0MS9jYy9BaGVxeUVyZkh3UmExckVnME1qQTBVUkJNMkU0?=
 =?utf-8?B?Z0hwaXhYbTI0NWs0VVN1eWJUUnJ6M2pONkFtdHFRTVhTZXh1VUh0cW8ybUdM?=
 =?utf-8?B?OG5neVhURDRIT0RzaTcxQWpMUnVzT1BtV2RXeFhxSHpGeXNQcTgrNHF0aW5F?=
 =?utf-8?B?SnhoN09ha3dRcHZPajBVZ1RXRGdKKzdSZW1xMzI5Y2dMU3k4cDdOMkFvT2VJ?=
 =?utf-8?B?cUlnYVhqMkg1cytrYXJXcVQzcDMzT2tkajNWaW9MLzdnQVJud0hXT1F4UnJV?=
 =?utf-8?B?ckJOT2ppRWNtSHpsVzRrY0pXV2tNa1cvLzRnbThmWGZtVXF1RGZWdFJoQjdU?=
 =?utf-8?B?QlVjcTRscUlwbTAyYkc3VmpvSmkwRVhwYTJFU0RxUlBDdGhGYUYxSnc1c3pG?=
 =?utf-8?B?MkJEd3pjaFhDSE0zVWRQejBWZDN3SHd3dkVkaVVhOFpGQzkwY0dMeWsvbzdV?=
 =?utf-8?B?c1dmdXp2OXYrR2NTS1VDWDJ1YkNFUTJtbEoxME5CcGRvaXdzaG5iaU5uMWlM?=
 =?utf-8?B?S0hid3JjYW1LOVBtelQwRmdLcnRZakZrRUZNWW1mVklHUXI5MjlXTnIvYzdK?=
 =?utf-8?B?cnMrWS9FOUxMajhMQnY4cGdtd3pIOXNTRitYVzBLckNRc1FCK0VCUGpQcU1C?=
 =?utf-8?B?UXJuYm1Pc1JZVTRoV1lsQnRsaHJNenNwRjNZa0hRcjRiK1BROTMxd1pqZVFI?=
 =?utf-8?B?TmdOcUxBZDFJYS9WRStJUyt4bVpnWTQwLzc1OVhCbTdKNy9lRXdoU0xYb1lq?=
 =?utf-8?B?MUd4L3FBTjNpbEdvaS9QK1V4TENTVy8zUnI5dU1hTWd4VlVabk43TVZqNVVK?=
 =?utf-8?B?aDNsSkpPZktVbmdseXF1MlEzYlcrWkV4OVdZbDNLUmt4THB3ZzNzbWo4WU9u?=
 =?utf-8?B?MmdyNVhENWNtMlhGUE9KOENlQkQyNzBXMUVIQ1RJYUxqelAzdHgyVWQvNUdw?=
 =?utf-8?B?VzdlM2d5d213SXFlRjd6OWs2dXZSUEVJWTdremZiZ0pCK1BGb0RSa2kwdlpv?=
 =?utf-8?B?ay9YTGFjcFB0clN2QUN3a3d5MEZhWUZnSUwvblo4bXJyUVVUUHJXT0dHQVRx?=
 =?utf-8?B?ZUpIL3BETlJHMVFzN2NhV2dFQk9xZUovSzdTVW1iQncvNVJXdXNXZ3NrbmVw?=
 =?utf-8?B?TmpHSk5sWEtZSldhRDJheGtxL0pWL0FWWjltZ1NYLy9iYU40b2puMHhxRGZ6?=
 =?utf-8?B?ZEpwVkNnOHpIM2h0Y015bEZwVXpXQitsWXlnNEtqWU5hdWRFR3ROdXNBK1p4?=
 =?utf-8?B?OWRjZ3QwaDRBSkhHclVUMndxaTU5R2laWDJZb0g2aEVlNFFyMytWRlV0RlQx?=
 =?utf-8?B?NEhsVE9xWTdHUlA0QllNN0NyQ3hoazAvQ3Y1QzRudUR6YnA0cG9jazBERnhB?=
 =?utf-8?B?WTJFVDEvdFl2VUIwT3FGWUJ3Q0hWRmNwSVdTZmRVZmJTZS9mSkUzT09zYThZ?=
 =?utf-8?B?Y3pLcm50Y1gwaTZ5SWlvZTZDUEZnc2UxTnEyNjFNUmtOcEFsdWhKbjFQRWtq?=
 =?utf-8?B?Q2Z2RUV2NllRSGRMU2E1RWdxd1FKY2FUTDYvR2cxU09sREhLa2h4NUZ2Q2hG?=
 =?utf-8?B?RWswd1doNkpLem9yZzBNVGF4ME93QjYwSUVtNURIdkkrQ2N4TGpOcGxBbWln?=
 =?utf-8?B?d3R4SVVJcDZqME84MUxneXFsK3dkbWU2VllEOTBJY244eWhOUjZBSFVONTNG?=
 =?utf-8?B?ZklscElxckJaNW80VGg5NzlNRTdhVmovb3hjcDRTZU11WCtjTXBtVkRKTWNX?=
 =?utf-8?B?WFA0Sjd5VWl0WXd2SFVXbzgxQkV3Y1laU0J6QW5ha3cvU3lpajI1QS9WMXc1?=
 =?utf-8?B?UUwxVVZXQURRYjE0blBtd0tnUVh5MXZ4dUtRbHpvY0FJbEpEdXdJODY5bVMr?=
 =?utf-8?B?RVVINHdoVUdrT1ZpNlI5bDRlOE1wR1E3c1JBK3RkYkRNbUZUV2wxOVpJL01x?=
 =?utf-8?Q?cAoli9p6LE6+6ctjOqo+fzq1l5BqHayE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVCbjBRbnVPQThQZ2ZKU3NyYUJ3YnJhQUl0L0pUYXhCWHFvREZWa1Q5MEll?=
 =?utf-8?B?MkRqK3FqdG9ScHZKaSs2bndsaEx2QlZnSzFrNHNHRjZiZGI3UXZPdndNTU1a?=
 =?utf-8?B?c3NSd3ZZeGYrRTVtS3QzUXpzSkY2aVBZODN0ZEttMktlTXVKakVmcjhEZkJF?=
 =?utf-8?B?L2tVMlNlbk9sUWovaDJlSjg0ekU3alE0Q1FMUUJNVHNJUGRTT2s1RVlXYTF3?=
 =?utf-8?B?bGFhY2xVSHF0M09IZ0FYSmQrTUp5TnZrcEVkQVNBYm5QK0VNTzQ3UGF2clc3?=
 =?utf-8?B?ckg4dE85dmUxV2tBOHlqc2NpV3RlbEh5NllONk02TFM2VE4zNGNOOUxZWTFv?=
 =?utf-8?B?aUhqUUo2Wkk0aFZqY2xNYWJ5YWdSVy9LYXp2c05EbHQ3Q0c5S1JEbTZ1WmVI?=
 =?utf-8?B?cEYyeStuM1hyRG9oRGx0dzVnWngrbEpRVnAzbHpjamdKZXFyYXFrNWYwWUNS?=
 =?utf-8?B?bWwxcWZrOTdidXYxWkxVS201TmU1ZzFLZ29ZMEU3NWRVdkdPMXhvRHVIY1Ry?=
 =?utf-8?B?UW94ZFpVRmNveFVJcmZENThieEUwcjlhRG05eEk3ZGFMZ2h4MGl0VFpSSmhr?=
 =?utf-8?B?T0NCalg3RHpkY0xwendlSXJrajlzM2ZWSDRJaGVEQTFCUGcyMlpua0xFMXpp?=
 =?utf-8?B?L2g5NC9rYmV1VlI4YVlFR3ZIZkh6NmV2V2piTlRGZEcvZ3B2SEgvSDRJL0hj?=
 =?utf-8?B?ZnBGVXRQNmliRlhPa2lEQkxKTmthTHJWd0U5Vy9YMVhSZ29aOVZUajg5dzBw?=
 =?utf-8?B?TU9Ub0JPazNVQU11Tk1QUnpSbWZtWTNVTGMwcXNhUzl4OWlMYy93c2tqZEds?=
 =?utf-8?B?amM5bmdZZTBObERpRHVNNjdYUit1Tld6REdiVFptVG43ajBOTG9kL0ZlelN2?=
 =?utf-8?B?ZFZvcVIxMzNITkVPaXNCYitBM0tBWm9rUHd0aVc0dktSbnVCTDVOb1RLV0Rt?=
 =?utf-8?B?eE9jSHRZeEJac3d6Y0NHL1o2K0hXbThZWWRrRkdWZ21xMXUvZXFDMWlZQjRK?=
 =?utf-8?B?RmJYSkZwV3htYkorY0U1TUxrR1ZObTFGbWxkeGhRVkFQWjZCRTRLeFh6NUNZ?=
 =?utf-8?B?QWN3dFhZenoyMlpReGdyR21vajNScWY1MVhPM0Zuby9OMnU5ajRlbnNFc1dp?=
 =?utf-8?B?K2NGZEsxZm1LQ2E2V3h6M1hTZkRkSTFrVUc5aHdYQ1BHMklzaWtROEp4Qmly?=
 =?utf-8?B?ZU5VV01hYUh0UFJZaDN5YlkwZUs2OUF5eE0rUis4ZXBLdGljSHg2TkIxMTNN?=
 =?utf-8?B?Z2FiVUp0Z2g5dG90YmxvRFZqOXpoRFpNRGpjZ29TMUd5SFRGdC9YN3lRd29v?=
 =?utf-8?B?cWN3RlBqRkRIWnY1aDd5b0tMLzFyQkdxeW9ZR0l4ZXRONjRUMFBHUVBaWm5V?=
 =?utf-8?B?K1ZFY3hteHV2SlNxemllRUUwNExRUFJib2t1UVg2TlMvL24zK3g4TlZkQThO?=
 =?utf-8?B?dlRjZnpjSWdTc1FHcUl5WEM4Mmp0cHlyVThPaU80VUtUMjVNcWRnTnQzUklm?=
 =?utf-8?B?TFZKQ2o3TGthdjVZTDVzbHRKSVdjM1hpYkp0dFNWZUt1QmhpVjFsb3BtQzcz?=
 =?utf-8?B?ZFVKR3ZvcERrbEo5N05YdzhGc3pHd3kwMnJLV0RNZ01Sb2Q2R0dlbldJNlM5?=
 =?utf-8?B?MG5GVDRvQnhjTDFjWHdCRDcrMjE0MjFPRGtQYmNqT0NDbFVPL2ZJb0V3OHB5?=
 =?utf-8?B?bm1DL211OGhOdXIycWkvZEdVM1pqK0FlNVJBdCtVZFZZcmpxUEdpVzVxamFp?=
 =?utf-8?B?UXBheXhtS2RZaEIzSGljT1FRdXVYWGdYK0doZHQ1VFAwRHJqNk1qQS9HRGw3?=
 =?utf-8?B?NXhZZkhTK2pWR3RVN1FSVWNKVTcwY2drNGUya24wUjRUUC9UNUEwZkE1dW5D?=
 =?utf-8?B?YXVxMVJlQ0tDbW01V0FWblVzMCtkTCtEVGM4b3JtVlo4ajZHTE5OZnllY3VK?=
 =?utf-8?B?NTZ6RUY5SnEzbStSNmtKbExGN2FHdlptN2JIbm5CV2Y2OTkyNWhnRUdFVHI1?=
 =?utf-8?B?V2NpVlFUZ1VUOFJsL0tZWXluMkhGdWEybzNlNjYyZ0l1R0RoblRtSkw4Tnlw?=
 =?utf-8?B?VVVSenhmZFE0Zkxic3ZSazQxQzNTdVF0QzVpT2tSQW12a3BnT2FDaitFb1g1?=
 =?utf-8?B?R0F5bWFJbW1NUkhDdnoveFRmeFlwd1hoM1BRcWhGRUZJRGJHYml4WFl5blNE?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03673647-8d5c-42c9-8911-08de0c0d9dc7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:09:35.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eshm8ddL2xAnHFiQZyLMR3aX3vwXUP17BvZp1+cCAWadGVFgQFtnNufnNUlrMV8xdVgrwcDn/uAH1frR/4y9d49zAAyiwgO+WBC3B7B5uNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9154
X-OriginatorOrg: intel.com

Greg KH wrote:
> So unless we have one big "all the notes merged into one" tree
> somewhere

...circling back to say. Why *not* do this?

When Linus says:

> And maybe lore could even have particular indexing for the data you
> are interested in if that helps.
> 
> In my experience, Konstantin has been very responsive when people have
> asked for those kinds of things (both b4 and lore).

...why not a notes tree? Make a convention for subsystems to annotate
notes updates in pull requests. Linus workflow does not change,
mainline metadata unaffected, but pr-tracker-bot is enabled to update
the central 'notes' tree. This gives a path for subsystems to ship
metadata that their downstreams care about.

