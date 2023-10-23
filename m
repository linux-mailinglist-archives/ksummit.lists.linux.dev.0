Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 141437D41D5
	for <lists@lfdr.de>; Mon, 23 Oct 2023 23:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0729281392
	for <lists@lfdr.de>; Mon, 23 Oct 2023 21:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B9822F16;
	Mon, 23 Oct 2023 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bP+WuyN6"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5DF1A583;
	Mon, 23 Oct 2023 21:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698097460; x=1729633460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IpsZUMND3aVGdnhdwRzDu2CiHjWEmDqX879e2K1Z/Hk=;
  b=bP+WuyN6aJzhY9DzQBy+ffS4JXu3zeuDDCirEEuF8MQUW2K3bqyeutpq
   vadKaAKIWZsrSBzcl0Tbe0+NJRLTd8+8G2cTi/C9gmVC5+aTB/E9DdKQ4
   hxFx+sLpMD6e8kuiIaEpaJmOenJjJWIelu6Ukg8Ym7JqrwUqNA19h7jCJ
   XLS1YimsutTtF1p1SjRU7yu7NjwYkS1NQfouxmNySm0h1f+tgYKaMKkqM
   qqOkchio51RuBIwKEpfsHU9lXRdb6q6VsDia89xbn33Ro2y9k5q/ZDbQq
   kxEu+AL9ZEpohcL5Qosidfl9jN8zZrmbbY19nsxmB/WYR3fWNVsoieLYO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="418060497"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="418060497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="5948523"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:43:03 -0700
Date: Mon, 23 Oct 2023 14:44:15 -0700
From: Tony Luck <tony.luck@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <ZTbpLw4isOaPmiMC@agluck-desk3>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023152918.4eb91ee3@gandalf.local.home>
 <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>

On Mon, Oct 23, 2023 at 02:31:11PM -0700, Paul E. McKenney wrote:
> On Mon, Oct 23, 2023 at 03:29:18PM -0400, Steven Rostedt wrote:
> > On Mon, 23 Oct 2023 08:55:56 -1000
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > > On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > >
> > > > Well here's a task: write a bot which follows the mailing lists and
> > > > sends people nastygrams if one of their emails is more than 95%(?)
> > > > quoted text.  
> > > 
> > > I think that might be better off as a spam filter rule.
> > > 
> > > Don't make it some after-the-fact "trawl the lists". Just make it a
> > > bounce with a "you quoted too much". Same as the html avoidance.
> > > 
> > > Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> > > kind of reply, but if it's more than 50 lines of quoting, trigger a
> > > "at least equal parts new message".
> > > 
> > > I'm sure Konstantin has nothing better to do...
> > > 
> > >                 Linus
> > 
> > Paul,
> > 
> > Just in case you are wondering why one day one of your replies gets
> > rejected ;-)
> 
> You never know.  Those who would have otherwise received my replies
> might be very happy with this outcome.  ;-)
> 
> 							Thanx, Paul

Hmm.

Thirty-two lines of quoted message.

Only two lines of response.

[Not including signature]

You are skating close to the edge of a 95% quote rule filter unless
it counted the signature.

But
this
might
also
cause
people
to
go
to
silly
lengths
to
avoid
having
their
message
cancelled!

-Tony

