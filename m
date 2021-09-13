Return-Path: <ksummit+bounces-556-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 3098C409667
	for <lists@lfdr.de>; Mon, 13 Sep 2021 16:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 406FD1C0F91
	for <lists@lfdr.de>; Mon, 13 Sep 2021 14:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504973FDA;
	Mon, 13 Sep 2021 14:52:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08463FD0
	for <ksummit@lists.linux.dev>; Mon, 13 Sep 2021 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631544735;
	bh=VPfq8BqZ6xy0+6P2yfAIitl06YOfr9k0VCz+G/2fSpE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=OXYQudZQ0dqcOZC90Uqy6TKpwk0FbWYu6T0Q8O9J8rO2em8l1ycPYbLjQ3NkEqOMy
	 4jaUNFeHxlSd/VqdheFiolvtUMEuNhJJ1w8TlZhX8VIssKrLmqWHc4R5IDjRRvIw4f
	 kPyvO2EE7W5fkiF5KhTi+oSwrAzIMrfeR1Lu0tLg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B544A1280577;
	Mon, 13 Sep 2021 07:52:15 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0K7JSgW-hFY; Mon, 13 Sep 2021 07:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631544735;
	bh=VPfq8BqZ6xy0+6P2yfAIitl06YOfr9k0VCz+G/2fSpE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=OXYQudZQ0dqcOZC90Uqy6TKpwk0FbWYu6T0Q8O9J8rO2em8l1ycPYbLjQ3NkEqOMy
	 4jaUNFeHxlSd/VqdheFiolvtUMEuNhJJ1w8TlZhX8VIssKrLmqWHc4R5IDjRRvIw4f
	 kPyvO2EE7W5fkiF5KhTi+oSwrAzIMrfeR1Lu0tLg=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 05B62128051A;
	Mon, 13 Sep 2021 07:52:14 -0700 (PDT)
Message-ID: <03c63726404ad51449b2370d5d3cada976633eec.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
  Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner
 <tglx@linutronix.de>,  Josh Triplett <josh@joshtriplett.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 ksummit@lists.linux.dev, dev@tvm.apache.org
Date: Mon, 13 Sep 2021 07:52:14 -0700
In-Reply-To: <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
References: <87ilz8c7ff.ffs@tglx> <YTyFZufZHu9BSFxk@unreal>
	 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com> <YTybN5QwAnLfSBZC@unreal>
	 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com> <YT2By1+yuo7rcu2D@unreal>
	 <YT2rwbBR6ilHmwSZ@kroah.com> <YT26ebT6xXWsnVMw@unreal>
	 <YT3/5kJuhw/QVqrw@kroah.com> <YT4LgkK+ejUWljEh@unreal>
	 <YT4QCHwnqZL/rl0z@kroah.com>
	 <CAPM=9twpxAP13fEv8BxsSkd4Xcqxu989F3biiPFFDgKRADL0KQ@mail.gmail.com>
	 <CAKMK7uHQw8=GKpayxzOJUs4BnwoVDS08Y9bynp6=VH+eW35Pgw@mail.gmail.com>
	 <CAPM=9txdCs-pXfw1Q=o_tMcmPafHcwV6_K5Sh=Vnj6d=G-tm_A@mail.gmail.com>
	 <CACRpkdZRy8b3B8chCnpEHV3_qfBS6kCqMNmCPy4MV0vf0-AsAw@mail.gmail.com>
	 <CAK8P3a2Fo=O3tM2vrFzbifc9rkmz9b3homwitTg5WNJrpDcLxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 15:20 +0200, Arnd Bergmann wrote:
> On Mon, Sep 13, 2021 at 12:51 AM Linus Walleij <
> linus.walleij@linaro.org> wrote:
> > On Sun, Sep 12, 2021 at 11:13 PM Dave Airlie <airlied@gmail.com>
> > wrote:
> > 
> > > For userspace components as well these communities of experts
> > > need to exist for each domain, and we need to encourage upstream
> > > first processes across the board for these split kernel/userspace
> > > stacks.
> > > 
> > > The habanalabs compiler backend is an LLVM fork, I'd like to see
> > > the effort to upstream that LLVM backend into LLVM proper.
> > 
> > I couldn't agree more.
> > 
> > A big part of the problem with inference engines / NPU:s is that of
> > no standardized userspace. Several of the machine learning
> > initiatives from some years back now have stale git repositories
> > and are visibly unmaintained, c.f. Caffe 
> > https://github.com/BVLC/caffe last commit 2 years ago.
> 
> Caffe as a standalone project was abandoned and merged into
> PyTorch, see https://caffe2.ai/. I think this is the kind of
> consolidation of those projects that you are looking for.
> 
> > Habanalabs propose an LLVM fork as compiler, yet the Intel
> > logo is on the Apache TVM website, and no sign of integrating with
> > that project. They claim to support also TensorFlow.
> > 
> > The way I perceive it is that there simply isn't any GCC/LLVM or
> > Gallium 3D of NPU:s, these people haven't yet decided that "here
> > is that userspace we are all going to use". Or have they?
> > 
> > LLVM? TVM? TensorFlow? PyTorch? Some other one?
> > 
> > What worries me is that I don't see one single developer being
> > able to say "this one definitely, and they will work with the
> > kernel community", and that is what we need to hear.
> 
> I don't actually think this is a decision we can possibly wait for.
> The ones you listed all work on different levels, some build on top
> of others, and some may get replaced by new ones over time.

I cut all the interesting design stuff because there's a meta problem
here: we seem to be charting a course based on the idea we have to get
the userspace API right first time.  We really don't, we have to make a
reasonable effort to get it right, but we can go around for a v2 if we
fail ... that's the whole point about open source: fail fast and redo. 
No-one can really design an API without seeing how the users actually
use it.  When we do get it right first time, it's more by luck than
judgment, so we should expect failure more often than not.  The trick
to a successful API is usually finding what the minimal set of
operations is and implementing that.  If you think about bells and
whistles first (as 95% of API design documents do tend to) you usually
fail.

Completely new APIs with producer consumer interlock always have this
failure problem, because in a blue sky environment, neither the
producer nor consumer knows exactly what they want the first time
around ... they usually have to try a couple of times to figure out
what works and what doesn't.  What we have to enable is this fast
iteration while they work it out.  API versioning is usually a good
beginning to this ...

There's also nothing wrong with recommending existing interfaces and
seeing how that works because existing patterns are there for a reason.

James





