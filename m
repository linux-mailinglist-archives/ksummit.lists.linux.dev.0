Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4757D4AA9
	for <lists@lfdr.de>; Tue, 24 Oct 2023 10:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2402818C8
	for <lists@lfdr.de>; Tue, 24 Oct 2023 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6A511CA7;
	Tue, 24 Oct 2023 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKssdzFJ"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA677460;
	Tue, 24 Oct 2023 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698136953; x=1729672953;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=UQdiKYKyo2nBA32v5OcQxzYIjrGmDvDUl+R4fWYg4ng=;
  b=jKssdzFJ2WZGkPgQLumR/JbZntBl+Q99QvkYCCol445fk+1X2veNKaZ3
   EtdnDYrApABsRx9C2SvTlVwQEtM+ImsTiJWYQBg7b6ew/mTiQCAVNIMqZ
   A8lmBHtZgZd5ThU8IuUy6MD/UDCwYqGT2nxAsWqdCNin75Zui3JhA4gCx
   Iwd7JK15HVqb4xov3OwPgR0Rnb4QPZ/SByZJ1DAbyJzK5eRgUUy3iPIhq
   7yPGcVzaVi2IbPOLBAdqB/z2+1Hwuyrscn/TD7GXAQWj29whXoVgfW0H/
   oiCWoR5d1J2MrDh4SBKoyXmeE+ClftQwcjap5DBb51jhR8RuzU8C9SKlp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5636997"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="5636997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793413970"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="793413970"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.48.28])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:42:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: NeilBrown <neilb@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-Reply-To: <20231024072506.GC31956@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <169809755184.20306.3698252725424588550@noble.neil.brown.name>
 <CAMuHMdUku6U2EMCEXCE_K7bX2XX28P6qXq6ByWvC25C0bVhTOw@mail.gmail.com>
 <20231024072506.GC31956@pendragon.ideasonboard.com>
Date: Tue, 24 Oct 2023 11:42:26 +0300
Message-ID: <875y2wbedp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 24 Oct 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Get a better e-mail client ? ;-) At least with e-mail you have a choice
> between different clients.

Yup. What I see is excessive quotes collapsed, replaced with something
like this:

[ 18 more citation lines. Click/Enter to show. ]

All the actual replies stand out, regardless of the length of
quoting. Now it's just the Outlook style "quoting" without >'s that bugs
me...


BR,
Jani.


-- 
Jani Nikula, Intel

