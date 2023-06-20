Return-Path: <ksummit+bounces-937-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61632737120
	for <lists@lfdr.de>; Tue, 20 Jun 2023 18:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F08281350
	for <lists@lfdr.de>; Tue, 20 Jun 2023 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A601773F;
	Tue, 20 Jun 2023 16:03:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E67101F3
	for <ksummit@lists.linux.dev>; Tue, 20 Jun 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687276993; x=1718812993;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=4kyOfn0qjdKFzO/DRMxgLfkBbtx/VpGsip0Qq+6gtkE=;
  b=hE3gVUKH5ot1MVeujh+gROdO18RxMZnD1VALXy65/KMBPTwu5E74HEOm
   zt+mYjhYVn+2Xb9gert4ECHHcP6uq1BgCUD/gElFONK2q5VvclGdlZJs2
   AZ3AJi37REmTI+SWIMPyIMwx2/LDRK4IZ+bc0yq+MVDobKTDpYXuNLe0K
   1LdDYdMlpZJ8jRWpgLfrkESeFia1xAD4NMIp67BKOVfMV9Yg6r+odGCJh
   rWjcwVlKxErFzlK7Vepzh01DcXvFpHEnIFyU/w37RrqUZSkk2ap4woIe6
   EjRPkPGYXk0niLmiloNjca+jaxc6a63TZza0n4vKmg4dithG7HBnBy6FQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363321975"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="363321975"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 09:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691483157"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="691483157"
Received: from dshvarts-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.204])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 09:02:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
In-Reply-To: <87fs6rxppz.fsf@meer.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87fs6rxppz.fsf@meer.lwn.net>
Date: Tue, 20 Jun 2023 19:02:54 +0300
Message-ID: <871qi6glzl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 16 Jun 2023, Jonathan Corbet <corbet@lwn.net> wrote:
> The documentation discussion at past kernel summits has been lively, so
> I think we should do it again.  Some topics I would bring to a session
> this year would include:
>
> - The ongoing restructuring of the Documentation/ directory.  I've been
>   slowly moving the architecture docs into Documentation/arch/, but
>   would like to do more to reduce the clutter of the top-level directory
>   and make our documentation tree more closely resemble the organization
>   of the source.
>
> - Structure.  We continue to collect documents, but do little to tie
>   them together into a coherent whole.  Do we want to change that and,
>   if so, how?
>
> - Support for documentation work.  There is nobody in the community who
>   is paid to put any significant time into documentation, and it shows.
>   How can we fix that?
>
> - Infrastructure.  Sphinx brings a lot but is far from perfect; what can
>   we do to improve it?

It should be more feasible to build the documentation. Make it faster,
reduce the warnings.

Some ideas to make it faster:

- Bump the minimum Sphinx version requirement if it helps the speed. I
  don't think it needs to be as conservative as the compiler.

- Cache kernel-doc results per document. A bunch of .rst files use
  multiple kernel-doc directives for the same source file to better
  control the documentation order [1]. Each directive causes the same
  source to be parsed. (I'm not sure how bad the effect is though.)

- Simplify the rst output kernel-doc produces. For example, use rst
  native field lists for parameter and member descriptions instead of
  hand-crafting them. See [2]. Drop the "definition" part from
  structures, as nobody relies on it anyway. If necessary, add links to
  source instead.

- Default to Sphinx parallel build.

- Consider splitting the whole documentation to multiple smaller
  projects, and linking between them using intersphinx. (This may be a
  tall order.)

Some ideas to reduce warnings:

- W=1 already includes kernel-doc warnings for .c. In i915 we've added
  that to the regular build as well as a separate target to test
  headers, and use kernel-doc -Werror for development. Try to get more
  folks on board.

- Add more warning levels to kernel-doc similar to compilers, and reduce
  the default warnings. For example, I'm not sure it's necessary to warn
  about each undocumented parameter/member by default. That could be a
  verbose option. Bump up the warnings after we've fixed the more
  glaring issues.

- For more verbose checking without Sphinx, it should be possible to
  lint the rst produced by kernel-doc (originating from source), and
  check that as part of the build. But that's clearly W=2 stuff or on a
  subsystem/driver basis.

- Making the Sphinx build faster would also get more people on board
  fixing the warnings too.


BR,
Jani.



[1] git grep "^\.\. kernel-doc::" -- Documentation | sort | uniq -c | sort -rn | grep -v " 1 "
[2] https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#info-field-lists




>
> Other topics will certainly arise as well.
>
> jon
>

-- 
Jani Nikula, Intel Open Source Graphics Center

