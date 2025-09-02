Return-Path: <ksummit+bounces-2266-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F789B3FD1E
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDDC17CF5C
	for <lists@lfdr.de>; Tue,  2 Sep 2025 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4577A2F6178;
	Tue,  2 Sep 2025 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoaKdr+U"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEED2F60A7
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810556; cv=none; b=InuHyRDUHGXGwPBfAEIB5eBMgk8ZOWz6h/JB6AHMPDmo3zbH0ws5qvTT4gQY4RjtUeWNu9R1Ft8S0zMGgD/gHj53m8bhzt1ARKGgKqYA2eSEbPTfFj6VX6OTMs/XlVS0wuxUE9TEBSXCkIvbdDWq6ST6M0h4RG7D+0rf4s27EcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810556; c=relaxed/simple;
	bh=Lpj+JaOxsWSycZTIDZPRENuoqLKzloi2JGP5Ii1fNhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AjAw1DY19D6MY+kAloPiLdWavXU8Q/zNS7ueqKTItiGRU6aib1X8diJUgMACH/g6GEohAQNT8GfZnP7onoNBODfo3ThpGRP2Bab/SOJOM4YRjFMH43/d3lxQUp03IBSeJky8LPakYDgF55paMS40QSZoNs2O2HTp1iEPc/snzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoaKdr+U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756810556; x=1788346556;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Lpj+JaOxsWSycZTIDZPRENuoqLKzloi2JGP5Ii1fNhI=;
  b=XoaKdr+UiOC0FZXZk/wx1ahxza8Tu2YyDmP9v7v4lmDtRZGqT70c4aul
   AQhHXde6TfstwIth0YBNhZlELr9LgAO6+ngkzOXmv+WC8AoBwm3rATFPE
   2pfzf8e2BbspOVhLnP9zgn2zARoz6nNk+1sm/FlUt9EXnsew6Q4ifmxbK
   eMiFD24r0b58TiSYW2TrvZ5IOAo2Q8sC2oc1zC3Tg5/V/LHVL1VB3+wtC
   rKjBe2Xc/3W0Xm6l+A1A7BVMgJY/2qbJvyC3QsU7apIcPNtRCacMDsXXB
   RLwpySSWYbv3klosOZxP+BmCsIz7BLCONqYxRnm6ULBPqoNULqivG2v88
   Q==;
X-CSE-ConnectionGUID: hQ3lY/18TsixYZfnPq+WaQ==
X-CSE-MsgGUID: c9hjE1WiT7CpOcFu4mN3EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59188440"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59188440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:55:55 -0700
X-CSE-ConnectionGUID: vudavzSNTkStGV2J715wSA==
X-CSE-MsgGUID: BFZ1gKy2SGu7eHM20n4I6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171408022"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:55:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250901202635.426d099a@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <20250901202635.426d099a@foz.lan>
Date: Tue, 02 Sep 2025 13:55:48 +0300
Message-ID: <6041c6f82863fa3c8e63b37a43ce984bdb1fc6e1@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 01 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> On media, our CI builds with W=1, and aim to have no warnings.

How do you filter out non-media W=1 failures?

I'd love to be able to tell contributors to use a certain kernel config
or command-line for build, and tell them to fix *all* warnings, instead
of teaching them to ignore most of them.


BR,
Jani.

-- 
Jani Nikula, Intel

