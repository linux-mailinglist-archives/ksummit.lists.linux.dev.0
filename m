Return-Path: <ksummit+bounces-2282-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD89B4171E
	for <lists@lfdr.de>; Wed,  3 Sep 2025 09:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAA86179B09
	for <lists@lfdr.de>; Wed,  3 Sep 2025 07:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DAE2DEA71;
	Wed,  3 Sep 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFrpuXkz"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521A2D4818
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885658; cv=none; b=WdFcEir+9aikDcBxWt92qL7IS26yZN0EKV46cdiRTYx0zNW2GqUYJsBT6Av38C8eSCgK/7RQyip+peUiULSQ/pAqLwzLkUFnW6B8F/PXD4QISyh3A4HSuA4PwrQd+IY5WuRjllz5eZs+osfj+zfTXogQ2I9zCcpj9FeGikCkZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885658; c=relaxed/simple;
	bh=jb1+fIsCsDFWpCn7HcvoyKBcxDwCq0HWUA9v6nTvnjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NpS5CYTj1F56MbIIu0sYrswBR/Vj4ZPlYjQ4Ax53KsWruOBoEfxJjzcLjntzTCloEuObaaI8mMT5Ftgm0aQxCQiymGpubh8Oy+gbjAzDVHtAome9x8lqI5I4ujsh97R3eGoRNokNR49LOstWKeCkTjSNKtVd6vhW2Lu+dEVhXMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFrpuXkz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756885657; x=1788421657;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jb1+fIsCsDFWpCn7HcvoyKBcxDwCq0HWUA9v6nTvnjQ=;
  b=WFrpuXkzq6s5enIkeROYfcCz265yPLq3imAkfJf8c/ykSUPNy/aIyguw
   zj0fWD7FXK2j5Ud488LBeR2jqfABr6Mfcszw9x4MaWMnajS/WAm4opVPW
   rlJYK9MQVtsNLcnlthsUB63gE6rV0hT/IQAN71wlj2DmGA536sEBi4PtV
   jkRlqU7ygigKJQB+FVzF8Ngjm1dTrQM74rPEvY56wIDLrO9JvT05F2x9E
   VsIEAHI1g0uoA81+Iy2fChJiIVouEeEfynY9+b1ZdIUG5mXuijoOklQDG
   dYP0orJLFBzZzHmnn3NSJmKofeUu+sKuV0/lYUK4XCCAetohgl+5N8z33
   g==;
X-CSE-ConnectionGUID: kbqnugiDSdyPgK/5PzTS9Q==
X-CSE-MsgGUID: z+JERa/PT9GVOVnLIFutdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58405722"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58405722"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 00:47:36 -0700
X-CSE-ConnectionGUID: PG4Vf26IQj+B11VHuu5Nkw==
X-CSE-MsgGUID: kE1LeGEMQFGaqZ/5+GTH9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="208723904"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.246])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 00:47:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, Linux
 Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
In-Reply-To: <20250902185221.GA1602@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250901204635.51b81ffd@foz.lan>
 <1bf8a898-e697-46e2-86b1-4158b021d652@sirena.org.uk>
 <j3iblg4xx4nu64dgaxhl62mtherszeh3jyrskkf7l2jigld7wf@lr7mtq33gbi7>
 <865e583b-4c97-4db1-963c-ed8539fa56dc@sirena.org.uk>
 <20250902135938.35048fbc@foz.lan> <20250902141434.3e5b14e4@foz.lan>
 <8339a5dd-446d-4717-9d68-983f5e2354b3@sirena.org.uk>
 <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net> <20250902191929.504977bf@foz.lan>
 <20250902185221.GA1602@pendragon.ideasonboard.com>
Date: Wed, 03 Sep 2025 10:47:28 +0300
Message-ID: <50492e9bd0d647a6ba7eccbed73f782181f83499@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 02 Sep 2025, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> I'm with Jon here, I wouldn't blindly override the Python interpreter
> selected by the user. What we could however do is print a message if we
> detect a version of Python that could improve performance, telling the
> user they could switch.

Just piling on here, totally agreed.

Don't surprise the user. Let the user be in control. If they choose a
silly combo, let them. You know, they might be debugging the issues in
that silly combo to begin with, and don't want to jump through hoops to
work around tools that think they know better.

Letting the user know they're using a silly combo and suggesting better
alternatives is a whole different matter.


BR,
Jani.

-- 
Jani Nikula, Intel

