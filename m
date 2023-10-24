Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195027D42A5
	for <lists@lfdr.de>; Tue, 24 Oct 2023 00:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0AFB2816C5
	for <lists@lfdr.de>; Mon, 23 Oct 2023 22:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E59241E6;
	Mon, 23 Oct 2023 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5ww+ZOG"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4C23765;
	Mon, 23 Oct 2023 22:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8A4C433C8;
	Mon, 23 Oct 2023 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698099904;
	bh=L1wN0pbRBXETBheNSvb/vCo9rEfy9Zk3zwLjdiJYkk4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=K5ww+ZOGhfXH5Mh+C6mfq+mhAN8LlkvtSgxL5zdInVU1MU6bCNxoWA4ClSL2If1Ky
	 5JeRDajyfZyvD4HZWuDH0KIFwryTY59S2SBE99dWcmrq8Z0jvhFi2OoRstFJB0ar3O
	 GomauxOC/IcwMTsowcZYSqm/wcRYQyc2KnJxIbAjVTsD4y+kWx0UO49LzKB4G9+hbG
	 R5a1Z2yim2CPYZRuSGjU/O8KskCK7sBkkkqxIlUTtNPLgh0Ob5vQEhS8A6UChPNQ3o
	 RFkAa/aJc53gX1cLputIRVAfWbBGN7MB8snXfSBjKYgQaj5GBMG0xHta4f+nqjsAr/
	 3Ma54di1H+I+A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4E14ECE059F; Mon, 23 Oct 2023 15:25:04 -0700 (PDT)
Date: Mon, 23 Oct 2023 15:25:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <78d1f406-c80c-4426-91ef-3ea8ac72a9aa@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023152918.4eb91ee3@gandalf.local.home>
 <2ab947dd-7281-432e-9292-54182a31a81c@paulmck-laptop>
 <ZTbpLw4isOaPmiMC@agluck-desk3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTbpLw4isOaPmiMC@agluck-desk3>

On Mon, Oct 23, 2023 at 02:44:15PM -0700, Tony Luck wrote:
> On Mon, Oct 23, 2023 at 02:31:11PM -0700, Paul E. McKenney wrote:
> > On Mon, Oct 23, 2023 at 03:29:18PM -0400, Steven Rostedt wrote:
> > > On Mon, 23 Oct 2023 08:55:56 -1000
> > > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > > 
> > > > On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > >
> > > > > Well here's a task: write a bot which follows the mailing lists and
> > > > > sends people nastygrams if one of their emails is more than 95%(?)
> > > > > quoted text.  
> > > > 
> > > > I think that might be better off as a spam filter rule.
> > > > 
> > > > Don't make it some after-the-fact "trawl the lists". Just make it a
> > > > bounce with a "you quoted too much". Same as the html avoidance.
> > > > 
> > > > Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> > > > kind of reply, but if it's more than 50 lines of quoting, trigger a
> > > > "at least equal parts new message".
> > > > 
> > > > I'm sure Konstantin has nothing better to do...
> > > > 
> > > >                 Linus
> > > 
> > > Paul,
> > > 
> > > Just in case you are wondering why one day one of your replies gets
> > > rejected ;-)
> > 
> > You never know.  Those who would have otherwise received my replies
> > might be very happy with this outcome.  ;-)
> > 
> > 							Thanx, Paul
> 
> Hmm.
> 
> Thirty-two lines of quoted message.
> 
> Only two lines of response.
> 
> [Not including signature]
> 
> You are skating close to the edge of a 95% quote rule filter unless
> it counted the signature.
> 
> But
> this
> might
> also
> cause
> people
> to
> go
> to
> silly
> lengths
> to
> avoid
> having
> their
> message
> cancelled!

;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)
;-)

							Thanx, Paul

