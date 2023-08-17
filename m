Return-Path: <ksummit+bounces-1002-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0A77F5D3
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C899B1C213A3
	for <lists@lfdr.de>; Thu, 17 Aug 2023 12:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001D513AEA;
	Thu, 17 Aug 2023 12:01:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0113AD3
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692273668; x=1723809668;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6WienYC8XVy8S5DzyNaDCHoxampazkCtSfDUXY6R+sE=;
  b=h+8x3qJZcI0rc2DRXjt6K9MUiapE6aYVNHSR3Ve97fvGA2L7d3P/elgy
   r2cXppzFnyrm9pMAS9dbx9pULL7kgdGD26H61FZ/G0cAhjXJyRw8f9qll
   rKUTUMyRywRBYkSYGqHBxbXey/ekkpQyt/leRc2bTEv5kv6vzRNVDGN3+
   9AyYeiasrgn6rCc6hRjlcsoNK5Kb1XLHQBsjlbjF4RsW15hxRN0vSk2/t
   zu17MyIkyjeDAzOL5ZzdyZgBCEiyKcLecnmn8PMmECE5Xzj0ENUXMFJFx
   00DfG7YlBZfPSFWZ3MU3yOUEWhUX6Vv8GH/vN6ZDrIjg08MB9R/TFHVsk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353106092"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="353106092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="764057576"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764057576"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:01:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>
Cc: ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>, Song Liu
 <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
In-Reply-To: <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
Date: Thu, 17 Aug 2023 15:00:57 +0300
Message-ID: <87ttsx98ue.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 16 Aug 2023, Luis Chamberlain <mcgrof@kernel.org> wrote:
> In so far as making it possible to get b) to help, my current excitement
> surrounds around what Song Liu mentioned to me at LSFMM and then
> quickly demonstrated that the eBPF folks are doing with patchwork.
> Get the patches to be tested automatically, and *immediately*
> patch reviewers and maintainers can get feedback if something is not even
> worth reviewing.

I'm all for automated testing and CI, and all i915 patches get tested
before merging. But requiring everything to pass before a human so much
as looks at it can be incredibly demotivating for contributors. For
example, if they polish the contribution, and take all corner cases into
consideration to pass the tests... and then get told their design is all
wrong and needs to be redone from scratch. It's a balance.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

