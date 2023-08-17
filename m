Return-Path: <ksummit+bounces-1001-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063277F3A3
	for <lists@lfdr.de>; Thu, 17 Aug 2023 11:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808151C2136C
	for <lists@lfdr.de>; Thu, 17 Aug 2023 09:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B345312B6C;
	Thu, 17 Aug 2023 09:39:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95296125DE
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 09:39:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B6DB497;
	Thu, 17 Aug 2023 11:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692265074;
	bh=ByqeO8nZIk7FwORxo0QbY8G6fX3M12y6d0/3MZNJRh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMYen94zoO0mR8nOmTACOtzKzCAgFCoeFtSP6hUoNqLUKoLFDbLFN9B6WZyheH66X
	 6/cmadWicpmuIOOnwkVCFOXabKFXF1lT/lRAuF36dNcNZ0vGvhJuTERpTVyrmaNvWm
	 vjDt9/RjxQnjuoiibPxOgsExFhOqDNPGJd2lOdkQ=
Date: Thu, 17 Aug 2023 12:39:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817093914.GE21668@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZN0uNrpD8JUtihQE@bombadil.infradead.org>

On Wed, Aug 16, 2023 at 01:14:46PM -0700, Luis Chamberlain wrote:
> On Wed, Aug 16, 2023 at 02:08:08PM -0400, Josef Bacik wrote:
> > Maintainers/long time developers are burning out.  At the same time there's
> > frustration from new comers who have trouble getting their patches accepted.  We
> > have instances of arguments between longtime developers which leads to more
> > frustration because it drags on the development process.
> 
> <-- snip -->
> 
> > Automate everything: I hate email, that is no secret, but even with email we can
> > automate a lot of things.  The btrfs team built out the GH CI so developers can
> > drive their own testing, spreading the load.  Eventually I hope to get to the
> > point where the merging of patches is automated away so we don't have to deal
> > with those mechanics.
> > 
> > Developing strategies to handle the more mundane tasks of managing our projects
> > will help free us to engage better with our communities, and guide people to be
> > better developers, feeding back into the ecosystem that will help reduce the
> > pain.  Thanks,
> 
> I have been thinking about *many* of these things *for years*, but also *doing*.
> 
> In the *doing* part at the last LSFMM this year I described challenges I have
> faced in this *doing*, but I think it is useful to itemize a few of them
> so they are reminders:
> 
>   a) hardware resources
>   b) push button people / reporting / etc
> 
> Today a) is resolved typically by either companies interested and
> keeping things private (legal or whatnot) or sharing hardware resources
> with community members (Samsung has let me share a big baremetal server
> for community testing), and lately we also now have Oracle offering OCI
> instances. I have *yet* to hear back from any other cloud provider.
> 
> The economic downturn makes a) harder today, whereas a few years before
> I was hinted this was *not* a problem. And so we must take anything we
> can get for it.
> 
> Jeff Layton has also hinted that developers tend prefer for resources to
> be independent of just one company, ie, we can't just have one sole
> provider. I believe this is the right approach. Loosing my test rig
> after I switched an employer once made upkeeping XFS stable backporting
> work just not possible long ago and, fortunately, today we have a team of
> good folks with hw resources from 3 different companies to succeed. This
> wasn't planned. It just happened.
> 
> So to help with automation to help with the burnout, there is a "meta"
> aspect of a) then: proactive planning to get enough public resources for
> community developers to step up to help, whether that be to backport /
> test stable fixes, or resources for future automation of tests.
> 
> If your subsystem is not ready to discuss a) yet, that likely might be
> because different companies / folks use different things to test subsystems /
> regressions / new patches. And there in lies another "meta" issue.
> 
> In the *worst* case there are simply no tests, *or* maintainers suggesting
> there is no way to automate *cough*.
> 
> There are also those that believe testing is super awesome, but seem to
> shy away from the idea that our community is not ready for *requiring*
> tests for kernel development / new patches / features / etc. IMHO evidence
> of burnouts is a strong suggestion we should *strive* for it. The issue
> is that typically this last part is an afterthought in the worst case,
> and even with best intentions, can sometimes be a resource constrain
> whether that be physical hardware or the b) part mentioned above.
> 
> What does this tell us, if we care about this? *If* automation is to be
> a serious consideration it *must* be just as good as the kernel code we
> write. And so I think it would help for those that *do* care about this
> to start thinking about all these things proactively in this sense.
> 
> As for b) feedback from LSFMM was let's just automate it too. While
> sensible, without resource consideration its a slow steep slope. But
> I think we're getting better at that with time. Not only do we need
> to think about writing test coverage but also the other parts of b).
> 
> In so far as making it possible to get b) to help, my current excitement
> surrounds around what Song Liu mentioned to me at LSFMM and then
> quickly demonstrated that the eBPF folks are doing with patchwork.
> Get the patches to be tested automatically, and *immediately*
> patch reviewers and maintainers can get feedback if something is not even
> worth reviewing.

This is interesting, do you have any link to share to related resources
?

> There are some other R&D type of ideas out there I have shared with some
> peers and some have shared with me too, which could probably help long
> term too, but one step at a time.
> 
> To help with b) my goal was to leverage and learn what eBPF folks have
> done, allow kdevops to use it, and then start integrating with patchwork
> for either the stuff I maintain or for the subsystems that are
> interested in leverating the automation framework behind kdevops.
> 
> A boring but perhaps fitting way to think about what we do is to start
> thinking about what we do with kernel development as a public utlity and
> service and we just need to automate testing of this public utility.
> 
> I'd be very interested in talking about this if invited but my current
> flight departs in the afternoon, but I could perhaps see to fly the next day if
> this topic is chosen / I get an invite.

-- 
Regards,

Laurent Pinchart

