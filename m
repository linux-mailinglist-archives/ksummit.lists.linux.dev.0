Return-Path: <ksummit+bounces-2265-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02088B3FCED
	for <lists@lfdr.de>; Tue,  2 Sep 2025 12:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3064E157E
	for <lists@lfdr.de>; Tue,  2 Sep 2025 10:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E752F3C12;
	Tue,  2 Sep 2025 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7U2wTDB"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26592F2903
	for <ksummit@lists.linux.dev>; Tue,  2 Sep 2025 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809775; cv=none; b=kVV8RfQqcGJgVMLCIpsuwi4AI/+8VTWfkxyjXJZK18ZBnq7SV0/uQ3pUoDC4QwYojYBEYCcli567pdupDVIDdGfBhQxbEf1IyqbpHctfXPP5mwCZyP148ZQE/h4XPCCkMjbZ88S8F/LKq3Dx0H+7s9lLgH2av3TKNc2xiAplPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809775; c=relaxed/simple;
	bh=Bro/N25vNzwxLTh6uSwQUXtbEkcjD9GXg6flaTJPDgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kuaGbzAruV5IFTriVw1u6S6rqoyJHkPjFzT75KsagzVO7wDYxi96SQYay6giO7UspSUfLxZ0axmNuoltE336thG3UPJ0v6UtRZ3su43Ie06djnGdWFAJtr3Wjr7I8Zl5F4hIEl5WpIyJALTbUFlCt8e+38GY+3iHn6qtSOpGW5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7U2wTDB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756809774; x=1788345774;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Bro/N25vNzwxLTh6uSwQUXtbEkcjD9GXg6flaTJPDgA=;
  b=H7U2wTDB01aQhL871W1MeIezAA2LGhd+OWBA7PogtbdGwNdUtuftoZPp
   Zr15OpvWh4G7OLI12JnBixbzteVKAw4COa6xK0SPbjl6eFuyivCZMyBtB
   0ONio7rIVZ27S6A/tmrrIChB1xZ39gq6lED9gkS4Nf3gx/gdnk8OA/I98
   0/+OSkM7e6lYFEnEtDINY1rp1ZNepGh1ic9tgSLhKftrxjDGKHIYsVG6G
   DyaJBXNKETb1q5/ykTRDN3Fv8OJVAZ7aMxrkhaCVZKavC4cmeHeqJp0aM
   DytC/hddL8K88UJEQeKLV70ta0gSXmM/rBBaGe6Az939R1h1ORvL+DFUY
   A==;
X-CSE-ConnectionGUID: y6PIhjpvTU+uVfPo8eRk/Q==
X-CSE-MsgGUID: kjXJGKdPSCG1MdSm+Tn39A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59027320"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59027320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:42:54 -0700
X-CSE-ConnectionGUID: Ie8rfVt6TuiJ/fjIRgSL7A==
X-CSE-MsgGUID: 11yPS4qzQBG1EnMAec4Sag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170523939"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.193])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:42:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87plcndkzs.fsf@trenco.lwn.net>
 <20250828230104.GB26612@pendragon.ideasonboard.com>
 <87wm6l0w2y.fsf@trenco.lwn.net>
 <930d1b37-a588-43db-9867-4e1a58072601@oracle.com>
 <20250830222351.GA1705@pendragon.ideasonboard.com>
 <87h5xo1k6y.fsf@trenco.lwn.net> <20250831160339.2c45506c@foz.lan>
 <b452388b7796bba710790ceb5759b75ec6e57f23@intel.com>
 <b41031ca-b4a4-450d-a833-5affefe958b2@infradead.org>
Date: Tue, 02 Sep 2025 13:42:45 +0300
Message-ID: <bff2c47623a632609d07f8f2d237d0b40722c2c1@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 01 Sep 2025, Randy Dunlap <rdunlap@infradead.org> wrote:
> ISTM that there are lots of non-docs developers who either just don't care
> about that or never run 'make W=1 htmldocs' to see the problems in their
> drivers or subsystems. OK, maybe it's just a very low priority for them.
>
> Willy had a suggestion that we just make checking kernel-doc during
> all .c builds a permanent feature instead of a W=1 option.
> This helps, but still doesn't force 'make htmldocs' to be run.
>
> And it causes around 450 build warnings in my testing of an x86_64 allmodconfig
> build.

I think in general the build system lacks proper support for subsystems
or drivers being ahead of the curve in keeping them W=1 or kernel-doc
-Wall clean.

We hack around this in parts of drm Makefiles, and it really has helped
to keep the kernel-doc and W=1 breakage/fix churn down. But it's not
pretty.


BR,
Jani.

-- 
Jani Nikula, Intel

