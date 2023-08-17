Return-Path: <ksummit+bounces-1012-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B246977FAD2
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC27281FD4
	for <lists@lfdr.de>; Thu, 17 Aug 2023 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A582154AF;
	Thu, 17 Aug 2023 15:33:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610214F87
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692286398; x=1723822398;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LcI6DtqOvmLZ587BzqKhfQxcSmdVpaV8oBdzLDlmMz0=;
  b=AnTeWVO2Q+1AI1tCglTGYMparXgIP8Eq5Dxs4yRCfniPoWeMCoJ7+WAb
   x0IAQFRg6ziuayAZVV6I7GaF35El+ypa/NwON4ODau2+iwjwciPtx9h10
   FUBuovsYi3asts+GxwxM1EZQ+jrmTGu5Jh8I0bUmQqssnp4+2ECF5251T
   7rZgG9n/AdrLq/obqp5xyVGE3C97ywF8/wUVA2PXSu77HVfUecvVgGOov
   VtV3q+9AhxRNgK184wQO9s33vhAP4M6ClkYZ4iy4p8qOEEelJl5BL3jMb
   mRcopBePHUUrScuC94+1wP9LAdtu88z6/YNPW5/yPlDzWDPxFy0osWRov
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375625370"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="375625370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="737766032"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="737766032"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:31:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik
 <josef@toxicpanda.com>, ksummit@lists.linux.dev, Jeff Layton
 <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
In-Reply-To: <20230817102210.0b17f985@gandalf.local.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org> <87ttsx98ue.fsf@intel.com>
 <20230817102210.0b17f985@gandalf.local.home>
Date: Thu, 17 Aug 2023 18:31:37 +0300
Message-ID: <87lee98z3a.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 17 Aug 2023, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 17 Aug 2023 15:00:57 +0300
> Jani Nikula <jani.nikula@intel.com> wrote:
>
>> On Wed, 16 Aug 2023, Luis Chamberlain <mcgrof@kernel.org> wrote:
>> > In so far as making it possible to get b) to help, my current excitement
>> > surrounds around what Song Liu mentioned to me at LSFMM and then
>> > quickly demonstrated that the eBPF folks are doing with patchwork.
>> > Get the patches to be tested automatically, and *immediately*
>> > patch reviewers and maintainers can get feedback if something is not even
>> > worth reviewing.  
>> 
>> I'm all for automated testing and CI, and all i915 patches get tested
>> before merging. But requiring everything to pass before a human so much
>> as looks at it can be incredibly demotivating for contributors. For
>> example, if they polish the contribution, and take all corner cases into
>> consideration to pass the tests... and then get told their design is all
>> wrong and needs to be redone from scratch. It's a balance.
>>
>
> For big new features, I agree. They shouldn't need to pass all tests. I
> think anything that has an [RFC] subject should bypass the test
> requirements. But I get a bunch of fixes patches, that fail tests all the
> time. If you are sending a fix to something that causes a regression, the
> maintainer should not be involved. Automated tests should be enough to tell
> the submitter to go back and redo their patch.

Agreed.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

